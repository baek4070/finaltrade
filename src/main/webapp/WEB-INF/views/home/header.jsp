<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon-16x16.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>투래이do!</title>
<link href="${path}/resources/css/bootstrap.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<style>

	.btn-outline-danger{
	width:auto;
	}
	.btn-primary{
	width:auto;
	}
	
	@media (max-width:992px) {
		.firstnone{
		display:none;
		}
	 }
	 
	 
	.remote{
		position: fixed;
		right: 0.1%;
		bottom: 50px;
		text-align:center;
		width: 120px;
		z-index:999;
	}
	
	.accordion{
		padding-left : 0;
	}
	

</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="position:fixed; top:0%; width:100%; z-index:999; min-height:72px;">
<div class="row col-10 offset-1">
  <div class="container-fluid ">
  		 <a class="navbar-brand text-center" href="/" style="font-family: 'Gugi', cursive; font-size:xx-large; " >
	  		<span onmouseover="this.style.color='rgb(255,174,66)';" onMouseOut="this.style.color='white'">투</span><span onmouseover="this.style.color='#2ea65a';" onMouseOut="this.style.color='white'">래</span><span onmouseover="this.style.color='#187bcd';" onMouseOut="this.style.color='white'">이</span><span onmouseover="this.style.color='rgb(220,20,60)';" onMouseOut="this.style.color='white'">Do</span>
   		 </a> 
	    
    <sec:authorize access="isAuthenticated()">
	<sec:authentication var="user" property="principal.user"/>
      <c:if test="${!empty user}">
      <ul class="navbar-nav ms-auto" style="display:inline; float:right;">
      <sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')">
      	<li class="nav-item navbar-text">
      		<a class="nav-link" href="${path}/user/master">MANAGEMENT</a>
      	</li>
      	</sec:authorize>
      	<li class="nav-item " >
          <a onmouseover="this.style.color='rgb(255,174,66)';" onMouseOut="this.style.color='white'" style="color:white; text-decoration:none;" href="${path}/message/msgList?uno=${user.uno}">쪽지함</a>&nbsp;
			<a onmouseover="this.style.color='#2ea65a';" onMouseOut="this.style.color='white'" style="color:white; text-decoration:none;" href="${path}/user/info">${user.u_name}님 반갑습니다.</a>&nbsp;
         <a onmouseover="this.style.color='rgb(220,20,60)';" onMouseOut="this.style.color='white'" style="color:white; text-decoration:none;" href="${path}/user/signOut">로그아웃</a>
      	</li>
      	<li class="nav-item dropdown">
      	<a onmouseover="this.style.color='#187bcd';" onMouseOut="this.style.color='white'" style="color:white; text-decoration:none;" class="dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          	<img style="width:35px; height:auto;" src="../resources/css/bells.png"/>
          </a>
          <div class="dropdown-menu" id="bell" style="position:absolute;">
          	<div style="text-align:center; font-family: 'Gugi', cursive; font-size:x-large;">알&nbsp;&nbsp;림</div>
          </div>
      </ul>
      </c:if>
      </sec:authorize>
      <sec:authorize access="isAnonymous()">
      <ul class="navbar-nav ms-auto" style="float:right;">
      	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signIn">로그인</a>
      	</li>
      	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signUp">회원가입</a>
      	</li>
      </ul>
      </sec:authorize>
   <button style="float:left; margin-right:2em;"class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
  </button>
    <div class="collapse navbar-collapse navbarColor01">
      <ul class="navbar-nav me-auto" style="font-family: 'Gugi', cursive; float:left ;">
        <li class="nav-item">
          <a class="nav-link" href="${path}/notice/list">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/board/list?tradeType=buy">필요해요</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/board/list?tradeType=sell">필요없어요</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/qnaboard/list">Q&A</a>
        </li>
        <li class="nav-item">
        <form action="${path}/home/myList" method="post" id="wishGo">
          <a class="nav-link wish" href="#">찜목록&#x2763;</a>
          <input type="hidden" name="uno" value="${user.uno}"/>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        </li>
      </ul>
    </div>
  </div>
  </div>
  <div class="remote">
  	<button type="button" class="btn btn-secondary" id="remoteTop" >△</button><br/><br/>
  	<button type="button" class="btn btn-secondary" id="remoteBottom" >▽</button>
  </div>
</nav>
<div class="col-10 offset-1 my-2">
	<div class="row" style="margin-top:100px;">
		<div class="col-lg-3 ms-md-auto" style="margin-top:16px;">
		
    	</div>
    </div>
</div>
<sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')">
<br/>
<br/>
</sec:authorize>
<div class="row col-10 offset-1" style="min-height:800px;">



<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var exist = '${mslist}'
console.log(exist);

if(exist != ''){
	$(document).on('ready',function(){
		window.open('${path}/message/msgDetail?mno=${mslist.mno}', '_blank', ' scrollbars=no, location=no,resizable=no, width=800, height=600');
	});
}


$(document).on('ready',function(){
	var uno = '${user.uno}'
	console.log(uno);
	if(uno !== ''){
		var url = "${path}/bell/"+uno
		$.getJSON(url,function(data){
			console.log(data);
			printList(data);
		});
	}
});

function printList(list){
	var str = "<div class='dropdown-divider'></div><a class='dropdown-item href='#' >등록된 알림이 없습니다.</a>";
	if($(list).length !== 0){
		str = "";
		$(list).each(function(){
			let bno = this.bno;
			let uno = this.uno;
			let mno = this.mno;
			let sender = this.sender;
			if(this.checked == 'n'){
				if(bno >= 1){
					str += "<div class='dropdown-divider'></div>"
		        	str += "<a class='dropdown-item new' href='${path}/selected?bno="+bno+"&uno="+uno+"'>"+bno+"번 글에 댓글이 추가되었습니다.</a>"
				}else if(mno >= 1){
					str += "<div class='dropdown-divider'></div>"
					str += "<a class='dropdown-item message new' href='${path}/called?uno="+uno+"&mno="+mno+"' >"+sender+"님에게서 쪽지가 도착했습니다.</a>"
				}
			}
		});
	}
	console.log(str);
	$("#bell").append(str);
}

/*  $(".message").on("click",function(event){
	 event.preventDefault();
	$.ajax({
		type : "get",
		url : "${path}/called",
		headers : {
			"Content-Type" : "application/json"
		},
		dataType : "text",
		data : JSON.stringify({
			uno : this.uno,
			mno : this.mno
		}),
		success : function(data){
			 $('#dialog-message').dialog({
					modal: true, 
					buttons: {
						"PHP": function() { $(this).dialog('close'); },
						"ASP": function() { $(this).dialog('close'); },
						"JSP": function() { $(this).dialog('close'); }
					}
				});
		}
	}); 
}); */

 $(".message").click(function(event){
	event.preventDefault();
	window.open(this.href, '_blank', ' scrollbars=no, location=no,resizable=no, width=800, height=600'); 
}); 

$(".totalSearch").click(function(event){
	event.stopPropagation();
	if($("#searchValue").val() == "" || $("#searchValue").val() == null){
		alert("검색어를 입력해주세요");
		return;
	}
	total.submit();
});

$(".wish").click(function(event){
	event.stopPropagation();
	$("#wishGo").submit();
});

/* <!--  $('#toggle').click(function(event){
event.stopPropagation();
$('#drop').toggle();
});

$(document).click(function(){
$('#drop').hide();
});

--!> */

$("#remoteTop").click(function(){
    $(window).scrollTop(0);
});

$("#remoteBottom").click(function(){
	 window.scrollTo(0,document.body.scrollHeight);
	
});



</script>
