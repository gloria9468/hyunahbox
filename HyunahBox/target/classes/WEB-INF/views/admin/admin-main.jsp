<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
	let miniNavi = "<div>✔  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>관리자</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>관리자</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
	
});	
</script>

</head>


<body>
	<div class="smBlock"></div>
	<div class="cardP">
		<div class="card" style="width: 18rem;">
		 <a href="../movie/"><img src="/box/resources/images/movie.png" class="card-img-top" >
			<div class="card-body">영화</div>
		</a>
		</div>
		
		<div class="card" style="width: 18rem;">
		 
		 <a href="../theater/"><img src="/box/resources/images/theater.png" class="card-img-top" >
			<div class="card-body">극장</div>
		</a>
		</div>
		<div class="card" style="width: 18rem;">
		 <a href="../schedule/"><img src="/box/resources/images/schedule.png" class="card-img-top" >
			<div class="card-body">예매(스케쥴)</div>
		</a>
		</div>
	</div>
</body>
</html>