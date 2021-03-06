<%-- 
    Document   : coaches-booking
    Created on : May 7, 2022, 12:38:12 PM
    Author     : Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<div class="container d-flex justify-content-center align-items-center my-2" id="main-div">
    <form class="row" action="${pageContext.request.contextPath}/staff/coaches-booking">
        <div class="col-md-3">
            <label>Chọn điểm xuất phát</label>
            <select name="start" class="custom-select">
                <c:forEach var="l" items="${location}">
                    <option value="${l.id}" <c:if test="${l.id == startId}">selected="selected"</c:if>>${l.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-1"><i class="fa-2x fas fa-arrow-right mx-2" style="margin-top: 35px"></i></div>        
        <div class="col-md-3">
            <label>Chọn điểm đến</label>
            <select name="destination" class="custom-select">
                <c:forEach var="l" items="${location}">
                    <option value="${l.id}" <c:if test="${l.id == destination}">selected="selected"</c:if>>${l.name}</option>
                </c:forEach>
            </select>
        </div>        
        <div class="col-md-3">
            <label for="date">Chọn ngày đi</label>
            <input name="date" value="${date}" id="datePicker" class="form-control" type="date" required>
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-outline-primary" style="margin-top: 2rem">Tìm kiếm xe</button>
        </div>
    </form>
</div>
<br>
<div>
    <c:forEach var="c" items="${coaches}">
        <div>
            <div class="row">
                <!--Test-->
                <div class="card mb-3 w-auto" >
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <c:choose>
                                <c:when test="${c[9] != null && c[9].startsWith('https') == true}">
                                    <img class="rounded w-100 h-100" width="335" height="335" src="${c[9]}" alt="coach image">
                                </c:when>

                                <c:when test="${c[9] == null || c[9].startsWith('https') == false}">
                                    <img class="rounded w-100 h-100 " width="335" height="335" src="<c:url value="/images/default.jpg" />" alt="coach image">
                                </c:when>
                            </c:choose>
                        </div>
                        <div class="col-md-8">

                            <div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card-body">
                                            <h5 class="card-title"> ${c[8]}</h5>
                                            <div>Tên chuyến: ${c[0]}</div>
                                            <div>Giờ bắt đầu: ${c[1]}</div>
                                            <div>Giờ dự kiến tới nơi: ${c[2]}</div>
                                            <div>Ghế trống: ${c[3]}</div>
                                            <div>Tuyến xe: ${c[5]}</div>
                                            <div>Trạm xuất phát: ${c[6]}</div>
                                            <div>Trạm kết thúc: ${c[7]}</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mt-3">
                                        <div>Giá vé: ${c[4]}</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <a class="pl-4 pt-2" href="<c:url value="/staff/ticket-management?coachesId=${c[12]}"/>">Kiểm tra vé</a>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-primary" style="margin: 0px 0px 16px; padding: 6px 12px" data-toggle="modal" data-target="#myModal">Đặt vé</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Test-->
                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Đặt vé xe</h4>
                                    <button type="button" class="close" id="closeModal" data-dismiss="modal">&times;</button>
                                </div>
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Số lượng vé đặt:</label>
                                        <div class="d-flex justify-content-between">                 
                                            <input type="number" id="replyNumber" min="1" step="1" value="1" onchange="updatePrice(${c[4]})" data-bind="value:replyNumber" />
                                            <label id="total">Thành tiền: ${c[4]}</label>
                                        </div>
                                        <label>Họ tên</label>
                                        <input type="text" id="fullname" value="${currentUser.fullname}" class="form-control" required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Số điện thoại</label>
                                        <input type="number" minlength="10" maxlength="11" id="phone" class="form-control" required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Địa chỉ email</label>
                                        <input type="text" id="email" class="form-control" required="required"/>
                                    </div>
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <input class="btn-primary btn" onclick="addTicket(${c[12]}, ${c[4]})" type="button" value="Thanh toán"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <br>
    </c:forEach>
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
        datePicker.setAttribute("min", today);
    };
    function addTicket(coachesId, price) {
        document.getElementById("pay-btn").disabled = true;
        fetch("/CoachManagement/api/seat-check", {
            method: 'post',
            body: JSON.stringify({
                "coachesId": coachesId
            }),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(function (res) {
            console.info(res);
            return res.json();
        }).then(function (data) {
            console.info(data);
            if (document.getElementById("replyNumber").value <= data) {
                if (document.getElementById("fullname").value.trim() != "" && document.getElementById("phone").value.trim() != "" && document.getElementById("email").value.trim() != "") {
                    fetch("/CoachManagement/api/add-ticket", {
                        method: 'post',
                        body: JSON.stringify({
                            "fullname": document.getElementById("fullname").value,
                            "phone": document.getElementById("phone").value,
                            "email": document.getElementById("email").value,
                            "coachesId": coachesId,
                            "amount": document.getElementById("replyNumber").value,
                            "price": price
                        }),
                        headers: {
                            "Content-Type": "application/json"
                        }
                    }).then(function (res) {
                        console.info(res);
                        return res.json();
                    }).then(function (data) {
                        console.info(data);
                        document.getElementById("closeModal").click();
                        let area = document.getElementById("main-div");
                        area.innerHTML = area.innerHTML + `<div class="alert alert-success alert-dismissible fixed-top">
                                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                        <strong>Đặt vé thành công!</strong> Vui lòng kiểm tra email và số điện thoại.
                                                    </div>`;
                        document.getElementById("pay-btn").disabled = false;
                    });
                } else {
                    let area = document.getElementById("myModal");
                    area.innerHTML = area.innerHTML + `<div class="alert alert-danger alert-dismissible">
                                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                        <strong>Vui lòng điền đầy đủ thông tin!</strong>
                                                    </div>`;
                    document.getElementById("pay-btn").disabled = false;
                }
                ;
            } else {
                let area = document.getElementById("myModal");
                area.innerHTML = area.innerHTML + `<div class="alert alert-danger alert-dismissible fixed-bottom">
                                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                        <strong>Đặt vé thất bại!</strong> xe đã hết chổ ngồi.
                                                    </div>`;
                document.getElementById("pay-btn").disabled = false;
            }
            ;
        });
    }
    ;
    function updatePrice(price) {
        if (document.getElementById("replyNumber").value < 1)
            document.getElementById("replyNumber").value = 1;
        document.getElementById("total").innerHTML = "Thành tiền: " + document.getElementById("replyNumber").value * price;
    }
    ;
</script>