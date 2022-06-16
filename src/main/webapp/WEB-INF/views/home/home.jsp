<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<style>

	th{
		text-align:center;
	}
	
	td{
		text-align:center;
	}
	
</style>

<sec:authentication property="principal" var="pinfo"/>
<nav class="navbar navbar-expand-lg navbar-light bg-light lownavbar " >
  <div class="container-fluid" style="background-color:#2ea65a;">
    <a class="navbar-brand " href="${path}/board/list?tradeType=buy" style="font-family: 'Gugi', cursive;">필요해요</a>
    <div class="navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto " style=" font-family: 'Gugi', cursive;" >
        <li class="nav-item" >
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=one">의류</a>
        </li>
        <li class="nav-item" >
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=two">식품</a>
        </li>
        <li class="nav-item" >
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=three">전자기기</a>
        </li>
        <li class="nav-item" >
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=four">서적</a>
        </li>
        <li class="nav-item" >
          <a style="color:white;" class="nav-link" href="${path}/board/list?tradeType=buy&category=five">기타</a>
        </li>
      </ul>
        <form action="board/list" id="totalbuy">
			<div class="input-group mb-3 " style="margin-top:16.2px; ">
	    		<input type="text" class="form-control" name="keyword" id="searchValue1" placeholder="필요한 것 찾기" style=" float:right" >
	    		<input type="hidden" name="TradeType" value="buy">
	    		<button class="btn btn-primary totalSearch1" type="button" id="button-addon2" style="float:right;">검색</button>
	    	</div>
    	</form>
    </div>
  </div>
</nav>

<nav class="navbar navbar-expand-lg navbar-light bg-light lownavbar" >
  <div class="container-fluid" style="background-color:rgb(220,20,60);">
    <a class="navbar-brand" href="${path}/board/list?tradeType=sell" style="font-family: 'Gugi', cursive;">필요 없어요</a>
    <div class="navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto" style="font-family: 'Gugi', cursive;">
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

<!-- -----------------------------accordion--------------------------------------------------------------- -->

