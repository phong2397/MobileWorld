<%-- 
    Document   : home
    Created on : Jan 12, 2020, 11:53:18 AM
    Author     : junev
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"  %>


<!-- Linking -->
<div class="linking">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="/MobileWorld-war">Home</a></li>
            <li class="active">Filter</li>
        </ol>
    </div>
</div>

<!-- Slid Sec -->
<div class="container">
    <div class="row"> 
        <!-- Shop Side Bar -->
        <%@include file="include/shop-sidebar.jsp" %>
        <!-- Products -->
        <div class="col-md-9">

            <!-- Items -->
            <div class="col-list"> 
                <c:forEach items="${products}" var="item">
                    <!-- Product -->
                    <div class="product">
                        <article>                   
                            <!-- Product img -->
                            <div class="media-left">
                                <div class="item-img">
                                    <a href="./product?id=${item.id}"><img class="img-responsive" src="./uploads?fileName=${item.thumb}" ></a>
                                </div>
                            </div>                  
                            <!-- Content -->
                            <div class="media-body">
                                <div class="row">                       
                                    <!-- Content Left -->
                                    <div class="col-sm-7">
                                        <span class="tag">${item.category.name}</span>
                                        <a href="./product?id=${item.id}" class="tittle">${item.name}</a> 
                                        <!-- Reviews -->

                                        <p class="rev">
                                            <c:if test="${item.ratingCollection.size() > 0}">  
                                                <c:set var="sum" value="0"></c:set>
                                                <c:forEach items="${item.ratingCollection}" var="r">
                                                    <c:set var="sum" value="${sum = sum + r.stars}"></c:set>
                                                </c:forEach>
                                                <c:set var="stars" value="${sum/item.ratingCollection.size()}"></c:set>
                                                <c:forEach begin="1" end="${stars}">
                                                    <i class="fa fa-star"></i>
                                                </c:forEach>     
                                                <c:forEach begin="${stars + 1}" end="5">
                                                    <i class="fa fa-star-o"></i> 
                                                </c:forEach>
                                            </c:if>

                                            <c:if test="${item.ratingCollection.size() == 0}">
                                                <i class="fa fa-star-o"></i> 
                                                <i class="fa fa-star-o"></i> 
                                                <i class="fa fa-star-o"></i> 
                                                <i class="fa fa-star-o"></i> 
                                                <i class="fa fa-star-o"></i> 
                                            </c:if>
                                            <span class="margin-left-10">${item.ratingCollection.size()} Review(s)</span>
                                        </p>
                                        <ul class="bullet-round-list">
                                            <c:forEach items="${item.specificationCollection}" var="s">
                                                <c:if test="${s.attribute.show}">
                                                    <li>${s.attribute.name}: ${s.value}</li>
                                                    </c:if>
                                                </c:forEach>
                                        </ul>
                                    </div>                      
                                    <!-- Content Right -->
                                    <div class="col-sm-5 text-center">
                                        <div class="position-center-center">
                                            <div class="price">
                                                <c:if test="${item.discount != null}">
                                                    <b><fmt:formatNumber type="currency" currencySymbol="$" value="${item.price - item.discount}" maxFractionDigits="0" /> </b>
                                                    <b><fmt:formatNumber type="currency" currencySymbol="$" value="${item.price}" maxFractionDigits="0" /></b>
                                                </c:if>
                                                <c:if test="${item.discount == null}">
                                                    <b><fmt:formatNumber type="currency" currencySymbol="$" value="${item.price - item.discount}" maxFractionDigits="0" /> </b>
                                                </c:if> 
                                            </div>
                                            <p>
                                                Availability: 
                                                <span class="in-stock">
                                                    <c:if test="${item.state == 1}">In stock</c:if>
                                                    <c:if test="${item.state == 2}">Out stock</c:if>
                                                    </span>
                                                </p>
                                                <a href="#" target="${item.id}" class="btn-round btnCart"><i class="icon-basket-loaded"></i> Add to Cart</a> </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </c:forEach>
            </div>               
        </div>
    </div>
</div>

<%@include file="include/recently-viewed-items.jsp" %>

<!-- JavaScripts --> 
<script src="js/vendors/jquery/jquery.min.js"></script> 
<script src="js/vendors/wow.min.js"></script> 
<script src="js/vendors/bootstrap.min.js"></script> 
<script src="js/vendors/own-menu.js"></script> 
<script src="js/vendors/jquery.sticky.js"></script> 
<script src="js/vendors/owl.carousel.min.js"></script> 
<script src="admin/plugins/toastr/toastr.min.js"></script> 
<!-- SLIDER REVOLUTION 4.x SCRIPTS  --> 
<script type="text/javascript" src="rs-plugin/js/jquery.tp.t.min.js"></script> 
<script type="text/javascript" src="rs-plugin/js/jquery.tp.min.js"></script> 
<script src="js/vendors/jquery.nouislider.min.js"></script>     
<script src="js/main.js"></script> 
<script>
    <%
        String minPrice = request.getParameter("minPrice") != null ? request.getParameter("minPrice") : "0";
        String maxPrice = request.getParameter("maxPrice") != null ? request.getParameter("maxPrice") : "5000";
    %>
    jQuery(document).ready(function ($) {
        var slider = $("#price-range").noUiSlider({
            tooltips: [true, true],
            range: {
                'min': [0],
                'max': [5000]
            },
            start: [<%= minPrice%>, <%= maxPrice%>],
            connect: true,
            serialization: {
                lower: [
                    $.Link({
                        target: $("#price-min")
                    })
                ],
                upper: [
                    $.Link({
                        target: $("#price-max")
                    })
                ],
                format: {
                    decimals: 0,
                    prefix: '$'
                }
            },
            format: {
                // 'to' the formatted value. Receives a number.
                to: function (value) {
                    return value + ',-';
                },
                // 'from' the formatted value.
                // Receives a string, should return a number.
                from: function (value) {
                    return Number(value.replace(',-', ''));
                }
            }
        });
    }).on('change.one', function (selector, data) {
        $("input[name='minPrice']").val(data[0].replace("$", ""));
        $("input[name='maxPrice']").val(data[1].replace("$", ""));
    });
</script>
<%@include file="include/footer.jsp" %>