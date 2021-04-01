<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="게시판-게시글 상세보기" name="pageTitle"/>
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

<div id="board-container">
    <p id="boardNo"><span>NO.</span><span id="board-no">${board.boardNo}</span></p>

    <div id="board-titlebox" class="content-row">
        <span id="board-title">${board.boardTitle}</span>
        <span id="board-date">${board.enrollDate}</span>
        <span id="board-write">작성자 : ${board.boardWriter.memberName} </span>
    </div>
    <div id="board-content">${board.boardContent}</div>
    <div id="board-file" class="content-row">
        <c:if test="${board.renamedFileName != null}">
            <img src="${pageContext.request.contextPath}/resources/images/file.png" id="file-image" style="width:20px"> ${board.originalFileName}
        </c:if>
        <c:if test="${board.renamedFileName == null}">
            <span>첨부파일 없음</span>
        </c:if>
    </div>
    <div id="btn-group">
        <c:if test="${board.boardWriter.memberId eq memberLoggedIn.memberId}">
            <button type="button" class="btn btn-dark" id="board-edit-btn">수정</button>
            <button type="button" class="btn btn-dark" id="board-delete-btn">삭제</button>
        </c:if>
        <button type="button" id="list-button" class="btn btn-dark" style="width:150px;" onclick = "location.href = '${pageContext.request.contextPath}' ">목록</button>
    </div>
</div>
<script>
    $("#board-edit-btn").click(function(){
       location.href = "${pageContext.request.contextPath}/board/edit/"+${board.boardNo};
    });
    $("#board-delete-btn").click(function(){
        location.href = "${pageContext.request.contextPath}/board/delete/"+${board.boardNo};
    })
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>