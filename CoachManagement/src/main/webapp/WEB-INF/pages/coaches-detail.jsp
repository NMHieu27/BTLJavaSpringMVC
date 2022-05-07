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
    <!--Test-->
    <div class="card mb-3 w-auto" >
        <div class="row no-gutters">
            <div class="col-md-4"> 
                <c:choose>
                    <c:when test="${coa[7] != null && coa[7].startsWith('https') == true}">
                        <img class="rounded w-100 h-100" src="${coa[7]}" alt="coach image">
                    </c:when>

                    <c:when test="${coa[7] == null || coa[7].startsWith('https') == false}">
                        <img class="rounded w-100 h-100 " src="<c:url value="/images/default.jpg" />" alt="coach image">
                    </c:when>
                </c:choose>
            </div>
            <div class="col-md-8">

                <div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="card-body">
                                <h5 class="card-title"> ${coa[6]}</h5>
                                <div>Tên chuyến: ${coa[0]}</div>
                                <div>Giờ bắt đầu: ${coa[1]}</div>
                                <div>Giờ dự kiến tới nơi: ${coa[2]}</div>
                                <div>Tuyến xe: ${coa[3]}</div>
                                <div>Trạm xuất phát: ${coa[4]}</div>
                                <div>Trạm kết thúc: ${coa[5]}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Test-->


    <div id="commentArea">
        <h4>Bình luận:</h4>
        <c:forEach var="c" items="${comments}">
            <div class="row my-date">
                <div class="col-md-2" style="padding: 10px">
                    <img class="rounded-circle img-fluid " src="${c[3]}" alt="Ảnh người dùng" />
                </div>
                <div class="col-md-10 my-date h-50" style="border: 1px #000 solid; border-radius: 10px">
                    <strong><div>${c[0]}</div></strong>

                    <div>${c[2]}</div>
                    <br>
                    <br>
                    <br>
                    <small><i>${c[1]}</i></small>   
                </div>
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
    let dates = document.querySelectorAll(".my-date > small > i");
    for (let i = 0; i < dates.length; i++) {
    let d = dates[i];
    d.innerText = moment(d.innerText).fromNow();
    }
    };
    function addComment(coachesId) {
    if (1${currentUser.id} != 1){
    if (document.getElementById("commentId").value.trim() != "") {
    fetch("/CoachManagement/api/add-comment", {
    method: 'post',
            body: JSON.stringify({
            "content": document.getElementById("commentId").value.trim(),
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
    area.innerHTML = area.innerHTML + `<div class="row my-date">
                                        <div class="col-md-2" style="padding: 10px">
                                            <img class="rounded-circle img-fluid " src="` + data[3] + `" alt="Ảnh người dùng" />
                                            </div>
                                            <div class="col-md-10 my-date h-50" style="border: 1px #000 solid; border-radius: 10px">
                                                <strong><div>` + data[2] + `</div></strong>
                    
                                                <div>` + data[0] + `</div>
                                                        <br>
                                                        <br>
                                                        <br>
                                                <small><i>` + moment(data[1]).fromNow() + `</i></small>   
                                            </div>
                                        </div>`;
    });
    }
    document.getElementById("commentId").value = "";
    } else {
    window.location.replace("http://localhost:8080/CoachManagement/login");
    }
    }
    ;
</script>

`
<!--            <div class="my-date">
                <img src="` + data[3] + `" class="rounded" alt="Ảnh người dùng">
                <div>` + data[2] + `</div>
                <small><i>` + moment(data[1]).fromNow() + `</i></small>
                <div>` + data[0] + `</div>   
                <br>
            </div>`;-->