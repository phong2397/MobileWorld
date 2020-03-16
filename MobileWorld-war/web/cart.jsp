<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"  %>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<link rel="stylesheet" href="admin/plugins/toastr/toastr.min.css">
<!-- Linking -->
<div class="linking">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="/MobileWorld-war">Home</a></li>
            <li class="active">Cart</li>
        </ol>
    </div>
</div>

<section class="shopping-cart padding-bottom-60">
    <div class="container">
        <table class="table">
            <thead>
                <tr>
                    <th>Items</th>
                    <th class="text-center">Price</th>
                    <th class="text-center">Quantity</th>
                    <th class="text-center">Total Price </th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${cart.size() > 0}">
                    <c:forEach items="${cart}" var="item">
                        <c:set var="total" scope="page" value="${total + item.quantity * item.finalPrice}" />
                        <tr item="${item.product.id}">
                            <td><div class="media">
                                    <div class="media-left">
                                        <a href="./product?id=${item.product.id}">
                                            <img class="img-responsive" src="./uploads?fileName=${item.product.thumb}" alt="Photo" >
                                        </a> 
                                    </div>
                                    <div class="media-body">
                                        <p>${item.product.name}</p>
                                    </div>
                                </div></td>
                            <td class="text-center padding-top-60"><fmt:formatNumber type="currency" currencySymbol="$" value="${item.finalPrice}" maxFractionDigits="0" /></td>
                            <td class="text-center"><!-- Quinty -->

                                <div class="quinty padding-top-20">
                                    <input type="number" class="cart-quantity" target="${item.product.id}" value="${item.quantity}">
                                </div></td>
                            <td class="text-center padding-top-60 total-price">
                                <fmt:formatNumber type="currency" currencySymbol="$" value="${item.quantity * item.finalPrice}" maxFractionDigits="0" />
                            </td>
                            <td class="text-center padding-top-60">
                                <a href="#" class="cart-remove" target="${item.product.id}"><i class="fa fa-close"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${cart.size() == 0}">
                    <tr>
                        <td colspan="5" class="text-center">No Item</td>
                    </tr>
                </c:if>
            </tbody>

        </table>

        <c:if test="${cart.size() > 0}">
            <!-- Promotion -->
            <div class="promo">

                <!-- Grand total -->
                <div class="g-totel text-right" style="float: none">
                    <h5 class="grand-total">Grand total: <span><fmt:formatNumber type="currency" currencySymbol="$" value="${total}" maxFractionDigits="0" /></span></h5>
                </div>
            </div>
            <!-- Button -->
            <div class="pro-btn"> <a href="./product" class="btn-round btn-light">Continue Shopping</a></div>
        </c:if>

        <c:if test="${cart.size() == 0}">
            <div class="pro-btn"> <a href="./product" class="btn-round btn-light">Go Shopping</a> </div>
        </c:if>

        <c:if test="${cart.size() > 0}">
            <div class="pay-method" style="margin-top: 40px">
                <div class="row">
                    <div class="col-md-12"> 

                        <!-- Your information -->
                        <div class="heading">
                            <h2>Your information</h2>
                            <hr>
                        </div>
                        <form action="./payment" method="post" id="register">
                            <div class="row"> 
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fullname"> Fullname </label>
                                        <input class="form-control" name="fullname" id="fullname" type="text" value="${user.fullname}">
                                    </div>
                                </div>


                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="phone"> Phone </label>
                                        <input class="form-control" name="phone" id="phone" type="text" value="${user.phone}">
                                    </div>
                                </div>

                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="address"> Address </label>
                                        <input class="form-control" name="address" id="address" type="text" value="${user.address}">
                                    </div>
                                </div>

                                <div class="pro-btn"> <input type="submit" id="btn-pay" class="btn-round" value="Confirm"></input> </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:if>

    </div>
</section>

<!-- JavaScripts --> 
<script src="js/vendors/jquery/jquery.min.js"></script> 
<script src="js/vendors/wow.min.js"></script> 
<script src="js/vendors/bootstrap.min.js"></script> 
<script src="js/vendors/own-menu.js"></script> 
<script src="js/vendors/jquery.sticky.js"></script> 
<script src="js/vendors/owl.carousel.min.js"></script> 
<!-- SLIDER REVOLUTION 4.x SCRIPTS  --> 
<script type="text/javascript" src="rs-plugin/js/jquery.tp.t.min.js"></script> 
<script type="text/javascript" src="rs-plugin/js/jquery.tp.min.js"></script>
<script type="text/javascript" src="admin/plugins/toastr/toastr.min.js"></script> 
<script src="js/main.js"></script> 

<script type="text/javascript"
src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>

<script>
    $(function () {
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
            if(arguments.length > 0) {
                arguments[0] = $.trim(arguments[0]);
            }

            return value.apply(this, arguments);
        };
    });

        $("#register").validate({

            rules: {
                fullname: {
                    required:true,
                    minlength: 2,
                    maxlength: 30,
                    
                },
                phone: {    required:true,
                    pattern: /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4}$/i,
         
                },

                address: {
                      required:true,
                    minlength: 6,
                    maxlength: 30,
               
                },

            },

            messages: {
                fullname: {
                    required: "<font color='red'>Please enter Fullname</font>",
                    minlength: "<font color='red'>Fullname must be at least 2 characters long<font>",
                    maxlength: "<font color='red'>Fullname must be maximun at least 30 characters long<font>",
                },
                address: {
                    required: "<font color='red'>Please enter Address</font>",
                    maxlength: "<font color='red'>Address must be maximun at least 30 characters long<font>",
                    minlength: "<font color='red'>Address must be at least 6 characters long</font>",
                },
                phone: {
                    required: "<font color='red'>Please enter Phone Number</font>",
                    pattern: "<font color='red'>Please enter valid phone - Phone begin 01 or 09 and 10 to 11 number!<font>"
                },
            },

        });


        $('.cart-quantity').change(function () {
            var val = parseInt($(this).val().trim());
            if (val <= 0) {
                toastr.error('The quantity must be in range from 1 to 10');
                $(this).val(1);
            }

            if (val > 10) {
                toastr.error('The quantity must be in range from 1 to 10');
                $(this).val(10);
            }
        });
    });
</script>

<%@include file="include/footer.jsp" %>