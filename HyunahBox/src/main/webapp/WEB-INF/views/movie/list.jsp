<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 영화</title>

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
<jsp:include page="../include/header.jsp"></jsp:include>
<link href="/box/resources/css/form.css" rel="stylesheet">


<body>
	<div class="container">
		<div>
			<h3 class="title">전체 영화 리스트</h3>
		</div>
		<div class="smBlock"></div>
		
		<div class="movie">
			<c:forEach var="item" items="${list}">
				
				<li>
					<div><img src="/box/resources/images/bear.png"></div>
					<div class="movieCode" data-moviecode="${item.movieCode}">${item.title}</div>
					<div>개봉일 <fmt:formatDate value="${item.openDate}" pattern="yyyy.MM.dd" /></div>
					
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
				
			</c:forEach>
		</div>
		
	</div>
</body>

<script type="text/javascript">
$(function(){
	//miniNavi 부분 넣음.
	const loc = location.href;
	let miniNavi = "<div>✔  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>영화</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>전체 영화</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
	
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
				url: location.href + movieCode + "/" + memberId,
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
			url: location.href + "PLUS" + "/" + movieCode + "/" + "${sessionScope.member.getId()}",
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
			url: location.href + "MINUS" + "/" + movieCode + "/" + "${sessionScope.member.getId()}",
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
	
</script>
</html>