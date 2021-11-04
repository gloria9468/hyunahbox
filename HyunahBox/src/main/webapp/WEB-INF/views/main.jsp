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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="/box/resources/css/main.css" rel="stylesheet">
<link href="/box/resources/css/form.css" rel="stylesheet">


<script>
	var result = '${msg}';
	if(result == "withdraw_success"){
		alert("탈퇴되셨습니다!");
	}
	
	$(function(){
		var ajaxLoc = "/box/movie/"
		$(".movieCode").hide();
		
			$('.movie_navi').hide();
			$(".movie").hover(function(){
				$('.movie_navi').show();
			});
			
			$(".clickBooking").click(function(){
				const movieCode = parseInt($(this).parent().parent().siblings(".movieCode").data("moviecode"));
				const movieName = $(this).parent().parent().siblings(".movieCode").text();

				sessionStorage.setItem("mCode", movieCode);
				sessionStorage.setItem("mName", movieName);
				
				location.href = "/box/booking/";
				
			});
			
			
			$(document).on("click", ".clickHeart", function(){ // 클릭하면 계속 해서 바뀌기 때문에. (document).on 으로 가야함.
				const member = "${sessionScope.member}";
				const memberId = "${sessionScope.member.getId()}";
				const movieCode = parseInt($(this).parent().parent().siblings(".movieCode").data("moviecode"));
				console.log(movieCode);
				
				const heartCnt = parseInt($(this).data("heartcnt"));

				if(member == null || member == ""){
					if(confirm("하트는 로그인 후에 사용하실 수 있습니다.\n로그인 하시겠습니까?")){
						location.href = "/box/login";				
					}
				}else{
				
					$.ajax({
						type: "Post",
						url: ajaxLoc + movieCode + "/" + memberId,
						contentType: "application/json",
						datatype: JSON,
						data: JSON.stringify,
						async: true,

						success: function (data) {
							if(data == "PLUS"){
								plusHeartMovie(memberId, movieCode, heartCnt);
													
							}else if (data == "MINUS"){
								minusHeartMovie(memberId, movieCode, heartCnt);
														
							}else {
								alert("이상한 경우");
							}
							
						}
					});
				}
			});

			
			
			function plusHeartMovie(memberId, movieCode, heartCnt){
				$.ajax({
					type: "Post",
					url: ajaxLoc + "PLUS" + "/" + movieCode + "/" + "${sessionScope.member.getId()}",
					contentType: "application/json",
					datatype: JSON,
					data: JSON.stringify,
					async: true,
					success: function (data) { 	// 색칠된 하트
						const heartCode = "#heart"+movieCode;
						const heartCntPlus = heartCnt + 1;
						
						let fullHeart = "<button type='button' data-heartcnt='";
							fullHeart += heartCntPlus;
							fullHeart += "' class='clickHeart btn btn-danger mx-2'> ♥ ";
							fullHeart += heartCntPlus;
							fullHeart += "</button>";
						

						$(heartCode).html( $(fullHeart) );
					}
				})
			}
			
			function minusHeartMovie(memberId, movieCode, heartCnt){
				$.ajax({
					type: "Post",
					url: ajaxLoc + "MINUS" + "/" + movieCode + "/" + "${sessionScope.member.getId()}",
					contentType: "application/json",
					datatype: JSON,
					data: JSON.stringify,
					async: true,
					success: function (data) { 	// 빈 하트
						const heartCode = "#heart"+movieCode;
						const heartCntMinus = heartCnt - 1;
					
						let emptyHeart = "<button type='button' data-heartcnt='";
							emptyHeart += heartCntMinus;
							emptyHeart += "' class='clickHeart btn btn-outline-danger mx-2'> ♡ ";
							emptyHeart += heartCntMinus;
							emptyHeart += "</button>";
							
						$(heartCode).html( $(emptyHeart) );

					}
				})
			}
	});
</script>

<style type="text/css">
	.movie {
		justify-content : center;
		text-aline : center;
	}
	.movie li {
		display : inline-block;
		text-aline : center;
		margin : 0px 20px;
		width : 250px;
	}	
	.moviebtns{
		margin : 0px 20px 20px 20px;
	}
	.moviebtns div{
		display : inline-block;
	}	
	
	div li .title{
		text-aline : center;
	}
	div li button{
		text-aline : center;
	}
	
</style>

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
				
				<a href="booking/">빠른예매</a>
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
		
		
		
		<div>
			<div class="boxoffice">
				<h4>박스오피스</h4>
				<a href="movie/">더 많은 영화보기 +</a>
			</div>
			
			<div class="rank">
				<!-- <div><img src="/box/resources/poster/이터널스.jpg">1위</div><div><img src="/box/resources/poster/듄.jpg">2위</div><div><img src="/box/resources/poster/고장난 론.jpg">3위</div><div><img src="/box/resources/poster/그래비티.jpg">4위</div> -->
				
			<c:forEach var="item" items="${list}">
			<div class="movie">
					<li>
						<div><img src="/box/resources/images/bear.png"></div>
						<div class="movieCode" data-moviecode="${item.movieCode}">${item.title}</div>
						<div class="moviebtns">
							
							<div id="heart${item.movieCode}">
								<c:choose>
									<c:when test="${sessionScope.member != null && item.id != null}">
										<button type="button" id="full" data-heartcnt="${item.heartCnt}" class="clickHeart btn btn-danger mx-2"> ♥ ${item.heartCnt}</button>
									</c:when>
									<c:otherwise>
										<button type="button" id="empty" data-heartcnt="${item.heartCnt}" class="clickHeart btn btn-outline-danger mx-2"> ♡ ${item.heartCnt}</button>
									</c:otherwise>
								</c:choose>
							</div>
							<div><button type="button" class="clickBooking btn btn-outline-primary mx-2">예매</button></div>
						</div>
					</li>
					
				
			</div>
		</c:forEach>
			</div>
			
			<div class="smBlock"></div>
			<form class="search">
				<input type="text" onfocus="this.value='';" value="영화제목을 입력하세요">
				<input type="text" onfocus="this.value='';" value="상영시간표">
				<input type="text" onfocus="this.value='';" value="박스오피스">
				<input type="text" onfocus="this.value='';" value="빠른예매">
			</form>

			

		</div>

	</div>
	<div class="midbackground">
		<div class = "innerMidbackground">
			<img src="/box/resources/images/ad.png"><br/>광고문의 010 8602 8648
		</div>
	</div>
	</div>
</body>
</html>