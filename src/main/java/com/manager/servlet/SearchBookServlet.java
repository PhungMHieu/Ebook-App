package com.manager.servlet;

import java.io.IOException;
import java.util.List;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="SearchBookServlet", urlPatterns={"/manager/search_book"})
public class SearchBookServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đọc từ khóa tìm kiếm từ yêu cầu của client
        String keyword = request.getParameter("keyword");
        
        // Gọi phương thức tìm kiếm trong SupplierDAOImpl với từ khóa tìm kiếm nhận được
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> searchResults = dao.getBookBySearch(keyword);
        for(BookDtls b : searchResults){
            System.out.println(b.getBookName());
        }
        
        // Lưu kết quả tìm kiếm vào một thuộc tính của request
        request.setAttribute("searchResultBooks", searchResults);
        
        // Forward đến trang search_supplier.jsp để hiển thị kết quả tìm kiếm
        RequestDispatcher dispatcher = request.getRequestDispatcher("import_book.jsp");
        dispatcher.forward(request, response);
    }
}
