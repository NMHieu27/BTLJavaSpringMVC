<%-- 
    Document   : admin-left
    Created on : Apr 29, 2022, 9:26:17 AM
    Author     : Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-primary elevation-4">
    <!--     Brand Logo -->
    <a href="#" class="brand-link text-center">
        <span class="brand-text font-weight-light">ADMIN</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
<!--                <img class="img-circle elevation-2" src="<c:url value="/images/2.jpg" />" alt="Avatar" />-->
                <c:choose>
                    <c:when test="${currentUser.avatar != null && currentUser.avatar.startsWith('https') == true}">
                        <img class="img-circle elevation-2" src="${currentUser.avatar}" alt="Card image">
                    </c:when>

                    <c:when test="${currentUser.avatar == null || currentUser.avatar.startsWith('https') == false}">
                        <img class="img-circle elevation-2" src="<c:url value="/images/default.jpg" />" alt="Card image">
                    </c:when>
                </c:choose>
            </div>
            <div class="info">
                <a href="#" class="d-block">${currentUser.fullname}</a>
            </div>
        </div>


        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul
                class="nav nav-pills nav-sidebar flex-column"
                data-widget="treeview"
                role="menu"
                data-accordion="false"
                >


                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-table"></i>
                        <p>
                            Quản lý
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<c:url value="/admin/users-manage" />" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Người dùng</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/admin/coach-manage" />" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Xe</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/admin/route-manage" />" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tuyến xe</p>
                            </a>
                        </li>                   
                        <li class="nav-item">
                            <a href="<c:url value="/admin/coaches-manage" />" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Chuyến xe</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/admin/price-manage" />" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Giá</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-chart-pie"></i>
                        <p>
                            Báo cáo thống kê
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="<c:url value="/admin/route-stat" />" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Chuyến xe theo tuyến</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/admin/revenue-stat" />" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Doanh thu</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/logout" />" class="nav-link">
                        <i class="nav-icon fas fa-sign-out-alt "></i>
                        <p>
                            Đăng xuất
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->