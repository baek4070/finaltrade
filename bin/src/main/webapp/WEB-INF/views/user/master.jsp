<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자 페이지 -->
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')">
<sec:authentication var="user" property="principal.user"/>
<style>
	.table{
		border:1px solid black;
	}
	.deleteBtn{
		wi
	}
	h1{
		text-align:center;
	}
	.deleteBtn{
		border-radius:25px;
		height:30px;
	}
	.select{
		appearance:none;
		background-color:white;
		color:rgb(39,128,227);
		padding:3px 0;
		width:100px;
		text-align:center;
		font-weight:500;
		boder-left:1px solid skyblue;
		border-radius:15px;
	}
	.select option{
		width:100px;
		text-align:center;
		font-weight:500;
		boder-left:1px solid;
		border-radius:15px;
	}
	th{
		font-weight:600;
		font-size:1.4em;
	}
	td{
		font-weight:600;
		font-size:1em;
	}
</style>
<div style="padding-top:50px;float:right;">	
	<table style="padding-top:25px;float:right;">
		<tr>
			<td>
				<input type="text" class="inner" style="width:180px;height:25px;border-radius:20px;text-align:center;font-weight:500;font-size:1.2em;" placeholder="이름으로 검색"/>
				<input type="button" class="btn btn-primary sbtn" value="검색" style="width:75px;border-radius:5px;"/>
			</td>
		</tr>
	</table>
</div>
<div class="container" style="font-family: 'Gugi', cursive;padding-top:50px;padding-bottom:100px;">
<h1>관리자 페이지</h1>
	<table class="container table tabled-bordered" style="border:1px solid black;text-align:center;padding-top:40px;">
		<tr>
			<th>회원번호</th>
			<th>이메일</th>
			<th>이름</th>
			<th>권한</th>
			<th>생년월일</th>
			<th>전화번호</th>
			<th>마지막 방문 일자</th>
			<th>탈퇴 여부</th>
			<th>권한 부여/삭제</th>
		</tr>
		<c:choose>
				<c:when test="${empty searchList && !empty userList}">
					<c:forEach var="user" items="${userList}">
						<tr>
							<td>${user.uno}</td>
							<td id="userM">${user.u_id}</td>
							<td>${user.u_name}</td>
							<td>
								<select id="authM" class="select" style="font-size:1em;">
									<c:forEach var="auth" items="${user.authList}">
										<c:if test="${auth.u_auth eq 'ROLE_USER'}">
											<option value="ROLE_USER">일반 사용자</option>
										</c:if>
										<c:if test="${auth.u_auth eq 'ROLE_MASTER'}">
											<option value="ROLE_MASTER">관리자</option>
										</c:if>
										<c:if test="${auth.u_auth eq 'ROLE_ADMIN'}">
											<option value="ROLE_ADMIN">관리자</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
							<td>${user.u_birth}</td>
							<td>${user.u_phone}</td>
							<td>
								<f:formatDate value="${user.u_visit_date}" pattern="yyyy-MM-dd (E) HH:mm"/>
							</td>
							<td>
								<select class="select">
									<option value="y" ${user.u_withdraw eq 'y' ? 'selected' : '' }>비활성화</option>
									<option value="n" ${user.u_withdraw eq 'n' ? 'selected' : '' }>활성화</option>
								</select>
								<sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')"> 
									<input type="button" value="활성/비활성" class="deleteBtn btn btn-primary" />
								</sec:authorize>
							</td>
							<td>
								<sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')">	
									<select class="authChange select">
										<option selected>권한선택</option>
										<option value="ROLE_USER">일반회원</option>
										<option value="ROLE_MASTER">관리자</option>
									</select>
								</sec:authorize>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:when test="${!empty searchList}">
					<c:forEach var="suser" items="${searchList}">
						<tr>
							<td>${suser.uno}</td>
							<td id="userM">${suser.u_id}</td>
							<td>${suser.u_name}</td>
							<td>
								<select id="authM" class="select" style="font-size:1em;">
									<c:forEach var="auth" items="${suser.authList}">
										<c:if test="${auth.u_auth eq 'ROLE_USER'}">
											<option value="ROLE_USER">일반 사용자</option>
										</c:if>
										<c:if test="${auth.u_auth eq 'ROLE_MASTER'}">
											<option value="ROLE_MASTER">관리자</option>
										</c:if>
										<c:if test="${auth.u_auth eq 'ROLE_ADMIN'}">
											<option value="ROLE_ADMIN">관리자</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
							<td>${suser.u_birth}</td>
							<td>${suser.u_phone}</td>
							<td>
								<f:formatDate value="${suser.u_visit_date}" pattern="yyyy-MM-dd (E) HH:mm"/>
							</td>
							<td>
								<select class="select">
									<option value="y" ${suser.u_withdraw eq 'y' ? 'selected' : '' }>비활성화</option>
									<option value="n" ${suser.u_withdraw eq 'n' ? 'selected' : '' }>활성화</option>
								</select>
								<sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')"> 
									<input type="button" value="활성/비활성" class="deleteBtn btn btn-primary" />
								</sec:authorize>
							</td>
							<td>
								<sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')">	
									<select class="authChange select">
										<option selected>권한선택</option>
										<option value="ROLE_USER">일반회원</option>
										<option value="ROLE_MASTER">관리자</option>
									</select>
								</sec:authorize>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<th colspan="9">등록된 회원이 없습니다.</th>
					</tr>
				</c:otherwise>
		</c:choose>
	</table>
