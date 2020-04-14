
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

            <h5 class="title text-uppercase text-center">Product Report</h5>

            <div class="row">

                <div class="col-12 text-center">
                    <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
            </div>

            <table class="table table-bordered" style="margin-top: 30px">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th class="text-center">Category</th>
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
        function random_rgb() {
            var o = Math.round, r = Math.random, s = 255;
            return 'rgba(' + o(r() * s) + ',' + o(r() * s) + ',' + o(r() * s) + ',' + 1 + ')';
        }
        var cateLabels = ${labels};


        var datasets = [];

        var brandDatas = ${brandDatas};

        cateLabels.forEach(function (e, i) {
            datasets.push({
                label: e,
                backgroundColor: random_rgb(),
                borderColor: 'rgba(210, 214, 222, 1)',
                data: brandDatas[i]
            });
        });

        var barChartCanvas = $('#barChart').get(0).getContext('2d')
        var barChartData = {
            labels: ${brandLabels},
            datasets: datasets
        }

        var barChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false
        }

        var barChart = new Chart(barChartCanvas, {
            type: 'bar',
            data: barChartData,
            options: barChartOptions
        })

        $('.print-btn').click(function () {
            window.print();
        });
    </script>
</html>
