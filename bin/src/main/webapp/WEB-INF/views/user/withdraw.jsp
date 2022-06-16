<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<form action="${path}/user/withdrawPost" method="POST" id="withdraw">
	<table>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" id="u_id" name="u_id" required/>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" id="u_pw" name="u_pw" required/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="out" value="회원탈퇴"/>
			</td> 
		</tr>
	</table>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
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