<%-- 
    Document   : import_book
    Created on : May 3, 2024, 12:26:05 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager: Import Book</title>
        <%@include file = "allCss.jsp" %>
        <script src="import_book.js"></script>
    </head>
    <body>
        <%@include file = "navbar.jsp" %>
        <div class="container">
            <div class="row justify-content-center p-5">
                <div class="col-md-6">
                    <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/manager/search_book" method="GET">
                        <input class="form-control mr-sm-2" type="search" style="width: 300px;" placeholder="Search Book" aria-label="Search" name="keyword">
                        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
                <div class="text-center">
                    <a href="add_books.jsp" class="btn btn-success">
                        <i class="fa-sharp fa-solid fa-plus mr-2"></i>Add Book</a>
                </div>
            </div>
            <h3>Tất cả</h3>
            <div class="table-wrapper">
                <table class="table table-striped text-center" id="listBook">
                    <thead>
                        <tr>
                            <th scope="col" class="td-bookId">Id</th>
                            <th scope="col" class="td-bookName">Book Name</th>
                            <th scope="col" class="td-bookAuthor">Author</th>
                            <th scope="col" class="td-bookPrice">Price</th>
                            <th scope="col" class="td-bookCategories">Categories</th>
                            <th scope="col" "td-bookStatus">Status</th>
                            <th scope="col" "td-checkbox">Choose</th>
                        </tr>
                    </thead>

                    <tbody>
                        <% 
                            List<BookDtls> list;
                            String keyword = request.getParameter("keyword");
                            if (keyword != null && ! keyword.isEmpty()) {
                                list = (List<BookDtls>) request.getAttribute("searchResultBooks");
                            } else {
                                BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                                list = dao.getAllBooks();
                            }
                            for(BookDtls b : list){ 
                        %>
                            <tr>
                                <th scope="row" class="td-bookId"><%=b.getBookId() %></th>
                                <td class="td-bookName"><%=b.getBookName() %></td>
                                <td class="td-bookAuthor"><%=b.getAuthor() %></td>
                                <td class="td-bookPrice"><%=b.getPrice() %></td>
                                <td class="td-bookCategories"><%=b.getBookCategory() %></td>
                                <td class="td-bookStatus"><%=b.getStatus() %></td>
                                <td class="td-checkbox"><input type="checkbox" name="selectedBooks" value="<%=b.getBookId() %>"></td>
                            </tr>
                            <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <h3>Danh sách đã chọn</h3>
            <div class="table-wrapper" id="selectedBooksTable">
                <table class="table table-striped text-center">
                    <thead>
                        <tr>
                            <th scope="col" class="td-bookId">Id</th>
                            <th scope="col" class="td-bookName">Book Name</th>
                            <th scope="col" class="td-bookAuthor">Author</th>
                            <th scope="col" class="td-bookPrice">Price</th>
                            <th scope="col" class="td-bookCategories">Categories</th>
                            <th scope="col" "td-bookStatus">Status</th>
                            <th scope="col" "td-checkbox">Quantity</th>
                        </tr>
                    </thead>

                    <tbody>
                        <!-- Dữ liệu sách sinh ở đây -->
                    </tbody>
                </table>
            </div>
            <div class="row justify-content-end mt-4">
                <div class="col-md-6 text-center">
                    <button class="btn btn-primary" id="nextButton">Next</button>
                </div>
            </div>
        </div>
        <div class="modal" id="confirmationModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Xác nhận xóa</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc chắn muốn xóa sản phẩm này?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-danger" id="confirmDeleteBtnModal">Xác nhận</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
