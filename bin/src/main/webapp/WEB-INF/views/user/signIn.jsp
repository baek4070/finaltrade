<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<style>
	#text{
		text-align:center;
	}
	.container{
		display : flex;
		justify-content:center; 
		align-items:center; 
		padding-top:250px;
	}
	input[type="checkbox"]{
		width:23px;
		height:23px;
	}
	input[type="text"]{
		height:45px;
	}
	input[type="password"]{
		height:45px;
	}
	#table {
		border-collapse: separate;
		border-spacing: 0 4px;
	}
</style>
<div class="container" style="display:flex; justify-content:center; align-items:center; padding-top:50px; font-family: 'Gugi', cursive;">
<form action="/user/signIn" method="POST">
	<h1 id="text" style="text-align:center;font-size:4em;font-weight:800;">LOGIN</h1>
	<table id="table" style="border-spacing:30px 30px;">
		<tr>
			<td style="font-weight:700;font-size:1.5em;">E-MAIL</td>
			<td>
				<input type="text" name="u_id" id="u_id" placeholder="E-Mail" class="form-control" autocomplete="off" style="font-size:1.3em;"/>
			</td>
		</tr>
		<tr style="margin:25px;">
			<td style="font-weight:700;font-size:1.5em;">PASSWORD</td>
			<td>
				<input type="password" name="u_pw" id="u_pw" placeholder="password" class="form-control" autocomplete="off" style="font-size:1.3em;"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:700;font-size:1.2em;">
				<label>
					<input type="checkbox" class="form-check-input" name="userCookie" id="userCookie" />로그인 유지
				</label>
			</td>
		</tr>
		<tr>	
			<td colspan="2">			
				<input type="submit" class="btn-primary form-control" value="로그인" id="loginBtn" style="border-radius:20px;"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" id="button">
				<input type="button" class="form-control btn-primary" value="회원가입" onclick="location.href='${path}/user/signUp';" style="border-radius:20px;"/>		
			</td>
		</tr>
	</table>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</div>
<script>
	var csrf = '${_csrf.parameterName}';
	console.log(csrf);
	
	var csrfT = '${_csrf.token}';
	console.log(csrfT);
	
	var message = '${message}';

	if(message == "UserDetailsService returned null, which is an interface contract violation") {
		msg = "아이디가 존재하지않습니다.";
		alert(msg);
	}else if(message == "Bad credentials"){
		msg = "비밀번호가 틀렷습니다.";
		alert(msg);
	}
</script>
</body>
</html>