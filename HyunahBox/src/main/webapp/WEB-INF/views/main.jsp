<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>♥현아박스에 오신 걸 환영합니다^^♥</title>

<style>

	*{margin: 0; padding: 0; list-style: none;}
	.background{height : 100vh;}

	.topbackground{margin:0 auto; background-color: rgb(12, 13, 46); height: calc(100vh-700px); width: 100%;}
	.midbackground{margin:0 auto; background-color: paleturquoise; height: 700px ; width: 100%;}
	.member a{color: rgb(204, 204, 204);}
	.member a:hover{text-decoration: underline 2px white; text-underline-position: under;}
	.member1{display: inline-block;}
	.member1 a{text-decoration: none; padding:10px; padding-right: 5px; font-size: small;}
	.member2{display: inline-block;	float: right;}
	.member2 a{text-decoration: none; padding:10px; padding-left: 5px; font-size: small;}


	.boxoffice h4{
	    margin-top: 40px;
	}
	
	.navi .endLine {
		text-align: center;
		padding:0;
		
	}    

	.navi .endLine li {
		display: inline-block;
		padding: 20px 20px 0px 20px;
		align-items:center;
		
	}
		
	.navi .endLine .fstNavi a{
		line-height: 50px;
		font-size: x-large;
		color : white;
		text-decoration: none;
		text-align: center;
	}
	.navi .endLine .fstNavi a:hover{
		text-decoration: underline 2px white; 
		text-underline-position: under;
	}
	.navi .endLine .fstNavi ul {
		padding:0;
	}
	.navi .endLine .fstNavi ul li{
		display : none;
		position: absolute;
		margin : 0;
		padding : 0;
		width : 100%;
		background: rgb(0, 0, 160);
		left : 0px;
	    top : 135px;
	    height : 40px;
	    
	}
	.navi .endLine .fstNavi ul li a {
		color : white;
		font-size : 20px;
	}

	.navi .endLine .fstNavi:hover #hov{
		display : block;
	}


	.boxoffice{ text-align: center; color: white; padding-bottom:10px; margin:10px; }
	
	.boxoffice a{float: right; text-decoration: none; color: rgb(204, 204, 204); padding-bottom:5px; }
	.boxoffice a:hover{text-decoration: underline 2px white; text-underline-position: under;}

	.rank{text-align: center; margin:10px; padding-top: 20px;}
	.rank div{text-align: center; margin: 20px; padding: 0;  margin-right: 10px;  display: inline-block; vertical-align: -webkit-baseline-middle;}

	.rank div img{width:100%; height:100%};
	
	.search{padding : 50px; }
	.search div{
		text-align: center;	
	}
	.search .innerSearch{
		width : 110px;
	}
	.search .innerSearch_input{
		width : 110px;
		height : 38px;
		background-color: #6B66FF;
		color: white;
		border: 1px solid transparent;
		text-align : center;
		margin: 0px 8px;
		vertical-align: bottom;
		border-radius: .25rem;
	}
	
	
	.btn-default{
		background-color : #6B66FF;
		border-color: #6B66FF;
		color : white;
	}
	.btn-default:hover{
		background-color : #B5B2FF;
		border-color: #B5B2FF;
		color : white;
	}
	

	.movie {
		justify-content : center;
		text-align : center;
	}
	.movie li {
		display : inline-block;
		text-align : center;
		margin : 0px 20px;
		width : 250px;
	}	
	.movieCode{
		color: white;
	}
	.moviebtns{
		margin : 0px 20px 20px 20px;
	}
	.moviebtns div{
		display : inline-block;
	}	
	
	div li .title{
		text-align : center;
	}
	div li button{
		text-align : center;
	}
	


	

	.rank div img{width:220px; height:280px;};	
	
	@media all and (max-width:1024px){
		.rank div{text-align: center; margin: 20px; padding: 0;  margin-right: 10px;  display: inline-block;  vertical-align: -webkit-baseline-middle;}
	
		
	}
	

	form.search {
    	text-align: center;
	}
	
	
	
	

	.midbackground .innerMidbackground{
		display: flex;
		justify-content: center;
		align-items: center;
		height: 500px;
		position: relative;
		top: 50%;
		transform: translateY(-50%);
		font-size: 30px;
	}
	.midbackground .innerMidbackground img{
		width: 50px; 
		height: 50px;
	}
	
	
	
	#menu_list *{color:white;}
	#menu_list .topBlock, #miniNavi{background-color:rgb(12, 13, 46) !important;}
	.secNavi{height:35px !important; margin: -2px 0px;}
	
