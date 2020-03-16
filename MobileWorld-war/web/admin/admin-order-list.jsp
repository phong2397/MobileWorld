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
                                        <table  class="table table-hover" data-order='[[ 0, "desc" ]]'> 
                                            <thead>
                                                <tr>
                                                    <th class="text-center text-muted">#ID</th>
                                                    <th>Customer</th>
                                                    <th>State</th>
                                                    <th>Order Date</th>
                                                    <th>Verifier</th>
                                                    <th class="text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${order}" var="item">
                                                    <tr>
                                                        <td class="text-center">#${item.id}</td>
                                                        <td>${item.customer.username}</td>
                                                        <td>${item.state}</td>
                                                        <td class="text-center"> <fmt:formatDate value="${item.orderDate}" pattern="dd-MM-yyyy"/></td>
                                                        <td>  <select class="select-state" target="${item.id}">
                                                                <option value="1" ${item.state == 1 ? "selected" : ""}>PENDING</option>

                                                                <option value="2" ${item.state == 2 ? "selected" : ""}>SUCCESS</option>
                                                               
                                                            </select></td>
                                                        <td class="text-center">
                                                            <a href="update-category?action=find&id=${item.id}"    class="btn btn-warning btn-sm">Update</a>
                                                            <a href="update-category?action=delete-category&id=${item.id}"  onclick="return confirm('You want to delete?');"class="btn btn-danger btn-sm">Delete</a>
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
            <!-- /.content-wrapper -->

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->

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

        <!-- PAGE SCRIPTS -->
        <script>
                                                                $(function () {
                                                                    $(".table-hover").DataTable(dataTableOptions);

                                                                    $('.select-state').change(function (e) {
                                                                        e.preventDefault();
                                                                        var id = $(this).attr('target').trim();
                                                                        var state = $(this).val().trim();
                                                                        $.post('./order-change-state', {
                                                                            id: id,
                                                                            state: state
                                                                        }, function (resp) {
                                                                            toastr.success('The Order state updated');
                                                                        });
                                                                    });


                                                                });

        </script>
    </body>
</html>
