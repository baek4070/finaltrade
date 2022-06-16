<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<form id="logoutForm" action="${path}/user/signOut" method="POST">
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<script>

	var result = '${result}';
	if(result != "") alert(result);
	
	var message = '${message}';
	if(message != "") alert(message);
	
	$("#logoutForm").submit();



	
</script>
</body>
</html>