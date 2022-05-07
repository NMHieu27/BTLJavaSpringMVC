<%-- 
    Document   : header
    Created on : Apr 19, 2022, 1:13:54 AM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark text-white">
    <ul class="navbar-nav">
        <li class="nav-item active">
            <a class="nav-link " href="<c:url value="/"/>">Trang chủ</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " href="<c:url value="/coaches-booking"/>">Đặt vé xe</a>
        </li>
        <c:if test="${currentUser.userRole == 'ROLE_USER'}">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/user-booking-history"/>">Xem lịch sử</a>
            </li>
        </c:if>
        <c:if test="${currentUser.userRole == 'ROLE_STAFF'}">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/staff/ticket-management"/>">Xem vé xe</a>
            </li>
        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <li class="nav-item">
                <a href="<c:url value="/login" />" class="nav-link">
                    <i class="fa fa-user" aria-hidden="true"></i> Đăng nhập
                </a>
            </li>
            <li class="nav-item">
                <a href="<c:url value="/register" />" class="nav-link">
                    <i class="fa fa-check" aria-hidden="true"></i> Đăng kí
                </a>
            </li>
        </c:if>

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <li class="nav-item">
                <a href="<c:url value="/" />" class="nav-link ">
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
                <a href="<c:url value="/logout" />" class="nav-link">
                    Đăng xuất
                </a>
            </li>
        </c:if>

    </ul>
</nav>

