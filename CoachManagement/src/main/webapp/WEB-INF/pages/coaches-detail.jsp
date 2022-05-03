<%-- 
    Document   : coaches-detail
    Created on : May 3, 2022, 1:05:57 PM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<div>
    <div>
        <div class="row">
            <div class="col-md-2">
                <img src="${coa[9]}" class="rounded" alt="Ảnh xe">
            </div>
            <div class="col-md-10">
                <div>Tên xe: ${coa[8]}</div>
                <div class="row">
                    <div class="col-sm-7">Tên chuyến: ${coa[0]}</div>
                    <div class="col-md-5">Giá vé: ${coa[4]}</div>
                </div>
                <div>Giờ bắt đầu: ${coa[1]}</div>
                <div>Giờ dự kiến tới nơi: ${coa[2]}</div>
                <div>Ghế trống: ${coa[3]}</div>
                <div>Tuyến xe: ${coa[5]}</div>
                <div>Trạm xuất phát: ${coa[6]}</div>
                <div>Trạm kết thúc: ${coa[7]}</div>
            </div>
        </div>         
    </div>
    <div>
        <h4>Bình luận:</h4>
        <c:forEach var="c" items="${comments}">
            <div>
                <div>${c[0]}</div>
                <div>${c[1]}</div>
                <div>${c[2]}</div>
            </div>
        </c:forEach>
    </div>
</div>
