<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>

<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<script>
	function newPw(){
		const form = document.newPwForm;
		
		if(form.pw.value == ''){
			alert('새로운 비밀번호를 입력하세요.')
			form.pw.focus();
			return;
		}
		if(form.pwCheck.value == ''){
			alert('새로운 비밀번호을 확인하세요');
			form.pwCheck.focus();
			return;
		}
		
		if(form.pw.value == form.pwCheck.value){
			alert('비밀번호 변경이 완료되었습니다! <br> 다시 로그인해주세요!');
			form.submit();
		} else {
			alert('비밀번호가 다릅니다. 확인해주세요!');
		} 
	}
	
	function goBacktoLogin(){
		location.href = '/box/login';
	}
	
	var result = '${msg}';
	if(result == 'newPw_success'){
		alert('새로운 비밀번호를 등록하세요!');
	}
	
</script>
	
</head>
<body>
	<form name="newPwForm" method="post">
	
		<div>
			<label>새로운 비밀번호</label>
			<input type="password" name="pw">
		</div>
		<div>
			<label>새로운 비밀번호 확인</label>
			<input type="password" name="pwCheck">
		</div>

	</form>

	<div>
		<button onclick = "newPw()">새로운 비밀번호 등록</button>
		<button onclick = "goBacktoLogin()">로그인 하러가기</button>
	</div>
	
</body>
</html>