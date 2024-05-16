<%-- 
    Document   : search
    Created on : May 6, 2024, 11:36:30 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
        <style type="text/css">
            .crd-ho:hover{
                background-color: #fcf7f7;
            }
        </style>
    </head>
    <body>
        <%
        User u=(User) session.getAttribute("userobj");
        %>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <%
                String ch=request.getParameter("ch");
                BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
                List<BookDtls> list2=dao2.getBookBySearch(ch);
                for(BookDtls b:list2){
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>      
                            <%
                            if(b.getBookCategory().equals("Old")){
                            %>
                            Categories:<%=b.getBookCategory()%></p>
                            
                            <div class="row text-center">
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fas fa-dollar-sign"></i></a>
                            </div>
                            <%
                            }else{
                            %>
                            Categories:<%=b.getBookCategory()%></p>
                            <div class="row text-center">
                                <%
                                if(u==null){
                                %>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                <%
                                } else {
                                %>
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a>
                                <%
                                }
                                %>
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm"><%=b.getPrice()%><i class="fas fa-dollar-sign"></i></a>
                            </div>
                            <%
                            }
                            %>
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
