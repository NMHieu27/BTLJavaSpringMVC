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
                    <h1>Mật độ chuyến xe theo tuyến</h1>
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
                            <h3 class="card-title">Bảng dữ liệu</h3>

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
                                        <th style="width: 5% ">
                                            ID
                                        </th>
                                        <th style="width: 15%">
                                            Tên tuyến
                                        </th>
                                        <th style="width: 15%">
                                            Số lượng chuyến
                                        </th>                                       
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="r" items="${routeStat}">
                                    <tr>
                                        <td>${r[0]}</td>

                                        <td>${r[1]}</td>

                                        <td> ${r[2]}</td> 

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
                    <!-- LINE CHART -->
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Biểu đồ</h3>

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
                                <canvas id="routeStat"></canvas>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>
    let data=[];
    let labels=[];
//    let colors=[];
//    let borderColors=[];
//    let r, g, b;
    <c:forEach items="${routeStat}" var="c">
        data.push(${c[2]});
        labels.push('${c[1]}');
        
//        r = Math.random()*255;
//        g = Math.random()*255;
//        b = Math.random()*255;
//
//        colors.push(`rgba(${r}, ${g}, ${b}, 0.2)`);
//        borderColors.push(`rgba(${r}, ${g}, ${b}, 1)`);
    </c:forEach>
    
    
    window.onload = function() {
        let ctx = document.getElementById("routeStat").getContext("2d");
        drawChart(ctx, data, labels,"Thống kê mật độ chuyến xe theo tuyến", "bar");
    };
</script>