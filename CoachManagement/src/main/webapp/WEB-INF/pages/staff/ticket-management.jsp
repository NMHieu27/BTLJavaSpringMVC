<%-- 
    Document   : TicketManagement
    Created on : May 6, 2022, 2:18:37 PM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<div id="main-div">
    <c:forEach var="t" items="${tickets}">
        <div class="row m-lg-2" id="ticket${t.id}">
            <div class="col-md-10">
                <div><strong>Mã vé: ${t.id}</strong></div>
                <div>Ngày tạo: ${t.createdDate}</div>
                <div>Giá vé: ${t.price}</div>
                <div>Tên người đặt: ${t.fullname}</div>
                <div>Số điện thoại: ${t.phone}</div>
                <div>Email: ${t.email}</div>
                <br>
            </div>
            <div class="col-md-2">
                <input class="btn-primary btn " onclick="if (confirm('Bạn có chắc chắn muốn xóa?')) {
                            deleteTicket(${t.id});}" type="button" value="Xóa vé"/>
            </div>
        </div>        
    </c:forEach>
</div>
<script>
    function deleteTicket(ticketId) {
    fetch("/CoachManagement/api/delete-ticket", {
    method: 'post',
            body: JSON.stringify({
            "ticketId": ticketId
            }),
            headers: {
            "Content-Type": "application/json"
            }
    }).then(function (res) {
        console.info(res);
            return res.json();
    }).then(function (data) {
        console.info(data);
        if (data){
            document.getElementById("ticket" + ticketId).remove();
            let area = document.getElementById("main-div");
            area.innerHTML = `<div class="alert alert-success alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <strong>Xóa vé thành công!</strong>
                                    </div>` + area.innerHTML;
        }else {
            let area = document.getElementById("main-div");
            area.innerHTML = `<div class="alert alert-warring alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <strong>Xóa vé thất bại!</strong>
                                    </div>` + area.innerHTML;
        }
    });
    }
    ;
</script>

