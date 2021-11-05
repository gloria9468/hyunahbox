<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>

<script src="/candb/resources/JS/jquery-3.6.0.min.js"></script>
<script>
	function findPw(){
		const form = document.findPwForm;
		
		if(form.id.value == ''){
			alert('아이디를 입력하세요.')
			form.id.focus();
			return;
		}
		if(form.name.value == ''){
			alert('이름을 입력하세요');
			form.name.focus();
			return;
		}
		if(form.phone.value == ''){
			alert('전화번호를 입력하세요.');
			form.phone.focus();
			return;
		}
		form.submit();
	}
	
	function findId(){
		location.href = '/member/findId';
	}
	
	function goBacktoLogin(){
		location.href = '/login';
	}
	
	
	
	var result = '${msg}';
	if(result == 'wrongId'){
		alert('아이디부터 틀렸다.');
	} else if(result == 'wrongName'){
		alert('이름이 틀렸다');
	} else if(result == 'wrongPhone'){
		alert('전화번호가 틀렸다.');
	} else if(result == 'wrongEverything'){
		alert('아이디만 맞고 다 틀림.')
	}

</script>
	
</head>
<body>
	<form name="findPwForm" method="post">
		<div>
			<label>아이디</label>
			<input type="text" name="id" value="${newPw.id}">
		</div>
		<div>
			<label>이름</label>
			<input type="text" name="name">
		</div>
		<div>
			<label>전화번호</label>
			<input type="text" name="phone">
		</div>
	</form>

	<div>
		<div>
			<button onclick = "findPw()">비밀번호 찾기</button>
		</div>
		<button onclick = "findId()">아이디 찾기</button>
		<button onclick = "goBacktoLogin()">로그인 하러가기</button>
	</div>
	
</body>
</html>