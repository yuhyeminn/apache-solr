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

    #delFileChk+label{
        font-size: .8em;
        position: relative;
        left: -3px;
    }
    span#fname{
        position: absolute;
        left: 385px;
        width: 200px;
        background: white;
        font-size:18px;
    }
</style>

<form action="${pageContext.request.contextPath}/board/edit/${board.boardNo}" id="boardUpdateFrm"
      method="post" enctype="multipart/form-data">
    <input type="hidden" name="noticeNo" value="" />
    <input type="hidden" name="noticeWriter" value= />
    <div id="board-container">
        <div id="board-titlebox" class="content-row d-flex">
            <span style="font-weight: bold;margin-right:20px;" class="col-auto">제목</span>
            <input class="form-control col-10" type="text" name="boardTitle" id="boardTitle" value="${board.boardTitle}">
        </div>
        <div id="board-content">
            <p style="font-weight:bold;font-size:20px;margin-top:5px;">내용</p>
            <textarea class="form-control" name="boardContent"  cols="130" rows="20">${board.boardContent}</textarea>
        </div>
        <div id="board-file" class="content-row">
            <!-- file태그의 value속성은 임의로 변경할 수 없다. 반영되지 않음. -->
            <input type="file" name="upFile"/>

            <!-- file이 있는 경우 파일명 표시 -->
            <c:if test="${board.originalFileName != null}">
                <span id="fname">${board.originalFileName}</span>
            </c:if>

            <input type="hidden" name="oldOriginalFileName"
                   value="${board.originalFileName}" />

            <input type="hidden" name="oldRenamedFileName"
                   value="${board.renamedFileName}" />

            <!-- 기존파일삭제 체크박스 -->
            <c:if test="${board.renamedFileName != null}">
                <input type="checkbox" name="del_flag" id="delFileChk"/>
                <label for="delFileChk">첨부파일삭제</label>
            </c:if>
        </div>
        <div id="btn-group">

            <button type="submit" id="update-btn" class="btn btn-dark">수정</button>

            <button type="button" id="list-button" class="btn btn-dark" style="width:150px;" onclick = "location.href = '${pageContext.request.contextPath}' ">목록</button>
        </div>
    </div>
</form>

<script>
    $("[name=upFile]").change(function(){
        //수정페이지에서 파일태그에 파일을 추가한 경우
        if($(this).val() != ""){
            $("#fname").hide();
            $("#delFileChk").hide().next().hide();
            $("#delFileChk").val(true);
        }
        else{
            $("#fname").show();
            $("#delFileChk").show().next().show();
        }
    });
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>