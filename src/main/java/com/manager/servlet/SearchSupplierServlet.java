package com.manager.servlet;

import java.io.IOException;
import java.util.List;

import com.DAO.SupplierDAOImpl;
import com.DB.DBConnect;
import com.entity.Supplier;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="SearchSupplierServlet", urlPatterns={"/manager/search_supplier"})
public class SearchSupplierServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đọc từ khóa tìm kiếm từ yêu cầu của client
        String keyword = request.getParameter("keyword");
        
        // Gọi phương thức tìm kiếm trong SupplierDAOImpl với từ khóa tìm kiếm nhận được
        SupplierDAOImpl dao = new SupplierDAOImpl(DBConnect.getConn());
        List<Supplier> searchResults = dao.searchSupplier(keyword);
        // Lưu kết quả tìm kiếm vào một thuộc tính của request
        request.setAttribute("searchResults", searchResults);
        
        // Forward đến trang search_supplier.jsp để hiển thị kết quả tìm kiếm
        RequestDispatcher dispatcher = request.getRequestDispatcher("search_supplier.jsp");
        dispatcher.forward(request, response);
    }
}