</style>
<script>
	var result = '${msg}';
	if(result == "withdraw_success"){
		alert("탈퇴되셨습니다!");
	}
	
	$(function(){
		var ajaxLoc = "/movie/"
		
			$('.movie_navi').hide();
			$(".movie").hover(function(){
				$('.movie_navi').show();
			});
			
			$(".clickBooking").click(function(){
				const movieCode = parseInt($(this).parent().parent().siblings(".movieCode").data("moviecode"));
				const movieName = $(this).parent().parent().siblings(".movieCode").text();

				sessionStorage.setItem("mCode", movieCode);
				sessionStorage.setItem("mName", movieName);
				
				location.href = "/booking/";
				
			});
			
			
			$(document).on("click", ".clickHeart", function(){ // 클릭하면 계속 해서 바뀌기 때문에. (document).on 으로 가야함.
				const member = "${sessionScope.member}";
				const memberId = "${sessionScope.member.getId()}";
				const movieCode = parseInt($(this).parent().parent().siblings(".movieCode").data("moviecode"));
				console.log(movieCode);
				
				const heartCnt = parseInt($(this).data("heartcnt"));

				if(member == null || member == ""){
						
						swal({
							  icon: "warning",
							  text: "하트는 로그인 후에 사용하실 수 있습니다.\n로그인 하시겠습니까?",
							  closeOnClickOutside: false,
							  closeOnEsc: false,
							  buttons: ["취소", "확인"],
						})
						.then((willDelete) => {
							  if (willDelete) {
								  location.href = "/login";
							  }
						});
						
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
	
	
	function searchMovie(){
		
		
	}
	
	function timetable(){
		location.href="/booking/";
	}
	function boxoffice(){
		location.href="/movie/";
	}
	function booking(){
		location.href="/booking/";
	}
</script>


</head>

<jsp:include page="./include/header.jsp"/>

<body>

<div class="background">
	<div class="topbackground">
		<div class="member">
			<div class="member1">
				<a href="/info/">소개말</a>
			</div>
			<div class="member2">
				<c:if test="${sessionScope.member != null }">
					<a href="<c:url value='/member/mypage/'/>">마이페이지</a>
					<a href="logout">로그아웃</a>
				</c:if>
				<c:if test="${sessionScope.member == null }">
					<a href="login">로그인</a>
					<a href="signup">회원가입</a>
				</c:if>
				
				<a href="<c:url value='/booking/'/>">빠른예매</a>
				<c:if test="${sessionScope.member.getId() == 'admin' && sessionScope.member.getName() == '관리자' }">
					<a href="<c:url value='/admin/admin-main/'/>">관리자</a>
				</c:if>
			</div>
		</div>
		
		<!-- 
		<nav class ="navi">
			<ul class="endLine">
				<li class ="fstNavi"><a href="<c:url value='/movie/'/>">영화</a>
					<ul>
						<li id="hov"><a href ="<c:url value='/movie/list/'/>">전체 영화</a></li>
					</ul>
				</li>
				<li class="fstNavi"><a href="<c:url value='/theater/'/>">극장</a></li>
				<li><a href="<c:url value='/'/>"><img src="<c:url value='/resources/images/logo.png'/>" height="60px" width="60px"></a></li>
				<li class="fstNavi"><a href="<c:url value='/booking/'/>">예매</a></li>
				<li class="fstNavi"><a href="<c:url value='/event/'/>">예정</a></li>
			</ul>
		</nav>
		-->
		
		
		
		<div>
			<div class="boxoffice">
				<h4>박스오피스</h4>
				<a href="<c:url value='/movie/'/>">더 많은 영화보기 +</a>
			</div>
			
			<div class="rank">
				
			<c:forEach var="item" items="${list}">
			<div class="movie">
				<ul>
					<li>
						<div><img src="${item.posterUrl}"></div>
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
				</ul>	
				
			</div>
		</c:forEach>
			</div>
			
			<div class="smBlock"></div>
			<div class="search">
				<div>
					<button onclick="searchMovie()" type="button" class="innerSearch btn btn-default mx-2">영화검색</button>
					<button onclick="timetable()" type="button" class="innerSearch btn btn-default mx-2">상영시간표</button>
					<button onclick="boxoffice()" type="button" class="innerSearch btn btn-default mx-2">박스오피스</button>
					<button onclick="booking()" type="button" class="innerSearch btn btn-default mx-2">빠른예매</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="midbackground">
		<div class = "innerMidbackground">
			<img src="<c:url value='/resources/images/ad.png'/>"><br/>광고문의 010 8602 8648
		</div>
	</div>
	</div>
</body>
</html>