<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#static{
		padding:0px;
	}
	
	tr th a{
		text-decoration:none;
		color:white;
		font-weigth:normal;
		font-size:12px;
	}
	
	tr th a:hover{
		color:black;
	}
</style>
<div class="container">
<table class="table table-hover">
	<tr>
		<th id="static">
			<div class="row navbar navbar-dark bg-primary">
				<div class="col-10"><h3 style="margin:0">QnA</h3></div>
				<div class="col-1" style="min-width:74px;">
					<a href="${path}/qnaboard/list">더보기</a>
				</div>
			</div>
		</th>
	</tr>
	<c:if test="${!empty qBoard}">
	<c:forEach var="question" items="${qBoard}">
		<tr>
    		<td onclick="location.href='${path}/qnaboard/detail?qno=${question.qno}'"><p style="font-weight:bold;">${question.title}</p>${question.content}</td>
    	</tr>
    </c:forEach>
    </c:if>
    <c:if test="${empty qBoard}">
    <tr>
      <td><h4>내용이 없습니다.</h4></td>
    </tr>
    </c:if>
 </table>
 <table class="table table-hover">
	<tr>
		<th id="static">
			<div class="row navbar navbar-dark bg-primary">
				<div class="col-10"><h3 style="margin:0">Board</h3></div>
				<div class="col-1" style="min-width:74px;">
					<a href="${path}/board/list">더보기</a>
				</div>
			</div>
		</th>
	</tr>
	<c:if test="${!empty bBoard}">
	<c:forEach var="board" items="${bBoard}">
		<tr>
    		<td onclick="location.href='${path}/board/detail?bno=${board.bno}'"><p style="font-weight:bold;">${board.title}</p>${board.content}</td>
    	</tr>
    </c:forEach>
    </c:if>
    <c:if test="${empty bBoard}">
    <tr>
      <td><h4>내용이 없습니다.</h4></td>
    </tr>
    </c:if>
 </table>
</div>
<jsp:include page="/WEB-INF/views/home/footer.jsp"/>
</body>
</html>