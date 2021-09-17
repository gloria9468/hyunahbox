<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾기 페이지</title>

<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<script>
	function findId(){
		location.href = '/box/member/findId';
	}
	function findPw(){
		location.href = '/box/member/findPw';
	}
</script>

</head>
<body>
	<div><button onclick="findId()">아이디 찾기</button></div>
	<div><button onclick="findPw()">비밀번호 찾기</button></div>
</body>
</html>