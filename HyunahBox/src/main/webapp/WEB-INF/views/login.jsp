<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인 화면</title>

<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<script>
	var result = '${msg}';
	var id = '${id}';
	if(result == 'wrongId'){
		alert('아이디가 틀렸습니다.')
	} else if(result == 'wrongPw'){
		alert('비밀번호가 틀렸습니다.');
	}
	
	else if(result == 'findId_success'){//findId에서 redirect로 넘어옴.
		
		alert('아이디는   >>   ' + id);
	}

	function findPage(){
		location.href = '/box/member/findPage';
	}
	
</script>

</head>
<body>
	<div>
		<h3>로그인</h3>
			<div>
				<form method="post">
					<div>
						<label>아이디 : </label>
						<input type="text" name="id" onKeyup="this.value=this.value.replace(/[^a-z0-9]/g,'')">
					</div>
					
					<div>
						<label>비밀번호 : </label>
						<input type="password" name="pw">
					</div>
					<div>
						<input type="submit" value="로그인">
					</div>
				</form>
			</div>
			
		<div>
			<div>
				<a href="/box/signup">회원가입</a>
			</div>
			<div>
				<button onclick="findPage()">ID/PW 찾기</button>
			</div>
			<div>
				<a href="/box/main/">처음화면으로</a>
			</div>
			
		</div>
	</div>
</body>
</html>