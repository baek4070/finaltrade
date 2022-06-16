<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#img {
		width: 300px; height: 300px; border-radius: 0.5rem;
	}
</style>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h2>BoardModify Page</h2>
	<form id="modifyForm" action="" method="get">
		<sec:authentication property="principal" var="pinfo"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="writerId" value="${pinfo.username}"/>
		<table class="table table-hover">
			<tr>
				<td>글번호</td>
				<td><input type="text" class="form-control" name="bno" value="${board.bno}" readonly/></td>
			</tr>
			<tr>
				<td>물품구분</td>
				<td>
					<select name="tradeType" class="form-select">
						<option>필요해요</option>
						<option>필요없어요</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="category" class="form-select">
						<option>one</option>
						<option>two</option>
						<option>three</option>
						<option>four</option>
						<option>five</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" class="form-control" name="title" value="${board.title}"/>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" class="form-control" name="writer" value="${pinfo.user.u_name}" readonly/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea class="form-control" name="content">${board.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>이미지</td>
				<td>
					<img id="img" alt="이미지" src="${pageContext.request.contextPath}/resources/img/${board.fileName}">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-primary" type="submit" data-oper="modify" style="border-radius: 0.25rem;">수정</button>
					<button class="btn btn-primary" type="submit" data-oper="list" style="border-radius: 0.25rem;">목록</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
	</form>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function(){
			
			var modifyForm = $("#modifyForm");
			
			$("button").on("click", function(e){
				e.preventDefault();
				var operation = $(this).data("oper");
				
				switch(operation) {
					case "modify":
						modifyForm.attr("action", "/board/modify").attr("method", "post");
						break;
					case "list":
						modifyForm.attr("action", "/board/list").attr("method", "get");
						break;
				}
				modifyForm.submit();
			});
		});
	</script>
</body>
</html>