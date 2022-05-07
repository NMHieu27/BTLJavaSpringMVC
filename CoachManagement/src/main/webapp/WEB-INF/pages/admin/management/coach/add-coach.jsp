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
                    <h1>Thêm xe khách</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Xe khách</li>
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
                    <c:url value="/admin/coach-manage/add-coach" var="action" />
                    <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="coach">
                        <div class="form-group">
                            <label for="name">Tên xe</label>
                            <form:input type="text" id="name" path="name" class="form-control" />
                            <form:errors path="name" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="licenseplates">Biển số</label>
                            <form:input type="text" id="licenseplates" path="licenseplates" class="form-control" />
                            <form:errors path="licenseplates" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="price">Giá</label>
                            <form:input type="number" id="price" path="price" step="500" min="0" max="9999999999"  class="form-control" />
                            <form:errors path="price" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="describe">
                                Mô tả
                            </label>
                            <form:textarea id="describe" path="describe" 
                                           cssClass="form-control" />
                            <form:errors path="describe" cssClass="text-danger" />
                        </div>

                        <label for="file">Hình ảnh</label>
                        <div class="custom-file mb-3 form-group">   
                            <form:input
                                type="file"
                                class="custom-file-input form-control"
                                id="file"
                                name="file"
                                path="file"  
                                required="required"
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

                        <div class="form-group">
                            <label for="categoryId">
                                Loại xe
                            </label>
                            <form:select path="categoryId" cssClass="form-control">
                                <form:options items="${cates}"  
                                              itemLabel="name" 
                                              itemValue="id" />
                            </form:select>
                        </div>

                        <div class="row form-group">
                            <div class="col-12">
                                <a href="<c:url value="/admin/coach-manage"/>" class="btn btn-secondary">Quay lại</a>
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