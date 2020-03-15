<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <div style="display: flex; align-items: center">
                <img width="32" src="<c:if test="${user.avatar != ''}">${user.avatar}</c:if><c:if test="${user.avatar == ''}">assets/img/customer-100.png</c:if>" class="img-circle elevation-2" />
                <span style="font-weight: bold; margin-left: 5px">${user.fullname}</span>
                <a href="login?action=logout" style="margin-left: 10px"><i class="fa fa-sign-out-alt text-danger"></i></a>
            </div>
        </li>
    </ul>
</nav>