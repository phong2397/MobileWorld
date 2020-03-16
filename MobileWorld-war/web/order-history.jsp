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


<!-- SLIDER REVOLUTION 4.x SCRIPTS  --> 
<script type="text/javascript" src="js/vendors/jquery.tp.t.min.js"></script> 
<script type="text/javascript" src="js/vendors/jquery.tp.min.js"></script> 
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
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


<div class="account-wrap">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- HTML -->
                <div id="account-id">

                    <h4 class="account-title"><span class="fa fa-chevron-right"></span>Your Order History</h4>

                    <div style="padding: 10px;"></div>
                    <div class="order-history">
                        <table class="table table-striped table-bordered" id="table-order-history">
                            <thead>
                                <tr>
                                    <th style="font-weight: 700;">Order ID</th>
                                    <th style="font-weight: 700;">Customer(s)</th>
                                    <th style="font-weight: 700;">Total</th>

                                    <th style="font-weight: 700;">Order Date</th>
                                    <th style="font-weight: 700;">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${orderList.size() > 0}">
                                    <c:forEach items="${orderList}" var="item">
                                        <tr>

                                            <td align="center"><a href="order?action=order-detail&id=${item.id}">Order No.${item.id}</a></td>
                                            <td align="center">
                                                <div class="item-price" name ="username">${item.customer.fullname}</div>
                                            </td>
                                            <td>
                                                <c:set var="total" value="${0}"/>
                                                <c:forEach items="${item.orderDetailCollection}" var="od">
                                                    <c:set var="total" value="${total + od.price * od.quantity}" />
                                                </c:forEach>
                                                <fmt:setLocale value="en-US"/>
                                                <fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="0" value="${total}" />
                                            </td>

                                            <td align="center">
                                                <fmt:formatDate value="${item.orderDate}" pattern="dd-MM-yyyy"/>
                                            </td>

                                            <td align="center">
                                         
                                    <p>Availability: 
                                        <c:if test="${item.state == 1}">
                                            <span class="in-stock">PENDING</span>
                                        </c:if>

                                        <c:if test="${item.state == 2}">
                                            <span class="text-warning">SUCCESS</span>
                                        </c:if>

                                       
                                    </p>
                               
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </c:if>

                                <c:if test="${orderList.size() == 0}">
                                    <tr>
                                        <td colspan="5">No Order</td>
                                    </tr>
                                </c:if>

                            </tbody>
                        </table>

                        <div class="table-btn">
                            <a href="User?action=update&id=${curAcc.id}" class="btn-black">Back To Account</a>
                        </div>
                    </div>                          
                </div>
            </div>
            <div class="col-md-3 col-sm-4 checkout-steps">
                <!-- USER-RIGHT-MENU -->

            </div>
        </div>
    </div>
</div>
<%@include file="include/footer.jsp"  %>