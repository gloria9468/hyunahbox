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
	function findId(){
		const form = document.findIdForm;
		
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
	
	function findPw(){
		location.href = '/box/member/findPw';
	}
	
	function goBacktoLogin(){
		location.href = '/box/login';
	}
	
	
	
	var result = '${msg}';
	var id = '${id}';
	if(result == 'findId_success'){
		alert('아이디는   >>   ' + {id} );
	} else if(result == 'wrong'){
		alert('다시 입력해주세요!');
	}
	
</script>
	
</head>
<body>
	<form name="findIdForm" method="post">
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
			<button onclick = "findId()">아이디 찾기</button>
		</div>
		<div>
			<button onclick = "findPw()">비밀번호 찾기</button>
		</div>
		<div>
			<button onclick = "goBacktoLogin()">로그인 하러가기</button>
		</div>
	</div>
	
</body>
</html>