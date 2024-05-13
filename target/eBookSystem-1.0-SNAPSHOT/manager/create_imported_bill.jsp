<%-- 
    Document   : create_imported_bill
    Created on : May 4, 2024, 8:49:39 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager: Create Imported Bill</title>
        <%@include file = "allCss.jsp" %>
        <script src="create_imported_bill.js"></script>
        <style>
            body{
                margin-top:20px;
                background-color:#eee;
            }

            .card {
                box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: 1rem;
            }
        </style>
    </head>
    <body style="background-color: #f0f2f2">
        <%@include file = "navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="invoice-title">
                                <h4 class="d-flex justify-content-end font-size-15">Imported Bill <span class="badge bg-success font-size-12 ms-2">Paid</span></h4>
                                <div class="mb-4">
                                    <h2 class="mb-1 text-muted">EBooks System</h2>
                                </div>
                                <div class="text-muted">
                                    <p class="mb-1">Học viện Công nghệ Bưu chính Viễn thông</p>
                                    <p class="mb-1"><i class="uil uil-envelope-alt me-1"></i> eBookSystem@gmail.com</p>
                                    <p><i class="uil uil-phone me-1"></i> 012-345-6789</p>
                                </div>
                            </div>

                            <hr class="my-4">

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="text-muted">
                                        <h5 class="font-size-16 mb-3">Billed To:</h5>
                                        <h5 class="font-size-15 mb-2"id="supplier_name"></h5>
                                        <p class="mb-1" id="supplier_address"></p>
                                        <p class="mb-1" id="supplier_email"></p>
                                        <p id="supplier_phone"></p>
                                    </div>
                                </div>
                                <!-- end col -->
                                <div class="col-sm-6">
                                    <div class="text-muted text-sm-end">
                                        <div class="mt-4">
                                            <h5 class="font-size-15 mb-1">Imported Date:</h5>
                                            <p id="imported_date"></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col -->
                            </div>
                            <!-- end row -->

                            <div class="py-2">
                                <h5 class="font-size-15">Import Summary</h5>
                                <div class="table-responsive">
                                    <table class="table align-middle table-nowrap table-centered mb-0" id="selectedBooksTable">
                                        <thead>
                                            <tr>
                                                <th style="width: 70px;">No.</th>
                                                <th>Item</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th class="text-end" style="width: 120px;">Total</th>
                                            </tr>
                                        </thead><!-- end thead -->
                                        <tbody>
                                            
                                        </tbody><!-- end tbody -->
                                    </table><!-- end table -->
                                </div><!-- end table responsive -->
                                <div class="d-print-none mt-4">
                                    <div class="d-flex justify-content-end">
                                        <a href="javascript:window.print()" class="btn btn-success me-1"><i class="fa fa-print"></i></a>
                                        <button type="button" id="saveButton" class="btn btn-primary w-md ml-2" onclick="saveBill()">Save</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end col -->
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
                        Lưu hóa đơn thành công!
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
                        Lưu hóa đơn thất bại!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file = "footer.jsp" %>
    </body>
</html>
