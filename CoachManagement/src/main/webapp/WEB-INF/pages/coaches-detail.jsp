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
    <div id="commentArea">
        <h4>Bình luận:</h4>
        <c:forEach var="c" items="${comments}">
                    <div class="my-date">
                        <div>${c[0]}</div>
                        <i>${c[1]}</i>
                        <div>${c[2]}</div>
                        <br>
                    </div>
        </c:forEach>
    </div>
    <div class="form-group">
        <textarea class="form-control" id="commentId" placeholder="Nhập phản hồi"></textarea>
        <br>
        <input class="btn-primary btn" onclick="addComment(${coachesId})"
               type="button" value="Gửi phản hồi"/>
    </div>
</div>
<script>
    window.onload = function () {
        let dates = document.querySelectorAll(".my-date > i");
        for (let i = 0; i < dates.length; i++) {
            let d = dates[i];
            d.innerText = moment(d.innerText).fromNow();
        }
    };
    function addComment(coachesId) {
        fetch("/CoachManagement/api/add-comment", {
            method: 'post',
            body: JSON.stringify({
                "content": document.getElementById("commentId").value,
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

            let area = document.getElementById("commentArea");

            area.innerHTML = area.innerHTML + `
            <div class="my-date">
                <div>UsernameTesting</div>
                <div>` + data.content + `</div>   
                <div>` + moment(data.createdDate).fromNow() + `</div>
                <br>
            </div>`;

        });
    }
    ;
</script>