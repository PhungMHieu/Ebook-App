/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.DB.DBConnect;
import com.DAO.BookDAOImpl;
import com.entity.BookDtls;
import com.entity.Cart;
import com.DAO.CartDAOImpl;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author phume
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            int bid=Integer.parseInt(request.getParameter("bid"));
            int uid=Integer.parseInt(request.getParameter("uid"));

            BookDAOImpl dao=new BookDAOImpl (DBConnect.getConn()); 
            BookDtls b=dao.getBookById(bid);
            
            Cart c=new Cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookName());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice (Double.parseDouble(b.getPrice()));

            CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
            boolean f=dao2.addCart(c);

            HttpSession session=request.getSession();

            if(f)
            {
                session.setAttribute("addCart", "Book Added to cart"); 
                response.sendRedirect("checkout.jsp");
            }else { 
                session.setAttribute("failed", "Something wrong on server"); 
                response.sendRedirect("all_new_book.jsp");
            }

        } catch (Exception e) { 
            e.printStackTrace();
        }
    }

    /*
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    */
}
