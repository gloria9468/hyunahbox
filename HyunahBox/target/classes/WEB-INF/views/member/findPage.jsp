<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾기 페이지</title>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/box/resources/css/form.css" rel="stylesheet">

<style type="text/css">
	.cardP{
		text-align: center;
		
	}
	.card{
		display: inline-block;
		margin : 20px 30px;
	}
	.cardP img{
		height : 250px;
		width : 250px;
	}
	.cardP a{
		text-decoration: none;
		color: dimgray;
		font-size : 20px;
	}
	
</style>

<script type="text/javascript">
$(function(){
	//miniNavi 부분 넣음.
	const loc = location.href;
	let miniNavi = "<div>✔  >  <a href='/box/login/";
		miniNavi += "'>로그인</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>ID/PW찾기</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
	
});	

function findId(){
	location.href = '/box/member/findId';
}
function findPw(){
	location.href = '/box/member/findPw';
}
</script>

</head>
<body>
	
	
	
	<div class="smBlock"></div>
	<div class="cardP">
		<div class="card" style="width: 18rem;">
			<img src="/box/resources/images/id.png" class="card-img-top" >
			<div class="card-body"><button class="btn btn-outline-primary" onclick="findId()">아이디 찾기</button></div>
			
		</div>
		
		<div class="card" style="width: 18rem;">
		 	<img src="/box/resources/images/pw.png" class="card-img-top" >
			<div class="card-body"><button class="btn btn-outline-primary" onclick="findPw()">비밀번호 찾기</button></div>
		</div>
		
	</div>
	
</body>
</html>