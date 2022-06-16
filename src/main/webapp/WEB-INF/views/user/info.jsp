<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<sec:authorize access="isAuthenticated()">
<sec:authentication var="user" property="principal.user"/>
<style>
	#signUpdateForm{
		display:flex;
		justify-content:center;
		align-items:center;
	}
	.head{
		text-align:center;
	}
	.button{
		margin:15px;
		
	}
	#table {
		border-collapse: separate;
		border-spacing: 0 20px;
	}
</style>
<h1 style="text-align:center;display:flex; justify-content:center; align-items:center;font-size:3em;font-weight:800; padding-top:25px; font-family: 'Gugi', cursive;">내 정보 관리</h1>
<form id="signUpdateForm" action="${path}/user/signUpdatePost" method="POST">
	<input type="hidden" name="uno" id="uno" value="${user.uno}"/>
	<table id="table" style="font-family: 'Gugi', cursive;">
		<tr>
			<td style="font-weight:700;font-size:1.2em;">아이디(email)</td>
			<td style="font-size:1.5em;font-weight:600;">
				<input type="hidden" name="u_id" value="${user.u_id}" style="font-size:1.5em;font-weight:600;"/>${user.u_id}
			</td>
		</tr>
		
		<tr>
			<td style="font-weight:700;font-size:1.2em;">이름(2~6자이내)</td>
			<td>
				<input type="text" name="u_name" class="form-control" id="u_name" value="${user.u_name}" required style="font-size:1.5em;font-weight:600;"/>
			</td>
		</tr>
		<tr>
			<td style="font-weight:700;font-size:1.2em;">생년월일(ex-19820607)</td>
			<td>
				<input type="text" name="u_birth" class="form-control" id="u_birth" value="${user.u_birth}" autocomplete="off" required style="font-size:1.5em;font-weight:600;"/>
			</td>
		</tr>
		<tr>
			<td style="font-weight:700;font-size:1.2em;">주소</td>
			<td>
				<div class="row">
					<div class="col-md-8">
						<input type="text" class="form-control" name="u_addr_post" id="u_addr_post" value="${user.u_addr_post}" required style="font-size:1.5em;font-weight:600;"/>
					</div>
					<div class="col-md-4">
						<input type="button" class="form-control btn btn-primary" onclick="sample6_execDaumPostcode();" value="주소찾기" style="border-radius:20px;width:120px;height:45px;"/>
					</div>
				</div>
				<br/>
				<input type="text" class="form-control" name="u_addr" id="u_addr" value="${user.u_addr}" required style="font-size:1.5em;font-weight:600;"/>
				<br/>
				<input type="text" class="form-control" name="u_addr_detail" id="u_addr_detail" value="${user.u_addr_detail}" required style="font-size:1.5em;font-weight:600;"/>
			</td>
		</tr>
		<tr>
			<td style="font-weight:700;font-size:1.2em;">전화번호(-제외 숫자만)</td>
			<td>
				<input type="text" name="u_phone" class="form-control" id="u_phone" value="${user.u_phone}" required style="font-size:1.5em;font-weight:600;"/>
			</td>
		</tr>
		<tr>
			<td style="font-weight:700;font-size:1.2em;">비밀 번호 입력</td>
			<td>
				<input type="password" class="form-control" name="u_pw" id="u_pw" autocomplete="off" required style="font-size:1.5em;font-weight:600;" />
			</td>
		</tr>
		<tr>
			<td colspan=2 >
				<input type="button" class="btn-primary" value="홈" onclick="location.href='${path}/'" style="border-radius:35px; width:138px;height:60px;font-size:20px;"/>
				<input type="button" class="btn-primary" value="회원탈퇴" onclick="location.href='/user/withdraw';" style="border-radius:35px; width:138px;height:60px;font-size:20px;"/>
				<input type="button" class="btn-primary" id="update" value="수정하기" style="border-radius:35px; width:138px;height:60px;font-size:20px;"/> 
				<input type="button" class="btn-primary" value="관리자" onclick="location.href='/user/master';" style="border-radius:35px; width:138px;height:60px;font-size:20px;"/>
			</td>
		</tr>
	</table>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</sec:authorize>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	
	var result = '${result}';
	
	if(result == '수정 실패'){
		alert(result);
	}
		
