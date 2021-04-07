<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />

    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
</head>
<body>
<div id="container">
    <header>
        <div id="header-container">
            <h2>${param.pageTitle }</h2>
        </div>
        <!-- https://getbootstrap.com/docs/4.0/components/navbar/ -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                JPA 게시판
            </a>
            <div class="login-form row g-2">
                <c:if test="${memberLoggedIn == null}">
                    <form class="d-flex" method="post" id="login-frm">
                        <label for="email" class="col-form-label col-auto">이메일</label>
                        <input type="text" class="form-control" id="email" name="email">

                        <label for="password" class="col-form-label col-auto">비밀번호</label>
                        <input type="password" class="form-control" id="password" name="password">

                        <button type="button" class="btn col-auto btn-dark" id="login-btn" style="margin-left:10px">로그인</button>
                    </form>
                    <button type="button" class="btn col-auto btn-dark" style="margin-left:10px" data-toggle="modal" data-target="#modal-register">회원가입</button>
                </c:if>
                <!-- 로그인 한 경우 -->
                <c:if test="${memberLoggedIn != null}">
                    <span><strong>${memberLoggedIn.memberName}</strong> 님 안녕하세요.</span>
                    <button type="button" class="btn col-auto btn-dark" id="logout-btn" style="margin-left:10px" onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</button>
                </c:if>
            </div>
        </nav>
    </header>
    <!-- 회원 가입 모달 -->
    <div class="modal fade" id="modal-register">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">회원 가입</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="register-frm" method="post">
                    <div class="modal-body" style="padding:30px;">
                        <div class="form-group">
                            <label for="memberId" class="col-form-label col-auto">이름</label>
                            <input type="text" class="form-control" name="memberName" required>

                            <label for="memberId" class="col-form-label col-auto">이메일</label>
                            <input type="email" class="form-control" name="memberEmail" required>

                            <label for="password" class="col-form-label col-auto">비밀번호</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-info" id="register-btn">회원 가입</button>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <script>
        /* 회원 가입 */
        $("#register-btn").click(function(){
            let formData = new FormData(document.getElementById('register-frm'));
            $.ajax({
                url:"${pageContext.request.contextPath}/member",
                data: formData,
                dataType: "json",
                type:"POST",
                processData: false,
                contentType : false,
                success: data => {
                    if(data.complete){
                        alert("성공적으로 가입되었습니다.");
                        $("#modal-register").modal('hide');
                    }else{
                        alert("이미 가입된 이메일입니다.");
                    }
                    //입력폼 초기화
                    $("#register-frm")[0].reset();
                },
                error : (x,s,e) => {
                    console.log(x,s,e);
                }
            });
        });

        /* 로그인 */
        $("#login-btn").click(function(){
            let formData = new FormData(document.getElementById('login-frm'));
            $.ajax({
                url:"${pageContext.request.contextPath}/member/login",
                data: formData,
                type:"POST",
                processData: false,
                contentType: false,
                success: data => {
                    alert(data.msg);
                    //입력폼 초기화
                    $("#login-frm")[0].reset();

                    if(data.complete){
                        history.go(0);
                    }
                },
                error : (x,s,e) => {
                    console.log(x,s,e);
                }
            });
        });

    </script>
    <section id="content">