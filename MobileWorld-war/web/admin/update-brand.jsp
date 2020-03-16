<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <!-- Select2 -->
        <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
        <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
        <!-- Toastr -->
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
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark">Update Brand</h1>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Primary Information (Required)</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                            class="fas fa-minus"></i></button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove"><i
                                            class="fas fa-remove"></i></button>
                                </div>
                            </div>
                            <!-- /.card-header -->

                            <div class="card-body">

                                <form action="update-brand?action=update-brand" method="post" id="loginForm">
                                    <input type="hidden"  name="id" value="${brand.id}" class="form-control" />
                                    <div class="col-md-12">

                                        <label>Brand Name</label>
                                        <input type="text" id="name" name="name" value="${brand.name}" class="form-control" />

                                    </div>
                                    <div class="col-sm-2 " style="margin-top: 30px">
                                        <button id="btnPublish" class="btn btn-primary">
                                            <i class="fas fa-save mr-2"></i>Save
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- /.content -->
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
        <!-- AdminLTE App -->
        <script src="assets/js/adminlte.js"></script>

        <!-- Toastr -->
        <script src="plugins/toastr/toastr.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                $("#loginForm").validate({

                    rules: {
                        name: {
                            required: true
                        },
                        logo: {
                            required: true
                        }
                    },
                    messages: {
                        name: {
                            required: "<font color='red'>Please enter Name's Brand</font>",
                        },
                        logo: {
                            required: "<font color='red'>Please upload link Images</font>",
                        },
                    },
                });

            });
        </script>
    </body>
</html>
