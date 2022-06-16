<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h1 class="text-center">답글달기(관리자 모드)</h1>
	<table class="table table-hover">
		<tr>
			<th>제목</th>
			<td colspan="5" class="text-center">${vo.title}<td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.userNickname}<td>
			<th>작성자id</th>
			<td>${vo.userId}</td>
			<th>작성일자</th>
			<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/><td>
			<th>마지막수정일자</th>
			<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updatedate}"/><td>
			<th>조회수</th>
			<td>${vo.viewcnt}<td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5" class="text-center">${vo.content}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="5" class="text-center">${vo.filename}</td>
		</tr>
	</table>
	<hr/>
	<form action="resisterReply" method="POST">
				<sec:authentication property="principal" var="pinfo"/>
			<input type="hidden" name="userId" value="${pinfo.username}"/>
			<input type="hidden" name="seq" value="${vo.seq}"/>
			<input type="hidden" name="depth" value="${vo.depth}"/>
			<input type="hidden" name="root" value="${vo.root}"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table class="table table-hover">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" name="title" value="re:${vo.title}"required/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" name="userNickname" value="${pinfo.user.u_name}" readonly required/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" name="content" rows="30" cols="50"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="btn btn-outline-danger" style="border-radius: 0.25rem; float:right;" type="submit" value="답변달기" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>