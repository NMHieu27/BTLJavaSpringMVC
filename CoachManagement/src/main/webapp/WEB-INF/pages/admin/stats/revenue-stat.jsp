<%-- 
    Document   : users-manage
    Created on : Apr 30, 2022, 1:29:03 PM
    Author     : Asus
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Thống kê báo cáo danh thu</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Thống kê</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">

            <div class="row">

                <div class="col-md-6">
                    <!-- AREA CHART -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Danh thu theo từng tháng trong năm</h3>

                            <div class="card-tools">
                                <button
                                    type="button"
                                    class="btn btn-tool"
                                    data-card-widget="collapse"
                                    >
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <table class="table table-striped projects text-center">
                                <thead>
                                    <tr>
                                        <th style="width: 10% ">
                                            Tháng
                                        </th>
                                        <th style="width: 15%">
                                            Doanh thu
                                        </th>                                    
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="r" items="${revenueMonth}">
                                        <tr>
                                            <td>${r[0]}</td>

                                            <td>${r[1]}</td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>

                <!-- /.col (LEFT) -->
                <div class="col-md-6">
                    <form class="my-1">
                        <div class="form-group">
                            <input type="number" min="2000" 
                                   class="form-control" 
                                   placeholder="Nhập năm..." name="year" />
                        </div>
                        <input type="submit" value="Lọc dữ liệu" class="btn btn-info" />
                    </form>
                    <!-- LINE CHART -->
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Biểu đồ doanh thu theo tháng</h3>

                            <div class="card-tools">
                                <button
                                    type="button"
                                    class="btn btn-tool"
                                    data-card-widget="collapse"
                                    >
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="chart">
                                <canvas id="revenueMonthStat"></canvas>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <!--/row-->

            <div class="row">

                <div class="col-md-6">
                    <!-- AREA CHART -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Danh thu các quý trong năm</h3>

                            <div class="card-tools">
                                <button
                                    type="button"
                                    class="btn btn-tool"
                                    data-card-widget="collapse"
                                    >
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <table class="table table-striped projects text-center">
                                <thead>
                                    <tr>
                                        <th style="width: 10% ">
                                            Quý
                                        </th>
                                        <th style="width: 15%">
                                            Doanh thu
                                        </th>                                     
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="r" items="${revenueQuarter}">
                                        <tr>
                                            <td>${r[0]}</td>

                                            <td>${r[1]}</td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>

                <!-- /.col (LEFT) -->
                <div class="col-md-6">
                    <form class="my-1">
                        <div class="form-group">
                            <input type="number" min="2000" 
                                   class="form-control" 
                                   placeholder="Nhập năm..." name="year" />
                        </div>
                        <input type="submit" value="Lọc dữ liệu" class="btn btn-info" />
                    </form>
                    <!-- LINE CHART -->
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Biểu đồ doanh thu theo quý</h3>

                            <div class="card-tools">
                                <button
                                    type="button"
                                    class="btn btn-tool"
                                    data-card-widget="collapse"
                                    >
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="chart">
                                <canvas id="revenueQuarter"></canvas>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <!--/row-->

        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>
    let data1 = [];
    let labels1 = [];
    let data2 = [];
    let labels2 = [];
//    let colors=[];
//    let borderColors=[];
//    let r, g, b;
    <c:forEach items="${revenueMonth}" var="r">
    data1.push(${r[1]});
    labels1.push(${r[0]});

//        r = Math.random()*255;
//        g = Math.random()*255;
//        b = Math.random()*255;
//
//        colors.push(`rgba(${r}, ${g}, ${b}, 0.2)`);
//        borderColors.push(`rgba(${r}, ${g}, ${b}, 1)`);
    </c:forEach>
    <c:forEach items="${revenueQuarter}" var="r">
    data2.push(${r[1]});
    labels2.push(${r[0]});

//        r = Math.random()*255;
//        g = Math.random()*255;
//        b = Math.random()*255;
//
//        colors.push(`rgba(${r}, ${g}, ${b}, 0.2)`);
//        borderColors.push(`rgba(${r}, ${g}, ${b}, 1)`);
    </c:forEach>

    window.onload = function () {
        let ctx1 = document.getElementById("revenueMonthStat").getContext("2d");
        drawChart(ctx1, data1, labels1, "Danh thu theo từng tháng trong năm", "line");

        let ctx2 = document.getElementById("revenueQuarter").getContext("2d");
        drawChart(ctx2, data2, labels2, "Danh thu các quý trong năm", "line");
    };
</script>