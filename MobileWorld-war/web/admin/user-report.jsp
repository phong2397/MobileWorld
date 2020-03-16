
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" scope="page" />
<c:set var="today" value="<%=new java.util.Date()%>"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
        <link rel="stylesheet" href="assets/css/adminlte.min.css">
        <link rel="stylesheet" href="plugins/chart.js/Chart.min.css">
        <link rel="stylesheet" href="assets/css/report.css">

    </head>
    <body>
        <div class="media-btn">
            <button class="print-btn rounded-circle elevation-4" title="Print">
                <img src="assets/img/printer-60.png">
            </button>

        </div>
        <div id="page" class="page">
            <div class="header row">
                <div class="logo col-6"><img src="../images/logo.png"/></div>
                <div class="company col-6"><h5 class="text">Mobile World Company</h5></div>
                <div class="col-12 text-right">
                    <span class="today"><fmt:formatDate value="${today}" dateStyle="LONG" /></span>
                </div>
            </div>

            <h5 class="title text-uppercase text-center">Customer Report</h5>

            <div class="row">


            </div>

            <table class="table table-bordered" style="font-size: 10pt">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>UserName</th>
                        <th class="text-center">FullName</th>
                        <th class="text-center">Phone</th>
                        <th class="text-center">Address</th>
                        <th class="text-center">Date Created</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${customers}" var="item" varStatus="loop">
                        <tr>
                            <td class="text-center">${loop.index + 1}</td>

                            <td>${item.username}</td>
                            <td>${item.fullname}</td>
                            <td>${item.phone}</td>
                            <td>${item.address}</td>
                            <td style="white-space: nowrap">
                                <fmt:formatDate value="${item.dateCreated}" pattern="dd-MM-yyyy"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="footer row">

            </div>
        </div>
    </body>
    <script src="plugins/jquery/jquery.min.js"></script>
    <script src="plugins/chart.js/Chart.min.js"></script>
    <script>
        $('.print-btn').click(function () {
            window.print();
        });

    </script>
</html>