$("#update").on("click",function(){
	$("#signUpdateForm").submit();
	
});


	function sample6_execDaumPostcode(){
		new daum.Postcode({
			oncomplete : function(data){
				// 주소 검색 결과
				console.log(data);
				
				var fullAddr='';	// 최종 주소
				var extraAddr = ''; // 조합형 주소
				
				// 선택한 주소 타입에 따라 주소값을 가져온다
				if(data.userSelectedType === 'R'){ // 도로명 주소
					fullAddr = data.roadAddress;
				}else{
					// 지번 주소
					fullAddr = data.jibunAddress;
				}
				
				// 도로명 주소 타입 조합
				if(data.userSelectedType === 'R'){
					// 법정동명이 있을때 법정동명 추가
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					
					// 건물명이 존재 한다면..건물명 추가
					if(data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ?','+data.buildingName : data.buildingName);
					}
					
					fullAddr += (extraAddr !== '' ? ' ('+extraAddr+')' : '');
				}
				// 우편번호 삽입
				$("#u_addr_post").val(data.zonecode);
				// 전체 주소 삽입
				$("#u_addr").val(fullAddr);
				// 상세주소 작성
				$("#u_addr_detail").focus();
			}
		}).open();
	}

	$("#u_birth").datepicker({
		changeMonth : true,
		changeYear : true,
		yearRange: 'c-80:c+1',
		dateFormat : "yymmdd",
		dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
		dayNamesMin : ['월','화','수','목','금','토','일'],
		monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 	
	});
	
	
	$.validator.addMethod("regex",function(value,element,regexpr){
		return regexpr.test(value);
	});
	
	var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;			
	
	
	$("#signUpdatePost").validate({
		rules : {
			u_id : {
				required : true,
				email : true,
				remote : {
					type : "POST",
					url : "${pageContext.request.contextPath}/user/uidCheck",
				}
			},
			u_pw : {
				required : true, 
				minlength : 8,
				maxlength : 16,
				regex : regexPass
			},
			u_repw : {
				required : true, 
				minlength : 8,
				maxlength : 16,
				equalTo : "#u_pw"
			},
			u_name : {
				required : true,
				rangelength : [2,6]
			},
			u_birth : {
				required : true
			},
			u_addr_post : {
				required : true
			},
			u_addr : {
				required : true
			},
			u_addr_detail : {
				required : true
			},
			u_phone : {
				required : true,
				regex : regexMobile
			}
		},
		messages : {
			u_id : {
				required : "이메일(아이디)를 작성해주세요.",
				email : "올바른 이메일 형식이 아닙니다.",
				remote : "이미 존재하는 ID입니다."
			},
			u_pw : {
				required : "비밀번호를 작성해주세요.",
				minlength : "비밀번호는 최소 8글자 이상입니다.",
				maxlength : "비밀번호는 최대 16글자만 가능합니다.",
				regex : "비밀번호는 특수문자와 숫자를 포함해야합니다."
			},
			u_repw : {
				required : "비밀번호를 작성해주세요.",
				minlength : "비밀번호는 최소 8글자 이상입니다.",
				maxlength : "비밀번호는 최대 16글자만 가능합니다.",
				equalTo : "비밀번호가 일치하지 않습니다."
			},
			u_name : {
				required : "이름을 작성해 주세요.",
				rangelength : $.validator.format(
					"문자 길이가 {0}에서 {1}사이의 값을 입력하세요."
				)
			},
			u_birth : {
				required : "생년월일을 작성해주세요."
			},
			u_addr_post : {
				required : "우편번호를 확인해 주세요."
			},
			u_addr : {
				required : "주소를 확인해 주세요."
			},
			u_addr_detail : {
				required : "상세주소를 입력해주세요."
			},
			u_phone : {
				required : "전화번호를 입력해주세요.",
				regex : "올바른 전화번호 형식이 아닙니다."
			}
		},
//		debug : true,	// 확인 후 submit 실행하지 않음
		errorElement : "span",
		errorClass : "text-danger"
	});
	
	$.validator.setDefaults({
		submitHandler : function(){
			$("#signUpdateForm").submit();
		}
	});
	
	// 인증 코드 저장소
	var emailCode = "";
	
	$("#acceptEmail").click(function(){
		$.ajax({
			type : "GET",
			dataType : "text",
			url : "${pageContext.request.contextPath}/user/checkEmail",
			data : {
				u_id : $("#u_id").val()
			},
			success : function(code){
				// 확인용 삭제요망
				console.log(code);
				if(code){
					emailCode = code;
					alert("메일 발송완료");
					$("#emailCodeWrap").show();
				}else{
					alert("발송 오류");
				}
			}
		});
	});
	
	var boolEmailCode = false;
	
	$("#emailAcceptBtn").click(function(){
		var userCode =  $("#emailCode").val();
		if(emailCode == userCode){
			console.log("일치");
			boolEmailCode = true;
			alert("이메일 인증 완료");
		}else{
			console.log("불일치");
			boolEmailCode = false;
			alert("다시 인증해주십시오.");
		}
	});
	
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(
				// "${_csrf.parameterName}",
				"${_csrf.headerName}",
				"${_csrf.token}");
	});
	
</script>
</body>
</html>