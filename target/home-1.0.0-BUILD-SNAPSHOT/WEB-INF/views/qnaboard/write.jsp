<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h2 class="text-center" style="font-family: 'Gugi', cursive;">질문하기</h2>
	<form action="resister" method="POST" enctype="multipart/form-data" >
				<sec:authentication property="principal" var="pinfo"/>
			<input type="hidden" name="userId" value="${pinfo.username}"/>
			<input type="hidden" name="uno" value="${pinfo.user.uno}"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table class="table table-hover">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" name="title" required/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" name="userNickname" value="${pinfo.user.u_name}" readonly required/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" name="content" rows="20" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile" multiple/ ></td>
			</tr>
		</table>
		<input class="btn btn-outline-danger" style="border-radius: 0.25rem; float:right;" type="submit" value="등록" />
	</form>
	
</body>
</html>