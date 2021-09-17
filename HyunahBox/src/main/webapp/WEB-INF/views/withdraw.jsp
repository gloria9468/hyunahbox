<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>

<script src="/candb/resources/JS/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	
	function withdraw(){
		const form = document.withdrawForm;
	
		
		if(form.id.value == ''){
			alert('아이디를 입력해주세요');
			form.id.focus();
			return;
		}
		if(form.pw.value == ''){
			alert('비밀번호를 입력해주세요');
			form.pw.focus();
			return;
		}
		var lastConfirm = confirm("정말로 회원 탈퇴를 하시겠습니까?");
		if(lastConfirm){
			form.submit();	
		} else{
			return goBack();
			
		}
		
	}
	
	var result = '${msg}';
	
	if(result == "wrongPw"){
		alert("비밀번호가 틀렸습니다.");
	}
	if(result == "wrongId"){
		alert("아이디가 틀렸습니다.");
	}
	
	function goBack(){
		location.href = "./mypage";
	}
	

</script>


</head>
<body>
	<form name="withdrawForm" method="post">
		<div>
			<label>아이디</label>
			<input name="id" type="text">
		</div>
		
		<div>
			<label>비밀번호</label>
			<input name="pw" type="password">
		</div>
		
	</form>
	<button onclick="withdraw()">탈퇴 신청</button>
	
</body>
</html>