<%@page import="vn.group1.entity.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <meta name="author" content="M_Adnan">
        <!-- Document Title -->
        <title>Mobile World</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
        <link rel="stylesheet" type="text/css" href="css/settings.css" media="screen">

        <!-- StyleSheets -->
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="admin/plugins/toastr/toastr.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- Fonts Online -->
        <link href="css/css.css" rel="stylesheet">

        <!-- JavaScripts -->
        <script src="js/vendors/modernizr.js"></script>
    </head>
    <body>

        <!-- Page Wrapper -->
        <div id="wrap" class="layout-10 yellow"> 

            <!-- Top bar -->
            <div class="top-bar">
                <div class="container">
                    <ul class="pull-left right-sec">

                    </ul>
                    <div class="right-sec">
                    
                        <ul>
                            <li>  <% if (session.getAttribute("curAcc") != null) { %>
		
                            <li><i class="glyphicon glyphicon-user" ></i><a href="User?action=update&id=${curAcc.id}">Hello: ${curAcc.fullname}</a></li>
                            <li><a href="User?action=logout">Logout</a></li>
						<% } %>
                                                <%if(session.getAttribute("curAcc") == null){ %>
		
						<li><a href="/MobileWorld-war/login">Login/Register</a></li>
						<% } %></li>
                       
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <header class="header-style-5 style-10">
                <div class="container">
                    <div class="logo"> <a href="/MobileWorld-war"><img src="images/logo-47.png" alt="Logo"></a> </div>
                    <div class="go-right"> 

                        <!-- search -->
                        <form action="/MobileWorld-war/filter" method="get">
                            <div class="search-cate">
                                <select name="category" class="selectpicker">
                                    <option value="0">All Categories</option>
                                    <c:forEach items="${categories}" var="item">
                                        <option value="${item.id}" <c:if test="${category == item.id}">selected</c:if>> ${item.name}</option>
                                    </c:forEach>

                                </select>
                                <input type="search" name="txt" placeholder="" value="<%= request.getParameter("txt") != null ? request.getParameter("txt") : ""%>">
                                <button class="submit" type="submit"><i class="icon-magnifier"></i></button>
                            </div>
                        </form>

                        <!-- Hotline --> 
                        <span class="call-mun"><i class="fa fa-phone"></i> <strong>Hotline:</strong><br>
                            (+100) 123 456 7890</span> 

                        <!-- Cart Part -->
                        <ul class="nav navbar-right cart-pop">
                            <li class="nav-link">
                                <a href="./cart" >
                                    <span class="itm-cont">${cartItems}</span>
                                    <i class="flaticon-shopping-bag"></i> <strong>My Cart</strong> <br>
                                    <span class="total">${cartItems} item(s) - <fmt:formatNumber type="currency" currencySymbol="$" value="${cartTotal}" maxFractionDigits="0" /></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </header>
            <!-- Nav -->
            <nav class="navbar ownmenu">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-open-btn" aria-expanded="false"> <span><i class="fa fa-navicon"></i></span> </button>
                    </div>
                    <!-- NAV -->
                    <div class="collapse navbar-collapse" id="nav-open-btn">
                        <ul class="nav">
                            <li>
                                <a href="./">Home </a>
                            </li>

                            <li>
                                <a href="./product">All Products </a>
                            </li>

                            <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories </a>
                                <ul class="dropdown-menu multi-level animated-2s fadeInUpHalf" style="display: none;">
                                    <c:forEach items="${categories}" var="c">
                                        <li><a href="./product?cateId=${c.id}"> ${c.name} </a></li>
                                        </c:forEach>

                                </ul>
                            </li>

                            <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Brands </a>
                                <ul class="dropdown-menu multi-level animated-2s fadeInUpHalf" style="display: none;">
                                    <c:forEach items="${brands}" var="b">
                                        <li><a href="./product?brandId=${b.id}"> ${b.name} </a></li>
                                        </c:forEach>

                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- NAV RIGHT -->
                    <div class="nav-right"> </div>
                </div>
                <hr>
            </nav>
