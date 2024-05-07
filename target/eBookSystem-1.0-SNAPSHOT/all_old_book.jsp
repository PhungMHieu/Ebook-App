<%-- 
    Document   : all_recent_book
    Created on : May 6, 2024, 11:59:45 PM
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
        <title>All Old Book</title>
        <%@include file="all_component/allCss.jsp" %>
        <style type="text/css">
            .back-img{
                background: url("img/b.jpg");
                height: 50vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .crd-ho:hover{
                background-color: #fcf7f7;
            }
        </style>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row p-3">
                <%
                      BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                      List<BookDtls> list = dao.getAllOldBooks();
                      for(BookDtls b:list)
                      {%>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="book/<%=b.getPhotoName() %>" alt="" style="width: 150px; height: 200px" 
                                 class="img-thumblin"/>
                            <p><%=b.getBookName() %></p>
                            <p><%=b.getAuthor() %></p>

                            <div class="row text-center">
                                <a href="" class="btn btn-danger btn-sm ml-5"><i class="fas fa-cart-plus"></i>Add Cart</a>
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm"><%=b.getPrice()%><i class="fas fa-dollar-sign"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                 }
                %>
            </div>
        </div>
    </body>
</html>
