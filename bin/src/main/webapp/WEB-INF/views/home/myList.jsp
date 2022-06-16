<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<style>
	img {
		width: 302px; height: 150px;
		object-fit: contain;
	}
</style>
		<c:choose>
	  	 	<c:when test="${!empty wishList}">
	  	 		<c:forEach items="${wishList}" var="board">
	  	 			<div class="card border-primary mb-3 p-0 mx-2" style="max-width: 19rem; height: 200px;" onclick="location.href='${path}/board/detail?bno=${board.bno}'">
			  		<div class="card-body p-0" style="cursor: pointer;">
			  			<c:choose>
			  				<c:when test="${!empty board.fileName}">
			  					<img alt="이미지" src="${path}/resources/img/${board.fileName}">
			  				</c:when>
			  				<c:otherwise>
								<img alt="이미지" src="${path}/resources/img/camera.png">
							</c:otherwise>
			  			</c:choose>
			  		</div>
		  				<div style="cursor: pointer; background-color: #ccc;">
		  					<div>${board.title}</div>
	  	 					<div class="boardWriter">${board.writer}</div>
		  				</div>
					</div>
	  	 		</c:forEach>
	  	 	</c:when>
	  	 	<c:otherwise>
	  	 		<h1>목록이 존재하지 않습니다.</h1>
	  	 	</c:otherwise>
	  	</c:choose>
<jsp:include page="/WEB-INF/views/home/footer.jsp"/>
