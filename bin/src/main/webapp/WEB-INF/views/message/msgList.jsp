<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<style>
	th{
		max-width:600px;
	
	}
	
	td{
		max-width:600px;
	
	}
</style>
<div>
<ul class="nav nav-tabs mx-auto" style="max-width: 800px;">
  <li class="nav-item">
    <a class="nav-link active" data-bs-toggle="tab" id="a" href="#all">전체 메세지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" id="non" href="#non-read">안읽은 메세지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" id="readed" href="#read">읽은 메세지</a>
  </li>
</ul>
<div id="myTabContent" class="tab-content mx-auto" style="max-width: 800px;">
  <div class="tab-pane fade active show" id="all">
  <table class="table table-hover">
  	<tr>
  		<th scope="col">번호</th>
  		<th scope="col">제목</th>
  		<th scope="col">보낸이</th>
  		<th scope="col">수신날짜</th>
  	</tr>
  	<c:choose>
  	<c:when test="${!empty mList}">
		<c:forEach var="m" items="${mList}">
			<tr class="msg" style="cursor:pointer;" >
				<td class="mno">${m.mno}<input type="hidden" class="suno" value="${m.suno}"/></td>
				<td>${m.title}</td>
		  		<td>${m.sender}</td>
		  		<td>
		  			<f:formatDate value="${m.sendDate}" pattern="yyyy-MM-dd (E) HH:mm"/>
		  		</td>
		  	</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
		 	<td colspan="4" style="text-align:center;"><h3>내용이 없습니다.</h3></td>
		</tr>
	</c:otherwise>
	</c:choose>
  </table>
    	 <ul class="pagination">
			<c:if test="${pm.prev}">
				<li class="page-item">
    					<a class="page-link" href="${pm.startPage-1}">&laquo;</a>
   				</li>
			</c:if>
			<c:forEach var="num" begin="${pm.startPage}" end="${pm.endPage}">
				<li class="page-item">
   					<a class="page-link" href="${pm.search(num)}">${num}</a>
   				</li>
			</c:forEach>
			<c:if test="${pm.next}">
				<li class="page-item">
					<a class="page-link" href="${pm.endPage+1}">&raquo;</a>
				</li>
			</c:if>
		</ul>
  </div>
  <div class="tab-pane fade" id="non-read" style="max-width: 800px;">
  <table class="table table-hover">
  	<tr>
  		<th scope="col">번호</th>
  		<th scope="col">제목</th>
  		<th scope="col">보낸이</th>
  		<th scope="col">수신날짜</th>
  	</tr>
  	<c:choose>
  	<c:when test="${!empty nmList}">
		<c:forEach var="n" items="${nmList}">
				<c:if test="${n.checked eq 'n'}">
					<tr class="msg" style="cursor:pointer;" >
						<td class="mno">${n.mno}<input type="hidden" class="suno" value="${n.suno}"/></td>
						<td>${n.title}</td>
				  		<td>${n.sender}</td>
				  		<td>
				  			<f:formatDate value="${n.sendDate}" pattern="yyyy-MM-dd (E) HH:mm"/>
				  		</td>
				  	</tr>
			  	</c:if>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<c:if test="${empty nList}">
				<tr>
		 			<td colspan="4" style="text-align:center;"><h3>내용이 없습니다.</h3></td>
				</tr>			  		
			</c:if>		
	</c:otherwise>
	</c:choose>
	</table>
	   	<ul class="pagination n">
			<c:if test="${npm.prev}">
				<li class="page-item">
    					<a class="page-link" href="${npm.startPage-1}">&laquo;</a>
   				</li>
			</c:if>
			<c:forEach var="num" begin="${npm.startPage}" end="${npm.endPage}">
				<li class="page-item">
   					<a class="page-link" href="${npm.search(num)}&c=c">${num}</a>
   				</li>
			</c:forEach>
			<c:if test="${pm.next}">
				<li class="page-item">
					<a class="page-link" href="${npm.endPage+1}">&raquo;</a>
				</li>
			</c:if>
			
		</ul>
  </div>
    <div class="tab-pane fade" id="read" style="max-width: 800px;">
  <table class="table table-hover">
  	<tr>
  		<th scope="col">번호</th>
  		<th scope="col">제목</th>
  		<th scope="col">보낸이</th>
  		<th scope="col">수신날짜</th>
  	</tr>
  	<c:if test="${!empty cmList}">
		<c:forEach var="c" items="${cmList}">
				<c:if test="${c.checked eq 'y'}">
					<tr class="msg" style="cursor:pointer;" >
						<td class="mno">${c.mno}<input type="hidden" class="suno" value="${c.suno}"/></td>
						<td>${c.title}</td>
				  		<td>${c.sender}</td>
				  		<td>
				  			<f:formatDate value="${c.sendDate}" pattern="yyyy-MM-dd (E) HH:mm"/>
				  		</td>
				  	</tr>
			  	</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${empty cmList}">
		<tr>
		 	<td colspan="4" style="text-align:center;"><h3>내용이 없습니다.</h3></td>
		</tr>
	</c:if>
	</table>
	   	<ul class="pagination c">
			<c:if test="${cpm.prev}">
				<li class="page-item">
    					<a class="page-link" href="${cpm.startPage-1}">&laquo;</a>
   				</li>
			</c:if>
			<c:forEach var="num" begin="${cpm.startPage}" end="${cpm.endPage}">
				<li class="page-item">
   					<a class="page-link" href="${cpm.search(num)}&ct=ct">${num}</a>
   				</li>
			</c:forEach>
			<c:if test="${pm.next}">
				<li class="page-item">
					<a class="page-link" href="${cpm.endPage+1}">&raquo;</a>
				</li>
			</c:if>
		</ul>
  </div>
</div>
</div>
<jsp:include page="/WEB-INF/views/home/footer.jsp"/>
</body>
<script>

	var c = '${getc}';
	var ct = '${getct}';

	$(document).ready(function(){
		if(c !== ''){
			$("#a").attr('class','nav-link');
			$("#non").attr('class','nav-link active');
			$("#non-read").attr('class','tab-pane fade active show');
			$("#all").attr('class','tab-pane fade');
		}else if(ct !== ''){
			$("#a").attr('class','nav-link');
			$("#readed").attr('class','nav-link active');
			$("#read").attr('class','tab-pane fade active show');
			$("#all").attr('class','tab-pane fade');
		}
		
	});

	$(".msg").click(function(){
		var mno = $(this).children(".mno").text();
		var suno = $(this).children(".mno").children("input[type='hidden']").val();
		console.log(suno);
		console.log(mno);
		window.open('${path}/message/msgDetail?mno='+mno+'&suno='+suno+'', '_blank',' width=800, height=600, scrollbars=no, resizable=no');
	});
	
	$(".n a").on("click", function(e){
		
	});
</script>
</html>