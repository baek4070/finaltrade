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
	.image {
		width: 302px; height: 150px;
		object-fit: contain;
	}

	.row {
		align-items: center;
		justify-content: center;
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
<title>Insert title here</title>
</head>
<body>
	<!-- 
		BoardController의 @GetMapping("/list")
		=>	${ltt} : tradeType
			${lct} : category
	 -->
	<jsp:include page="/WEB-INF/views/home/header.jsp"/>
		<c:if test="${ltt eq 'buy'}">
			<h1 class="text-center" style="font-family: 'Gugi', cursive;" >
			필요해요
			<c:if test="${lct eq 'one'}">(의류)</c:if>
			<c:if test="${lct eq 'two'}">(식품)</c:if>
			<c:if test="${lct eq 'three'}">(전자기기)</c:if>
			<c:if test="${lct eq 'four'}">(서적)</c:if>
			<c:if test="${lct eq 'five'}">(기타)</c:if>
			</h1>
<div class="row col-10">
	<nav class="navbar navbar-expand-lg navbar-light bg-light lownavbar " >
	  <div class="container-fluid" style="background-color:#2ea65a;">
	    <a class="navbar-brand " href="${path}/board/list?tradeType=buy" style="font-family: 'Gugi', cursive;">필요해요</a>
	    <div class="navbar-collapse" id="navbarColor03">
	      <ul class="navbar-nav me-auto " style="font-family: 'Gugi', cursive;" >
	        <li class="nav-item" >
	          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=one">의류</a>
	        </li>
	        <li class="nav-item">
	          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=two">식품</a>
	        </li>
	        <li class="nav-item">
	          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=three">전자기기</a>
	        </li>
	        <li class="nav-item">
	          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=four">서적</a>
	        </li>
	        <li class="nav-item">
	          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=five">기타</a>
	        </li>
	      </ul>
	        <form action="board/list" id="totalbuy">
				<div class="input-group mb-3" style="margin-top:16.2px; ">
		    		<input type="text" class="form-control" name="keyword" id="searchValue1" placeholder="필요한 것 찾기" style=" float:right" >
		    		<input type="hidden" name="TradeType" value="buy">
		    		<button class="btn btn-primary totalSearch1" type="button" id="button-addon2" style="float:right;">검색</button>
		    	</div>
	    	</form>
	    </div>
	  </div>
	</nav>
</div>
		</c:if>
		<c:if test="${ltt eq 'sell'}">
			<h1 class="text-center" style="font-family: 'Gugi', cursive;" >
			필요없어요
			<c:if test="${lct eq 'one'}">(의류)</c:if>
			<c:if test="${lct eq 'two'}">(식품)</c:if>
			<c:if test="${lct eq 'three'}">(전자기기)</c:if>
			<c:if test="${lct eq 'four'}">(서적)</c:if>
			<c:if test="${lct eq 'five'}">(기타)</c:if>
			</h1>
		<div class="row col-10">
			<nav class="navbar navbar-expand-lg navbar-light bg-light lownavbar" >
			  <div class="container-fluid" style="background-color:rgb(220,20,60);">
			    <a class="navbar-brand" href="${path}/board/list?tradeType=sell" style="font-family: 'Gugi', cursive;">필요 없어요</a>
			    <div class="navbar-collapse" id="navbarColor03">
			      <ul class="navbar-nav me-auto"  style="font-family: 'Gugi', cursive;">
			        <li class="nav-item">
			          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=sell&category=one">의류</a>
			        </li>
			        <li class="nav-item">
			          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=sell&category=two">식품</a>
			        </li>
			        <li class="nav-item">
			          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=sell&category=three">전자기기</a>
			        </li>
			        <li class="nav-item">
			          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=sell&category=four">서적</a>
			        </li>
			         <li class="nav-item">
			          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=sell&category=five">기타</a>
			        </li>
			      </ul>
			        <form action="board/list" id="totalsell">
						<div class="input-group mb-3" style="margin-top:16.2px;">
				    		<input type="text" class="form-control" name="keyword" id="searchValue2" placeholder="필요한 사람 찾기" style="float:right" >
				    		<input type="hidden" name="TradeType" value="sell">
				    		<button class="btn btn-primary totalSearch2" type="button" id="button-addon2" style="float:right">검색</button>
				    	</div>
			    	</form>
			    </div>
			  </div>
			</nav>
		</div>
		</c:if>
		<c:if test="${ltt ne 'buy' and ltt ne 'sell'}">
			<h1 class="text-center" style="font-family: 'Gugi', cursive;" >전체 물품</h1>
		</c:if>
		<div style="margin-bottom: 15px"></div>
		<sec:authentication property="principal" var="pinfo"/>
		<div class="row">
		<c:choose>
	  	 	<c:when test="${!empty list}">
	  	 		<c:forEach items="${list}" var="board">
	  	 			<div class="card border-primary mb-3 p-0 mx-2" style=" position:relative; min-width:19rem; max-width: 19rem; height: 200px; border-radius: 0.25rem;" >
	  	 			<sec:authorize access="isAuthenticated()">
	  	 					<div class="card-body p-0" style="cursor: pointer;" onclick="location.href='detail?bno=${board.bno}&uno=${board.uno}&w_uno=${pinfo.user.uno}'">
	  	 					<c:choose>
				  				<c:when test="${!empty board.fileName}">
				  					<img class="image" alt="이미지" src="${pageContext.request.contextPath}/resources/img/${board.fileName}">
				  				</c:when>
				  				<c:otherwise>
									<img class="image" alt="이미지" src="${pageContext.request.contextPath}/resources/img/camera.png">
								</c:otherwise>
				  			</c:choose>
						</div>
		  				<div style="cursor:pointer; background-color: #2ca7ff; text-align: right; font-family: 'Gugi', cursive;" onclick="location.href='detail?bno=${board.bno}&uno=${board.uno}&w_uno=${pinfo.user.uno}'" >
		  					<div style="font-family: 'Gugi', cursive; text-align: center;">${board.title}</div>
	  	 					${board.writer}
  	 					</div>
	  	 			</sec:authorize>
	  	 			<sec:authorize access="isAnonymous()">
  	 					<div class="card-body p-0" style="cursor: pointer;" onclick="location.href='detail?bno=${board.bno}'">
	  	 					<c:choose>
				  				<c:when test="${!empty board.fileName}">
				  					<img class="image" alt="이미지" src="${pageContext.request.contextPath}/resources/img/${board.fileName}">
				  				</c:when>
				  				<c:otherwise>
									<img class="image" alt="이미지" src="${pageContext.request.contextPath}/resources/img/camera.png">
								</c:otherwise>
				  			</c:choose>
						</div>
  	 					<div style="cursor:pointer; background-color: #2ca7ff; text-align: right; font-family: 'Gugi', cursive;" onclick="location.href='detail?bno=${board.bno}'" >
		  					<div style="font-family: 'Gugi', cursive; text-align: center;">${board.title}</div>
	  	 					${board.writer}
  	 					</div>
	  	 			</sec:authorize>
			  		</div>
	  	 		</c:forEach>
	  	 	<!-- 페이징 블럭 시작 -->
	  	 	<ul class="pagination" style="font-family: 'Gugi', cursive;">
				<c:if test="${pm.prev}">
					<li class="page-item">
      					<a class="page-link" href="${pm.startPage-1}">&laquo;</a>
    				</li>
				</c:if>
				<c:forEach var="num" begin="${pm.startPage}" end="${pm.endPage}">
					<li class="page-item">
      					<a class="page-link" href="${num}">${num}</a>
    				</li>
				</c:forEach>
				<c:if test="${pm.next}">
					<li class="page-item">
						<a class="page-link" href="${pm.endPage+1}">&raquo;</a>
					</li>
				</c:if>
			</ul>
	  	 	<!-- 페이징 블럭 끝 -->
	  	 	
	  	 	</c:when>
	  	 	<c:otherwise>
	  	 		<h3 class="text-center" style="font-family: 'Gugi', cursive;">등록된 게시물이 없습니다.</h3>
	  	 	</c:otherwise>
   		</c:choose>
   		<!-- 로그인 된 사용자만 물품 등록 가능 -->
   		<sec:authorize access="isAuthenticated()">
   			<form action="register" method="get">
				<button class="btn btn-outline-danger" style="border-radius: 0.25rem; float: right;">새 물품 등록</button>
			</form>
   		</sec:authorize>
   		<!-- 검색 시작 -->
   			<div class="input-group mb-3"
   			style="justify-content: center;">
				<select name="searchType" class="category" style="border-radius: 0.25rem;">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
					<option value="titcont">제목+내용</option>
				</select>
				&nbsp;
				<input type="text" class="search_box" id="keyword"
				style="border-radius: 0.25rem 0 0 0.25rem;"
				placeholder="검색어를 입력하세요."/>
				<input type="button" id="go_search" class="btn btn-primary" style="border-radius: 0 0.25rem 0.25rem 0;" value="검색"/>
			</div>
			<input type="hidden" name="page" value="${pm.cri.page}"/>
			<input type="hidden" name="perPageNum" value="${pm.cri.perPageNum}"/>
			<input type="hidden" id="tradeType" value="${ltt}"/>
			<input type="hidden" id="category" value="${lct}"/>
		<!-- 검색 끝 -->
	<form id="listForm">
		<input type="hidden" name="page" value="${pm.cri.page}"/>
		<input type="hidden" name="perPageNum" value="${pm.cri.perPageNum}"/>
		<input type="hidden" name="tradeType" value="${ltt}"/>
		<input type="hidden" name="category" value="${lct}"/>
	</form>
	</div>
	<div id="test"></div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function(){
			var result = '<c:out value="${result}"/>';
			
			registerCheck(result);
			
			history.replaceState({}, null, null);
			
			function registerCheck(result) {
				if(result === '' || history.state) {
					return;
				}
				alert(result);
			}
			
			// 페이징 블록 클릭
			$(".pagination a").on("click", function(e){
				e.preventDefault();
				var targetPage = $(this).attr("href");
				var tradeType = '${ltt}';
				var category = '${lct}';
				console.log(targetPage);
				console.log(tradeType);
				console.log(category);
				var listForm = $("#listForm");
				listForm.find("[name='page']").val(targetPage);
				listForm.find("[name='tradeType']").val(tradeType);
				listForm.find("[name='category']").val(category);
				listForm.attr("action", "list");
				listForm.submit();
			});
			
			// 검색 요청
			$("#go_search").click(function(){
				var searchType = $("select option:selected").val();
				var keyword = $("#keyword").val();
				var tradeType = $("#tradeType").val();
				var category = $("#category").val();
				console.log("searchType : " + searchType);
				console.log("keyword : " + keyword);
				location.href="list?searchType="+searchType+"&keyword="+keyword+"&tradeType="+tradeType+"&category="+category;
			});
		});
			
	</script>
	<jsp:include page="/WEB-INF/views/home/footer.jsp"/>
</body>
</html>