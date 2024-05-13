/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author PC
 */
@WebServlet(name="BooksAdd", urlPatterns={"/add_books"})
@MultipartConfig
public class BooksAdd extends HttpServlet {
   
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
        log("1234");
        log(request.getRequestURI());
//        log(request.getParameter("bname"));
        try {
            
//            log("2345");
            String bookName = request.getParameter("bname");
            log(bookName);
            String author = request.getParameter("author");
            String price = request.getParameter("price");
            log(price);
            String categories = request.getParameter("categories");
            String status = request.getParameter("status");
            Part part = request.getPart("bimg");
            String fileName = part.getSubmittedFileName();
//            log(fileName);
//            log(price);
            BookDtls b = new BookDtls();
            b.setAuthor(author);
            b.setBookName(bookName);
            b.setPrice(price);
            b.setBookCategory(categories);
            b.setStatus(status);
            b.setPhotoName(fileName);
            b.setEmail("admin");
            log(b.toString());
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean f = dao.addBooks(b);
            HttpSession session = request.getSession();
            if(f){
                String path = getServletContext().getRealPath("")+"book";
                log(path);
                File file = new File(path);
                part.write(path+File.separator+fileName);
                session.setAttribute("succMsg", "Book Add Successfully");
                response.sendRedirect("admin/add_books.jsp");
            }else{
                session.setAttribute("failedMsg", "Something wrong on Server");
                response.sendRedirect("admin/add_books.jsp");
            }
        } catch (Exception e) {
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
