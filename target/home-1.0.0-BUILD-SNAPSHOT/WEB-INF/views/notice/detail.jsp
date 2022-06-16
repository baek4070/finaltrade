<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h1 class="text-center" style="font-family: 'Gugi', cursive;">공지사항</h1>
	<table class="table table-hover">
		<tr>
			<th>제목</th>
			<td colspan="6" class="text-center">${vo.title}<td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.userNickname}<td>
			<th>작성일자</th>
			<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/><td>
			<th>조회수</th>
			<td>${vo.viewcnt}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="7" class="text-center"><textarea class="form-control" readonly rows="20" cols="50">${vo.content}</textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<c:if test="${!empty vo.filename}">
				<td colspan="7">
					<a id="img" href="${pageContext.request.contextPath}/resources/qna/${vo.filename}"> <img src="${path}/resources/img/file.png" style="width:25px; height:25px;" />${vo.filename} </a>
				</td>
			</c:if>
		</tr>
	</table>
	<sec:authentication property="principal" var="pinfo"/>
	<div style="float:right;">
	<a href="list" class="btn btn-outline-danger" style="border-radius: 0.25rem ; margin-left:3px; float:right;">목록으로</a>
	<sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')">
	<a href="modify?nno=${vo.nno}" style="border-radius: 0.25rem ; margin-left:3px; float:right;" class="btn btn-outline-danger" >수정</a>
	
	<a href="#" id="delete" class="btn btn-outline-danger" style="margin-left:3px; border-radius: 0.25rem; float:right;" data-uri="delete?nno=${vo.nno}" >삭제</a>
	&nbsp;
	</sec:authorize>
	</div>
	
	
	
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type='text/javascript'>
		$(document).ready(function(){
		    $("#delete").on('click', function() {  // 클래스값이 delete인 엘리먼트가 눌리면?
		        if(confirm("정말로 삭제하시겠습니까?")) {  // 확인 창이 열림
		            location.href = $(this).data('uri');  // data-uri 속성값으로 URL 호출
		        }
		    });
		});
	</script>
</body>
</html>