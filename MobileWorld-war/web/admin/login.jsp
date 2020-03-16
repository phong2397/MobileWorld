<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>MobileWorld | Admin Panel</title>

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="assets/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                jQuery.validator.addMethod("noSpace", function (value, element) {
                    return value.indexOf(" ") < 0 && value != "";
                }, " <font color='red'>No space  </font>");

                $("#loginForm").validate({

                    rules: {
                        username: {
                            required: true, //Required username
                            noSpace: true
                        },

                        pass: {
                            required: true, //Required password
                            noSpace: true
                        }

                    },

                    messages: {
                        username: {
                            required: "<font color='red'>Please enter Username</font>",

                        },

                        pass: {
                            required: "<font color='red'>Please enter Password</font>",

                        },
                    },

                });

            });
        </script>
    </head>
    <body class="hold-transition login-page">
        <%
            if (session.getAttribute("cur") != null) {
                response.sendRedirect("product-list");
            }
        %> 
        <div class="login-box">
            <div class="login-logo">
                <a href="../../index2.html"><b>Admin</b>Login</a>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Sign in to start </p>

                    <form action="login?action=login" method="post" id="loginForm">
                        <span style="color:red">${error}</span>
                        <div class="input-group mb-3">
                            <div class="col-sm-12">
                                <label><i class="		fa fa-anchor"></i>  Username:       </label>
                                <input type="text" name="username" id="username" class="form-control" />

                            </div>


                        </div>
                        <div class="input-group mb-3">

                            <div class="col-sm-12">
                                <label><i class="	fa fa-key"></i>  Password:       </label>
                                <input type="password" name="pass" id="pass" class="form-control" />

                            </div>
                        </div>
                        <div class="row">
                        
                            <!-- /.col -->
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->
    </body>
</html>