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
                    <li class="active">Login</li>
                </ol>
            </div>
        </div>


        <!-- Blog -->
        <section class="login-sec padding-top-30 padding-bottom-100">
            <div class="container">
                <div class="row">
                    <div class="col-md-6"> 
                        <!-- Login Your Account -->
                        <h5>Login Your Account</h5>

                        <!-- FORM -->

                        <!-- FORM -->
                        <form action="User?action=login" method="post" id="loginForm"  >
                            <ul class="row">
                                <li class="col-sm-12"     >   <span style="color:red">${error}</span><li>
                                <li class="col-sm-12">
                                    <label>Username
                                        <input type="text" class="form-control" name="username" placeholder="" required title="Username is required"/>


                                    </label>
                                </li>
                                <li class="col-sm-12">
                                    <label>Password
                                        <input type="password" class="form-control" name="pass" placeholder="" required title="Password is required"/>

                                    </label>
                                </li>
                                <li class="col-sm-6">
                                    <div class="checkbox checkbox-primary">
                                        <input id="cate1" class="styled" type="checkbox" >
                                        <label for="cate1"> Keep me logged in </label>
                                    </div>
                                </li>
                                <li class="col-sm-12 text-left">
                                    <input type="submit" value="Login"class="btn-round"/>
                                </li>
                            </ul>
                        </form>
                    </div>



                    <!-- Don’t have an Account? Register now -->
                    <div class="col-md-6">
                        <h5>Don’t have an Account? Register now</h5>

                        <!-- FORM -->
                        <form action="User?action=insert" method="post" id="register">
                            <ul class="row">
                                <li class="col-sm-12"     >   <span style="color:red">${message}</span><li>
                                <li class="col-sm-12">

                                    <label ><i class="	fa fa-user"></i> UserName<em style="color: red">*</em></label>
                                    <input type="text" class="form-control" name="username"  id="username" placeholder="" >

                                </li>
                                <li class="col-sm-12">

                                    <label ><i class="	fa fa-key"></i> Password<em style="color: red">*</em></label>
                                    <input type="password" class="form-control" name="pass"  id="pass" placeholder=""  >

                                </li>

                                <li class="col-sm-12">
                                    <label><i class="fa fa-tag"></i>FullName<em>*</em>       </label>
                                    <input type="text" class="form-control" name="fullname" id="fullname" placeholder=""  >

                                </li>
                                <li class="col-sm-12">
                                    <label><i class="fa fa-phone"></i> Phone <em>*</em></label>
                                    <input type="number" class="form-control" name="phone" id="phone" placeholder="" pattern="[0-9]+" />

                                </li>
                                <li class="col-sm-12">
                                    <label><i class="fa fa-coffee"></i> Address <em>*</em></label>
                                    <input type="text" class="form-control" name="address" id="address" placeholder="" />

                                </li>
                                <li class="col-sm-12">
                                    <label>Avatar <em>*</em>
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
                                </li>


                                <li class="col-sm-12 text-left">
                                    <button type="submit" class="btn-round">Register</button>
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


        $("#register").validate({
            rules: {
                username: {
                    required: true, //Required username
                    minlength: 4,
                    maxlength: 30,
                    pattern: /^(?![^-]*--+)(?![0-9]+$)[a-zA-Z0-9][-a-zA-Z0-9]{2,23}[a-zA-Z0-9]$/i,

                },
                pass: {
                    required: true, //Required password
                    minlength: 8, //Password must be of at least 6 chars
                    maxlength: 15,
                },

                fullname: {
                    required: true,
                    pattern: /^[A-Z][a-z]{0,9}[\s,][A-Z][a-z]{0,9}$/i,

                },
                phone: {required: true,
                    pattern: /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4}$/i
                },

                address: {
                    required: true,
                    
                },
            },

            messages: {
                username: {
                    required: "<font color='red'>Please enter Username</font>",
                    minlength: "<font color='red'>Username must be at least 4 characters long<font>",
                    maxlength: "<font color='red'>Username must be maximun at least 30 characters long<font>",
                    pattern: "<font color='red'>Invalid Username,Valid Format: minh77 , Long23 , Ninh<font>"
                },

                pass: {
                    required: "<font color='red'>Please enter Password</font>",
                    maxlength: "<font color='red'>Password must be maximun at least 15 characters long<font>",
                    minlength: "<font color='red'>Password must be at least 8 characters long</font>",
                    pattern: "<font color='red'>Invalid Username,Valid Format:  AB*&^lou#,Phong23@<font>"
                },
                fullname: {
                    required: "<font color='red'>Please enter Fullname</font>",

                    pattern: "<font color='red'>Invalid Fullname,Minimum at least each word is 10 characters,  Valid Format: Phong, Chau , Phong Chau, Phong<font>"
                },
                address: {
                    required: "<font color='red'>Please enter Address</font>",
                    pattern: "<font color='red'>Invalid Username,e.g: 61 Park Street, Camden, ME, 04843, US<font>"
                },
                phone: {
                    required: "<font color='red'>Please enter Phone Number</font>",
                    pattern: "<font color='red'>Invalid Phone,Valid Format:(123) 456-7890\n\,  123-456-7890  , 123.456.7890 , 1234567890<font>"
                },
            },
        });

        $("#loginForm").validate({

            rules: {
                username: {
                    required: true, //Required username

                },

                pass: {
                    required: true, //Required password

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