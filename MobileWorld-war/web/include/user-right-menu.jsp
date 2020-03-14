<%-- 
    Document   : user-right-menu
    Created on : Jan 13, 2020, 10:30:13 PM
    Author     : lehun
--%>

<%@page import="vn.group1.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<h6>Reviews and Ratings</h6>-->
<style>
    .checkout-steps div {
    background: #f5f5f5;
    padding: 20px 20px 30px;
}

</style>
<div>
    <ul class="account-list">

        <li><a href="User?action=update&id=${curAcc.id}"><i class="fa fa-edit"></i> My Account</a></li>                                        
     <li><a href="changepass?action=findid&id=${user.id}">  <i class="fa fa-edit"></i> Change Password</a></li>
 
        <li><a href="order-history.jsp"> <i class="fa fa-edit"></i> Order History</a></li>
       
    </ul>                                
</div>

