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
                                <h1 class="m-0 text-dark">Ratings</h1>
                            </div><!-- /.col -->

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

                                        <table class="table table-hover data-table" data-order='[[0, "desc"]]'>
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Customer</th>
                                                    <th>Product</th>
                                                    <th class="text-center">Star</th>
                                                    <th>Comment</th>
                                                    <th class="text-center">Date Rating</th>
                                                </tr>
                                            </thead>

                                            <tbody>


                                                <c:forEach items="${review}" var="item" >

                                                    <tr>
                                                        <td>${item.id}</td>
                                                        <td>${item.customer.fullname}</td>
                                                        <td>
                                                            <a href="../product?id=${item.product.id}">${item.product.name}</a>
                                                        </td>
                                                        <td class="text-center">
                                                            <c:forEach begin="1" end="${item.stars}">
                                                                <i class="fa fa-star" style="color:#fecb00"></i>
                                                            </c:forEach>
                                                        </td>
                                                        <td>
                                                            ${item.comment}
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:formatDate value="${item.ratingDate}" pattern="dd-MM-yyyy"/>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>
                                    <!-- ./card-body -->

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



        </div>



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
    <!-- OPTIONAL SCRIPTS -->
    <script src="assets/js/main.js"></script>

    <!-- PAGE PLUGINS -->
    <!-- DataTables -->
    <script src="plugins/datatables/jquery.dataTables.js"></script>
    <script src="plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

    <!-- PAGE SCRIPTS -->
    <script>
        $(function () {
            $(".data-table").DataTable(dataTableOptions);
        });

        <c:if test="${error != null}">
        toastr.error('${error}');
        </c:if>
    </script>
</body>
</html>
