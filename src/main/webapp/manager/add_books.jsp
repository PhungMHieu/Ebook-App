<%-- 
    Document   : add_books
    Created on : May 2, 2024, 5:49:00 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager: Add Books</title>
        <%@include file = "allCss.jsp" %>
    </head>
    <body style="background-color: #f0f2f2">
        <%@include file = "navbar.jsp" %>
        <div class="container">
            <div class="row p-2 justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Add New Book</h4>
                            <c:if test="${not empty succMsg}">
                                <c:remove var="succMsg" scope="session"/>
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
                            <form action="../manager_add_books" method="post" enctype="multipart/form-data">
                                <!-- Tao truong nhap book name -->
                                <div class="form-group">
                                    <label for="exampleInputBookName">Book Name*</label>
                                    <input name="bname" type="text" class="form-control" id="exampleInputBookName" aria-describedby="bookNameHelp" required>
                                </div>
                                <!-- Tao truong nhap author name -->
                                <div class="form-group">
                                    <label for="exampleInputAuthorName">Author Name*</label>
                                    <input name="author" type="text" class="form-control" id="exampleInputAuthorName" aria-describedby="authorHelp" required>
                                </div>
                                <!-- Tao truong nhap price -->
                                <div class="form-group">
                                    <label for="exampleInputPrice">Price*</label>
                                    <input name="price" type="number" class="form-control" id="exampleInputPrice" aria-describedby="priceHelp" required>
                                </div>
                                <!-- Tao dropdown chon book category -->
                                <div class="form-group">
                                    <label for="inputCategory">Book Category*</label>
                                    <select id="inputCategory" name="bcategory" class="form-control">
                                        <option selected>--selected--</option>
                                        <option value="Old"> Old Book </option>
                                        <option value="New"> New Book </option>
                                        <option value="Recent"> Recent Book </option>
                                    </select>
                                </div>
                                <!-- Tao dropdown chon book status  -->
                                <div class="form-group">
                                    <label for="inputState">Book Status*</label>
                                    <select id="inputState" name="bstatus" class="form-control">
                                        <option selected>--selected--</option>
                                        <option value="active"> Active </option>
                                        <option value="inactive"> Inactive </option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="formControlFile1">Upload Photo</label>
                                    <input name="bimg" type="file" class="form-control-file" id="upload" name="bimg">
                                </div>
                                <div class="d-flex justify-content-center mt-3">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-danger mr-2 custom-btn" onclick="window.location.href='add_books.jsp';"> Cancel </button>
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
                        Thêm sách thành công!
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
        <%@include file ="footer.jsp" %>
    </body>
</html>
