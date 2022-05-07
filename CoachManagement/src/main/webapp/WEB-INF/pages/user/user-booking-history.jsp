<%-- 
    Document   : user-booking-history
    Created on : May 6, 2022, 4:25:30 AM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<div>
    <c:forEach var="t" items="${tickets}">
        <!--Test-->
        <div class="card mb-3 w-auto" >
            <div class="row no-gutters">
                <div class="col-md-4"> 
                    <c:choose>
                        <c:when test="${t[7] != null && t[7].startsWith('https') == true}">
                            <img class="rounded w-100 h-100" src="${t[9]}" alt="coach image">
                        </c:when>

                        <c:when test="${t[7] == null || t[7].startsWith('https') == false}">
                            <img class="rounded w-100 h-100 " src="<c:url value="/images/default.jpg" />" alt="coach image">
                        </c:when>
                    </c:choose>
                </div>
                <div class="col-md-8">

                    <div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="card-body">
                                    <h5 class="card-title"> Mã vé: ${t[0]}</h5>
                                    <div>Tên xe: ${t[6]}</div>
                                    <div>Tên chuyến: ${t[2]}</div>
                                    <div>Giá vé: ${t[1]}</div>
                                    <div>Giờ bắt đầu: ${t[3]}</div>
                                    <div>Giờ dự kiến tới nơi: ${t[4]}</div>
                                    <div>Tuyến xe: ${t[5]}</div>
                                    <div class="row">
                                        <div class="col-md-7">
                                            <a href="<c:url value="/coaches-detail?coachId=${t[8]}&routeId=${t[10]}&coachesId=${t[9]}"/>">Xem thông tin</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>



