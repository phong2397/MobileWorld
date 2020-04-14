  
<!-- Left SideBar -->
<div class="col-md-3"> 
    <!-- Categories -->
    <div class="cate-lst"> <a class="cate-style" href="#."><i class="fa fa-list-ul"></i> Our Categories </a>
        <div class="cate-bar-in">
            <div id="cater">
                <ul>
                    <c:forEach items="${categories}" var="item">
                        <li><a href="./product?cateId=${item.id}"> ${item.name}</a></li>
                        </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Left SideBar -->