<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<form action="update" method="POST">
		<table border=1>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="qno" value=${vo.qno} />
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"  value="${vo.title}" required/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="userNickname" value="${vo.userNickname}" required/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="30" cols="50" >${vo.content}</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>