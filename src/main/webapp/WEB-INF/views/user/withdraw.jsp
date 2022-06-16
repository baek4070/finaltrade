<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<style>
	#text{
		text-align:center;
	}
	
	input[type="text"]{
		height:45px;
	}
	input[type="password"]{
		height:45px;
	}
	#table {
		border-collapse: separate;
	}
</style>
<h1 style="text-align:center;font-size:3em;font-weight:800;padding-top:150px;font-family: 'Gugi', cursive;">회원탈퇴</h1>
<div class="container" style="display:flex; justify-content:center; font-family: 'Gugi', cursive;">
	<form action="${path}/user/withdrawPost" method="POST" id="withdraw">
		<table id="table" style="border-spacing:40px 40px;">
			<tr>
				<td  style="font-weight:700;font-size:1.5em;">이메일</td>
				<td>
					<input type="text" id="u_id" name="u_id" placeholder="E-Mail" class="form-control" autocomplete="off" style="font-size:1.3em;" required/>
				</td>
			</tr>
			<tr>
				<td style="font-weight:700;font-size:1.5em;">비밀번호</td>
				<td>
					<input type="password" id="u_pw" name="u_pw" placeholder="password" class="form-control" autocomplete="off" style="font-size:1.3em;" required/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="out" value="회원탈퇴" class="btn-primary form-control" style="border-radius:20px;"/>
				</td> 
			</tr>
		</table>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
</div>
<script>

var message = '${message}';

if(message == "탈퇴 성공"){
	alert(message);
} else if(message == "탈퇴 실패"){
	alert(message);
	history.go(-1);
};

	$("#out").on("click",function(){
		
		$("#withdraw").submit();

	});
	 
</script>
</body>
</html>