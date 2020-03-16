<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!-- SLIDER REVOLUTION 4.x SCRIPTS  --> 



<%@include file="include/header.jsp"  %>
<section class="padding-bottom-60">
    <div class="container"> 

        <h5>Order Detail</h5>

        <div class="pay-method check-out"> 

            <!-- Shopping Cart -->
            <div class="heading">
                <h2>Items</h2>
                <hr>
            </div>

            <!-- Check Item List -->
            <c:forEach items="${order}" var="od">
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


            <!-- Totel Price -->
            <div class="totel-price">
                <h4><small> Total Price: </small>   <c:set var="total" value="${0}"/>
                    <c:forEach items="${order}" var="od">
                        <c:set var="total" value="${total + od.price * od.quantity}" />
                    </c:forEach>
                    <fmt:setLocale value="en-US"/>
                    <fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="0" value="${total}" />
            </div>
        </div>

        <!-- Button -->
        <div class="pro-btn"> <a href="User?action=order-history&id=${curAcc.id}" class="btn-round btn-light">Back to List</a>  </div>
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