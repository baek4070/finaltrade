<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<style>

	th{
		text-align:center;
	}
	
	td{
		text-align:center;
	}
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light lownavbar" >
  <div class="container-fluid" style="background-color:#2ea65a;">
    <a class="navbar-brand" href="${path}/board/list?tradeType=buy" style="font-family: 'Gugi', cursive;">필요해요</a>
    <div class="navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=one">상품1</a>
        </li>
        <li class="nav-item">
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=two">상품2</a>
        </li>
        <li class="nav-item">
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=three">상품3</a>
        </li>
        <li class="nav-item">
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=four">상품4</a>
        </li>
        <li class="nav-item">
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=five">상품5</a>
        </li>
        <li class="nav-item">
        <form action="${path}/home/myList" method="post" id="wishGo">
          <a style="color:white;" class="nav-link wish" href="#">내가 주고싶은 목록</a>
          <input type="hidden" name="uno" value="${user.uno}"/>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        </li>
      </ul>
        <form action="board/list" id="totalbuy">
			<div class="input-group mb-3" style="margin-top:16.2px;">
	    		<input type="text" class="form-control" name="keyword" id="searchValue1" placeholder="필요한 것 찾기" style="float:right" >
	    		<input type="hidden" name="TradeType" value="buy">
	    		<button class="btn btn-primary totalSearch1" type="button" id="button-addon2" style="float:right">검색</button>
	    	</div>
    	</form>
    </div>
  </div>
</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-light lownavbar" >
  <div class="container-fluid" style="background-color:rgb(220,20,60);">
    <a class="navbar-brand" href="${path}/board/list?tradeType=sell" style="font-family: 'Gugi', cursive;">필요 없어요</a>
    <div class="navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto" ">
        <li class="nav-item">
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=sell&category=one">상품1</a>
        </li>
        <li class="nav-item">
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=sell&category=two">상품2</a>
        </li>
        <li class="nav-item">
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=sell&category=three">상품3</a>
        </li>
        <li class="nav-item">
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=sell&category=four">상품4</a>
        </li>
         <li class="nav-item">
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=sell&category=five">상품5</a>
        </li>
        <li class="nav-item">
        <form action="${path}/home/myList" method="post" id="wishGo">
          <a style="color:white;" class="nav-link wish" href="#">가지고싶은 목록</a>
          <input type="hidden" name="uno" value="${user.uno}"/>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
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

<!-- -----------------------------accordion--------------------------------------------------------------- -->

<div class="accordion " id="accordionExample" >
  <div class="accordion-item" >
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
       	 공지사항
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
      
	      <ul class="navbar-nav me-auto">
	      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=buy&category=one'">
	      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=buy&category=one">상품1</a>
	      	</li>
	      </ul>
	      
	      <ul class="navbar-nav me-auto">
	      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=buy&category=two'">
	      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=buy&category=two">상품2</a>
	      	</li>
	      </ul>
	      
	      <ul class="navbar-nav me-auto">
	      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=buy&category=three'">
	      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=buy&category=three">상품3</a>
	      	</li>
	      </ul>
	      
	      <ul class="navbar-nav me-auto">
	      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=buy&category=four'">
	      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=buy&category=four">상품4</a>
	      	</li>
	      </ul>
	      
	      <ul class="navbar-nav me-auto">
	      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=buy&category=five'">
	      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=buy&category=five">상품5</a>
	      	</li>
	      </ul>
      
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
       	팝니다
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
      
	      <table class="table table-hover">
		    <c:if test="${!empty bslist}">
		      <tr>
		      	<th>작성자</th>
		      	<th>제목</th>
		      	<th>내용</th>
		      	<th>작성일</th>
		      	<th>조회수</th>
		      </tr>
				<c:forEach var="bs" items="${bslist}">
					<tr style="cursor:pointer;" onclick="location.href='${path}/board/list?bno=${bs.bno}&tradeType=${bs.tradeType}'">
					   <td style="max-width:50px;">
							<a>${bs.writer}</a>
					   </td>
					   <td style="max-width:100px;">
							<a>${bs.title}</a>
					   </td>
					   <td>
							<a>${bs.content}</a>
					   </td>
					   <td>
							<a><f:formatDate value="${bs.updateDate}" pattern="yyyy-MM-dd (E) HH:mm"/></a>
					   </td>
					   <td>
							<a>${bs.viewcnt}</a>
					   </td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty bslist}">
				<h3>내용이 없습니다.</h3>
			</c:if>
	      </table>
      
      </div>
    </div>
  </div>
  
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
      	 삽니다
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      	<table class="table table-hover">
		    <c:if test="${!empty bblist}">
		      <tr>
		      	<th>작성자</th>
		      	<th>제목</th>
		      	<th>내용</th>
		      	<th>작성일</th>
		      	<th>조회수</th>
		      </tr>
				<c:forEach var="bb" items="${bblist}">
					<tr style="cursor:pointer;" onclick="location.href='${path}/board/list?bno=${bb.bno}&tradeType=${bb.tradeType}'">
					   <td>
							<a>${bb.writer}</a>
					   </td>
					   <td>
							<a>${bb.title}</a>
					   </td>
					   <td>
							<a>${bb.content}</a>
					   </td>
					   <td>
							<a><f:formatDate value="${bb.updateDate}" pattern="yyyy-MM-dd (E) HH:mm"/></a>
					   </td>
					   <td>
							<a>${bb.viewcnt}</a>
					   </td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty bblist}">
				<h3>내용이 없습니다.</h3>
			</c:if>
	      </table>
      </div>
    </div>
  </div>
  
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
      	 자주찾는 질문
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
	    <div class="accordion-body">
	      <table class="table table-hover">
		    <c:if test="${!empty qlist}">
		      <tr>
		      	<th>제목</th>
		      </tr>
				<c:forEach var="question" items="${qlist}">
					<tr style="cursor:pointer; text-align:center;" onclick="location.href='${path}/qnaboard/detail?qno=${question.qno}'">
					   <td>
							<a>${question.title}</a>
					   </td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty qlist}">
				<h3>내용이 없습니다.</h3>
			</c:if>
	      </table>
	    </div>
    </div>
  </div>
  
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingFive">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
      	 문의하기
      </button>
    </h2>
    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      </div>
    </div>
  </div>
</div>
	<form action="/">
	<input type="hidden" name="uno" value="${user.uno}"/>
	</form>
<jsp:include page="/WEB-INF/views/home/footer.jsp"/>
<script>
$(".totalSearch1").click(function(event){
	event.stopPropagation();
	if($("#searchValue1").val() == ""){
		alert("검색어를 입력해주세요");
		return;
	}
	$("#totalbuy").submit();
});

$(".totalSearch2").click(function(event){
	event.stopPropagation();
	if($("#searchValue2").val() == ""){
		alert("검색어를 입력해주세요");
		return;
	}
	$("#totalsell").submit();
});
</script>