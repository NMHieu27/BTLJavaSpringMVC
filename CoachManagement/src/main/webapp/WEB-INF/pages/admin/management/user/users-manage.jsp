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
                    <h1 class="m-0">Quản lí người dùng </h1>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Người dùng</li>
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

            <div class="row justify-content-between">

                <div class="d-flex p-0 text-white my-2 mx-2">
                    <!-- <div class="p-2 bg-info">Flex item 1</div> -->
                    <a class="btn btn-success" href="<c:url value="/admin/users-manage/add-user"/>">
                        <i class="fas fa-plus-circle"></i>
                        Thêm
                    </a>
                </div>

                <form class="d-flex my-2">
                    <div class="form-group m-0">
                        <input type="text"
                               class="form-control"
                               placeholder="Nhập tên người dùng..." name="kw" />
                    </div>
                    <input type="submit" value="Lọc dữ liệu" class="btn btn-info ml-3 mx-2 " />
                </form>

            </div>


            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Danh sách người dùng</h3>

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
                                    Họ tên
                                </th>
                                <th style="width: 15%">
                                    Tài khoản
                                </th>
                                <th style="width: 12%">
                                    Số điện thoại
                                </th>
                                <th style="width: 12%">
                                    Phân quyền
                                </th>
                                <th style="width:10%">
                                    Avatar
                                </th>
                                <th style="width:10%">
                                    Trạng thái
                                </th>
                                <th style="width: 15%">
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="u" items="${users}">
                                <tr>
                                    <td>
                                        ${u.id}
                                    </td>
                                    <td>
                                        <a>
                                            ${u.fullname}
                                        </a>
                                    </td>

                                    <td>
                                        <a>${u.username}</a>
                                        <br/>
                                        <small>
                                            Created ${u.joinDate}
                                        </small>
                                    </td>
                                    <td>
                                        <div>
                                            ${u.phone}
                                        </div>
                                    </td>

                                    <td>
                                        <div>
                                            ${u.userRole}
                                        </div>
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${u.avatar != null && u.avatar.startsWith('https') == true}">
                                                <img class="table-avatar" src="${u.avatar}" alt="Card image">
                                            </c:when>

                                            <c:when test="${u.avatar == null || u.avatar.startsWith('https') == false}">
                                                <img class="table-avatar" src="<c:url value="/images/default.jpg" />" alt="Card image">
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${u.active == true}">
                                                <i class="fas fa-check-circle text-success"></i>
                                            </c:when>

                                            <c:otherwise>
                                                <i class="fas fa-times-circle text-danger"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-right py-0 align-middle">
                                        <a class="btn btn-info btn-sm" href="<c:url value="/admin/users-manage/update-user/${u.id}"/>">
                                            <i class="fas fa-pencil-alt">
                                            </i>
                                            Sửa
                                        </a>
                                        <a class="btn btn-danger btn-sm" onclick="if (!confirm('Bạn có chắc chắn muốn xóa?')) {
                                                    return false
                                                }" href="<c:url value="/admin/users-manage/delete/${u.id}"/>">
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
