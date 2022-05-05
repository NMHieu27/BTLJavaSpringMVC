<%-- 
    Document   : login
    Created on : May 5, 2022, 3:05:57 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            Đăng kí
        </title>
        <link rel="stylesheet" href="<c:url value="/css/login.css" />"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-9 mx-auto">
                    <div class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
                        <div class="card-img-left d-none d-md-flex">
                            <!-- Background image for card set in CSS! -->
                        </div>
                        <div class="card-body p-4 p-sm-5">
                            <h5 class="card-title text-center mb-5 fw-light fs-5">ĐĂNG KÍ</h5>
                            <c:if test="${errMsg != null}">
                                <div class="alert alert-danger">
                                    ${errMsg}
                                </div>
                            </c:if>
                            <c:url value="/register" var="action" />
                            <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="user">
                                <div class="form-group">
                                    <label for="fullname">Họ tên</label>
                                    <form:input type="text" id="fullname" path="fullname" class="form-control" />
                                    <form:errors path="fullname" cssClass="text-danger" />
                                </div>
                                <div class="form-group">
                                    <label for="phone">Số điện thoại</label>
                                    <form:input type="text" id="phone" path="phone" class="form-control" />
                                    <form:errors path="phone" cssClass="text-danger" />
                                </div>
                                <div class="form-group">
                                    <label for="username">Tài khoản</label>
                                    <form:input type="text" id="username" path="username" class="form-control" />
                                    <form:errors path="username" cssClass="text-danger" />
                                </div>
                                <div class="form-group">
                                    <label for="password">Mật khẩu</label>
                                    <form:input type="password" id="password" path="password" class="form-control" />
                                    <form:errors path="password" cssClass="text-danger" />
                                </div>
                                <div class="form-group">
                                    <label for="confirmPassword">Nhập lại mật khẩu</label>
                                    <form:input type="password" id="confirmPassword" path="confirmPassword" class="form-control" />
                                </div>
                                <label for="file">Ảnh đại diện</label>
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
                                <div class="d-grid mb-2 text-center">
                                    <button class="btn  btn-primary btn-login fw-bold text-uppercase" type="submit">Đăng kí</button>
                                </div>                             
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
<script>
    // Add the following code if you want the name of the file appear on select
    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
</script>

