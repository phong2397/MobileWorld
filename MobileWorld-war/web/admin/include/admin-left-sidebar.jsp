<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link text-center">
        <span class="brand-text font-weight-bold">Admin Panel</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column"
                data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->

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
                                <a href="./category-list" class="nav-link <c:if test="${subMenu.equals('category-list')}">active</c:if>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>List</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="./create-category" class="nav-link <c:if test="${subMenu.equals('create-category')}">active</c:if>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Create</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                      <li class="nav-item has-treeview menu-open">
                        <a href="#" class="nav-link <c:if test="${mainMenu.equals('orders')}">active</c:if>">
                            <i class="nav-icon fas fa-box"></i>
                            <p>
                                Orders
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="./order-list" class="nav-link <c:if test="${subMenu.equals('order-list')}">active</c:if>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>List</p>
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
                        
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>