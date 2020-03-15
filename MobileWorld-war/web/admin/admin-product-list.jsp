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
                                <h1 class="m-0 text-dark">
                                    Products
                                    <a href="./create-product" class="btn btn-success">
                                        <i class="fa fa-plus mr-1"></i> Create new
                                    </a>
                                </h1>
                            </div>
                            <div class="col-4 text-right">
                                <a target="_blank" href="./product-report" class="btn btn-default">Generate Report</a>
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
                                    <div class="card-body">
                                        <table class="table table-hover data-table" data-order='[[ 0, "desc" ]]'>
                                            <thead>
                                                <tr>
                                                    <th class="text-center text-muted">#ID</th>
                                                    <th class="text-center"><i class="fas fa-image"></i></th>
                                                    <th>Name</th>
                                                    <th>Category</th>
                                                    <th>Brand</th>
                                                    <th class="text-center">Date Created</th>
                                                    <th class="text-center">Last Updated</th>
                                                    <th class="text-center">State</th>
                                                    <th class="text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${products}" var="item">
                                                    <tr>
                                                        <td class="text-center">#${item.id}</td>
                                                        <td style="width: 150px; padding: 20px">
                                                            <img class="img-fluid" src="../uploads?fileName=${item.thumb}" /></td>
                                                        <td>${item.name}</td>
                                                        <td>${item.category.name}</td>
                                                        <td>${item.brand.name}</td>
                                                        <td class="text-center"><fmt:formatDate value="${item.dateCreated}" dateStyle="SHORT" /></td>
                                                        <td class="text-center">
                                                            <c:if test="${item.dateUpdated != null}">
                                                                <fmt:formatDate value="${item.dateUpdated}" dateStyle="SHORT" />
                                                            </c:if>

                                                            <c:if test="${item.dateUpdated == null}">
                                                                Not update
                                                            </c:if>
                                                        </td>
                                                        <td class="text-center">
                                                            <select class="select-state" target="${item.id}">
                                                                <option value="1" ${item.state == 1 ? "selected" : ""}>In Stock</option>
                                                                <option value="2" ${item.state == 2 ? "selected" : ""}>Out Stock</option>
                                                                <option value="3" ${item.state == 3 ? "selected" : ""}>Stop Selling</option>
                                                            </select>
                                                        </td>
                                                        <td class="text-center">
                                                            <a target="_blank" href="../product?id=${item.id}" class="btn btn-primary btn-sm">View</a>
                                                            <a href="./update-product?id=${item.id}" class="btn btn-info btn-sm">Update</a>
                                                            <button type="button" class="btn btn-danger btn-sm btn-delete-product" target="${item.id}">Delete</button>
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
                $(".data-table").DataTable(dataTableOptions);

                $('.select-state').change(function (e) {
                    e.preventDefault();
                    var id = $(this).attr('target').trim();
                    var state = $(this).val().trim();
                    $.post('./change-state', {
                        id: id,
                        state: state
                    }, function (resp) {
                        toastr.success('The product state updated');
                    });
                });

                $('.btn-delete-product').click(function () {
                    Swal.fire({
                        title: 'Delete product',
                        text: 'Are you sure delete this product?',
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes',
                        cancelButtonText: 'No',
                        customClass: {
                            confirmButton: 'btn',
                            cancelButton: 'btn'
                        }
                    }).then((result) => {
                        if (result.value) {
                            var id = $(this).attr('target');
                            $.post('./delete-product', {
                                id: id
                            }, function (res) {
                                if (res == 'successed') {
                                    window.location.reload();
                                } else {
                                    toastr.error('Cannot delete a product that already has a buyer!');
                                }
                            });
                        }
                    });
                });
            });

        </script>
    </body>
</html>
