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
		display : flex;
		justify-content : center;
	}
	.movie li {
		display : inline-block;
		text-aline : center;
		margin : 0px 20px;
		width : 250px;
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
					<div data-movieCode="${item.movieCode}" class="movieCode">${item.movieCode}</div>
					<div><img src="/box/resources/images/logo.png"></div>
					<div class="title">${item.title}</div>
					<div>개봉일 <fmt:formatDate value="${item.openDate}" pattern="yyyy.MM.dd" /></div>
					
					<c:if test="${sessionScope.member != null}">
						<div>${item.id}</div>
					</c:if>
					
					<div><button type="button" class="clickBooking btn btn-outline-primary mx-2">예매</button></div>
						
					
					<div>
						<c:choose>
							<c:when test="${sessionScope.member != null && item.id != null}">
								<button type="button" data-heart="${item.movieCode}" id="heart${item.movieCode}" class="clickHeart btn btn-outline-danger mx-2"> ♥ </button>
							</c:when>
							<c:otherwise>
								<button type="button" data-heart="${item.movieCode}" id="heart${item.movieCode}" class="clickHeart btn btn-outline-danger mx-2"> ♡ </button>
							</c:otherwise>
						</c:choose>
						
					</div>
				</li>
				
			</c:forEach>
		</div>
		
	</div>
</body>

<script type="text/javascript">
	$(".clickBooking").click(function(){
		const movieCode = parseInt($(this).parent().siblings(".movieCode").text());
		
		console.log(movieCode);
		
		
		//location.href = "/box/booking/";
		
	});
	
	
	$(".clickHeart").click(function(){
		const member = "${sessionScope.member}";
		const movieCode = parseInt($(this).parent().siblings(".movieCode").text());
		if(${sessionScope.member == null}){
			if(confirm("하트는 로그인 후에 사용하실 수 있습니다.\n로그인 하시겠습니까?")){
				location.href = "/box/login";				
			}
		}else{
		
			$.ajax({
				type: "Post",
				url: location.href + movieCode + "/" + "${sessionScope.member.getId()}",
				contentType: "application/json",
				datatype: JSON,
				data: JSON.stringify,
				async: true,

				success: function (data) {
					const id = "${sessionScope.member.getId()}";
					if(data == "PLUS"){
						plusHeartMovie(id, movieCode);
					}else if (data == "MINUS"){
						minusHeartMovie(id, movieCode);
					}else {
						alert("이상한 경우");
					}
					
				}
			});
		}
	});
	
	// TODO 누르면 emptyHeart 없어지고, fullHeart로 바뀔 수 있게
	function plusHeartMovie(id, movieCode){
		$.ajax({
			type: "Post",
			url: location.href + "PLUS" + "/" + movieCode + "/" + "${sessionScope.member.getId()}",
			contentType: "application/json",
			datatype: JSON,
			data: JSON.stringify,
			async: true,
			success: function (data) { 	// 색칠된 하트
				
				let fullHeart = "<button type='button' data-heart='";
					fullHeart += movieCode;
					fullHeart += "' id='heart";
					fullHeart += movieCode;
					fullHeart += "' class='clickHeart btn btn-outline-danger mx-2'> ♥ </button>"
						 
				const heartCode = "#heart"+movieCode;

				console.log("fullHeart --> " +$(heartCode).data("heart"));
				
				$(heartCode).parent().append( $(fullHeart) );
				

			}
		})
	}
	
	function minusHeartMovie(id, movieCode){
		$.ajax({
			type: "Post",
			url: location.href + "MINUS" + "/" + movieCode + "/" + "${sessionScope.member.getId()}",
			contentType: "application/json",
			datatype: JSON,
			data: JSON.stringify,
			async: true,
			success: function (data) { 	// 빈 하트

				let emptyHeart = "<button type='button' data-heart='";
					emptyHeart += movieCode;
					emptyHeart += "' id='heart";
					emptyHeart += movieCode;
					emptyHeart += "' class='clickHeart btn btn-outline-danger mx-2'> ♡ </button>"	
		
				const heartCode = "#heart"+movieCode;

				console.log("emptyHeart --> " +$(heartCode).data("heart"));
				
				$(heartCode).parent().append( $(emptyHeart) );
			}
		})
	}
	
</script>
</html>