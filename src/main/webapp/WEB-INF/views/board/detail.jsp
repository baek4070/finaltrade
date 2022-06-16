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
	<h2 class="text-center" style="font-family: 'Gugi', cursive;" >물품 상세정보</h2>
	<form id="detailForm" action="" method="get">
		<sec:authentication property="principal" var="pinfo"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<sec:authorize access="isAuthenticated()">
			<c:if test="${pinfo.user.u_id ne board.writerId}">
				<c:choose>
					<c:when test="${empty wishlist}">
						<button class="btn btn-danger" type="submit" data-oper="addWishlist"
						style="border-radius: 0.25rem; float: right; margin-right:8px;"><img width="25px" src="../resources/img/heart2.png"/></button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-danger" type="submit" data-oper="removeWishlist"
						style="border-radius: 0.25rem; float: right; margin-right:8px; "><img width="25px" src="../resources/img/heart1.png"/></button>
					</c:otherwise>
				</c:choose>
			</c:if>
			<a class="btn btn-primary" id="sendMsg"
			style="border-radius: 0.25rem; float: right; margin-right:8px;"
			href="${path}/message/msgWrite?userNickname=${board.writer}&uno=${board.uno}&suno=${pinfo.user.uno}"
			onclick="window.open(this.href, '_blank', ' scrollbars=no, location=no,resizable=no, width=800, height=600'); return false;"><img width="25px" src="../resources/img/email.png"/></a>
		</sec:authorize>
		
		
		<table class="table table-hover">
			<tr>
				<th class="title" style="font-family: 'Gugi', cursive;" >제목</th>
				<td colspan="3">
					<input type="text" class="form-control" name="title" value="${board.title}" readonly/>
				</td>
				<th class="title" style="font-family: 'Gugi', cursive;" >조회수</th>
				<td>
					<input type="text" class="form-control" name="viewcnt" value="${board.viewcnt}" readonly/>
				</td>
			</tr>
			<tr>
				<th style="font-family: 'Gugi', cursive;">물품구분</th>
				<td>
					<c:choose>
						<c:when test="${board.tradeType eq 'buy'}">
							<input type="text" class="form-control" name="tradeType" value="필요해요" readonly/>
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control" name="tradeType" value="필요없어요" readonly/>
						</c:otherwise>
					</c:choose>
				</td>
				<th style="font-family: 'Gugi', cursive;">카테고리</th>
				<td>
					<c:if test="${board.category eq 'one'}">
						<input type="text" class="form-control" name="category" value="의류" readonly/>
					</c:if>
					<c:if test="${board.category eq 'two'}">
						<input type="text" class="form-control" name="category" value="식품" readonly/>
					</c:if>
					<c:if test="${board.category eq 'three'}">
						<input type="text" class="form-control" name="category" value="전자기기" readonly/>
					</c:if>
					<c:if test="${board.category eq 'four'}">
						<input type="text" class="form-control" name="category" value="서적" readonly/>
					</c:if>
					<c:if test="${board.category eq 'five'}">
						<input type="text" class="form-control" name="category" value="기타" readonly/>
					</c:if>
				</td>
				<th class="title" style="font-family: 'Gugi', cursive;" >작성자</th>
				<td>
					<input type="text" class="form-control" name="writer" value="${board.writer}" readonly/>
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<th class="title" style="font-family: 'Gugi', cursive;" >내용</th>
				<td colspan="5">
					<textarea class="form-control" rows="10" readonly>${board.content}</textarea>
				</td>
			</tr>
			<c:if test="${!empty board.fileName}">
				<tr>
					<th class="title" style="font-family: 'Gugi', cursive;">이미지</th>
						<td colspan="5">
							<img id="img" alt="이미지" src="${pageContext.request.contextPath}/resources/img/${board.fileName}">
						</td>
				</tr>
			</c:if>
		</table>
					<button class="btn btn-primary" type="submit" data-oper="list" style="border-radius: 0.25rem; float:right; margin-left:3px; ">목록</button>
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.user.u_id eq board.writerId or pinfo.user.u_id eq 'admin@admin' }">
							<button class="btn btn-primary" type="submit" data-oper="remove" style="border-radius: 0.25rem; float:right; margin-left:3px; ">삭제</button>
							<button class="btn btn-primary" type="submit" data-oper="modify" style="border-radius: 0.25rem; float:right; margin-left:3px; ">수정</button>
						</c:if>
						<input type="hidden" name="w_uno" value="${pinfo.user.uno}"/>
					</sec:authorize>
					
		<input type="hidden" name="uno" value="${board.uno}"/>
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
	</form>
	<!-- 댓글 리스트 -->
	<h4 style="font-family: 'Gugi', cursive;" >댓글</h4>
	<c:forEach items="${commentList}" var="commentList">
		<form action="" method="post" class="commentForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="rno" value="${commentList.rno}"/>
		<sec:authentication property="principal" var="pinfo"/>
		<table class="table table-hover" >
			<tr>
				<th class="title">${commentList.writer}</th>
				<sec:authorize access="isAuthenticated()">
					<c:choose>
						<c:when test="${pinfo.user.u_id eq commentList.writerId or pinfo.user.u_id eq 'admin@admin'}">
							<td><textarea class="form-control content" name="content">${commentList.content}</textarea></td>
						</c:when>
						<c:otherwise>
							<td><textarea class="form-control content" readonly>${commentList.content}</textarea></td>
						</c:otherwise>
					</c:choose>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<td><textarea class="form-control content" readonly>${commentList.content}</textarea></td>
				</sec:authorize>
				<th class="title" style="text-align:right; width:150px;"><f:formatDate value="${commentList.regdate}" pattern="yy-MM-dd HH:mm" /><br/>
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.user.u_id eq commentList.writerId or pinfo.user.u_id eq 'admin@admin'}">
							<button id="modifyComment" class="btn btn-primary" type="submit" data-oper="modifyComment"
							style="border-radius: 0.25rem;  margin-right: 5px;">수정</button>
							<button id="removeComment" class="btn btn-outline-danger" type="submit" data-oper="removeComment"
							style="border-radius: 0.25rem; ">삭제</button>
						</c:if>
					</sec:authorize>
				</th>
			</tr>
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
		<input type="hidden" name="uno" value="${board.uno}"/>
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
		<sec:authorize access="isAuthenticated()">
			<h4 style="font-family: 'Gugi', cursive;" >댓글 작성</h4>
			<input type="hidden" name="writerId" value="${pinfo.user.u_id}"/>
			<table class="table table-hover">
				<tr>
					<th style="font-family: 'Gugi', cursive;">작성자</th>
					<td>
						<input type="text" class="form-control" name="writer" value="${pinfo.user.u_name}" readonly/>
					</td>
				</tr>
				<tr>
					<th style="font-family: 'Gugi', cursive;">내용</th>
					<td>
						<textarea class="form-control" name="content"></textarea>
					</td>
					<td style="width:80px; ">
						<button id="registerComment" class="btn btn-primary" type="submit" data-oper="registerComment"
						style="border-radius: 0.25rem; margin-top:20px;">등록</button>
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
						//detailForm.attr("action", "/board/list").attr("method", "get");
						var tradeType = '${board.tradeType}';
						var category = '${board.category}';
						switch(tradeType) {
							case "buy":
								switch(category) {
									case "one":
										location.href="${path}/board/list?tradeType=buy&category=one";
										break;
									case "two":
										location.href="${path}/board/list?tradeType=buy&category=two";
										break;
									case "three":
										location.href="${path}/board/list?tradeType=buy&category=three";
										break;
									case "four":
										location.href="${path}/board/list?tradeType=buy&category=four";
										break;
									case "five":
										location.href="${path}/board/list?tradeType=buy&category=five";
										break;
								}
								break;
							case "sell":
								switch(category) {
								case "one":
									location.href="${path}/board/list?tradeType=sell&category=one";
									break;
								case "two":
									location.href="${path}/board/list?tradeType=sell&category=two";
									break;
								case "three":
									location.href="${path}/board/list?tradeType=sell&category=three";
									break;
								case "four":
									location.href="${path}/board/list?tradeType=sell&category=four";
									break;
								case "five":
									location.href="${path}/board/list?tradeType=sell&category=five";
									break;
								}
								break;
						}				
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
					case "modify": case "remove": case "addWishlist": case "removeWishlist":
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