package com.manager.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.SupplierDAOImpl;
import com.DB.DBConnect;
import com.entity.Supplier;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="ManagerAddSupplierServlet", urlPatterns={"/manager_add_suppliers"})
@MultipartConfig
public class ManagerAddSupplierServlet extends HttpServlet{
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
                String supplierName = request.getParameter("sname");
                System.out.println(supplierName);
                String supplierPhone = request.getParameter("sphone");
                System.out.println(supplierPhone);
                String supplierEmail = request.getParameter("semail");
                System.out.println(supplierEmail);
                String supplierAddress = request.getParameter("saddress");
                System.out.println(supplierAddress);
                
                Supplier s= new Supplier();
                s.setName(supplierName);
                s.setPhone(supplierPhone);
                s.setEmail(supplierEmail);
                s.setAddress(supplierAddress);
                
                SupplierDAOImpl dao = new SupplierDAOImpl(DBConnect.getConn());
                boolean f = dao.addSupplier(s);
                if(f){
                    session.setAttribute("succMsg", "Supplier Add Successfully");
                    response.sendRedirect("manager/add_suppliers.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something wrong on Server");
                    response.sendRedirect("manager/add_suppliers.jsp");
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
