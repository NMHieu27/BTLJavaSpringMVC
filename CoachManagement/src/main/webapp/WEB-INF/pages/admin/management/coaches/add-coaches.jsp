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
                    <h1>Thêm chuyến xe</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Chuyến xe</li>
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
                    <c:url value="/admin/coaches-manage/add-coaches" var="action" />
                    <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="coaches">
                        <div class="form-group">
                            <label for="name">Tên chuyến xe</label>
                            <form:input type="text" id="name" path="name" class="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="startDateString">Khởi chạy</label>
                            <form:input type="datetime-local" id="startDateString" path="startDateString" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="endDateString">Dự kiến kết thúc</label>
                            <form:input type="datetime-local" id="endDateString" path="endDateString" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="describe">
                                Mô tả
                            </label>
                            <form:textarea id="describe" path="describe" 
                                           cssClass="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="routeId">
                                Tên tuyến
                            </label>
                            <form:select path="routeId" cssClass="form-control">
                                <form:options items="${listRoute}"  
                                              itemLabel="name" 
                                              itemValue="id" />
                            </form:select>
                        </div>

                        <div class="form-group">
                            <label for="coachId">
                                Tên xe
                            </label>
                            <form:select path="coachId" cssClass="form-control">
                                <form:options items="${listCoach}"  
                                              itemLabel="name" 
                                              itemValue="id" />
                            </form:select>
                        </div>

                        <div class="form-group">
                            <label for="driverId">
                                Tài xế
                            </label>
                            <form:select path="driverId" cssClass="form-control">
                                <form:options items="${listDriver}"  
                                              itemLabel="fullname" 
                                              itemValue="id" />
                            </form:select>
                        </div>

                        <div class="form-group">
                            <label for="pricechangeId">
                                Giá thay đổi
                            </label>
                            <form:select path="pricechangeId" cssClass="form-control">
                                <form:options items="${listPriceChange}"  
                                              itemLabel="name" 
                                              itemValue="id" />
                            </form:select>
                        </div>

                        <div class="row form-group">
                            <div class="col-12">
                                <a href="<c:url value="/admin/coaches-manage"/>" class="btn btn-secondary">Quay lại</a>
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