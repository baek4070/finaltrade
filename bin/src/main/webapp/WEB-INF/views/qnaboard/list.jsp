<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon-16x16.png">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<style>

	img {
		width: 302px; height: 150px;
		object-fit: contain;
	}

	.row {
		align-content: space-around;
		margin: auto;
	}
	
	.pagination {
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.search_box {
	  display: block;
	  width: 25%;
	  padding: 0.375rem 0.75rem;
	  font-size: 1rem;
	  font-weight: 400;
	  line-height: 1.5;
	  color: #333;
	  background-color: #fff;
	  background-clip: padding-box;
	  border: 1px solid #ced4da;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  border-radius: 0.25rem;
	  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	
	.category {
	  display: block;
	  width: 15%;
	  padding: 0.375rem 2.25rem 0.375rem 0.75rem;
	  font-size: 1rem;
	  font-weight: 400;
	  line-height: 1.5;
	  color: #333;
	  background-color: #fff;
	  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23333' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
	  background-repeat: no-repeat;
	  background-position: right 0.75rem center;
	  background-size: 16px 12px;
	  border: 1px solid #ced4da;
	  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	}
</style>
<meta charset="UTF-8">
<title>투레이do!</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h2 class="text-center" style="font-family: 'Gugi', cursive;">질문과 답하기</h2>
	<table class="table table-hover"  >
		<tr style="font-family: 'Gugi', cursive;">
			<th scope="row">번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th class="lownavbar">마지막수정</th>
			<th class="lownavbar">첨부파일</th>
		</tr>
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="qnaboard" items="${list}" varStatus="status">
				
					<tr >
						<td>${qnaboard.root}</td>
						<td style="cursor:pointer;" onclick="location.href='detail?qno=${qnaboard.qno}'">${qnaboard.title}</td>
						<sec:authorize access="isAnonymous()">
							<td>
								${qnaboard.userNickname}
							</td>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<td>
								<div class="dropdown" style="position:relative; ">
									  <a class="dropbtn" style="cursor:pointer; text-decoration:none;">${qnaboard.userNickname}</a>
								  <div class="dropdown-content" style="z-index:2; left:20px; width:120px; height:50px; background-color:rgba(123,123,123,1); position:absolute; display:none">
								    <a href="${path}/message/msgWrite?mno=${qnaboard.userId}&suno=${user.uno}" onclick="window.open(this.href, '_blank', ' scrollbars=no, location=no,resizable=no, width=800, height=600'); return false;" style="color:white;">쪽지 보내기</a><br/>
								    <a href="writed?qno=${qnaboard.qno}" style="color:white;">작성 게시물 확인</a>
								  </div>
								</div>
							</td>
						</sec:authorize>
						<c:choose >
							<c:when test="${qnaboard.regdate eq qnaboard.updatedate}">
								<td class="lownavbar"><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaboard.regdate}"/></td>
							</c:when>
							<c:otherwise>
								<td class="lownavbar"><f:formatDate pattern="MM월dd일 HH시" value="${qnaboard.updatedate}"/></td>
							</c:otherwise>
						</c:choose>
						<c:choose >
							<c:when test="${!empty qnaboard.filename}">
								<th class="lownavbar"><img src="${path}/resources/img/file.png" style="width:25px; height:25px;" /></th>
							</c:when>
							<c:otherwise>
								<td class="lownavbar"> </td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td>작성된 글이 없습니다</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
		<sec:authorize access="isAuthenticated()">
			<a href="write" class="btn btn-outline-danger" style="border-radius: 0.25rem; float:right; font-family: 'Gugi', cursive;">글쓰기</a>
		</sec:authorize>
		<!-- 페이징 블럭 -->
		<ul class="pagination" style="font-family: 'Gugi', cursive;">
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="list?page=${pm.startPage-1}">이전</a>
   					</li>
				</c:if>
				<c:forEach var="i" begin="${pm.startPage}" 
								   end="${pm.endPage}">
		   				<c:choose>
							<c:when test="${pm.cri.page eq i}">
								 <li class="active page-item">
		  						 <a class="page-link" href="list${pm.search(i)}">${i}</a>
			   					</li>
							</c:when>
							<c:otherwise>
								<li class=page-item>
		  						 <a class="page-link" href="list${pm.search(i)}">${i}</a>
		   						</li>
							</c:otherwise>
						</c:choose>
				</c:forEach>
				<c:if test="${pm.next}">
					<li class="page-item">
						<a class="page-link" href="list?page=${pm.endPage+1}">다음</a>
	   				</li>
				</c:if>
		</ul>
	<div class="input-group mb-3"
	style="justify-content: center;">
		<select class="category" style="border-radius: 0.25rem;">
			<option value="n">미선택</option>
			<option value="t">제목</option>
			<option value="c">내용</option>
			<option value="tc">제목+내용</option>
		</select>
		&nbsp;
		<input class="search_box" type="text" id="keyword" placeholder="QnA게시판내에서 검색" style="border-radius: 0.25rem 0 0 0.25rem;" />
		<input class="btn btn-primary" style="border-radius: 0 0.25rem 0.25rem 0;" type="button" value="검색" id="searchBtn"/>
	</div>
	
	
	
	
	<script>
		// 검색 요청
		$("#searchBtn").click(function(){
			var searchType = $("select option:selected").val();
			var keyword = $("#keyword").val();
			console.log("searchType : " + searchType);
			console.log("keyword : " + keyword);
			location.href="list?searchType="+searchType+"&keyword="+keyword;
		});
		
	
		
		$('.dropdown').click(function(event){
		    event.stopPropagation();
	    		$('.dropdown-content',this).toggle();
		});
		
		$(document).click(function(){
		    $('.dropdown-content').hide();
		});
	</script>
</body>
</html>