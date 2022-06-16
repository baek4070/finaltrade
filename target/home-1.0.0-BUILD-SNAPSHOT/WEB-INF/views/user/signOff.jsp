<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>    
<!-- 중복 접속시 블락용 페이지 -->
<h1 style="display:flex;justify-content:center;align-items:center;text-align:center;">다른 사용자가 접속하여 접속이 해제되었습니다.</h1>
<div>
	<button class="btn btn-primary" style="display:block;justify-content:center;align-items:center;text-align:center;width:150px;height:100px;border-radius:40px;margin:auto;" onclick="location.href='/user/signIn';">로그인</button>
</div>
</body>
</html>