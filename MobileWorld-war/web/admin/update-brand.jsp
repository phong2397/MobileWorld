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
                                          <div class="col-md-6">

                                          
                                              <input type="hidden"  name="id" value="${brand.id}" class="form-control" />

                                        </div>
                                        <div class="col-md-6">

                                            <label>Brand Name</label>
                                            <input type="text" id="name" name="name" value="${brand.name}" class="form-control" />

                                        </div>
                                          <div class="col-md-6" style="margin-top: 20px">
                                        <div class="form-group">
                                            <label>Logo <em>*</em>
                                                <label class="btn btn-sm btn-primary" style="width: auto; border-radius: 3px; padding: 5px; font-size: 13px">
                                                    <i class="fa fa-upload"></i> Upload
                                                    <input type="file" id="fs-upImage" style="display: none">
                                                </label>
                                            </label>
                                            <div id="avt-preview" class="border rounded" style="
                                                 border: 1px solid #e2e2e2;
                                                 border-radius: 3px;
                                                 height: 200px;
                                                 width: 200px;
                                                 "></div>
                                        </div>
                                    </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Category</label>
                                                <input type="text" id="name" name="category" value="${brand.categories}" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-sm-2 " style="margin-top: 30px">
                                            <button id="btnPublish" class="btn btn-primary">
                                                <i class="fas fa-upload mr-2"></i>Publish
                                            </button>
                                        </div>
                                    </form>
                              
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
               
                    <!-- Bootstrap -->
                    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <!-- overlayScrollbars -->
                    <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
                    <!-- AdminLTE App -->
                    <script src="assets/js/adminlte.js"></script>

                    <!-- OPTIONAL SCRIPTS -->
                    <script src="assets/js/demo.js"></script>

                    <!-- PAGE PLUGINS -->
                    <!-- Select2 -->
                    <script src="plugins/select2/js/select2.full.min.js"></script>
                    <!-- InputMask -->
                    <!--<script src="plugins/moment/moment.min.js"></script>-->
                    <script src="plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
                    <!-- iro color picker -->
                    <script src="plugins/iro/iro.min.js"></script>
                    <!-- Toastr -->
                    <script src="plugins/toastr/toastr.min.js"></script>

                    !-- PAGE SCRIPTS -->
       
            
                    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
                    <script type="text/javascript">

                        $(document).ready(function () {



                        $("#loginForm").validate({

                        rules: {
                        name: {
                        required: true, //Required username

                        },
                                logo:{
                                required: true, //Required logo   
                                },
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
                        
                     $('#fs-upImage').change(function () {
                                var fd = new FormData();
                                var files = this.files;

                                fd.append('files', files[0]);


                                $.ajax({
                                    url: '/MobileWorld-war/upload',
                                    data: fd,
                                    cache: false,
                                    processData: false,
                                    contentType: false,
                                    type: 'POST',
                                    success: function (data) {
                                        data = JSON.parse(data);
                                        var im = data[0];
                                        $('#avt-preview').html(
                                                `<img class="img-responsive" src="/uploads/\${im}" alt="Uploaded Photo">
                            <input hidden type="text" name="logo" value="\${im}"/>`);
                                    }
                                });
                            });

                        });
                    </script>
                    </body>

                    </html>
