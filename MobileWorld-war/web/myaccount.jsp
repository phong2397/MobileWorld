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


        $("#register").validate({
            rules: {
                username: {
                    required: true,
                    minlength: 4,
                    maxlength: 30,

                },

                fullname: {

                    required: true,
                    minlength: 2,
                    maxlength: 30,

                },
                phone: {
                    required: true,
                    pattern: /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4}$/i
                },

                address: {
                    minlength: 6,
                    maxlength: 40,
                    required: true,

                },
            },

            messages: {
                username: {
                    required: "<font color='red'>Please enter Username</font>",
                    minlength: "<font color='red'>Username must be at least 4 characters long<font>",
                    maxlength: "<font color='red'>Username must be maximun at least 30 characters long<font>",

                },

                fullname: {
                    required: "<font color='red'>Please enter Fullname</font>",
                    minlength: "<font color='red'>Fullname must be at least 2 characters long<font>",
                    maxlength: "<font color='red'>Fullname must be maximun at least 30 characters long<font>",

                },
                address: {
                    minlength: "<font color='red'>Address must be at least 6 characters long<font>",
                    maxlength: "<font color='red'>Address must be maximun at least 40 characters long<font>",
                    required: "<font color='red'>Please enter Address</font>",

                },
                phone: {
                    required: "<font color='red'>Please enter Phone Number</font>",
                    pattern: "<font color='red'>Invalid Phone,Valid Format:(123) 456-7890\n\
  ,  123-456-7890  , 123.456.7890 , 1234567890<font>"
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
                            `<img class="img-responsive" src="./uploads?fileName=\${im}" alt="Uploaded Photo">
                            <input hidden type="text" name="avatar" value="\${im}"/>`);
                }
            });
        });

    });
</script>
<style>
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
    .form-login .btn.twitter {
        background-color: #22a9e0;
        border-color: #22a9e0;
        border-radius: 0;
        color: #ffffff;
        display: inline-block;
        font-weight: 700;
        margin-bottom: 20px;
        padding: 10px;
        text-transform: uppercase;
        width: 100%;
    }
    .form-login .btn.facebook:hover, .form-login .btn.twitter:hover,
    .form-login .btn.facebook:focus, .form-login .btn.twitter:focus{
        background-color: #333333 ;
        border-color: #333;
    }
    .create-new-account h3{
        margin: 0 0 42px;
        text-transform: capitalize;
    }
    .account-form.create-new-account li {
        font-size: 14px;
        margin-bottom: 16px;
        text-transform: capitalize;
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
        margin: 8px 15px 0;
    }
    .form-control{
        margin-bottom: 20px
    }
    .input-text{
        margin-bottom: 20px
    }

</style>

<!-- MY ACCOUNT -->
<div class="account-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-8">
                <!-- HTML -->
                <div id="account-id">
                    <h4 class="account-title"><span class="fa fa-chevron-right"></span>Change Your Personal Details</h4>                                                                  
                    <div class="account-form">
                        <form  class="form-update-user" method="POST" action="UpdateUser" id="register">      
                            <span class="text-success">${message}</span>
                            <ul class="row">

                                <input type="hidden" name="id" value="${user.id}" />

                                <li class="col-md-12 col-sm-12">
                                    <label><i class="fa fa-envelope"></i> Username <em>*</em></label>
                                    <div class="fs-email-update">

                                        <input type="text" name="username"  value="${user.username}" class="form-control"/>

                                    </div>
                                </li>

                                <li class="col-md-12 col-sm-6">
                                    <label>Full Name <em>*</em></label>
                                    <div class="fs-firstname-update">
                                        <input type="text" name="fullname"   value="${user.fullname}" class="form-control"/>

                                    </div>
                                </li>
                                <li class="col-md-12 col-sm-6">
                                    <label>Phone <em>*</em></label>
                                    <div class="fs-lastname-update">
                                        <input type="number" name="phone"   value="${user.phone}" class="form-control" />

                                    </div>
                                </li>
                                <li class="col-md-12 col-sm-6">  
                                    <label><i class="fa fa-venus-mars"></i> Address</label>
                                    <div class="fs-address-update">
                                        <input type="text" name="address"  value="${user.address}" class="form-control" />

                                    </div>
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
                                         ">
                                        <img src="./uploads?fileName=${user.avatar}" style="max-height: 100%">
                                    </div>
                                </li>
                                <div class="buttons-set">
                                    <button class="btn-black fs-button-update-user" type="submit"><span>Update Account</span></button>
                                </div>

                            </ul>

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