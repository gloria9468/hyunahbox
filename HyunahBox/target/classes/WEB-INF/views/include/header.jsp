<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>


<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">


 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>



<link href="/box/resources/css/otherMain.css" rel="stylesheet">
<script src="/box/resources/JS/sweetalert.min.js"></script>
<script>

	
	$(function(){
		$('.movie_navi').hide();
		$('.movie').hover(function(){
			$('.movie_navi').show();
		});
	});
</script>







	<div class="topBlock">
		<div class="member">
			<div class="member1">
				<a href="viplounge">VIP LOUNGE</a>
				<a href="membership">멤버십</a>
				<a href="cs">고객센터</a>
			</div>
			<div class="member2">
				<c:if test="${sessionScope.member != null }">
					<a href="/box/member/mypage">마이페이지</a>
					<a href="/box/logout">로그아웃</a>
				</c:if>
				<c:if test="${sessionScope.member == null }">
					<a href="/box/login/">로그인</a>
					<a href="/box/signup/">회원가입</a>
				</c:if>
				
				<a href="/box/booking/">빠른예매</a>
				<c:if test="${sessionScope.member.getId() == 'admin' && sessionScope.member.getName() == '관리자' }">
					<a href="/box/admin/admin-main/">관리자</a>
				</c:if>
			</div>
		</div>
		<nav class ="navi">
			<ul class="endLine">
				<li class ="fstNavi"><a href="/box/movie/">영화</a>
					<ul>
						<li id="hov"><a href ="/box/movie/list/">전체 영화</a></li>
					</ul>
				</li>
				<li class="fstNavi"><a href="/box/booking/">예매</a></li>
				<li class="fstNavi"><a href="/box/theater/">극장</a></li>
				<li><a href="/box/"><img src="/box/resources/images/logo.png" height="60px" width="60px"></a></li>
				<li class="fstNavi"><a href="/box/event/">이벤트</a></li>
				<li class="fstNavi"><a href="/box/store/">스토어</a></li>
				<li class="fstNavi"><a href="/box/benefit/">혜택</a></li>
			</ul>
		</nav>
		
		
</div>	
<div class="secNavi">
	<div id="miniNavi"></div>
</div>	
		