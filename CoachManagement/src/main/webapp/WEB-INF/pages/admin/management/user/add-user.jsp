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
                        <input type="text" id="fullname" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input
                            type="text"
                            id="username"
                            class="form-control"
                            />
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="text" id="phone" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="gender">Giới tính</label>
                        <select
                            id="gender"
                            name="gender"
                            class="custom-select mb-3 form-control"
                            >
                            <option value="Nam">Nam</option>
                            <option value="Nữ">Nữ</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <input type="text" id="address" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="yearofbirth">Ngày sinh</label>
                        <input type="date" name="yearofbirth" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="userRole">Phân quyền</label>
                        <select
                            name="user_role"
                            class="custom-select mb-3 form-control"
                            id="userRole"
                            >
                            <option value="ADMIN">ADMIN</option>
                            <option value="STAFF">STAFF</option>
                            <option value="DRIVER">DRIVER</option>
                            <option value="USER">USER</option>
                        </select>
                    </div>

                    <label for="file">Avatar</label>
                    <div class="custom-file mb-3 form-group">
                        <input
                            type="file"
                            class="custom-file-input form-control"
                            id="file"
                            name="file"
                            />
                        <label class="custom-file-label" for="customFile"
                               >Choose file</label
                        >
                    </div>

                    <div class="form-group">
                        <label for="active">Trạng thái</label>
                        <select
                            id="active"
                            name="active"
                            class="custom-select mb-3 form-control"
                            >
                            <option value="true">Còn</option>
                            <option value="false">Không</option>
                        </select>
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
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
