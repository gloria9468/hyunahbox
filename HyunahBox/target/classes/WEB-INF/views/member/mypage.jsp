<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/box/resources/css/form.css" rel="stylesheet">
<script>
$(function(){
	
	
	//miniNavi 부분 넣음.
	const loc = location.href;
	let miniNavi = "<div>✔  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>회원</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>마이페이지</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
});


function withdraw(){
	location.href = '/box/member/withdraw';
}

function bookingList(){
	location.href = '/box/member/bookingList';
}

</script>

<style type="text/css">
	.innercontainer{
		position: relative;
	    left: 50%;
	    transform: translateX(-7%);
	}
</style>

</head>
<body>
<div class="container">
	<div class="innercontainer">
		<div> <h1>${sessionScope.member.getName()} 님의 마이페이지</h1> </div>
		<div> <h1>등급 : ${sessionScope.member.getGrade().get(0).getGrade()} </h1> </div>
			
		
		<form method="post">
			<div class="row g-3 align-items-center">
				<label  class="col-form-label">아이디 : </label>
				<div class="col-auto">
					<input class="form-control" name="id" type="text" value="${item.id}" readonly>
				</div>
			</div>
			<div class="row g-3 align-items-center">
				<label class="col-form-label">비밀번호 : </label>
				<div class="col-auto">
					<input class="form-control" name="pw" type="password" value="${item.pw}" >
				</div>
			</div>
			<div class="row g-3 align-items-center">
				<label  class="col-form-label">이름 : </label>
				<div class="col-auto">
					<input class="form-control" name="name" type="text" value="${item.name}" readonly>
				</div>
			</div>
			<div class="row g-3 align-items-center">
				<label  class="col-form-label">전화번호 : </label>
				<div class="col-auto">
					<input class="form-control" name="phone" type="text" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" value="${item.phone}" />
				</div>
			</div>
			<div class="row g-3 align-items-center">
				<label  class="col-form-label">이메일 : </label>
				<div class="col-auto">
					<input class="form-control" name="email" type="email" value="${item.email}" >
				</div>
			</div>
			
			
			<div>
				<button type="submit" class="btn btn-success">정보수정</button>
				<button type="button" class="btn btn-primary" onclick="bookingList()">예매정보확인</button>
			</div>
				
		</form>
		
		<div>
			<button type="button" class="btn btn-danger" onclick="withdraw()">회원 탈퇴</button>
		</div>
	</div>
</div>


	
</body>
</html>