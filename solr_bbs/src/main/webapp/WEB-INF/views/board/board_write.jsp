<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="게시판-게시글 작성" name="pageTitle"/>
</jsp:include>
<style>
    #board-container {
        /* margin: 70px; */
        text-align: center;
        padding:30px;
        margin-bottom:100px;
    }
    .content-row{
        border-top:2px solid rgb(161, 161, 161);
        border-bottom: 2px solid rgb(161, 161, 161);
        font-size:20px;
        padding:12px;
        text-align: initial;
    }
    #board-date, #board-write{
        float:right;
        font-size:16px;
        margin:0px 5px;
    }
    #board-date{
        color:#666;
    }
    #board-content{
        padding:30px;
        /* background:black; */
        color:black;
        text-align: initial;
        min-height: 500px;
    }
    #board-file{
        font-size:17px;
    }
    #file-image{
        width:27px;
        margin-right:15px;
    }
    #board-title{font-weight: bold;}
    #boardNo{
        text-align: initial;
        font-style:italic;
        margin:5px;
        color:#666;
    }
    #btn-group{
        padding-top:20px;
        text-align:right;
    }
    #btn-group button{
        margin:0px 5px;
        width:70px;
    }
    #list-button{
        height:60px;
        font-size:20px;
        float: left;
    }
</style>

<form action="${pageContext.request.contextPath}/board" id="boardWriteFrm" method="post" enctype="multipart/form-data">
    <div id="board-container">
        <p style="text-align: left">작성자 : ${memberLoggedIn.memberName} (${memberLoggedIn.memberEmail})</p>
        <%--<input type="hidden" name="boardWriter" value="${memberLoggedIn}">--%>
        <div id="board-titlebox" class="content-row d-flex">
            <span style="font-weight: bold;margin-right:20px;" class="col-auto">제목</span>
            <input class="form-control col-10" type="text" name="boardTitle" id="boardTitle">
        </div>
        <div id="board-content">
            <p style="font-weight:bold;font-size:20px;margin-top:5px;">내용</p>
            <textarea class="form-control" name="boardContent"  cols="130" rows="20"></textarea>
        </div>
        <div id="notice-file" class="content-row">
            <input type="file" name="upFile" />
        </div>
        <div id="btn-group">
            <button type="submit" class="btn btn-dark">등록</button>
            <button type="button" id="list-button" class="btn btn-dark" style="width:150px;" onclick = "location.href = '${pageContext.request.contextPath}'" >목록</button>
        </div>
    </div>
</form>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>