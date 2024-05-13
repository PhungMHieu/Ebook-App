<<%-- 
    Document   : add_books
    Created on : May 3, 2024, 12:06:37 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page import="com.DAO.*" %>
<%@ page import="com.DB.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Books</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #0f2f2;">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Edit Users</h4>
                        <c:if test="${not empty succMsg}">
                            <p class="text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session"/>
                        </c:if>
                        <%
                           int id = Integer.parseInt(request.getParameter("id"));
                           UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
                           User u = dao.getUserById(id);
                        %>
                        <form action="../editusers" method="post">
                              <!--enctype="multipart/form-data"-->
                            <input type="hidden" name="id" value="<%=u.getId()%>">
                            <div class="form-group">
                                <label for="name">Name*</label>
                                <input type="text" class="form-control" id="name" 
                                        required="required"
                                        name = "name" value="<%=u.getName()%> ">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" id="email" 
                                        required="required"
                                       name="email" value="<%=u.getEmail() %>">
                            </div>
                            <div class="form-group">
                                <label for="phno">Phone Number</label>
                                <input type="number" class="form-control" id="phno" 
                                        required="required"
                                       name="phno" value="<%=u.getPhno()%>">
                            </div>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div style="margin-top:130px">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
