<%-- 
    Document   : header
    Created on : Apr 19, 2022, 1:13:54 AM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đặt vé xe khách H&L</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value="/"/>">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/coaches-booking"/>">Đặt vé xe</a>
                </li>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li class="nav-item">
                        <a href="<c:url value="/login" />" class="nav-link text-danger">
                            <i class="fa fa-user" aria-hidden="true"></i> Đăng nhập
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value="/register" />" class="nav-link text-danger">
                            <i class="fa fa-check" aria-hidden="true"></i> Đăng kí
                        </a>
                    </li>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <li class="nav-item">
                        <a href="<c:url value="/" />" class="nav-link text-success">
                            <c:if test="${currentUser.avatar != null}">
                                <img style="width:30px;" src="${currentUser.avatar}" class="rounded-circle" />
                            </c:if>
                            <c:if test="${currentUser.avatar == null}">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </c:if>

                            ${pageContext.request.userPrincipal.name}
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value="/logout" />" class="nav-link text-success">
                            Đăng xuất
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>

    </body>
</html>

