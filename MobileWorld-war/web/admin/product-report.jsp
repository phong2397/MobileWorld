
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
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #FAFAFA;
                font: 12pt "Arial";
            }
            * {
                box-sizing: border-box;
                -moz-box-sizing: border-box;
            }
            .page {
                width: 21cm;
                overflow:hidden;
                min-height:297mm;
                padding: 2.5cm;
                margin-left:auto;
                margin-right:auto;
                background: white;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }
            .subpage {
                padding: 1cm;
                border: 5px red solid;
                height: 237mm;
                outline: 2cm #FFEAEA solid;
            }

            @page {
                size: A4;
                margin: 0;
            }

            @media print {
                @page {
                    margin: 0;
                    border: initial;
                    border-radius: initial;
                    width: initial;
                    min-height: initial;
                    box-shadow: initial;
                    background: initial;
                    page-break-after: always;
                }
            }

            .logo img {
                height: 50px;
            }

            .company {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                text-transform: uppercase;
            }

            .company .text {
                font-weight: bold;
                margin: 0;
            }

            .title {
                margin: 40px 0;
                font-weight: bold;
            }

            .table td,
            .table th {
                vertical-align: middle;
            }
        </style>
    </head>
    <body onload="window.print();">
        <div id="page" class="page">
            <div class="header row">
                <div class="logo col-6"><img src="../images/logo.png"/></div>
                <div class="company col-6"><h5 class="text">Mobile World Company</h5></div>
                <div class="col-12 text-right">
                    <span class="today"><fmt:formatDate value="${today}" dateStyle="LONG" /></span>
                </div>
            </div>

            <h5 class="title text-uppercase text-center">Product Report</h5>

            <div class="row">
                <div class="col-6">
                    <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
            </div>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th class="text-center">Type</th>
                        <th class="text-center">Brand</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Discount</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${products}" var="p" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${p.name}</td>
                            <td class="text-center">${p.category.name}</td>
                            <td class="text-center">${p.brand.name}</td>
                            <td class="text-center"><fmt:formatNumber type="currency" currencySymbol="$" value="${p.price}" maxFractionDigits="0" /></td>
                            <td class="text-center">
                                <c:if test="${p.discount != null && today >= p.startDate && today <= p.endDate}">
                                    <fmt:formatNumber type="currency" currencySymbol="$" value="${p.price - p.discount}" maxFractionDigits="0" />
                                </c:if>
                                <c:if test="${p.discount == null || today < p.startDate || today > p.endDate}">
                                    No
                                </c:if> 
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
        var donutChartCanvas = $('#donutChart').get(0).getContext('2d');

        var donutData = {
            labels: ${labels},
            datasets: [
                {
                    data: ${data},
                    backgroundColor: ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
                }
            ]
        }
        var donutOptions = {
            maintainAspectRatio: false,
            responsive: true,
        }

        var donutChart = new Chart(donutChartCanvas, {
            type: 'doughnut',
            data: donutData,
            options: donutOptions
        })
    </script>
</html>