</div>
</sec:authorize>
<script>

	$(".sbtn").on("click",function(){
		
		var word = $(".inner").val();
		
		if(word == '' || word == null){
			location.href="/user/master";	
		}
		console.log(word);
		location.href="/user/master?word="+word;
	});


	$(".deleteBtn").on("click",function(){
		var deletef = $(this).parent().find("select").val();
		console.log(deletef);
		
		var parentTr = $(this).closest("tr");
		console.log('parentTr'+parentTr);
		var u_id = parentTr.find("#userM").text();
		console.log('u_id'+u_id);
		
		$.ajax({
			type : "post",
			url : "/user/delete",
			data : {
				u_id : u_id,
				u_withdraw : deletef,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "text",
			success : function(data){
				console.log(data);
				if(data == 'y' || data == 'n'){
					alert('변경 완료'+data);
				}else{
					alert('문제 발생');
				}
			}
		});
		
	}); 
		
	$(".authChange").on("change",function(){
		var selectAuth = $(this);
		var changeValue = selectAuth.val();
		console.log('changeValue'+changeValue);
		
		var parentTr = $(this).parent().parent();
		console.log('parentTr'+parentTr);
		var userId = parentTr.find("#userM").text();
		console.log('userId'+userId);
		
		$.ajax({
			type:"POST",
			url:"${path}/user/changeAuth",
			data:{
				u_id : userId,
				u_auth : changeValue,
				'${_csrf.parameterName}' : '${_csrf.token}'
			},
			dataType : "json",
			success : function(result){
				console.log('result');
				console.log(result);
				
				var str = "";
				$(result).each(function(){
					if(this.u_auth == 'ROLE_USER'){
						str += "<option>일반사용자</option>";
					}else if(this.u_auth == 'ROLE_MASTER'){
						str += "<option>관리자</option>";
					}else if(this.u_auth == 'ROLE_ADMIN'){
						str += "<option>관리자</option>";
					}
				});
				
				parentTr.find("#authM").html(str);
			},
			error : function(res){
				console.log(res);
				console.log('권한 부족');
			}
		});
		// 선택후에 권한선택으로 다시 돌아오는 문구		
		selectAuth.find("option").eq(0).prop("selected",true);
	});
	
	
</script>
</body>
</html>