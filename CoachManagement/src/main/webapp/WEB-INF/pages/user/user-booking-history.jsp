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
        <div>
            <div class="row">
                <div class="col-md-2">
                    <img src="${c[9]}" class="rounded" alt="Ảnh xe">
                </div>
                <div class="col-md-10">
					<div>Mã vé: ${t[0]}</div>
                    <div>Tên xe: ${t[6]}</div>
                    <div class="row">
                        <div class="col-sm-7">Tên chuyến: ${t[2]}</div>
                        <div class="col-md-5">Giá vé: ${t[1]}</div>
                    </div>
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
    </c:forEach>
</div>
