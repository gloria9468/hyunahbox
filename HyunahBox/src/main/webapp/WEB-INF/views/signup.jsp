<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<jsp:include page="include/header.jsp"></jsp:include>
<link href="/box/resources/css/signup.css" rel="stylesheet">

<script> 
	let check_id = false;
	
	function idCheck(){
		const form = document.signupForm;
		const xhr = new XMLHttpRequest;
		xhr.open("GET", "idCheck?id=" + form.id.value, true);
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
					if(xhr.responseText == "OK"){
						if(form.id.value != ''){
							check_id = true;
							toggleCheckId(1);
							alert("사용가능한 아이디");
						}else {
							alert("아이디를 입력해주세요");
						}
						
					}else {
						alert("이미 등록된 아이디")
						toggleCheckId(2);
					}
				}
			}
		}
		
		xhr.send();
		
	}
	
	function toggleCheckId(mode) {
		if(mode == 0) { // 중복검사 안했음
			$("#idCheck").removeClass("hide");
			$("#idCheck_FAIL").addClass("hide");
			$("#idCheck_OK").addClass("hide");
		} else if(mode == 1) { // 사용가능아이디
			$("#idCheck").addClass("hide");
			$("#idCheck_FAIL").addClass("hide");
			$("#idCheck_OK").removeClass("hide");	
		} else if(mode == 2) { // 이미 등록된 아이디
			$("#idCheck").addClass("hide");
			$("#idCheck_FAIL").removeClass("hide");
			$("#idCheck_OK").addClass("hide");	
		}
	}
	

	
	
	function changeId(){
		check_id = false;
		toggleCheckId(0);
	}
	
	// window.load = function() { }
	$(function(){
		toggleCheckId(0);
	});


	function signup(){
		const form = document.signupForm;
		
		if(form.id.value == ''){
			alert('아이디를 입력하세요.');
			form.id.focus();
			return;			 
		}
		
		if(!check_id){
			alert('아이디 중복 검사 하세요');
			return;
		}
		
		if(form.pw.value == ''){
			alert('비밀번호를 입력하세요.');
			form.pw.focus();
			return;			 
		}
		if(form.pw.value !== form.pwCheck.value){
			alert('비밀번호가 일치하지 않습니다. 확인해주세요');
			form.pwCheck.focus();
			return;			 
		}
		
		if(form.name.value == ''){
			alert('성명를 입력하세요.');
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
	function goBack(){
		location.href = ".";
	}
	

	
	function selectEmailBox(){
		const form = document.signupForm;
		var back = $("#email_select option:selected").val();
		
		if(form.email_select.value == 'etc'){
			form.backEmail.removeAttribute("readonly");
			form.backEmail.value=""; //초기화
			form.backEmail.focus();
			back=document.getElementById("backEmail").value;
		} else {
			form.backEmail.setAttribute("readonly", "");
			form.backEmail.value = back;
			
		}
	
	
	$(function(){//frontEmail + backEamil = email
		var frontEmail = document.getElementById("frontEmail").value;
	

		let makeEmail = frontEmail + "@" + back;
		console.log(frontEmail);
		console.log(back);
		
		let email = document.getElementById("email");
		email.value = makeEmail;
		console.log(email);
		});
	};
</script>
<style type="text/css">
.hide{
    display:none;
}

</style>

</head>
<body>
	<div class ="container">
		
		<div class="logo"> <h1>현아박스</h1></div>
		<div class ="center">
		
		
		<div class="form">
			<form name="signupForm" method="post" >
				<input type="hidden" class="emailList" id="email" name="email">
				<div class="formList">
					<label>아이디</label>
					<input name="id" type="text" onchange="changeId()" onKeyup="this.value=this.value.replace(/[^a-z0-9]/g,'')"> 
					<div class="idCheck">
						<p onclick="idCheck()" id="idCheck">중복검사</p>
						<p id="idCheck_OK">사용가능</p><p id="idCheck_FAIL">중복된 아이디</p>
					</div>
				</div>
				<div class="formList">
					<label>비밀번호</label>
					<input name="pw" type="password">
				</div>
				<div class="formList">
					<label>비밀번호 확인</label>
					<input name="pwCheck" type="password">
				</div>
				
				<div class="formList">
					<label>이름</label>
					<input name="name" type="text" onKeyup="this.value=this.value.replace(/[^ㄱ-ㅎ가-힣]/g,'')">
				</div>
				<div class="formList">
					<label>핸드폰번호</label>
					<input name="phone" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')">
				</div>
				<div class="formList">
					<label>이메일</label>
					<input name="frontEmail" id="frontEmail" type="text" onKeyup="this.value=this.value.replace(/[^a-z0-9]/g,'')">
					<p>@</p>
					
					<input type="text" id="backEmail" readonly="readonly">
						<select name ="selectEmail" id="email_select" onchange="selectEmailBox()" >
							<option selected disabled>선택해주세요</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.com">daum.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="etc" onKeyup="this.value=this.value.replace(/[^a-z.]/g,'')">직접입력</option>
						</select>
					</div>
				
			</form>
				<div class ="btn">
					<button onclick="signup()">회원가입</button>
					<button onclick="goBack()">취소</button>
				</div>
		</div>
		

		
		</div>
	</div>
</body>
</html>