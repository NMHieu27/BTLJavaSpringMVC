<%-- 
    Document   : TicketManagement
    Created on : May 6, 2022, 2:18:37 PM
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
                <div>
			<div>Mã vé: ${t.id}</div>
			<div>Ngày tạo: ${t.createdDate}</div>
			<div>Giá vé: ${t.price}</div>
			<div>Tên người đặt: ${t.fullname}</div>
			<div>Số điện thoại: ${t.phone}</div>
			<div>Email: ${t.email}</div>
			<div class="row">
                        <div class="col-md-7">
                            <a href="<c:url value="#"/>">Xem thông tin</a>
                        </div>
                    </div>  
                </div>
            </div>         
        </div>
    </c:forEach>
</div>

