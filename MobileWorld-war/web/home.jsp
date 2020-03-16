<%-- 
    Document   : home
    Created on : Jan 12, 2020, 11:53:18 AM
    Author     : junev
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"  %>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<!-- Shipping Info -->
<section class="shipping-info">
    <div class="container">
        <ul>

            <!-- Free Shipping -->
            <li>
                <div class="media-left"> <i class="flaticon-delivery-truck-1"></i> </div>
                <div class="media-body">
                    <h5>Free Shipping</h5>
                    <span>On order over $99</span></div>
            </li>
            <!-- Money Return -->
            <li>
                <div class="media-left"> <i class="flaticon-arrows"></i> </div>
                <div class="media-body">
                    <h5>Money Return</h5>
                    <span>30 Days money return</span></div>
            </li>
            <!-- Support 24/7 -->
            <li>
                <div class="media-left"> <i class="flaticon-operator"></i> </div>
                <div class="media-body">
                    <h5>Support 24/7</h5>
                    <span>Hotline: (+100) 123 456 7890</span></div>
            </li>
            <!-- Safe Payment -->
            <li>
                <div class="media-left"> <i class="flaticon-business"></i> </div>
                <div class="media-body">
                    <h5>Safe Payment</h5>
                    <span>Protect online payment</span></div>
            </li>
        </ul>
    </div>
</section>

<!-- Slid Sec -->
<div class="container">
    <section class="slid-sec margin-bottom-30">

        <!-- Main Slider Start -->
        <div class="tp-banner-container">
            <div class="tp-banner with-bg-slide-all">
                <ul>
                    <c:forEach items="${promotions}" var="item">
                        <!-- SLIDE  -->
                        <li data-transition="random" data-slotamount="7" data-masterspeed="300" data-saveperformance="off">
                            <!-- MAIN IMAGE -->
                            <img src="images/trans-bg.png" alt="slider" data-bgposition="center bottom" data-bgfit="cover"
                                 data-bgrepeat="no-repeat">

                            <!-- LAYER NR. 1 -->
                            <div class="tp-caption sfl tp-resizeme" data-x="left" data-hoffset="600" data-y="center"
                                 data-voffset="-80" data-speed="800" data-start="800" data-easing="Power3.easeInOut"
                                 data-splitin="chars" data-splitout="none" data-elementdelay="0.03" data-endelementdelay="0.4"
                                 data-endspeed="300"
                                 style="z-index: 5; font-size:24px; font-weight:500; color:#888888;  max-width: auto; max-height: auto; white-space: nowrap;">
                                ${item.brand.name}
                            </div>

                            <!-- LAYER NR. 2 -->
                            <div class="tp-caption sfr tp-resizeme" data-x="left" data-hoffset="600" data-y="center"
                                 data-voffset="-40" data-speed="800" data-start="1000" data-easing="Power3.easeInOut"
                                 data-splitin="chars" data-splitout="none" data-elementdelay="0.03" data-endelementdelay="0.1"
                                 data-endspeed="300"
                                 style="z-index: 6; font-size:36px; color:#888888; font-weight:800; white-space: nowrap;">
                                ${item.name}
                            </div>

                            <!-- LAYER NR. 1 -->
                            <div class="tp-caption sfr tp-resizeme" data-x="left" data-hoffset="600" data-y="center"
                                 data-voffset="10" data-speed="800" data-start="1300" data-easing="Power3.easeInOut"
                                 data-splitin="chars" data-splitout="none" data-elementdelay="0.03" data-endelementdelay="0.4"
                                 data-endspeed="300"
                                 style="z-index: 5; font-size:36px; font-weight:800; color:#f73232;  max-width: auto; max-height: auto; white-space: nowrap;">
                                <fmt:formatNumber type="currency" currencySymbol="$" value="${item.price - item.discount}" maxFractionDigits="0" />
                            </div>
                            <!-- LAYER NR. 1 -->
                            <div class="tp-caption sfl tp-resizeme" data-x="left" data-hoffset="50" data-y="center"
                                 data-voffset="0" data-speed="800" data-start="1300" data-easing="Power3.easeInOut"
                                 data-elementdelay="0.1" data-endelementdelay="0.1" data-endspeed="300" data-scrolloffset="0"
                                 style="z-index: 1;"><img src="./uploads?fileName=${item.thumb}" alt=""> </div>

                            <!-- LAYER NR. 4 -->
                            <div class="tp-caption lfb tp-resizeme" data-x="left" data-hoffset="600" data-y="center"
                                 data-voffset="100" data-speed="800" data-start="1300" data-easing="Power3.easeInOut"
                                 data-elementdelay="0.1" data-endelementdelay="0.1" data-endspeed="300" data-scrolloffset="0"
                                 style="z-index: 8;"><a href="./product?id=${item.id}" class="btn-round big">Shop Now</a> </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </section>

    <c:forEach items="${categories}" var="c">
        <section class="padding-top-0 padding-bottom-30"> 

            <!-- Heading -->
            <div class="heading">
                <h2 class="text-uppercase">
                    <a href="product?cateId=${c.id}">Popular ${c.name}s </a>
                </h2>
                <hr>
            </div>

            <!-- Items Slider -->
            <div class="item-slide-5 with-nav"> 
                <c:forEach items="${c.productCollection.stream().sorted((p1, p2)->p2.orderDetailCollection.size().compareTo(p1.orderDetailCollection.size())).limit(10).toArray()}" var="item">
                    <c:if test="${item.state < 3}">
                        <div class="product">
                            <article>
                                <a href="./product?id=${item.id}">
                                    <img class="img-responsive primary-img" src="./uploads?fileName=${item.thumb}" alt="Image" >
                                </a>
                                <!-- Content --> 
                                <span class="tag">${item.category.name}</span>
                                <a href="./product?id=${item.id}" class="tittle" title="${item.name}">${item.name}</a>

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
                                <span class="price">
                                    <c:if test="${item.discount != null && today >= item.startDate && today <= item.endDate}">
                                        <b><fmt:formatNumber type="currency" currencySymbol="$" value="${item.price - item.discount}" maxFractionDigits="0" /> </b>
                                        <b><fmt:formatNumber type="currency" currencySymbol="$" value="${item.price}" maxFractionDigits="0" /></b>
                                    </c:if>
                                    <c:if test="${item.discount == null || today < item.startDate || today > item.endDate}">
                                        <b><fmt:formatNumber type="currency" currencySymbol="$" value="${item.price}" maxFractionDigits="0" /> </b>
                                    </c:if> 
                                </span>
                                <a href="#" target="${item.id}" class="cart-btn"><i class="icon-basket-loaded"></i></a>
                            </article>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </section>
    </c:forEach>
</div>
<!-- JavaScripts --> 
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
<%@include file="include/footer.jsp" %>
