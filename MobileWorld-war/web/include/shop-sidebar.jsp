<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-3">
    <form action="/MobileWorld-war/filter" method="get">
        <div class="shop-side-bar">
            <!-- Categories -->
            <h6>Categories</h6>
            <div class="checkbox checkbox-primary">
                <ul>
                    <c:forEach items="${categories}" var="item">
                        <li>
                            <input id="cate${item.id}" class="styled" type="checkbox" name="categories" value="${item.id}" <c:if test="${filterCates != null && filterCates.contains(item.id.toString())}">checked</c:if> >
                            <label for="cate${item.id}"> ${item.name} <span>(${item.productCollection.size()})</span> </label>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- Featured Brands -->
            <h6>Featured Brands</h6>
            <div class="checkbox checkbox-primary">
                <ul>
                    <c:forEach items="${brands}" var="item">
                        <li>
                            <input id="brand${item.id}" class="styled" type="checkbox" name="brands" value="${item.id}" <c:if test="${filterBrands.contains(item.id.toString())}">checked</c:if> >
                            <label for="brand${item.id}"> ${item.name} <span>(${item.productCollection.size()})</span> </label>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <h6>Price</h6>
            <!-- PRICE -->
            <div class="cost-price-content">
                <div id="price-range" class="price-range"></div>
                <div style="display: flex; justify-content: space-between">
                    <span id="price-min">0</span>
                    <span id="price-max">5000</span> 
                </div>
                <input type="hidden" name="minPrice" value="<%= request.getParameter("minPrice") != null ? request.getParameter("minPrice") : 0%>"/>
                <input type="hidden" name="maxPrice" value="<%= request.getParameter("maxPrice") != null ? request.getParameter("maxPrice") : 5000%>"/>
                <button type="submit" class="btn-round" >Filter</button> 
            </div>   
        </div>
    </form>
</div>