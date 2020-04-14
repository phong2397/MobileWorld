<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"  %>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<link rel="stylesheet" href="admin/plugins/toastr/toastr.min.css">

<section class="padding-bottom-60">
    <div class="container"> 

        <h5>Order Successfully</h5>

        <div class="pay-method check-out"> 

            <!-- Shopping Cart -->
            <div class="heading">
                <h2>Items</h2>
                <hr>
            </div>

            <!-- Check Item List -->
            <c:forEach items="${order.orderDetailCollection}" var="od">
                <c:set var="total" value="${total + od.quantity * od.price}" />
                <ul class="row check-item">
                    <li class="col-xs-6">
                        <p>${od.product.name}</p>
                    </li>
                    <li class="col-xs-2 text-center">
                        <p><fmt:formatNumber type="currency" currencySymbol="$" value="${price}" maxFractionDigits="0" /></p>
                    </li>
                    <li class="col-xs-2 text-center">
                        <p>${od.quantity} Items</p>
                    </li>
                    <li class="col-xs-2 text-center">
                        <p><fmt:formatNumber type="currency" currencySymbol="$" value="${od.quantity * od.price}" maxFractionDigits="0" /></p>
                    </li>
                </ul>
            </c:forEach>


            <!-- Delivery infomation -->
            <div class="heading margin-top-50">
                <h2>Delivery infomation</h2>
                <hr>
            </div>


            <!-- Information -->
            <ul class="row check-item infoma">
                <li class="col-sm-3">
                    <h6>Name</h6>
                    <span>${order.customer.fullname}</span> </li>
                <li class="col-sm-3">
                    <h6>Phone</h6>
                    <span>${order.customer.phone}</span> </li>
                <li class="col-sm-6">
                    <h6>Address</h6>
                    <span>${order.customer.address}</span> </li>
            </ul>

            <!-- Totel Price -->
            <div class="totel-price">
                <h4><small> Total Price: </small> <fmt:formatNumber type="currency" currencySymbol="$" value="${total}" maxFractionDigits="0" /></h4>
            </div>
        </div>

        <!-- Button -->
        <div class="pro-btn"> <a href="./" class="btn-round btn-light">Back to Home</a> <a href="#" class="btn-round">Print</a> </div>
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
<script>

</script>
<%@include file="include/footer.jsp" %>