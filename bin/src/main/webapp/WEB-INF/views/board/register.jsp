<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#remove_img {
		display: none;
	}

	/* #img {
		max-width: 150px; max-height: 150px;
	} */

	.img_cover {
		position: relative;
		cursor: pointer;
		width: 150px; height: 150px;
		padding: 10px;
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
</style>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h2>BoardRegister Page</h2>
	<form id="registerForm" action="/board/register" method="post" enctype="multipart/form-data">
		<sec:authentication property="principal" var="pinfo"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="writerId" value="${pinfo.username}"/>
		<table class="table table-hover">
			<tr>
				<td>물품구분</td>
				<td>
					<select name="tradeType" class="form-select">
						<option>삽니다</option>
						<option>팝니다</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="category" class="form-select">
						<option>one</option>
						<option>two</option>
						<option>three</option>
						<option>four</option>
						<option>five</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" name="title" placeholder="제목을 입력해주세요." required/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" name="writer" readonly
					value="${pinfo.user.u_name}"/></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea class="form-control" name="content" required></textarea></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td>
					<div class="img_cover" onclick="imgUpload()">
						<img id="img" alt="이미지 등록" src="${path}/resources/img/camera.png">
					</div>
					<div style="margin-top: 7.5px;">
						<button class="btn btn-primary" type="button" id="remove_img"
						style="width: 150px; border-radius: 0.25rem;">이미지 삭제</button>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-primary" type="submit" id="register" style="border-radius: 0.25rem;">물품등록</button>
					<button class="btn btn-primary" type="button"
					onclick="location.href='/board/list'" style="border-radius: 0.25rem;">목록으로</button>
				</td>
			</tr>
		</table>
		<input type="file" id="profileImage" name="uploadFile" accept="image/*" style="display: none;"/>
		<input type="hidden" name="uimage" id="uimage"/>
	</form>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	function imgUpload(){
		$("#profileImage").trigger("click");
	}
	
	$("#profileImage").on("change", function(){
		var files = $(this)[0].files[0];
		console.log(files.type);
		if (!files.type.startsWith('image/')) {
			alert('이미지를 선택해주세요.');
			removeImage();
		}else{
			var path = window.URL.createObjectURL(files);
			$(".img_cover").css("padding",0);
			$("#img").css("width","150px").css("height","150px").css("border-radius","0.25rem");
			$("#img").attr("src",path);
			$("#remove_img").show(); // 이미지 삭제 버튼 보이기
		}
	});
	
	$("#remove_img").on("click",function(){
		$(".img_cover").css("padding","10px");
		$("#img").css("width","128px").css("height","128px");
		$("#img").attr("src","${path}/resources/img/camera.png");
		$("#remove_img").hide(); // 이미지 삭제 버튼 감추기
		$("#profileImage").val(""); // 파일 정보 삭제
	});
</script>
</html>