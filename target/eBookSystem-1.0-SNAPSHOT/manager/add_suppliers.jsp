<%-- 
    Document   : add_suppliers
    Created on : May 3, 2024, 12:26:49 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager: Add Suppliers</title>
        <%@include file = "allCss.jsp" %>
    </head>
    <body style="background-color: #f0f2f2">
        <%@include file = "navbar.jsp" %>
        <div class="container">
            <div class="row p-2 justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Add New Supplier</h4>
                            <c:if test="${not empty succMsgAddSupplier}">
                                <c:remove var="succMsgAddSupplier" scope="session"/>
                                <script>
                                    $(document).ready(function(){
                                        $('#successModal').modal('show');
                                    });
                                </script>
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <c:remove var="failedMsg" scope="session"/>
                                <script>
                                    $(document).ready(function(){
                                        $('#errorModal').modal('show');
                                    });
                                </script>
                            </c:if>
                            <form action="../manager_add_suppliers" method="post">
                                <!-- Tao truong nhap Supplier Name -->
                                <div class="form-group">
                                    <label for="exampleInputSupplierName">Supplier Name*</label>
                                    <input name="sname" type="text" class="form-control" id="exampleInputSupplierName" aria-describedby="supplierNameHelp" required>
                                </div>
                                <!-- Tao truong nhap Supplier Phone -->
                                <div class="form-group">
                                    <label for="exampleInputSupplierPhone">Supplier Phone*</label>
                                    <input name="sphone" type="tel" pattern="[0-9\+]*" class="form-control" id="exampleInputSupplierPhone" aria-describedby="supplierPhoneHelp" required>
                                </div>  
                                <!-- Tao truong nhap Supplier Email -->
                                <div class="form-group">
                                    <label for="exampleInputSupplierEmail">Supplier Email*</label>
                                    <input name="semail" type="text" class="form-control" id="exampleInputSupplierEmail" aria-describedby="supplierEmailHelp" required>
                                </div>
                                <!-- Tao truong nhap Supplier Address -->
                                <div class="form-group">
                                    <label for="exampleInputSupplierAddress">Supplier Address*</label>
                                    <input name="saddress" type="text" class="form-control" id="exampleInputSupplierAddress" aria-describedby="supplierAddressHelp" required>
                                </div>
                                <div class="d-flex justify-content-center mt-3">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-danger mr-2 custom-btn" onclick="window.location.href='add_suppliers.jsp';"> Cancel </button>
                                        <button type="submit" class="btn btn-primary ml-2 custom-btn"> Add </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal box thành công -->
        <div class="modal" id="successModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Thành công</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Thêm nhà cung cấp thành công!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal box thất bại -->
        <div class="modal" id="errorModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Thất bại</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Thêm sách thất bại!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