<div class="accordion " id="accordionExample" >
  <div class="accordion-item" >
    <h2 class="accordion-header" id="headingOne">
      <button style=" font-family: 'Gugi', cursive;" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
       	 공지사항(최신순)
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
      
		<table class="table table-hover">
		    <c:if test="${!empty nlist}">
		      <tr>
		      	<th style="width:100px;">번호</th>
		      	<th>제목</th>
		      	<th style="width:200px;" class="firstnone">작성일</th>
		      	<th style="width:100px;">조회수</th>
		      </tr>
				<c:forEach var="ns" items="${nlist}">
					<tr style="cursor:pointer;" onclick="location.href='${path}/notice/detail?nno=${ns.nno}'">
						<td>
							${ns.nno}
						</td>
					   <td>
							${ns.title}
					   </td>
					   <td class="firstnone" >
							<f:formatDate value="${ns.updatedate}" pattern="yy-MM-dd (E) HH:mm"/>
					   </td>
					   <td >
							${ns.viewcnt}
					   </td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty nlist}">
				<h3>내용이 없습니다.</h3>
			</c:if>
	      </table>
      
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button style=" font-family: 'Gugi', cursive;" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
       	필요없어요(최신순)
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
      
	      <table class="table table-hover">
		    <c:if test="${!empty bslist}">
		      <tr>
		      	<th>제목</th>
		      	<th style="width:100px;">작성자</th>
		      	<th style="width:200px;" class="firstnone">작성일</th>
		      	<th style="width:100px;">조회수</th>
		      </tr>
				<c:forEach var="bs" items="${bslist}">
					<sec:authorize access="isAuthenticated()">
						<tr style="cursor:pointer;" onclick="location.href='${path}/board/detail?bno=${bs.bno}&uno=${bs.uno}&w_uno=${pinfo.user.uno}'">
						   <td >
								${bs.title}
						   </td>
						   <td >
								${bs.writer}
						   </td>
						   <td class="firstnone">
								<f:formatDate value="${bs.updateDate}" pattern="yy-MM-dd (E) HH:mm"/>
						   </td>
						   <td>
								${bs.viewcnt}
						   </td>
						</tr>
					</sec:authorize>
					<sec:authorize access="isAnonymous()"> 
						<tr style="cursor:pointer;" onclick="location.href='${path}/board/detail?bno=${bs.bno}&uno=${bs.uno}'">
						   <td >
								${bs.title}
						   </td>
						   <td >
								${bs.writer}
						   </td>
						   <td class="firstnone">
								<f:formatDate value="${bs.updateDate}" pattern="yy-MM-dd (E) HH:mm"/>
						   </td>
						   <td>
								${bs.viewcnt}
						   </td>
						</tr>
					</sec:authorize>
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
      <button style=" font-family: 'Gugi', cursive;" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
      	 필요해요(최신순)
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      	<table class="table table-hover">
		    <c:if test="${!empty bblist}">
		      <tr>
		    	<th>제목</th>
		      	<th style="width:100px;">작성자</th>
		      	<th style="width:200px;" class="firstnone">작성일</th>
		      	<th style="width:100px;">조회수</th>
		      </tr>
				<c:forEach var="bb" items="${bblist}">
				    <sec:authorize access="isAuthenticated()">
						<tr style="cursor:pointer;" onclick="location.href='${path}/board/detail?bno=${bb.bno}&uno=${bb.uno}&w_uno=${pinfo.user.uno}'">
						   <td >
								${bb.title}
						   </td>
						   <td >
								${bb.writer}
						   </td>
						   <td class="firstnone">
								<f:formatDate value="${bb.updateDate}" pattern="yy-MM-dd (E) HH:mm"/>
						   </td>
						   <td>
								${bb.viewcnt}
						   </td>
						</tr>
				    </sec:authorize>
				    <sec:authorize access="isAnonymous()">
						<tr style="cursor:pointer;" onclick="location.href='${path}/board/detail?bno=${bb.bno}&uno=${bb.uno}'">
						   <td >
								${bb.title}
						   </td>
						   <td >
								${bb.writer}
						   </td>
						   <td class="firstnone">
								<f:formatDate value="${bb.updateDate}" pattern="yy-MM-dd (E) HH:mm"/>
						   </td>
						   <td>
								${bb.viewcnt}
						   </td>
						</tr>
				    </sec:authorize>
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
      <button style=" font-family: 'Gugi', cursive;" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
      	 자주하는 질문(조회순)
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
	    <div class="accordion-body">
	      <table class="table table-hover">
		    <c:if test="${!empty qlist}">
		      <tr>
		    	<th>제목</th>
		      	<th style="width:100px;">작성자</th>
		      	<th style="width:200px;" class="firstnone">작성일</th>
		      	<th style="width:100px;">조회수</th>
		      </tr>
				<c:forEach var="question" items="${qlist}">
					<tr style="cursor:pointer; text-align:center;" onclick="location.href='${path}/qnaboard/detail?qno=${question.qno}'">
					   <td>
						${question.title}
					   </td>
					   <td>
						${question.userNickname}
					   </td>
					   <td class="firstnone">
						<f:formatDate value="${question.regdate}" pattern="yy-MM-dd (E) HH:mm"/>
					   </td>
					   <td>
						${question.viewcnt}
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
      <button style=" font-family: 'Gugi', cursive;" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
      	 문의하기
      </button>
    </h2>
    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      <a target="_blank" href="https://github.com/baek4070">백인광</a><br/>
      <a target="_blank" href="https://github.com/gitgw016">박종혁</a><br/>
      <a target="_blank" href="https://github.com/kmh1996">김명환</a><br/>
      <a target="_blank" href="https://github.com/930521">김회진</a><br/>
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

      <%-- <ul class="navbar-nav me-auto">
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
	      </ul> --%>