<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/bootstrap.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<style>
	.remote{
		position: fixed;
		right: 0.1%;
		bottom: 50px;
		text-align:center;
		width: 120px;
		z-index:999;
	}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand col-10" href="/">사이트</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
    <sec:authorize access="isAuthenticated()">
	<sec:authentication var="user" property="principal.user"/>
      <c:if test="${!empty user}">
      <ul class="navbar-nav me-auto">
      	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signIn"><img style="width:35px; height:auto;" src="../resources/css/bells.png"/></a>
      	</li>
      	<li class="nav-item navbar-text">
      		<a class="nav-link" style="white-space:nowrap;"href="${path}/user/info">${user.u_name}님 반갑습니다.</a>
      	</li>
       	<li class="nav-item navbar-text">
      		<a class="nav-link" style="white-space:nowrap;" href="${path}/user/signOut">로그아웃</a>
      	</li>
      </ul>
      </c:if>
      </sec:authorize>
      <sec:authorize access="isAnonymous()">
      <ul class="navbar-nav me-auto">
      	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signIn">로그인</a>
      	</li>
      	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signUp">회원가입</a>
      	</li>
      </ul>
      </sec:authorize>
    </div>
  </div>
  <div class="remote">
  	<button type="button" class="btn btn-secondary" id="remoteTop" >△</button><br/><br/>
  	<button type="button" class="btn btn-secondary" id="remoteBottom" >▽</button>
  </div>
</nav>