<%-- 
    Document   : home
    Created on : May 1, 2024, 4:40:31 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Home</title>
        <%@include file="allCss.jsp" %>
        <style type="text/css">
            a{
                text-decoration: none;
                color: black;
            }
            a:hover{
                text-decoration: none;
                color: black;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp" />
        </c:if>
        <div class="container">
            <div class="row p-5">
                <div class="col-md-4">
                    <a href="add_books.jsp">
                        <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                            <h4>Add Books</h4>
                            ------------------
                        </div>
                    </div>
                    </a>
                </div>
                
                <div class="col-md-4">
                    <a href="all_books.jsp">
                        <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-book-open fa-3x text-danger"></i><br>
                            <h4>All Books</h4>
                            ------------------
                        </div>
                    </div>
                    </a>
                </div>
                
                <div class="col-md-4">
                    <a href="orders.jsp">
                    <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-box-open fa-3x text-warning"></i><br>
                        <h4>Orders</h4>
                        ------------------
                    </div>
                    </div>
                    </a>
                </div>
            </div>
            <div class="row p-2">
                <div class="col-md-6">
                    <a href="all_users.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-user fa-3x text-primary"></i><br>
                                <h4>List User</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="add_users.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-user fa-3x text-primary"></i><br>
                                <h4>Add User</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">
                            <h4>Do you want logout</h4>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <a href="../logout" type="button" class="btn btn-primary text-white">Log out</a>
                        </div>
                    </div>
                    <div class="modal-footer"></div>
                </div>
            </div>
        </div>
        <div style="margin-top: 300px">
            <%@include file="footer.jsp" %>
        </div>
        <!--<h1>Admin:Home</h1>-->
    </body>
</html>
