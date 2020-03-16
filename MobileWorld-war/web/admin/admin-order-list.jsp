<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>MobileWorld | Admin Panel</title>

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="assets/css/adminlte.min.css">
        <!-- SweetAleart -->
        <link rel="stylesheet" href="plugins/sweetalert2/sweetalert2.min.css">
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <!-- Custom style -->
        <link rel="stylesheet" href="assets/css/custom.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    </head>
    <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
        <%
            if (session.getAttribute("cur") == null) {
                response.sendRedirect("login.jsp");
            }
        %> 
        <div class="wrapper">
            <!-- Navbar -->
            <%@include file="include/admin-navbar.jsp" %>
            <!-- /.navbar -->
            <%@include file="include/admin-left-sidebar.jsp" %>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-8">
                                <h1 class="m-0 text-dark">Orders</h1>
                            </div><!-- /.col -->
                            <div class="col-4 text-right">
                                <a target="_blank" href="./order-report" class="btn btn-default">Generate Report</a>
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table class="table table-hover" data-order='[[ 0, "desc" ]]'> 
                                            <thead>
                                                <tr>
                                                    <th class="text-center">#ID</th>
                                                    <th>Customer</th>
                                                    <th class="text-center">Order Date</th>
                                                    <th class="text-center">Verify Date</th>
                                                    <th>Verifier</th>
                                                    <th class="text-center">State</th>
                                                    <th class="text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${order}" var="item">
                                                    <tr>
                                                        <td class="text-center">${item.id}</td>
                                                        <td>
                                                            <p style="margin-bottom: 5px; font-weight: bolder">${item.customer.fullname}</span>
                                                            <p style="margin-bottom: 5px">Phone: <a href="tel: ${item.customer.phone}">${item.customer.phone}</a></p>
                                                            <p style="margin-bottom: 5px">Address: ${item.customer.address}</p>
                                                        </td>
                                                        <td class="text-center"> <fmt:formatDate value="${item.orderDate}" pattern="dd-MM-yyyy"/></td>
                                                        <td class="text-center"> 
                                                            <c:if test="${item.verificationDate != null}">
                                                                <fmt:formatDate value="${item.verificationDate}" pattern="dd-MM-yyyy"/>
                                                            </c:if>

                                                            <c:if test="${item.verificationDate == null}">
                                                                Not verified
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${item.admin == null}">
                                                                Not verified
                                                            </c:if>
                                                            <c:if test="${item.admin != null}">
                                                                ${item.admin.fullname}
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${item.state == 1}">
                                                                <span class="badge badge-danger">Pending</span>
                                                            </c:if>

                                                            <c:if test="${item.state == 2}">
                                                                <span class="badge badge-success">Verified</span>
                                                            </c:if>
                                                        </td>
                                                        <td class="text-center">
                                                            <a href="#" class="btn btn-sm btn-info" data-toggle="modal" data-target="#order${item.id}">View</a>
                                                            <c:if test="${item.state == 1}">
                                                                <form action="./order-change-state" method="post" style="display: inline-block">
                                                                    <input type="hidden" name="orderId" value="${item.id}">
                                                                    <button type="submit" class="btn btn-success btn-sm btn-verify">Verify</button>
                                                                </form>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- ./card-body -->
                                    <div class="card-footer">

                                    </div>
                                    <!-- /.card-footer -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div><!--/. container-fluid -->
                </section>
                <!-- /.content -->
            </div>

            <c:forEach items="${order}" var="item">
                <div class="modal fade" id="order${item.id}">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Order #${item.id}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h4>Items</h4>

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Item</th>
                                            <th class="text-center">Quantity</th>
                                            <th class="text-right">Price</th>
                                            <th class="text-right">Sub Total</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:set var="total" value="${0}"/>
                                        <c:forEach items="${item.orderDetailCollection}" var="od" varStatus="loop">
                                            <c:set var="total" value="${total + od.quantity * od.price}" />
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${od.product.name}</td>
                                                <td class="text-center">${od.quantity}</td>
                                                <td class="text-right">
                                                    <fmt:formatNumber type="currency" currencySymbol="$" value="${od.price}" maxFractionDigits="0" />
                                                </td>
                                                <td class="text-right">
                                                    <fmt:formatNumber type="currency" currencySymbol="$" value="${od.quantity * od.price}" maxFractionDigits="0" />
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <!-- Totel Price -->
                                <div class="totel-price">
                                    <h4 class="text-right">
                                        <small> Total Price: </small>
                                        <fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="0" value="${total}" />
                                    </h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <!-- Main Footer -->
            <%@include file="include/admin-footer.jsp" %>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED SCRIPTS -->
        <!-- jQuery -->
        <script src="plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- overlayScrollbars -->
        <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
        <!-- SweetAleat -->
        <script src="plugins/sweetalert2/sweetalert2.min.js"></script>
        <script src="plugins/toastr/toastr.min.js"></script>
        <!-- AdminLTE App -->
        <script src="assets/js/adminlte.js"></script>

        <!-- PAGE PLUGINS -->
        <!-- DataTables -->
        <script src="plugins/datatables/jquery.dataTables.js"></script>
        <script src="plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
        <script src="assets/js/main.js"></script>
        <script>
            $(".table").DataTable(dataTableOptions);
        </script>
    </body>
</html>
