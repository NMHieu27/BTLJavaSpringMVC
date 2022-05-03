<%-- 
    Document   : add-user
    Created on : Apr 30, 2022, 10:50:49 PM
    Author     : Asus
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Thêm người dùng </h1>
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

    <c:if test="${errMsg != null}">
        <div class="alert alert-danger">
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
                                <option value="Nam">Nam</option>
                                <option value="Nữ">Nữ</option>
                            </form:select>
                        </div>

                        <div class="form-group">
                            <label for="address">Địa chỉ</label>
                            <form:input type="text" id="address" path="address" class="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="yearofbirth">Ngày sinh</label>
                            <form:input type="date" name="yearofbirth" path="yearofbirth" class="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="userRole">Phân quyền</label>
                            <form:select
                                name="userRole"
                                class="custom-select mb-3 form-control"
                                id="userRole"
                                path="userRole"
                                >
                                <option value="ADMIN">ADMIN</option>
                                <option value="STAFF">STAFF</option>
                                <option value="DRIVER">DRIVER</option>
                                <option value="USER">USER</option>
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
                                <option value="true">Còn</option>
                                <option value="false">Không</option>
                            </form:select>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <a href="#" class="btn btn-secondary">Quay lại</a>
                                <input
                                    type="submit"
                                    value="Lưu thông tin"
                                    class="btn btn-success float-right"
                                    />
                            </div>
                        </div>
                </div>
                <!-- /.card-body -->
            </div>

            <!-- /.card -->
        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
