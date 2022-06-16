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
		width: 300px; height: 300px;
		border-radius: 0.5rem;
	}
	#comments li{
		height:100px;
		list-style:none;
		padding:10px;
		border:1px solid #ccc;
		margin:5px 0;
	}
</style>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h2>물품 상세정보</h2>
	<form id="detailForm" action="" method="get">
		<sec:authentication property="principal" var="pinfo"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table class="table table-hover">
			<tr>
				<td>글번호</td>
				<td><input type="text" class="form-control" name="title" value="${board.bno}" readonly/></td>
			</tr>
			<tr>
				<td>물품구분</td>
				<td>
					<c:choose>
						<c:when test="${board.tradeType eq 'buy'}">
							<input type="text" class="form-control" name="tradeType" value="삽니다" readonly/>
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control" name="tradeType" value="팝니다" readonly/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><input type="text" class="form-control" name="category" value="${board.category}" readonly/></td>
			</tr>
			<tr>
				<td class="title">제목</td>
				<td>
					<input type="text" class="form-control" name="title" value="${board.title}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="title">작성자</td>
				<td>
					<input type="text" class="form-control" name="writer" value="${board.writer}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="title">내용</td>
				<td>
					<textarea class="form-control" readonly>${board.content}</textarea>
				</td>
			</tr>
			<tr>
				<td class="title">조회수</td>
				<td>
					<input type="text" class="form-control" name="viewcnt" value="${board.viewcnt}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="title">이미지</td>
				<c:if test="${!empty board.fileName}">
					<td>
						<img id="img" alt="이미지" src="${pageContext.request.contextPath}/resources/img/${board.fileName}">
					</td>
				</c:if>
			</tr>
			<tr>
				<td class="title" colspan="4">
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.user.u_id eq board.writerId or pinfo.user.u_id eq 'admin@admin' }">
							<button class="btn btn-primary" type="submit" data-oper="modify" style="border-radius: 0.25rem;">수정</button>
							<button class="btn btn-primary" type="submit" data-oper="remove" style="border-radius: 0.25rem;">삭제</button>
						</c:if>
						<c:if test="${pinfo.user.u_id ne board.writerId}">
							
							<button class="btn btn-primary" type="submit" data-oper="addWishlist"
							style="border-radius: 0.25rem; float: right;">찜하기</button>
							<button class="btn btn-primary" type="submit" data-oper="removeWishlist"
							style="border-radius: 0.25rem; float: right;">찜취소</button>
						</c:if>
						<input type="hidden" name="uno" value="${pinfo.user.uno}"/>
					</sec:authorize>
					<button class="btn btn-primary" type="submit" data-oper="list" style="border-radius: 0.25rem;">목록</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
	</form>
	<!-- 댓글 리스트 -->
	<h4>댓글</h4>
	<c:forEach items="${commentList}" var="commentList">
		<form action="" method="post" class="commentForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="rno" value="${commentList.rno}"/>
		<sec:authentication property="principal" var="pinfo"/>
		<table>
			<tr>
				<td>rno</td>
				<td>${commentList.rno}</td>
			</tr>
			<tr>
				<td class="title">작성자</td>
				<td class="title"><input type="text" class="form-control" value="${commentList.writer}" readonly/></td>
			</tr>
			<tr>
				<td class="title">작성일자</td>
				<td class="title"><input type="text" class="form-control"
				value="<f:formatDate value="${commentList.regdate}" pattern="yyyy-MM-dd HH:mm" />" readonly /></td>
			</tr>
			<tr>
				<td class="title">내용</td>
				<sec:authorize access="isAuthenticated()">
					<c:choose>
						<c:when test="${pinfo.user.u_id eq commentList.writerId or pinfo.user.u_id eq 'admin@admin'}">
							<td><textarea class="form-control" name="content">${commentList.content}</textarea></td>
						</c:when>
						<c:otherwise>
							<td><textarea class="form-control" readonly>${commentList.content}</textarea></td>
						</c:otherwise>
					</c:choose>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<td><textarea class="form-control" readonly>${commentList.content}</textarea></td>
				</sec:authorize>
			</tr>
			<sec:authorize access="isAuthenticated()">
				<c:if test="${pinfo.user.u_id eq commentList.writerId or pinfo.user.u_id eq 'admin@admin'}">
					<tr>
						<td colspan="2">
							<button id="removeComment" class="btn btn-primary" type="submit" data-oper="removeComment"
							style="border-radius: 0.25rem; float: right;">삭제</button>
							<button id="modifyComment" class="btn btn-primary" type="submit" data-oper="modifyComment"
							style="border-radius: 0.25rem; float: right; margin-right: 5px;">수정</button>
						</td>
					</tr>
				</c:if>
			</sec:authorize>
		</table>
		<div style="margin-top: 20px;"></div>
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
	</form>
	</c:forEach>
		
		<div style="margin-top: 20px;"></div>
		<form action="/board/registerComment" method="post" id="registerCommentForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<sec:authentication property="principal" var="pinfo"/>
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
		<sec:authorize access="isAuthenticated()">
			<h4>댓글 작성</h4>
			<input type="hidden" name="writerId" value="${pinfo.user.u_id}"/>
			<table>
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" class="form-control" name="writer" value="${pinfo.user.u_name}" readonly/>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea class="form-control" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<button id="registerComment" class="btn btn-primary" type="submit" data-oper="registerComment"
						style="border-radius: 0.25rem;">작성</button>
					</td>
				</tr>
			</table>
		</sec:authorize>
	</form>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		
		$(document).ready(function(){
			var result = '<c:out value="${result}"/>';
			if(result != null && result != ''){
				alert(result);
			}
			var detailForm = $("#detailForm");
			var commentForm = $(".commentForm");
			var registerCommentForm = $("#registerCommentForm");
			
			$("button").on("click", function(e){
				e.preventDefault();
				var operation = $(this).data("oper");
				
				switch(operation) {
					case "modify":
						detailForm.attr("action", "/board/modify").attr("method", "get");
						break;
					case "remove":
						detailForm.attr("action", "/board/remove").attr("method", "post");
						break;
					case "list":
						detailForm.attr("action", "/board/list").attr("method", "get");
						break;
					case "addWishlist":
						detailForm.attr("action", "/board/addWishlist").attr("method", "post");
						break;
					case "removeWishlist":
						detailForm.attr("action", "/board/removeWishlist").attr("method", "post");
						break;
					
					// 댓글 수정/삭제
					case "modifyComment":
						commentForm.attr("action", "/board/modifyComment");
						break;
					case "removeComment":
						commentForm.attr("action", "/board/removeComment");
						break;
					
				}
				switch(operation) {
					case "modify": case "remove": case "list": case "addWishlist": case "removeWishlist":
						detailForm.submit();
						break;
					case "modifyComment": case "removeComment":
						commentForm.submit();
						break;
					case "registerComment":
						registerCommentForm.submit();
						break;
				}
			});
		});
	</script>
</body>
</html>