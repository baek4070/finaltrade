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

	.con{
		scrollbars:no;
		resizable:no;
		width:800;
		height:600;
	}

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
<title>Insert title here</title>
</head>
<body>
	<div class="detail con">
	<h2 class="text-center">쪽지</h2>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table class="table table-hover">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" name="title" value="${msgList.title}" readonly/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" name="receiver" value="${msgList.sender}" readonly/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" name="content" rows="20" cols="50" readonly>${msgList.content}</textarea></td>
			</tr>
		</table>
		<input class="btn btn-outline-danger resistGo" style="border-radius: 0.25rem; float:left;" type="button" value="답장보내기" />
		<input class="btn btn-outline-danger close" style="border-radius: 0.25rem; float:right;" type="button" value="닫기" />
	</div>
	
	<div class="writes con" style="display:none;">
	<h2 class="text-center">쪽지보내기</h2>
	<form action="${path}/message/resister" method="post">
	<sec:authorize access="isAuthenticated()">
	<sec:authentication var="user" property="principal.user"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="uno" value="${msgList.suno}"/>
			<input type="hidden" name="suno" id="d" value="${user.uno}"/>
		<table class="table table-hover">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" name="title" required/></td>
			</tr>
			<tr>
				<td>받는사람</td>
				<td><input class="form-control" type="text" name="receiver" value="${msgList.sender}" readonly required/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" name="sender" value="${user.u_name}" readonly required/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" name="content" rows="20" cols="40" required></textarea></td>
			</tr>
			
		</table>
		<input class="btn btn-outline-danger" style="border-radius: 0.25rem; float:left;" type="submit" value="보내기" />
		<input class="btn btn-outline-danger" style="border-radius: 0.25rem; float:right;" type="reset" value="초기화"/>
		<input class="btn btn-outline-danger close" style="border-radius: 0.25rem; float:right;" type="button" value="닫기"/>
		</sec:authorize>
	</form>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(".close").click(function(){
		window.close();
	});
	
	$(".resistGo").click(function(){
		$(".detail").css('display','none');
		$(".writes").css('display','block');
	})
	
	var result = '${results}';
	if(result == 'true'){
		alert("전송 완료");
		window.close();
	}else if(result == 'false' && result != ''){
		alert("전송 실패");
	}
</script>
</html>