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
                    <h1>Thêm tuyến xe</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Tuyến xe</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
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
                    <c:url value="/admin/route-manage/add-route" var="action" />
                    <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="route">
                        <div class="form-group">
                            <label for="name">Tên tuyến xe</label>
                            <form:input type="text" id="name" path="name" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="price">Giá</label>
                            <form:input type="number" id="price" path="price" placeholder="0" step="500" min="0" max="9999999999"  class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="startingpointId">
                                Điểm đón khách
                            </label>
                            <form:select path="startingpointId" cssClass="form-control">
                                <form:options items="${station}"  
                                              itemLabel="name" 
                                              itemValue="id" />
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label for="destinationId">
                                Điểm trả khách
                            </label>
                            <form:select path="destinationId" cssClass="form-control">
                                <form:options items="${station}"  
                                              itemLabel="name" 
                                              itemValue="id" />
                            </form:select>
                        </div>

                        <div class="row form-group">
                            <div class="col-12">
                                <a href="<c:url value="/admin/route-manage"/>" class="btn btn-secondary">Quay lại</a>
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