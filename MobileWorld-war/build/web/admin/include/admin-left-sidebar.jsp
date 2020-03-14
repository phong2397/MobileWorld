<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
        <img src="assets/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">MobileWorld</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
      
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<c:if test="${user.avatar != ''}">${user.avatar}</c:if><c:if test="${user.avatar == ''}">assets/img/customer-100.png</c:if>" class="img-circle elevation-2" />
            </div>
              <a href="login?action=logout" class="d-block"><p style=" font-weight: bold;">Welcome ${user.fullname}</p></a>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column nav-compact nav-child-indent"
                data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item has-treeview">
                    <a href="./dashboard" class="nav-link <c:if test="${mainMenu.equals('dashboard')}">active</c:if>">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                <li class="nav-item has-treeview menu-open">
                    <a href="#" class="nav-link <c:if test="${mainMenu.equals('product')}">active</c:if>">
                        <i class="nav-icon fas fa-box"></i>
                        <p>
                            Products
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="./product-list" class="nav-link <c:if test="${subMenu.equals('product-list')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>List</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="./create-product" class="nav-link <c:if test="${subMenu.equals('create-product')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Create</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="./product-report" class="nav-link <c:if test="${subMenu.equals('product-report')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Report</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview menu-open">
                    <a href="#" class="nav-link <c:if test="${mainMenu.equals('brand')}">active</c:if>">
                        <i class="nav-icon fas fa-box"></i>
                        <p>
                            Brands
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="./brand-list" class="nav-link <c:if test="${subMenu.equals('brand-list')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>List</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="./create-brand" class="nav-link <c:if test="${subMenu.equals('create-brand')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Create</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="./brand-report" class="nav-link <c:if test="${subMenu.equals('brand-report')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Report</p>
                            </a>
                        </li>
                    </ul>
                </li>
                   <li class="nav-item has-treeview menu-open">
                    <a href="#" class="nav-link <c:if test="${mainMenu.equals('category')}">active</c:if>">
                        <i class="nav-icon fas fa-box"></i>
                        <p>
                            Categories
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="./cate-list" class="nav-link <c:if test="${subMenu.equals('cate-list')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>List</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="./create-cate" class="nav-link <c:if test="${subMenu.equals('create-cate')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Create</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="./cate-report" class="nav-link <c:if test="${subMenu.equals('cate-report')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Report</p>
                            </a>
                        </li>
                    </ul>
                </li>
                  <li class="nav-item has-treeview menu-open">
                    <a href="#" class="nav-link <c:if test="${mainMenu.equals('customer')}">active</c:if>">
                        <i class="nav-icon fas fa-box"></i>
                        <p>
                           User
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="./user-list" class="nav-link <c:if test="${subMenu.equals('user-list')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>List</p>
                            </a>
                        </li>
                       
                        <li class="nav-item">
                            <a href="./user-report" class="nav-link <c:if test="${subMenu.equals('brand-report')}">active</c:if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Report</p>
                            </a>
                        </li>
                  </ul>
                  </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>