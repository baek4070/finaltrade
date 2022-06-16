<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
 	#emailAcceptBtn{
		display:none;
	}  
	.table{
		justify-align:center;
	}
	#u_birth{
		background-color:white;
	}
	.input-group-text{
		display:flex;
		jusitfy-content:center;
		align-items:center;
	}
	.join{
		width:150px;
		
		/* width:auto; */
	}
	#signUpForm{
		background-color:white;
	}
	.modal { 
		position: absolute;
		top: 0;
		 left: 0;
		 width: 100%;
		 height: 100%;
		 display: none;
		 background-color: rgba(0, 0, 0, 0.4); 
	}

	.modal.show {
		display: block;
	} 
	.modal_body {
		position: absolute;
		top: 50%; 
		left: 50%; 
		width: 400px; 
		height: 600px; 
		padding: 40px; 
		text-align: center; 
		background-color: rgb(255, 255, 255); 
		border-radius: 10px; 
		box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 
		transform: translateX(-50%) translateY(-50%); 
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
</style>
<div class="div" style="display:flex; justify-content:center; align-items:center; padding-top:25px; font-family: 'Gugi', cursive;">
	<form id="signUpForm" action="${pageContext.request.contextPath}/user/signUpPost" method="POST">
		<h1 style="text-align:center;font-size:3em;font-weight:800;">JOIN</h1>
		<table class="table">
			<tr>
				<td style="font-weight:700;font-size:1.2em;">아이디(email)</td>
				<td>
					<input type="text" class="form-control" name="u_id" id="u_id" autocomplete="off" placeholder="E-Mail" style="font-size:1.3em;" />
					<button type="button" id="acceptEmail" name="acceptEmail" class="btn btn-primary btn-sm">이메일 인증</button>
					<div class="result"></div>
					<div id="emailCodeWrap">
						<input type="text" id="emailCode" class="form-control" name="emailCode" placeholder="이메일 인증" style="font-size:1.3em;" autocomplete="off"/>
						<button type="button" id="emailAcceptBtn" class="btn btn-primary btn-sm">인증 완료</button>
					</div>
				</td>
			</tr>
			<tr>
				<td style="font-weight:700;font-size:1.2em;">비밀번호</td>
				<td>
					<input type="password" class="form-control" name="u_pw" id="u_pw" autocomplete="off" placeholder="password" style="font-size:1.3em;"/>
				</td>
			</tr>
			<tr>
				<td style="font-weight:700;font-size:1.2em;">비밀번호 확인</td>
				<td>
					<input type="password" class="form-control" name="u_repw" id="u_repw" placeholder="password check" style="font-size:1.3em;"/>
				</td>
			</tr>
			<tr>
				<td style="font-weight:700;font-size:1.2em;">이름(2~6자이내)</td>
				<td>
					<input type="text" name="u_name" class="form-control" id="u_name" placeholder="Name" style="font-size:1.3em;"/>
				</td>
			</tr>
			<tr>
				<td style="font-weight:700;font-size:1.2em;">생년월일(ex-19820607)</td>
				<td>
					<input type="text" name="u_birth" class="form-control" id="u_birth" autocomplete="off" placeholder="생년월일" style="font-size:1.3em;"/>
				</td>
			</tr>
			<tr>
				<td style="font-weight:700;font-size:1.2em;">주소</td>
				<td>
					<div class="row">
						<div class="col-md-8">
							<input type="text" class="form-control" name="u_addr_post" id="u_addr_post" placeholder="우편 번호" style="font-size:1.3em;"/>
						</div>
						<div class="col-md-4">
							<input type="button" class="form-control btn btn-primary" onclick="sample6_execDaumPostcode();" value="주소찾기" style="border-radius:20px;"/>
						</div>
					</div>
					<br/>
					<input type="text" class="form-control" name="u_addr" id="u_addr" placeholder="주소" style="font-size:1.3em;"/>
					<br/>
					<input type="text" class="form-control" name="u_addr_detail" id="u_addr_detail" placeholder="상세 주소" style="font-size:1.3em;"/>
				</td>
			</tr>
			<tr>
				<td style="font-weight:700;font-size:1.2em;">전화번호(-제외 숫자만)</td>
				<td>
					<input type="text" name="u_phone" class="form-control" id="u_phone" placeholder="Phone Number" style="font-size:1.3em;"/>
				</td>
			</tr>
			<tr>
				<td style="font-weight:700;font-size:1.2em;">
					<label>
						개인정보 이용동의
						<input type="checkbox" name="u_info" id="u_info" value="y"/>(필수)
					</label>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#thisModal" style="border-radius:20px;">자세히보기</button>
					<%-- <a href="${path}/user/text">자세히 보기</a> --%>
					<%-- <input type="button" value="자세히 보기" class="detail btn btn-primary btn-sm" onclick="location.href='${path}/user/text';"/> --%>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="btn-primary form-control" id="signUpBtn" value="회원가입" style="border-radius:20px;"/> 
				</td>
			</tr>
		</table>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
</div>
	<!-- modal 개인정보용 -->
	<div id="thisModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				<h3 class="modal-title" id="myModalLabel">개인 정보 처리 방침</h3> 
				</div> 
				<div class="modal-body">
					<table>
						<tr>
							<td>
								<h5>
									■ 개인정보의 수집 및 이용목적 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
								</h5>
								<h6>
									- 고객 관리: 고객 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달
									- 마케팅 및 광고에 활용 : 신규 서비스 개발 및 특화, 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
								</h6>
							</td>
						</tr>
						<tr>
							<td>	
								<h5>
									■ 수집하는 개인정보 항목
									회사는 정보주체가 고객서비스(상담신청, 상담, 서비스 신청 등)를 이용하기 위하여 
									고객의 개인 정보를 제공할 때의 서비스 제공을 위한 필수 정보와
									보다 향상된 서비스 제공을 위한 선택정보를 온라인상 입력방법을 통하여 수집하고 있습니다. 
									수집하는 개인정보의 범위는 아래와 같습니다.
								</h5>
								<h6>	
									개인정보 수집항목
									- 필수항목: 이름, 생년월일, 전화번호 , 이메일, 주소
									
									개인정보 수집방법
									정보주체는 웹사이트 또는 서면 절차를 통하여 개인정보처리방침과 이용약관 각각의 내용을 확인하고 선택 할 수 있습니다. 선택한 경우에는 개인정보 수집에 동의한 것으로 봅니다.
								</h6>
							</td>
						</tr>
						<tr>
							<td>
								<h5>
									■ 개인정보의 보유 및 이용기간
								</h5>
								<h6>	
									회사는 법령에 따른 개인정보 보유 이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유, 이용 기간 내에 한하여 개인정보를 보유 및 처리합니다.
									제공된 개인 정보 폐기를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나 보유 및 이용기간이 종료한 경우 해당 개인정보를 지체 없이 파기합니다.
									
									단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
									
									회사 내부 방침에 의한 정보보유 사유
									- 내 용 : 상담 관련 정보
									- 보존이유 : 고객에게 원활한 상담 서비스 제공
									- 보존기간 : 폐기 요청 시 까지
								</h6>
							</td>
						</tr>
					</table>
				</div> 
				<div class="modal-footer"> 
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>  
		</div> 
	</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

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
	var regexKey = /^[0-9]{5,6}$/;
	
	$("#signUpForm").validate({
		rules : {
			u_id : {
				required : true,
				email : true,
				remote : {
					type : "POST",
					url : "${pageContext.request.contextPath}/user/uidCheck",
				}
			},
			emailCode : {
				required : true,
				regex : regexKey
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
			},
			u_info : {
				required : true
			}
		},
		messages : {
			u_id : {
				required : "이메일(아이디)를 작성해주세요.",
				email : "올바른 이메일 형식이 아닙니다.",
				remote : "이미 존재하는 ID입니다."
			},
			emailCode : {
				required : "인증해주세요.",
				regex : "인증번호를 입력해주세요."
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
			},
			u_info : {
				required : "개인정보 이용에 동의해주세요."
			}			
		},
		errorElement : "span",
		errorClass : "text-danger"
	});
	
	// 인증 코드 저장소
	var emailCode = "";
	
	$("#acceptEmail").click(function(){
		console.log('sdsdsd');
		u_id = $("#u_id").val();
		console.log(u_id);
		$.ajax({
			type : "GET",
			dataType : "text",
			url : "/user/checkEmail",
			data : {
				u_id : $("#u_id").val()
			},
			success : function(code){
				console.log(code);
				if(code){
					emailCode = code;
					alert("메일 발송완료");
					$("#emailAcceptBtn").show();
				}else{
					alert("메일 전송 실패 관리자에게 문의해 주세요");
				}
			},
			error : function(res){
				console.log(res);
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
			$("#acceptEmail").hide();
			$("#emailCodeWrap").hide();
		}else{
			console.log("불일치");
			boolEmailCode = false;
			alert("다시 인증해주십시오.");
		}
	});
	
	$.validator.setDefaults({
		submitHandler : function(){
			$("#signUpForm").submit();
		}
	});
	
	
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(
				// "${_csrf.parameterName}",
				"${_csrf.headerName}",
				"${_csrf.token}");
	});
	
</script>