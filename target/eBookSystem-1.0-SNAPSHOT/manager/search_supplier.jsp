<%-- 
    Document   : search_supplier
    Created on : May 3, 2024, 12:25:34 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.SupplierDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.Supplier" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager: Search Supplier</title>
        <%@include file = "allCss.jsp" %>
        <script src="search_supplier.js"></script>
    </head>
    <body>
        <%@include file = "navbar.jsp" %>
        <div class="container">
            <div class="row justify-content-center p-5">
                <div class="col-md-6">
                    <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/manager/search_supplier" method="GET">
                        <input class="form-control mr-sm-2" type="search" style="width: 300px;" placeholder="Search supplier" aria-label="Search" name="keyword">
                        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
                <div class="text-center">
                    <a href="add_suppliers.jsp" class="btn btn-success">
                        <i class="fa-sharp fa-solid fa-plus mr-2"></i>Add Supplier</a>
                </div>
            </div>
            <div class="table-wrapper">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<Supplier> list;
                            String keyword = request.getParameter("keyword");
                            if (keyword != null && ! keyword.isEmpty()) {
                                list = (List<Supplier>) request.getAttribute("searchResults");
                            } else {
                                SupplierDAOImpl dao = new SupplierDAOImpl(DBConnect.getConn());
                                list = dao.getAllSuppliers();
                            }
                            for(Supplier s : list){ 
                        %>
                            <tr>
                                <th scope="row"><%= s.getId()%></th>
                                <td><a href="import_book.jsp" class="supplier-link"> <%= s.getName()%></a></td>
                                <td><%= s.getPhone() %></td>
                                <td><%= s.getEmail() %></td>
                                <td><%= s.getAddress() %></td>
                            </tr>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>