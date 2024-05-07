<%-- 
    Document   : view_books
    Created on : May 7, 2024, 12:59:51 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="all_component/navbar.jsp" %>
        
        <%
            int bid=Integer.parseInt(request.getParameter("bid"));
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            BookDtls b = dao.getBookById(bid);
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="book/<%=b.getPhotoName() %>" style="height: 200px;width: 100px"/><br><!-- comment -->
                    <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName() %></span></h4>
                    <h4 class="mt-3">Author Name: <span class="text-success"><%=b.getAuthor() %></span></h4>
                    <h4>Category: <span class="text-success"><%=b.getBookCategory() %></span></h4>
                </div>
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%=b.getBookName()%></h2>
                    <%
                      if("Old".equals(b.getBookCategory()))
                      {%>
                      <h5 class="text-primary">Contact to Seller</h5>
                      <h5 class="text-primary"><i class="far fa-envelope"></i> Email: <%=b.getEmail() %></h5>
                        <%}
                    %>
                    <div class="row">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-money-bill-wave fa-3x"></i>
                            <p>Cash on Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-undo-alt fa-3x"></i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-truck-moving fa-3x"></i>
                            <p>Free Shipping</p>
                        </div>
                    </div>
                    <%
                        if("Old".equals(b.getBookCategory()))
                      {%>
                        <div class="text-center p-3">
                        <a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>Continue Shopping</a>
                        <a href="" class="btn btn-danger"><i class="fas fa-dollar-sign"></i>200</a>
                        </div>
                        <%}else{%>
                        <div class="text-center p-3">
                            <a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>Add Cart</a>
                            <a href="" class="btn btn-danger"><i class="fas fa-dollar-sign"></i>200</a>
                        </div>
                         <%   
                        }
                    %>
                    
                </div>
            </div>
        </div>
    </body>
</html>
