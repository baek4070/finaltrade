<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<form action="update" method="POST">
	<h1 class="text-center" style="font-family: 'Gugi', cursive;">질문 수정</h1>
		<table class="table table-hover">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="qno" value=${vo.qno} />
			<tr>
				<th>제목</th>
				<td><input class="form-control" type="text" name="title"  value="${vo.title}" required/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input class="form-control" type="text" name="userNickname" value="${vo.userNickname}" readonly/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control" name="content" rows="20" cols="15" >${vo.content}</textarea></td>
			</tr>
			<tr>
			<th>첨부파일</th>
			<c:if test="${!empty vo.filename}">
				<td >
					<a id="img" href="${pageContext.request.contextPath}/resources/qna/${vo.filename}"> <img src="${path}/resources/img/file.png" style="width:25px; height:25px;" />${vo.filename} </a>
				</td>
			</c:if>
		</tr>
		</table>
					<input type="submit" value="수정" class="btn btn-outline-danger" style="border-radius: 0.25rem; float:right; "/>
	</form>
</body>
</html>