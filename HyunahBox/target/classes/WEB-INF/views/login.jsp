<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인 화면</title>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/box/resources/css/form.css" rel="stylesheet">
<script>
	var result = '${msg}';
	var id = '${id}';
	if(result == 'wrongId'){
		swal("아이디가 틀렸습니다. \n 확인부탁드립니다.", {icon : "error", button : "확인" ,});
	} else if(result == 'wrongPw'){
		swal("비밀번호가 틀렸습니다. \n 확인부탁드립니다.", {icon : "error", button : "확인" ,});
	}
	
	else if(result == 'findId_success'){//findId에서 redirect로 넘어옴.
		
		alert('아이디는   >>   ' + id);
		swal("아이디는. \n ." + id + "입니다.", {icon : "success", button : "확인" ,});
	}

	function findPage(){
		location.href = '/box/member/findPage';
	}
	function signup(){
		location.href = '/box/signup';
	}
	
	
	$(function(){
		
		
		//miniNavi 부분 넣음.
		const loc = location.href;
		let miniNavi = "<div>✔  >  <a href='";
			miniNavi += loc;
			miniNavi += "'>로그인</a>  >  <a href='";
			miniNavi += loc;
			miniNavi += "'>로그인</a></div>";
		
		$(document.getElementById("miniNavi")).append( $(miniNavi) );
	});
	
</script>

<style type="text/css">
	.innerContainer{
		position: relative;
	    left: 50%;
	    transform: translateX(-7%);
	}
	.swal-overlay {
	    margin-top: 130px;
		height : calc(100vh - 130px);
		width : 100%;
		background-color: rgba(45, 45, 45, 0.9);
	}
	.swal-text{
		text-align : center;
	}
	
	.swal-button {
		padding: 7px 19px;
		border-radius: 2px;
		background-color: #4D00ED;
		font-size: 12px;
		border: 1px solid #2900C9;
		box-shadow:none;
	}
	
	.swal-button:focus{outline:none;box-shadow:none;}
	.swal-button--cancel:focus{box-shadow:none;}
	
	
	.swal-button--confirm:not([disabled]):hover{
		background-color : #1700B7;
	}
	
	.swal-footer {
    	text-align: center;
    }
    
	.swal-button--cancel{
		background-color : #EAEAEA;
		color : black;
		border: 1px solid #D8D8D8;
	}
	.swal-button--cancel:not([disabled]):hover{
		background-color : #A2A2A2;
	}
</style>

</head>
<body>
	<div class="container">
		<div class="innerContainer">
			<h3>로그인</h3>
				<div>
					<form method="post">
						<div class="row g-3 align-items-center">
							<label  class="col-form-label">아이디 : </label>
							<div class="col-auto">
								<input class="form-control" type="text" name="id" onKeyup="this.value=this.value.replace(/[^a-z0-9]/g,'')">
							</div>
						</div>
						
						<div class="row g-3 align-items-center">
							<label for="inputPassword6" class="col-form-label">비밀번호 : </label>
							<div class="col-auto">
								<input class="form-control" type="password" name="pw">
							</div>
						</div>
						<div>
							<button type="submit" class="btn btn-success">로그인</button>
						</div>
					</form>
				</div>
				
			<div>
				<div>
					<button class="btn btn-primary" type="button" onclick="signup()">회원가입</button>
				
					<button class="btn btn-warning" type="button" onclick="findPage()">ID/PW 찾기</button>
				</div>
				
				
			</div>
		</div>
	</div>
</body>
</html>