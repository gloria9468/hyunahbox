<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>
	<div> <h1>${sessionScope.member.getName()} 님의 마이페이지</h1> </div>
	<div> <h1>등급 : ${sessionScope.member.getGrade().get(0).getGrade()} </h1> </div>
		
	
	<form method="post">
		<div>
			<label>아이디 : </label>
			<input name="id" type="text" value="${item.id}" readonly>
		</div>
		<div>
			<label>비밀번호 : </label>
			<input name="pw" type="password" value="${item.pw}" >
		</div>
		<div>
			<label>이름 : </label>
			<input name="name" type="text" value="${item.name}" readonly>
		</div>
		<div>
			<label>전화번호 : </label>
			<input name="phone" type="text" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" value="${item.phone}" />
		</div>
		<div>
			<label>이메일 : </label>
			<input name="email" type="email" value="${item.email}" >
		</div>
		
		
		<div>
			<input type="submit" value="정보 수정">
		</div>
			
	</form>
	
	<div>
		<a href="/box/member/withdraw">회원 탈퇴</a>
	</div>
	
</body>
</html>