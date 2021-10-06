<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>♥현아박스에 오신 걸 환영합니다^^♥</title>
<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<script src="/box/resources/JS/indigo.min.js"></script>
<link href="/box/resources/css/main.css" rel="stylesheet">


<script>
	var result = '${msg}';
	if(result == "withdraw_success"){
		alert("탈퇴되셨습니다!");
	}
	
	$(function(){
			$('.movie_navi').hide();
			$(".movie").hover(function(){
				$('.movie_navi').show();
			});
	});
</script>

</head>
<body>

<div class="background">
	<div class="topbackground">
		<div class="member">
			<div class="member1">
				<a href="viplounge">VIP LOUNGE</a>
				<a href="membership">멤버십</a>
				<a href="cs">고객센터</a>
			</div>
			<div class="member2">
				<c:if test="${sessionScope.member != null }">
					<a href="/box/member/mypage/">마이페이지</a>
					<a href="logout">로그아웃</a>
				</c:if>
				<c:if test="${sessionScope.member == null }">
					<a href="login">로그인</a>
					<a href="signup">회원가입</a>
				</c:if>
				
				<a href="quick_booking">빠른예매</a>
				<c:if test="${sessionScope.member.getId() == 'admin' && sessionScope.member.getName() == '관리자' }">
					<a href="/box/admin/admin-main/">관리자</a>
				</c:if>
			</div>
		</div>
		<nav class ="navi">
			<ul>
				<li class ="movie"><a href="/box/movie/">영화</a></li>
				<li class="schedule"><a href="/box/schedule/">예매</a></li>
				<li class="theater"><a href="/box/theater/">극장</a></li>
				<li><a href="/box/"><img src="/box/resources/images/logo1.png"></a></li>
				<li class="event"><a href="/box/event/">이벤트</a></li>
				<li class="store"><a href="/box/store/">스토어</a></li>
				<li class="benefit"><a href="/box/benefit/">혜택</a></li>
			</ul>
			<div class="movie_navi">
				<a href ="movie/list">전체 영화</a>
			</div>
		</nav>
		
		
		
		<div>
			<div class="boxoffice">
				<h4>박스오피스</h4>
				<a href="movie">더 많은 영화보기 +</a>
			</div>
			
			<div class="rank">
				<div>1위</div><div>2위</div><div>3위</div><div>4위</div>
			</div>

			<form class="search">
				<input type="text" onfocus="this.value='';" value="영화제목을 입력하세요">
				<input type="text" onfocus="this.value='';" value="상영시간표">
				<input type="text" onfocus="this.value='';" value="박스오피스">
				<input type="text" onfocus="this.value='';" value="빠른예매">
			</form>

			

		</div>

	</div>
	<div class="midbackground">
		<h1>밑 부분</h1>
	</div>
	</div>
</body>
</html>