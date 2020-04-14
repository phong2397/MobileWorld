<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Your Recently Viewed Items -->
<section class="padding-bottom-60">
    <div class="container">
        <!-- heading -->
        <div class="heading">
            <h2>Your Recently Viewed Items</h2>
            <hr>
        </div>
        <!-- Items Slider -->
        <div class="item-slide-5 with-nav">
            <c:forEach items="${recentlyProducts}" var="item">
                <!-- Product -->
                <div class="product">
                    <article>
                        <a href="./product?id=${item.id}">
                            <img class="img-responsive" src="./uploads?fileName=${item.thumb}" alt="Image" >
                        </a> 
                        <!--<span class="sale-tag">-25%</span> -->
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
    </div>
</section>