<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="게시판-메인" name="pageTitle"/>
</jsp:include>
<style>
    #search-frm{margin:30px;}
</style>
<div id="table-container">

    <div id="writebtnbox" style="text-align:right;padding:0;"><button class="btn btn-dark" id="writeBtn" style="margin:0 0 10px 0;">글쓰기</button></div>

    <table class="table board" style="border-bottom:1px solid #dee2e6;margin:0 auto;">
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
        <!-- 메인 -->
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

        <!-- 검색 결과 -->
        <c:forEach var="list" items="${searchResult}">
            <tr class="board_detail" id="${list.id}">
                <th scope="row">${list.id}</th>
                <td>${list.title}</td>
                <td>${list.writer}</td>
                <td>
                    <%--<c:if test="${board.renamedFileName != null}">
                        <img src="${pageContext.request.contextPath}/resources/images/file.png" alt="" style="width:20px">
                    </c:if>--%>
                </td>
                <td>${list.date}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

    <!-- Solr 검색-->
    <form class="d-flex justify-content-center" id="search-frm" action="">
        <input type="text" class="form-control" name="keyword" value="${keyword}" id="search-keyword" style="width:200px;" placeholder="검색어">
        <button type="button" class="btn btn-dark" style="margin-left: 10px;" id="search-btn">검색</button>
    </form>

    <ul class="pager d-flex">
        <c:if test="${!boardList.first}">
            <li class="previous btn btn-outline-warning mr-auto">
                <a href="?page=${boardList.number-1}">&larr; Older Posts</a>
            </li>
        </c:if>
        <c:if test="${!boardList.last}">
            <li class="next btn btn-outline-warning ml-auto">
                <a href="?page=${boardList.number+1}">Newer Posts &rarr;</a>
            </li>
        </c:if>
    </ul>

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
    $("#search-btn").click(function(){
        let keyword = $("#search-keyword").val();
        if(keyword == ""){
            alert("검색어를 입력하세요.");
        }else{
            location.href="${pageContext.request.contextPath}/board/"+keyword+"/search";
        }
    })


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>