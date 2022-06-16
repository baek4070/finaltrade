<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
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
	<h2 class="text-center" style="font-family: 'Gugi', cursive;">공지사항</h2>
	<table class="table table-hover">
		<tr style="font-family: 'Gugi', cursive;">
			<th scope="row">번호</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="notice" items="${list}" varStatus="status">
				
					<tr style="cursor:pointer;" onclick="location.href='detail?nno=${notice.nno}'">
						<td>${notice.nno}</td>
						<td>${notice.title}</td>
						<td><f:formatDate pattern="yyyy-MM-dd" value="${notice.updatedate}"/></td>
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
			<a href="write" class="btn btn-outline-danger" style="border-radius: 0.25rem; float:right;">글쓰기</a>
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
		<input class="search_box" type="text" id="keyword" placeholder="공지사항내에서 검색" style="border-radius: 0.25rem 0 0 0.25rem;" />
		<input class="btn btn-primary" style="border-radius: 0 0.25rem 0.25rem 0;" type="button" value="검색" id="searchBtn"/>
	</div>
	
	
	
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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