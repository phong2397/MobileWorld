<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"  %>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<!-- Linking -->
<div class="linking">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="/MobileWorld-war">Home</a></li>
            <li class="active">Products</li>
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
            <div class="row"> 
                <c:forEach items="${products}" var="item">
                    <c:if test="${item.state < 3}">
                        <div class="col-md-4" style="padding: 1rem">
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
                        </div>
                    </c:if>
                </c:forEach>
            </div>   

            <!-- pagination -->
            <div class="text-center">
                <ul class="pagination">
                    <c:forEach begin="1" end="${pages}" var="i">
                        <c:if test="${currentPage == i }">
                            <li class="active">
                                <a href="?page=${i}">${i}</a>
                            </li>
                        </c:if>
                        <c:if test="${currentPage != i }">
                            <li>
                                <a class="page-link" href="?page=${i}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>            
        </div>
    </div>
</div>


<%@include file="include/recently-viewed-items.jsp" %>

<!-- JavaScripts --> 
<!-- Plugins --> 
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
<script src="js/main.js"></script> 
<script src="js/vendors/jquery.nouislider.min.js"></script> 
<script>
    jQuery(document).ready(function ($) {
        //  Price Filter ( noUiSlider Plugin)
        var slider = $("#price-range").noUiSlider({
            range: {
                'min': [0],
                'max': [5000]
            },
            start: [0, 5000],
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
                    // Set formatting
                    decimals: 0,
                    prefix: '$'
                }
            }
        });
    }).on('change.one', function (selector, data) {
        $("input[name='minPrice']").val(data[0].replace("$", ""));
        $("input[name='maxPrice']").val(data[1].replace("$", ""));
    });
</script>
<%@include file="include/footer.jsp" %>