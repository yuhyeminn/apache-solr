<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="게시판-메인" name="pageTitle"/>
</jsp:include>
<div id="table-container">
    <table class="table board" style="border-bottom:1px solid #dee2e6;width:80%; margin:0 auto;">
        <thead>
        <tr>
            <th scope="col">no.</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">첨부파일</th>
            <th scope="col">작성일</th>
            <%--<th scope="col" width="10%">조회수</th>--%>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="board" items="${boardList.content}">
        <tr class="board_detail" id="${board.boardNo}">
                <th scope="row">${board.boardNo}</th>
                <td>${board.boardTitle}</td>
                <td>${board.boardWriter.memberName}</td>
                <td>
                <c:if test="${board.renamedFileName != null}">
                    <img src="${pageContext.request.contextPath}/resources/images/file.png" alt="" style="width:20px">
                </c:if>
                </td>
                <td>${board.enrollDate}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pager">
        <c:if test="${!boardList.first}">
            <li class="previous">
                <a href="?page=${boardList.number-1}">&larr; Newer Posts</a>
            </li>
        </c:if>
        <c:if test="${!boardList.last}">
            <li class="next">
                <a href="?page=${boardList.number+1}">Older Posts &rarr;</a>
            </li>
        </c:if>
    </ul>
    <div id="writebtnbox" style="text-align:right;padding-right:110px;"><button class="btn btn-dark" id="writeBtn">글쓰기</button></div>
</div>
<script>
    $(".board_detail").click(function(){
        //클릭한 행의 게시글 번호
        let boardNo = this.id;
        location.href="${pageContext.request.contextPath}/board/"+boardNo;
    });
    $("#writeBtn").click(function(){
        //게시글 글쓰기 폼으로 이동
        location.href="${pageContext.request.contextPath}/board/write";
    });


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>