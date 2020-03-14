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
        <!-- SweetAleart -->
        <link rel="stylesheet" href="plugins/sweetalert2/sweetalert2.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="assets/css/adminlte.min.css">
        <!-- Custom style -->
        <link rel="stylesheet" href="assets/css/custom.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    </head>
    <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
        <% 
   if (session.getAttribute("curAcc") == null)
   {
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
                                    <h1 class="m-0 text-dark">Add New Product</h1>
                                </div>
                                <div class="col-sm-6 text-right">
                                    <button id="btnPublish" class="btn btn-primary">
                                        <i class="fas fa-upload mr-2"></i>Publish
                                    </button>
                                </div>
                            </div><!-- /.row -->
                        </div><!-- /.container-fluid -->
                    </div>
                    <!-- /.content-header -->

                    <!-- Main content -->
                    <section class="content">
                        <div class="container-fluid">
                            <div class="card card-primary card-outline card-tabs">
                                <div class="card-header p-0 border-bottom-0">
                                    <ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link font-weight-bold active" id="custom-tabs-three-home-tab"
                                               data-toggle="pill" href="#custom-tabs-three-home" role="tab"
                                               aria-controls="custom-tabs-three-home" aria-selected="false">Primary Information</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link font-weight-bold " id="custom-tabs-three-profile-tab"
                                               data-toggle="pill" href="#custom-tabs-three-profile" role="tab" 
                                               aria-controls="custom-tabs-three-profile" aria-selected="true">Specifications</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link font-weight-bold " id="custom-tabs-three-messages-tab" 
                                               data-toggle="pill" href="#custom-tabs-three-messages" role="tab" 
                                               aria-controls="custom-tabs-three-messages" aria-selected="false">Configuration options</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content" id="custom-tabs-three-tabContent">
                                        <div class="tab-pane fade active show" id="custom-tabs-three-home" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Category</label>
                                                        <select id="category" name="category" class="form-control select2">
                                                            <c:forEach items="${categories}" var="item">
                                                                <option value="${item.id}">${item.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Brand</label>
                                                        <select id="brand" name="brand" class="form-control select2">
                                                            <c:forEach items="${brands}" var="item">
                                                                <option value="${item.id}">${item.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Product Name</label>
                                                        <input type="text" id="name" name="name" class="form-control" />
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Price</label>
                                                        <div class="input-group">
                                                            <input type="text" id="price" name="price" class="form-control" />
                                                            <span class="input-group-append">
                                                                <span class="input-group-text">$</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Colors</label>
                                                        <div class=""></div>
                                                        <div class="border rounded">
                                                            <div class="row">
                                                                <div class="col-md-6 border-right">
                                                                    <div id="color-picker" class="d-flex justify-content-center p-4"></div>
                                                                    <div class="input-group input-group-sm p-4">
                                                                        <span class="input-group-prepend">
                                                                            <span id="colorPreview" class="input-group-text"></span>
                                                                        </span>
                                                                        <input type="text" class="form-control" id="colorName" placeholder="Enter color name">
                                                                        <span class="input-group-append">
                                                                            <button type="button" class="btn btn-success" id="btnAddColor">
                                                                                <i class="fas fa-angle-double-right"></i>
                                                                            </button>
                                                                        </span>
                                                                    </div>                                                   
                                                                </div>

                                                                <div class="col-md-6 p-4">
                                                                    <div class="scrollPane">
                                                                        <div id="colorContainer"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Gallery</label>
                                                        <div class="border rounded p-4">
                                                            <div id="galleryScrollPane">
                                                                <div class="gallery-container">
                                                                    <div class="content"></div>
                                                                    <label class="image-chooser">
                                                                        <input type="file" accept="image/png,image/jpeg"
                                                                               multiple="true" style="display: none" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="custom-tabs-three-profile" 
                                             role="tabpanel" aria-labelledby="custom-tabs-three-profile-tab">
                                            <div class="row" id="specifications"></div>
                                        </div>
                                        <div class="tab-pane fade" id="custom-tabs-three-messages" 
                                             role="tabpanel" aria-labelledby="custom-tabs-three-messages-tab">

                                        </div>
                                    </div>
                                </div>
                                <!-- /.card -->
                            </div>
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
        <script src="plugins/overlayScrollbars/js/OverlayScrollbars.min.js"></script>
        <!-- SweetAleat -->
        <script src="plugins/sweetalert2/sweetalert2.min.js"></script>
        <!-- AdminLTE App -->
        <script src="assets/js/adminlte.js"></script>
        <!-- Main User Script -->
        <script src="assets/js/main.js"></script>
        <!-- OPTIONAL SCRIPTS -->
        <script src="assets/js/demo.js"></script>

        <!-- PAGE PLUGINS -->
        <!-- Select2 -->
        <script src="plugins/select2/js/select2.full.min.js"></script>
        <!-- IMask -->
        <script src="plugins/imask/imask.min.js"></script>
        <!-- iro color picker -->
        <script src="plugins/iro/iro.min.js"></script>
        <!-- Toastr -->
        <script src="plugins/toastr/toastr.min.js"></script>

        !-- PAGE SCRIPTS -->
        <script>
            var attributeList = ${attributes};
        </script>
        <script src="assets/js/pages/create-product.js"></script>

    </body>
</html>