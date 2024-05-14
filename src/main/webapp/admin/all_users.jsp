<%-- 
    Document   : all_books
    Created on : May 3, 2024, 12:10:24 PM
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
        <title>Admin: All Books</title>
         <%@include file="allCss.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp" />
        </c:if>
        <h3 class="text-center">Hello Admin</h3>
        <c:if test="${not empty succMsg}">
            <h5 class="text-center text-success">${succMsg}</h5>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty failedMsg}">
            <h5 class="text-center text-danger">${failedMsg}</h5>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>
        
        <table class="table table-striped ">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">phone number</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                   UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
                   List<User> list = dao.getAllUsers();
                   for(User u: list){
                    %>
                    <tr>
                        <td><%=u.getId() %></td>
                        <td><%=u.getName() %></td>
                        <td><%=u.getEmail() %></td>
                        <td><%=u.getPhno() %></td>
                        <td>
                            <a href="edit_users.jsp?id=<%=u.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                            <a data-toggle="modal" data-target="#exampleModalCenter1<%=u.getId() %>" class="btn btn-sm btn-danger text-white">Delete</a>
                        </td>
                    </tr>
                    <div class="modal fade" id="exampleModalCenter1<%=u.getId() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                        <h4>Do you want to delete</h4>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <a href="../deleteUser?id=<%=u.getId() %>" class="btn btn-primary btn-danger" type="button">Delete</a>
                                        <!--<a href="../logout" type="button" class="btn btn-primary text-white">Log out</a>-->
                                    </div>
                                </div>
                                <div class="modal-footer"></div>
                            </div>
                        </div>             
                    </div>
                     <%
                    }
                %>
                
            </tbody>
        </table>
        
    </body>
</html>



<!--<td>
                            <a href="edit_books.jsp?id=
<%--<%=b.getBookId() %>--%>
" class="btn btn-sm btn-primary">Edit</a>
-->                            
<!--                        </td>-->
