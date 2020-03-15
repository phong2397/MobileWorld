<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>MobileWorld | Update product</title>

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Select2 -->
        <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
        <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
        <!-- daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
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
                                <h1 class="m-0 text-dark">Update Product</h1>
                            </div>
                            <div class="col-sm-6 text-right">
                                <button id="btnUpdate" class="btn btn-primary">
                                    <i class="fas fa-save mr-2"></i>Save
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
                                        <a class="nav-link font-weight-bold active" id="home-tab-link"
                                           data-toggle="pill" href="#home-tab" role="tab"
                                           aria-controls="home-tab-link" aria-selected="false">Primary Information (*)</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link font-weight-bold " id="specs-tab-link"
                                           data-toggle="pill" href="#specs-tab" role="tab" 
                                           aria-controls="specs-tab-link" aria-selected="true">Specifications (*)</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link font-weight-bold " id="promotion-tab-link"
                                           data-toggle="pill" href="#promotion-tab" role="tab" 
                                           aria-controls="promotion-tab-link" aria-selected="true">Promotion</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content" id="custom-tabs-three-tabContent">
                                    <div class="tab-pane fade active show" id="home-tab" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Category</label>
                                                    <select id="category" name="category" class="form-control select2">
                                                        <c:forEach items="${categories}" var="item">
                                                            <option <c:if test="${item == product.category}">selected</c:if> value="${item.id}">${item.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Brand</label>
                                                    <select id="brand" name="brand" class="form-control select2">
                                                        <c:forEach items="${brands}" var="item">
                                                            <option <c:if test="${item == product.brand}">selected</c:if> value="${item.id}">${item.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Product Name</label>
                                                    <input type="text" id="name" name="name" class="form-control" value="${product.name}" />
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Price</label>
                                                    <div class="input-group">
                                                        <input type="text" id="price" name="price" class="form-control" value="${product.price}" />
                                                        <span class="input-group-append">
                                                            <span class="input-group-text">$</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Gallery</label>
                                                    <div class="border rounded p-4">
                                                        <div id="galleryScrollPane">
                                                            <div class="gallery-container row" style="flex-wrap: nowrap; margin: 1rem 0">
                                                                <c:forEach items="${product.imageCollection}" var="item">
                                                                    <div class="image-preview col-md-3">
                                                                        <span class="close" title="Remove" onclick="removeImage(this, '${item.source}')">×</span>
                                                                        <div class="image" style="background-image:url(../uploads?fileName=${item.source})">
                                                                            <input hidden type="text" name="images" value="${item.source}"/>
                                                                        </div>
                                                                        <div class="text-center radio-avt">
                                                                            <div class="custom-control custom-radio">
                                                                                <input class="custom-control-input" type="radio" id="radio${item.id}" name="thumb" value="${item.source}" ${item.source == product.thumb ? 'checked' : ''}>
                                                                                <label for="radio${item.id}" class="custom-control-label">Avatar</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                                <label class="image-chooser col-md-3">
                                                                    <input type="file" accept="image/png,image/jpeg"
                                                                           multiple="true" style="display: none" onchange="uploadImage(this)"/>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="specs-tab" 
                                         role="tabpanel" aria-labelledby="specs-tab">
                                        <div class="row">
                                            <c:forEach items="${attributes}" var="attr">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>${attr.name}</label>
                                                        <input type="text" class="form-control specs" attr-id="${attr.id}" attr-name="${attr.name}" value="${product.specificationCollection.stream().filter(s->attr.id == s.getAttribute().getId()).findFirst().orElse(null).value}" />
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="promotion-tab" 
                                         role="tabpanel" aria-labelledby="promotion-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Promotion amount</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                                        </div>
                                                        <input type="text" class="form-control float-right" id="discount" value="${product.discount}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Promotion date range</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fas fa-clock"></i></span>
                                                        </div>
                                                        <input type="text" class="form-control float-right" id="reservationtime">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
        <!-- date-range-picker -->
        <script src="plugins/moment/moment.min.js"></script>
        <script src="plugins/daterangepicker/daterangepicker.js"></script>
        <!-- Toastr -->
        <script src="plugins/toastr/toastr.min.js"></script>
        <script src="assets/js/main.js"></script>

        !-- PAGE SCRIPTS -->
        <script>
            var id = ${product.id};
            var images = ${images};
            
            var startPromotion = '${startDate}';
            var endPromotion = '${endDate}';
        </script>
        <script src="assets/js/pages/update-product.js"></script>

    </body>
</html>