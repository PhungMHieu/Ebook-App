/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.manager.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

/**
 *
 * @author PC
 */
@WebServlet(name="ManagerAddBookServlet", urlPatterns={"/manager_add_books"})
@MultipartConfig
public class ManagerAddBookServlet extends HttpServlet{

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BooksAdd</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BooksAdd at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            com.entity.User user = (com.entity.User) session.getAttribute("userobj");
            if (user != null) {
                String userEmail = user.getEmail();
                System.out.println(userEmail);
                String bookName = request.getParameter("bname");
                System.out.println(bookName);
                String author = request.getParameter("author");
                System.out.println(author);
                String price = request.getParameter("price");
                System.out.println(price);
                String categories = request.getParameter("bcategory");
                System.out.println(categories);
                String status = request.getParameter("bstatus");
                System.out.println(status);
                Part part = request.getPart("bimg");
                String fileName = part.getSubmittedFileName();
                System.out.println(fileName);
                
                BookDtls b = new BookDtls();
                b.setAuthor(author);
                b.setBookName(bookName);
                b.setPrice(price);
                b.setBookCategory(categories);
                b.setStatus(status);
                b.setPhotoName(fileName);
                
                // Set email của người dùng vào đối tượng BookDtls
                b.setEmail(userEmail);
                
                BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                boolean f = dao.addBooks(b);
                
                if(f){
                    String path = getServletContext().getRealPath("")+"book";
                    File file = new File(path);
                    part.write(path+File.separator+fileName);
                    session.setAttribute("succMsg", "Book Add Successfully");
                    response.sendRedirect("manager/add_books.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something wrong on Server");
                    response.sendRedirect("manager/add_books.jsp");
                }
            } else {
                // Người dùng chưa đăng nhập, xử lý tùy ý (redirect hoặc thông báo lỗi)
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
}
