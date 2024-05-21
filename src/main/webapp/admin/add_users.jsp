<%-- 
    Document   : add_user
    Created on : May 14, 2024, 1:25:15 AM
    Author     : PC
--%>

<%-- 
    Document   : add_books
    Created on : May 3, 2024, 12:06:37 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Users</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #0f2f2;">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center"> Add Users</h4>
                        <c:if test="${not empty succMsg}">
                            <p class="text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session"/>
                        </c:if>
                        <form action="../add_users" method="post">
                            <div class="form-group">
                                <label for="name">Name*</label>
                                <input type="text" class="form-control" id="name" 
                                        required="required"
                                       name = "name">
                            </div>
                            <div class="form-group">
                                <label for="email">Email*</label>
                                <input type="email" class="form-control" id="email" 
                                        required="required"
                                       name="email">
                            </div>
                            <div class="form-group">
                                <label for="phno">Phone number</label>
                                <input type="number" class="form-control" id="price" 
                                        required="required"
                                       name="phno">
                            </div>
                            <div class="form-group">
                                  <label for="exampleInputPassword1">Pasword</label>
                                  <input type="password" class="form-control" id="exampleInputPassword1" 
                                         required="required" name="password">
                                </div>
                            <div class="form-group">
                                <label for="inputState">Role</label>
                                <select class="form-control" id="role" name="role">
                                    <option selected>--select--</option>
                                    <option value="User">User</option>
                                    <option value="manager">Manager</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Add</button>
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
