<%-- 
    Document   : add_books
    Created on : May 3, 2024, 12:06:37 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Edit Books</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #0f2f2;">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Edit Books</h4>
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
                           BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                           BookDtls b = dao.getBookById(id);
                        %>
                        <form action="../editbooks" method="post">
                              <!--enctype="multipart/form-data"-->
                              <input type="hidden" name="id" value="<%=b.getBookId()%>">
                            <div class="form-group">
                                <label for="bookName">Book Name*</label>
                                <input type="text" class="form-control" id="bookName" 
                                        required="required"
                                        name = "bname" value="<%=b.getBookName()%> ">
                            </div>
                            <div class="form-group">
                                <label for="authorName">Author Name*</label>
                                <input type="text" class="form-control" id="authorName" 
                                        required="required"
                                       name="author" value="<%=b.getAuthor() %>">
                            </div>
                            <div class="form-group">
                                <label for="price">Price*</label>
                                <input type="number" class="form-control" id="price" 
                                        required="required"
                                       name="price" value="<%=b.getPrice() %>">
                            </div>
                            <div class="form-group">
                                <label for="inputState">Book Status</label>
                                <select class="form-control" id="BookStatus" name="status">
                                <% 
                                if("Active".equals(b.getStatus())){
                                %>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                                <%  
                                }else{
                                %>
                                <option value="Inactive">Inactive</option>
                                <option value="Active">Active</option>
                                <%}
                                %>
                                </select>
                            </div>
<!--                            <div class="form-group">
                                <label for="upload">Upload Photo</label>
                                <input type="file" class="form-control-file" id="upload" name="bimg">
                            </div>-->
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
