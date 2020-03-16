<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="assets/css/adminlte.min.css">
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
                                <h1 class="m-0 text-dark">Users</h1>
                            </div><!-- /.col -->
                            <div class="col-4 text-right">
                                <a target="_blank" href="./user-report" class="btn btn-default">Generate Report</a>
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
                                        <table class="table table-hover data-table" data-order='[[0, "desc"]]'>
                                            <thead>
                                                <tr>
                                                    <th class="text-center text-muted">#ID</th>
                                                    <th class="text-center"><i class="fas fa-image"></i></th>
                                                    <th>UserName</th>
                                                    <th>Full Name</th>
                                                    <th>Phone</th>
                                                    <th>Address</th>
                                                    <th>Date Created</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${customers}" var="item">
                                                    <tr>
                                                        <td class="text-center">#${item.id}</td>
                                                        <td style="width: 150px; padding: 20px">
                                                            <c:if test="${item.avatar != null}">
                                                                <img class="img-fluid" src="../uploads?fileName=${item.avatar}" />
                                                            </c:if>
                                                        </td>
                                                        <td>${item.username}</td>
                                                        <td>${item.fullname}</td>
                                                        <td>${item.phone}</td>
                                                        <td>${item.address}</td>
                                                        <td>
                                                            <fmt:formatDate value="${item.dateCreated}" pattern="dd-MM-yyyy"/>
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
        <!-- AdminLTE App -->
        <script src="assets/js/adminlte.js"></script>

     
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
