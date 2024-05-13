package com.manager.servlet;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*") // Filter áp dụng cho tất cả các URL
public class AuthenticationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false); // Không tạo phiên mới nếu chưa có
        boolean isLoggedIn = (session != null && session.getAttribute("userobj") != null);

        String requestURI = httpRequest.getRequestURI();

        if (isLoggedIn || requestURI.endsWith("login.jsp") || requestURI.endsWith("login") || requestURI.endsWith("index.jsp")) {
            // Nếu đã đăng nhập hoặc yêu cầu truy cập trang đăng nhập, cho phép truy cập
            chain.doFilter(request, response);
        } else {
            // Nếu chưa đăng nhập và không phải trang đăng nhập, điều hướng đến trang đăng nhập
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/index.jsp");
        }
    }

    // Các phương thức còn lại của Interface Filter không được sử dụng
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}
