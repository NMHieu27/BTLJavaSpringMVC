<%-- 
    Document   : coaches-booking
    Created on : May 2, 2022, 3:43:25 AM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<div class="container d-flex justify-content-center align-items-center my-2">
    <form class="row" action="${pageContext.request.contextPath}/coaches-booking">
        <div class="col-md-3">
            <label>Chọn điểm xuất phát</label>
            <select name="start" class="custom-select">
                <c:forEach var="l" items="${location}">
                    <option value="${l.id}">${l.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-1"><i class="fa-2x fas fa-arrow-right mx-2" style="margin-top: 35px"></i></div>        
        <div class="col-md-3">
            <label>Chọn điểm đến</label>
            <select name="destination" class="custom-select">
                <c:forEach var="l" items="${location}">
                    <option value="${l.id}">${l.name}</option>
                </c:forEach>
            </select>
        </div>        
        <div class="col-md-3">
            <label for="date">Chọn ngày đi</label>
            <input name="date" class="form-control" type="date" required>
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-outline-primary" style="margin-top: 2rem">Tìm kiếm xe</button>
        </div>
    </form>
</div>
<div>
    <c:forEach var="c" items="${coaches}">
        <div>
            <div class="row">
                <div class="col-md-2">
                    <img src="${c[9]}" class="rounded" alt="Ảnh xe">
                </div>
                <div class="col-md-10">
                    <div>Tên xe: ${c[8]}</div>
                    <div class="row">
                        <div class="col-sm-7">Tên chuyến: ${c[0]}</div>
                        <div class="col-md-5">Giá vé: ${c[4]}</div>
                    </div>
                    <div>Giờ bắt đầu: ${c[1]}</div>
                    <div>Giờ dự kiến tới nơi: ${c[2]}</div>
                    <div>Ghế trống: ${c[3]}</div>
                    <div>Tuyến xe: ${c[5]}</div>
                    <div>Trạm xuất phát: ${c[6]}</div>
                    <div>Trạm kết thúc: ${c[7]}</div>
					<div>
                        <a href="<c:url value="/coaches-detail?coachId=${c[10]}&routeId=${c[11]}&coachesId=${c[12]}"/>">Xem thông tin</a>
                    </div>
                </div>
            </div>         
        </div>
    </c:forEach>
</div>

