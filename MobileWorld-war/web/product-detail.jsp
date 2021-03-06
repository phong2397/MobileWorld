<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"  %>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<link rel="stylesheet" href="css/starability-basic.min.css">
<!-- Linking -->
<div class="linking">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="/MobileWorld-war">Home</a></li>
            <li><a href="./product?cateId=${product.category.id}">${product.category.name}</a></li>
            <li class="active">${product.name}</li>
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
            <div class="product-detail">
                <div class="product">
                    <div class="row">
                        <!-- Slider Thumb -->
                        <div class="col-xs-5">
                            <article class="slider-item on-nav">
                                <div id="slider" class="flexslider">
                                    <ul class="slides">
                                        <c:forEach items="${product.imageCollection}" var="item">
                                            <li>
                                                <img src="./uploads?fileName=${item.source}" alt="">
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div id="carousel" class="flexslider">
                                    <ul class="slides">
                                        <c:forEach items="${product.imageCollection}" var="item">
                                            <li>
                                                <div style="background-image: url(./uploads?fileName=${item.source}); width: auto; height: 50px; background-size: contain; background-position: center; background-repeat: no-repeat"></div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </article>
                        </div>
                        <!-- Item Content -->
                        <div class="col-xs-7">
                            <span class="tags">${product.category.name}</span>
                            <h5>${product.name}</h5>
                            <p class="rev">
                                <c:if test="${product.ratingCollection.size() > 0}">  
                                    <c:set var="sum" value="0"></c:set>
                                    <c:forEach items="${product.ratingCollection}" var="r">
                                        <c:set var="sum" value="${sum = sum + r.stars}"></c:set>
                                    </c:forEach>
                                    <c:set var="stars" value="${sum/product.ratingCollection.size()}"></c:set>
                                    <c:forEach begin="1" end="${stars}">
                                        <i class="fa fa-star"></i>
                                    </c:forEach>     
                                    <c:forEach begin="${stars + 1}" end="5">
                                        <i class="fa fa-star-o"></i> 
                                    </c:forEach>
                                </c:if>

                                <c:if test="${product.ratingCollection.size() == 0}">
                                    <i class="fa fa-star-o"></i> 
                                    <i class="fa fa-star-o"></i> 
                                    <i class="fa fa-star-o"></i> 
                                    <i class="fa fa-star-o"></i> 
                                    <i class="fa fa-star-o"></i> 
                                </c:if>
                                <span class="margin-left-10">${product.ratingCollection.size()} Review(s)</span>
                            </p>
                            <div class="row">
                                <div class="col-sm-6">
                                    <span class="price">
                                        <c:set var="today" value="<%=new java.util.Date()%>"/>
                                        <c:if test="${product.discount != null && today >= product.startDate && today <= product.endDate}">
                                            <b><fmt:formatNumber type="currency" currencySymbol="$" value="${product.price - product.discount}" maxFractionDigits="0" /> </b>
                                            <b><fmt:formatNumber type="currency" currencySymbol="$" value="${product.price}" maxFractionDigits="0" /></b>
                                        </c:if>
                                        <c:if test="${product.discount == null || today < product.startDate || today > product.endDate}">
                                            <b><fmt:formatNumber type="currency" currencySymbol="$" value="${product.price}" maxFractionDigits="0" /> </b>
                                        </c:if> 
                                    </span>
                                </div>
                                <div class="col-sm-6">
                                    <p>Availability: 
                                        <c:if test="${product.state == 1}">
                                            <span class="in-stock">In stock</span>
                                        </c:if>

                                        <c:if test="${product.state == 2}">
                                            <span class="text-warning">Out stock</span>
                                        </c:if>

                                        <c:if test="${product.state == 3}">
                                            <span class="text-danger">Stop Selling</span>
                                        </c:if> 
                                    </p>
                                </div>
                            </div>
                            <!-- List Details -->
                            <ul class="bullet-round-list">
                                <c:forEach items="${product.specificationCollection}" var="s">
                                    <c:if test="${s.attribute.show}">
                                        <li>${s.attribute.name}: ${s.value}</li>
                                        </c:if>
                                    </c:forEach>
                            </ul>

                            <a href="#" target="${product.id}" class="btn-round btnCart"><i class="icon-basket-loaded margin-right-5"></i> Add to Cart</a> 
                        </div>
                    </div>
                </div>
                <!-- Details Tab Section-->
                <div class="item-tabs-sec">
                    <!-- Nav tabs -->
                    <ul class="nav" role="tablist">
                        <li role="presentation" class="active"><a href="#pro-detil"  role="tab" data-toggle="tab">Product Details</a></li>
                        <li role="presentation">
                            <a href="#cus-rev"  role="tab" data-toggle="tab">Customer Reviews <sup>(${product.ratingCollection.size()})</sup></a>
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="pro-detil">
                            <!-- List Details -->
                            <ul class="bullet-round-list">
                                <c:forEach items="${product.specificationCollection}" var="item">
                                    <li>${item.attribute.name} : ${item.value}</li>
                                    </c:forEach>
                            </ul>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="cus-rev">

                            <c:if test="${cus != null && !rated}">
                                <div class="rev-group mb-5">
                                    <form action="rating" method="post">
                                        <input type="hidden" name="prodId" value="${product.id}"/>
                                        <div class="rev-header">
                                            <div class="avt">
                                                <c:if test="${cus.avatar != null}">
                                                    <img src="./uploads?fileName=${cus.avatar}" />
                                                </c:if>
                                                <c:if test="${cus.avatar == null}">
                                                    <img src="images/user-64.png" />
                                                </c:if>
                                            </div>
                                            <div class="cus">
                                                <span class="cus-name">${cus.fullname}</span>
                                                <span class="rev">
                                                    <fieldset class="starability-basic" style="min-height: 0">
                                                        <input type="radio" id="rate1" name="rating" value="1" checked="">
                                                        <label for="rate1" title="Terrible">1 star</label>

                                                        <input type="radio" id="rate2" name="rating" value="2">
                                                        <label for="rate2" title="Not good">2 stars</label>

                                                        <input type="radio" id="rate3" name="rating" value="3">
                                                        <label for="rate3" title="Average">3 stars</label>

                                                        <input type="radio" id="rate4" name="rating" value="4">
                                                        <label for="rate4" title="Very good">4 stars</label>

                                                        <input type="radio" id="rate5" name="rating" value="5">
                                                        <label for="rate5" title="Amazing">5 stars</label>
                                                    </fieldset>
                                                </span>
                                            </div>
                                        </div>

                                        <p class="cmt">
                                            <textarea class="form-control txt-cmt" name="cmt" cols="2" required=""></textarea>
                                        </p>

                                        <div class="text-center">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </c:if>

                            <c:if test="${product.ratingCollection.size() > 0}">
                                <c:forEach items="${product.ratingCollection.stream().limit(5).toArray()}" var="item" varStatus="loop">
                                    <div class="rev-group <c:if test="${loop.index < product.ratingCollection.size() - 1}">mb-5</c:if>">
                                            <div class="rev-header">
                                                <div class="avt">
                                                <c:if test="${item.customer.avatar != null}">
                                                    <img src="./uploads?fileName=${item.customer.avatar}" />
                                                </c:if>
                                                <c:if test="${item.customer.avatar == null}">
                                                    <img src="images/user-64.png" />
                                                </c:if>
                                            </div>
                                            <div class="cus">
                                                <span class="cus-name">${item.customer.fullname}</span>
                                                <span class="rev-date"><fmt:formatDate value="${item.ratingDate}" pattern="dd/MM/yyyy"/></span>
                                                <span class="rev">
                                                    <c:forEach begin="1" end="${item.stars}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>     
                                                    <c:forEach begin="${item.stars + 1}" end="5">
                                                        <i class="fa fa-star-o"></i> 
                                                    </c:forEach>
                                                </span>
                                            </div>
                                        </div>

                                        <p class="cmt">${item.comment}</p>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${product.ratingCollection.size() == 0}">
                                <span>No review</span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 

    <!-- Related Products -->
    <section class="padding-top-30 padding-bottom-30">
        <!-- heading -->
        <div class="heading">
            <h2>Related Products</h2>
            <hr>
        </div>
        <!-- Items Slider -->
        <div class="item-slide-4 with-nav">
            <c:forEach items="${relatedProducts}" var="item">
                <!-- Product -->
                <div class="product">
                    <article>
                        <a href="./product?id=${item.id}">
                            <img class="img-responsive" src="./uploads?fileName=${item.thumb}" alt="Image" > 
                        </a>
                        <!-- Content --> 
                        <span class="tag">${item.category.name}</span> <a href="./product?id=${item.id}" class="tittle">${item.name}</a> 
                        <!-- Reviews -->
                        <p class="rev">
                            <c:if test="${item.ratingCollection.size() > 0}">
                                <c:forEach begin="1" end="${item.ratingCollection.get(0).stars}">
                                    <i class="fa fa-star"></i>
                                </c:forEach>     
                                <c:forEach begin="${item.ratingCollection.get(0).stars + 1}" end="5">
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

                        <c:if test="${item.discount != null && today >= item.startDate && today <= item.endDate}">
                            <div class="price">
                                <b><fmt:formatNumber type="currency" currencySymbol="$" value="${item.price - item.discount}" maxFractionDigits="0" /></b>
                                <span><fmt:formatNumber type="currency" currencySymbol="$" value="${item.price}" maxFractionDigits="0" /></span>
                            </div>
                        </c:if>
                        <c:if test="${item.discount == null || today < item.startDate || today > item.endDate}">
                            <div class="price">
                                <b><fmt:formatNumber type="currency" currencySymbol="$" value="${item.price}" maxFractionDigits="0" /> </b>
                            </div>
                        </c:if> 
                        <a href="#" target="${item.id}" class="cart-btn"><i class="icon-basket-loaded"></i></a> 
                    </article>
                </div>
            </c:forEach>
        </div>
    </section>
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