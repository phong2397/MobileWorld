<%-- 
    Document   : change-pass
    Created on : Jan 20, 2020, 11:04:36 AM
    Author     : lehun
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="include/header.jsp"  %>

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

        $("#loginForm").validate({

            rules: {

                oldpass: {
                    required: true, //Required password
                    minlength: 2,
                    maxlength: 30,
                },
                pass: {
                    required: true, //Required password
                    minlength: 8, //Password must be of at least 6 chars
                    maxlength: 30,
                    pattern: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$/i,
                },
                repass: {
                    equalTo: "#pass",

                },
            },

            messages: {
                oldpass: {
                    required: "<font color='red'>Please enter Your Current Pass</font>",
                    minlength: "<font color='red'>Password must be at least 3 characters long</font>",
                    maxlength: "<font color='red'>Password must be maximun at least 30 characters long<font>",
                },
                pass: {
                    required: "<font color='red'>Please enter Password</font>",
                    maxlength: "<font color='red'>Password must be maximun at least 30 characters long<font>",
                    minlength: "<font color='red'>Password must be at least 8 characters long</font>",
                    pattern: "<font color='red'>Invalid Pass,Valid Format:  ninhvu123^,Phong123@<font>",
                },
                repass: {

                    equalTo: "<font color='red'>Your Password does not match</font>",

                },
            },

        });

    });
</script>
<style>
    .ui-datepicker {
        height: auto !important;
        width: 19em;
    }
    .account-title{
        color: #333333;

        font-size: 14px;
        margin-top: 0;
        position: relative;
        text-transform: uppercase;
    }

    .account-title span {
        background: #333333 none repeat scroll 0 0;
        color: #ffffff;
        display: inline-block;
        height: 40px;
        line-height: 40px;
        margin-right: 10px;
        text-align: center;
        width: 40px;
    }
    .details-box ul li a{
        color: #666666;
        display: block;
        margin-bottom: 10px;
        text-transform: capitalize;
        font-size: 14px;
        font-weight: 700;
    }
    .account-list li a{
        color: #333333;
        display: block;
        margin-bottom: 10px;
        text-transform: capitalize;
    }
    .account-list li:last-child a{
        margin-bottom: 0;

    }
    .account-list li
    { list-style-type: none;}
    .account-list li a:hover, .account-list li a:focus, .account-list li.active a,
    .details-box ul li a:hover,  .details-box ul li a:focus, .pay-pal a:hover, .pay-pal a:focus,
    .form-login label a:hover, .form-login label a:focus{
        color: #d6644a;
    }
    .account-form{
        background: #ffffff none repeat scroll 0 0;
        border: 1px solid #d2d2d2;
        margin-bottom: 15px;
        padding: 40px;
    }
    .account-form li{
        list-style-type: none;
    }
    .form-list .selectboxit-container .selectboxit-options{
        width: 100% !important;
    }
    .form-list .selectboxit-container .selectboxit{
        width: 100% !important;  
        border: 1px solid #aaaaaa;
        margin: 0;
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    }
    .form-list .selectboxit-container{
        width: 100% !important;
        margin: 0 0 20px;;
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    }
    .form-list .selectboxit-container span,.form-list .selectboxit-container .selectboxit-options a{
        height: 40px;
        line-height: 40px;
    }
    .form-list input[type="radio"], .form-list input[type="checkbox"] {
        height: auto;   
        position: static;
        width: auto;
        margin-right: 10px;
    }

    .form-login .btn.facebook i, .form-login .btn.twitter i{
        margin-right: 10px;
    }
    .form-login .btn.facebook {
        background-color: #3e5c98;
        border-color: #3e5c98;
        border-radius: 0;
        color: #ffffff;
        display: inline-block;
        font-weight: 700;
        margin-bottom: 20px;
        padding: 10px;
        text-transform: uppercase;
        width: 100%;
    }
    .form-list label {
        vertical-align: middle;
        font-weight: 600;
        text-transform: capitalize;
    }
    .form-list input {
        border: solid 1px #aaa;
        width: 100%;
        height: 42px;
        line-height: 40px;
        padding: 0 20px;
        margin-bottom: 20px;
    }
    .btn-black {
        height: 33px;
        border: none;
        line-height: 33px;
        background: #333;
        padding: 0 20px;
        display: inline-block;
        font-family: Montserrat;
        font-size: 11px;
        border-radius: 3px;
        color: #fff;
        text-transform: uppercase;
        margin: 8px 0 0;
    }
    .form-control{
        margin-bottom: 20px
    }
    .input-text{
        margin-bottom: 20px
    }

</style>
<%
    if (session.getAttribute("curAcc") == null) {
        response.sendRedirect("login.jsp");
    }
%> 
<!-- MY ACCOUNT -->
<div class="account-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-8">
                <!-- HTML -->
                <div id="account-id">
                    <h4 class="account-title"><span class="fa fa-chevron-right"></span>Change Your Password</h4>    
                    <div>

                    </div>
                    <div class="account-form">

                        <form  class="fs-form-change-pass" action="changepass?action=change-pass" method="post" id="loginForm">    
                            <input name="id" type="hidden" value="${id}">
                            <span class="text-success">${message}</span>
                            <span  class="text-danger">${error}</span>
                            <ul class="form-list row">


                                <li class="col-md-7 col-sm-11 ">
                                    <label><i class="fa fa-key"></i>Current Password<em>*</em></label>
                                    <input  name="oldpass" type="password"  class="input-text fs-old-pass"/>

                                </li>
                                <li class="col-md-10 col-sm-8">
                                    <div class="column form-row">
                                        <hr class="border--primary" style="width: 50%; size: 50px; border-width: 1px; margin-left: 50px;
                                            border-style: double; position: relative; margin-bottom: 20px; margin-top:20px">

                                    </div>
                                </li>
                                <li class="col-md-7 col-sm-11">
                                    <div class="column form-row" >
                                        <label><i class="fa fa-key"></i> Password <em>*</em></label>
                                        <input name="pass" type="password" id="pass" class="input-text fs-password"/><br/>

                                    </div>
                                </li>
                                <li class="col-md-7 col-sm-11 ">
                                    <label><i class="fa fa-key"></i> Password Confirm <em>*</em></label>
                                    <input  name="repass" type="password" id="repass" class="input-text fs-repass"/>

                                </li>    
                            </ul>
                            <div class="buttons-set" style="margin-left: 80px;">
                                <button class="btn-black fs-button-change-pass" type="submit"><span><span>Update</span></span></button>
                            </div>                                     
                        </form>
                    </div>                                 
                </div>
            </div>

            <div class="col-md-3 col-sm-4 checkout-steps">
                <!-- USER-RIGHT-MENU -->
                <jsp:include page="include/user-right-menu.jsp" flush="true" />
            </div>
        </div>
    </div>
</div>
<div class="clearfix space20"></div>
<%@include file="include/footer.jsp"  %>