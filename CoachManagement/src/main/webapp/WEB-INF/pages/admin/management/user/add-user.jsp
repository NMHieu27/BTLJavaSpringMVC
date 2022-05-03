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
                    <h1>Thêm người dùng</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Người dùng</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <c:if test="${errMsg != null}">
        <div class="alert alert-danger mx-3">
            ${errMsg}
        </div>
    </c:if>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card card-primary">
                <div class="card-header">
                    <h3 class="card-title">Thông tin</h3>

                    <div class="card-tools">
                        <button
                            type="button"
                            class="btn btn-tool"
                            data-card-widget="collapse"
                            title="Collapse"
                            >
                            <i class="fas fa-minus"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body">
                    <c:url value="/admin/users-manage/add-user" var="action" />
                    <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="user">
                        <div class="form-group">
                            <label for="fullname">Họ tên</label>
                            <form:input type="text" id="fullname" path="fullname" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="username">Username</label>
                            <form:input type="text" id="username" path="username" class="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <form:input type="password" id="password" path="password" class="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="phone">Số điện thoại</label>
                            <form:input type="text" id="phone" path="phone" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="gender">Giới tính</label>
                            <form:select
                                id="gender"
                                name="gender"
                                class="custom-select mb-3 form-control"
                                path="gender"
                                >
                                <form:option value="Nam" label="Nam"/>
                                <form:option value="Nữ" label="Nữ"/>
                            </form:select>
                        </div>

                        <div class="form-group">
                            <label for="address">Địa chỉ</label>
                            <form:input type="text" id="address" path="address" class="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="userRole">Phân quyền</label>
                            <form:select
                                name="userRole"
                                class="custom-select mb-3 form-control"
                                id="userRole"
                                path="userRole"
                                >
                                <form:option value="ROLE_ADMIN" label="ADMIN" />
                                <form:option value="ROLE_STAFF" label="STAFF" />
                                <form:option value="ROLE_DRIVER" label="DRIVER" />
                                <form:option value="ROLE_USER" label="USER" />
                            </form:select>
                        </div>


                        <label for="file">Avatar</label>
                        <div class="custom-file mb-3 form-group">   
                            <form:input
                                type="file"
                                class="custom-file-input form-control"
                                id="file"
                                name="file"
                                path="file"
                                />
                            <label class="custom-file-label" for="customFile">Choose file</label>

                        </div>

                        <div class="form-group">
                            <label for="active">Trạng thái</label>
                            <form:select
                                id="active"
                                name="active"
                                class="custom-select mb-3 form-control"
                                path="active"
                                >
                                <form:option value="1" label="Còn" />
                                <form:option value="0" label="Không" />
                            </form:select>
                        </div>

                        <div class="row form-group">
                            <div class="col-12">
                                <a href="<c:url value="/admin/users-manage"/>" class="btn btn-secondary">Quay lại</a>
                                <input
                                    type="submit"
                                    value="Lưu thông tin"
                                    class="btn btn-success float-right"
                                    />
                            </div>
                        </div>
                    </form:form>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>
    // Add the following code if you want the name of the file appear on select
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
</script>