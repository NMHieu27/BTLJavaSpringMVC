<%-- 
    Document   : users-manage
    Created on : Apr 30, 2022, 1:29:03 PM
    Author     : Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Quản lí xe khách </h1>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Xe khách</li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <c:if test="${errMsg != null}">
        <div class="alert alert-danger mx-3">
            ${errMsg}
        </div>
    </c:if>

    <!-- Main content -->
    <section class="content">

        <div class="container-fluid">

            <div class="d-flex p-0 text-white my-2">
                <!-- <div class="p-2 bg-info">Flex item 1</div> -->
                <a class="btn btn-success" href="<c:url value="/admin/coach-manage/add-coach"/>">
                    <i class="fas fa-plus-circle"></i>
                    Thêm
                </a>
            </div>

            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Danh sách xe khách</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                            <i class="fas fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                            <i class="fas fa-times"></i>
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
                                    Tên xe
                                </th>
                                <th style="width: 15%">
                                    Biển số
                                </th>
                                <th style="width: 12%">
                                    Giá
                                </th>
                                <th style="width: 12%">
                                    Trạng thái
                                </th>
                                <th style="width: 15%">
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="lc" items="${listCoach}">
                                <tr>
                                    <td>
                                        ${lc.id}
                                    </td>
                                    <td>
                                        <a>
                                            ${lc.name}
                                        </a>
                                    </td>

                                    <td>
                                        <a>${lc.licenseplates}</a>

                                    </td>
                                    <td>
                                        <a>${lc.price}</a>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${lc.active == true}">
                                                <i class="fas fa-check-circle text-success"></i>
                                            </c:when>

                                            <c:otherwise>
                                                <i class="fas fa-times-circle text-danger"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-right py-0 align-middle">
                                        <a class="btn btn-info btn-sm" href="#">
                                            <i class="fas fa-pencil-alt">
                                            </i>
                                            Sửa
                                        </a>
                                        <a class="btn btn-danger btn-sm" onclick="if (!confirm('Bạn có chắc chắn muốn xóa?')) {
                                                    return false
                                                }" href="<c:url value="/admin/coach-manage/delete/${lc.id}"/>">
                                            <i class="fas fa-trash">
                                            </i>
                                            Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        <!--/. container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
