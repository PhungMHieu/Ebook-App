<%-- 
    Document   : all_recent_book
    Created on : May 6, 2024, 11:59:45 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.*" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Book</title>
        <%@include file="./all_component/allCss.jsp" %>
        <style type="text/css">
            .back-img{
                background: url("img/b.jpg");
                height: 50vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .crd-ho:hover{
                background-color: #fcf7f7;
            }
            #toast {
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                left: 50%;
                margin-left: -125px;
                background: #333;
                padding: 10px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                box-shadow: 0px 0px 100px #000;
            }

            #toast.display {
                visibility: visible;
                animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
            }

            @keyframes fadeIn {
                from {
                    bottom:0;
                    opacity: 0;
                }

                to {
                    bottom: 30px;
                    opacity: 1;
                }

            }
            @keyframes fadeOut {
                form {
                    bottom: 30px;
                    opacity: 1;
                }

                to {
                    bottom: 0;
                    opacity: 0;
                }
            }
        </style>
    </head>
    <body>
            
            <%@ include file="./all_component/navbar.jsp" %>
            <%
            User u = (User) session.getAttribute("userobj");
            %>
            <c:if test="${not empty addCart }">

                <div id="toast"> ${addCart} </div>

                <script type="text/javascript">
                    showToast();
                    function showToast(content)
                    {
                        $('#toast').addClass("display");
                        $('#toast').html(content);
                        setTimeout(()=>{
                            $("#toast").removeClass("display"); 
                        }, 2000);
                    }
                </script>

                <c:remove var="addCart" scope="session"/>
            </c:if>
        <div class="container-fluid">
            <div class="row p-3">
                <%
                      BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                      List<BookDtls> list = dao.getAllNewBooks();
                      for(BookDtls b:list)
                      {%>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="book/<%=b.getPhotoName() %>" alt="" style="width: 100px; height: 150px" 
                                 class="img-thumblin"/>
                            <p><%=b.getBookName() %></p>
                            <p><%=b.getAuthor() %></p>

                            <div class="row text-center">
                                <%
                            if (u == null) {
                            %>
                            <a href="login.jsp" class="btn btn-danger btn-sm ml-5">Add Cart</a>
                            <%
                            } else {
                            %>
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-5"><i class="fas fa-cart-plus"></i>Add Cart</a>
                            <%
                            }
                            %>
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm"><%=b.getPrice()%><i class="fas fa-dollar-sign"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                 }
                %>
            </div>
        </div>
    </body>
</html>
<!-- comment <a href="cart?bid=
<%--<%=b.getBookId()%>--%>
&&uid=
<%--<%=u.getId()%>--%>
" class="btn btn-danger btn-sm ml-5"><i class="fas fa-cart-plus"></i>Add Cart</a>-->