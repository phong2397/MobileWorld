<%-- 
    Document   : login
    Created on : Jan 13, 2020, 10:17:45 AM
    Author     : lehun
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"  %>

<div class="container">

    <div id="content"> 

        <!-- Linking -->
        <div class="linking">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="/MobileWorld-war">Home</a></li>
                    <li class="active">Enter Email</li>
                </ol>
            </div>
        </div>


        <!-- Blog -->
        <section class="login-sec padding-top-30 padding-bottom-100">
            <div class="container">
                <div class="row">
                    <div class="col-md-6"> 
                        <!-- Login Your Account -->
                        <h5>Enter Your Email to Get new Password</h5>

                        <!-- FORM -->

                        <!-- FORM -->
                        <form action="forgot-pass" method="post" id="register"  >
                            <ul class="row">
                                <li class="col-sm-12"     >   <span style="color:red">${error}</span><li>
                                <li class="col-sm-12">
                                    <label>Email:
                                        <input type="text" class="form-control" name="email" id="email" placeholder="" required title="Username is required"/>


                                    </label>
                                </li>

                                <li class="col-sm-12 text-left">
                                    <input type="submit" value="Verify Email"class="btn-round"/>
                                    <a href="login"  class="btn-round btn-light">Back to Login</a> 
                                </li>
                            </ul>
                        </form>
                    </div>




                </div>
            </div>
        </section>
    </div>
</div>
<!-- JavaScripts --> 
<script src="js/vendors/jquery/jquery.min.js"></script> 
<script src="js/vendors/wow.min.js"></script> 
<script src="js/vendors/bootstrap.min.js"></script> 
<script src="js/vendors/own-menu.js"></script> 
<script src="js/vendors/jquery.sticky.js"></script> 
<script src="js/vendors/owl.carousel.min.js"></script> 
<script src="admin/plugins/toastr/toastr.min.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>

<!-- SLIDER REVOLUTION 4.x SCRIPTS  --> 
<script type="text/javascript" src="js/vendors/jquery.tp.t.min.js"></script> 
<script type="text/javascript" src="js/vendors/jquery.tp.min.js"></script> 
<script src="js/main.js"></script>
<script type="text/javascript">

    $(document).ready(function () {

        $.validator.addMethod("pattern", function (value, element, param) {
            if (this.optional(element)) {
                return true;
            }
            if (typeof param === "string") {
                param = new RegExp("^(?:" + param + ")$");
            }
            return param.test(value);
        }, "Invalid regular expression format");

        $.each($.validator.methods, function (key, value) {
            $.validator.methods[key] = function () {
                if (arguments.length > 0) {
                    arguments[0] = $.trim(arguments[0]);
                }

                return value.apply(this, arguments);
            };
        });
        $("#register").validate({
            rules: {
                email: {
                    required: true,
                    minlength: 4,
                    maxlength: 30,
                },

            },
            messages: {
                email: {
                    required: "<font color='red'>Please enter Email</font>",
                    minlength: "<font color='red'>Email must be at least 4 characters long<font>",
                    maxlength: "<font color='red'>Email must be maximun at least 30 characters long<font>",
                },

            },
        });

        $('#fs-upImage').change(function () {
            var fd = new FormData();
            var files = this.files;
            fd.append('files', files[0]);
            $.ajax({
                url: './upload',
                data: fd,
                cache: false,
                processData: false,
                contentType: false,
                type: 'POST',
                success: function (data) {
                    data = JSON.parse(data);
                    var im = data[0];
                    $('#avt-preview').html(
                            `<img class="img-responsive" src="./uploads?fileName=\${im}" alt="Uploaded Photo">
                            <input hidden type="text" name="avatar" value="\${im}"/>`);
                }
            });
        });
    });

</script>
<%@include file="include/footer.jsp"  %>