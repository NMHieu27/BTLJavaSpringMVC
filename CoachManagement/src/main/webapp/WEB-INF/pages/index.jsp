<%-- 
    Document   : index
    Created on : Apr 19, 2022, 12:16:58 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container d-flex justify-content-center align-items-center my-2">
    <c:choose>
        <c:when test="${currentUser.userRole == 'ROLE_STAFF'}">
            <form class="row" action="${pageContext.request.contextPath}/staff/coaches-booking">
            </c:when>
                <c:otherwise>
                <form class="row" action="${pageContext.request.contextPath}/coaches-booking">
                </c:otherwise>
                </c:choose>
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
                        <option value="${l.id}" <c:if test="${l.id == '2'}">selected="selected"</c:if>>${l.name}</option>
                    </c:forEach>
                </select>
            </div>        
            <div class="col-md-3">
                <label for="date">Chọn ngày đi</label>
                <input name="date" class="form-control" id="datePicker" type="date" required>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-outline-primary" style="margin-top: 2rem">Tìm kiếm xe</button>
            </div>
        </form>
</div>
<script>
    window.onload = function () {
        var date = new Date();
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;
        var today = year + "-" + month + "-" + day;
        let datePicker = document.getElementById('datePicker');
        datePicker.value = today;
        datePicker.setAttribute("min", today);
    };
</script>
