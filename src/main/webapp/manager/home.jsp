<%-- 
    Document   : home
    Created on : May 2, 2024, 10:29:52 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager: Home</title>
        <%@include file = "allCss.jsp" %>
    </head>
    <body>
        <%@include file = "navbar.jsp" %>
        <div class ="container">
            <h1 class="text-center pt-5">Hello Manager</h1>
            <div class="row" style="padding-top: 50px;">
                <!-- Tao nut Add Book-->
                <div class="col-md-3">
                    <a href="add_books.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-plus-square fa-3x text-primary"></i>
                                <br>
                                <h4>Add Books</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>
                <!-- Yao nut Import Book -->
                <div class="col-md-3">
                    <a href="search_supplier.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-book-open fa-3x text-danger"></i>
                                <br>
                                <h4>Import Book</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>
                <!-- Tao nut Add Supplier-->
                <div class="col-md-3">
                    <a href="add_suppliers.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-solid fa-truck-field fa-3x text-warning"></i>
                                <br>
                                <h4>Add Supplier</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>
                <!-- Tao nut Log out-->
                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/logout">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-sign-out-alt fa-3x"></i>
                                <br>
                                <h4>Log out</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
