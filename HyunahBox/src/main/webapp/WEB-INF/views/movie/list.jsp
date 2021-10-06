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
	div li img{
		width : 100%;
	}
	div li .title{
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
					<div class="movieCode">${item.movieCode}</div>
					<div><img src="/box/resources/images/logo1.png"></div>
					<div class="title">${item.title}</div>
					<div>개봉일 <fmt:formatDate value="${item.openDate}" pattern="yyyy.MM.dd" /></div>
					<button class="clickHeart btn btn-outline-danger">하트 ${item.heart}</button>
					<div>예메</div>
				</li>
				
			</c:forEach>
		</div>
		
	</div>
</body>

<script type="text/javascript">
	$(".clickHeart").click(function(){
		const movieCode = $(this).parent().children(".movieCode").text();
		if(${sessionScope.member == null}){
			if(confirm("하트는 로그인 후에 사용하실 수 있습니다.\n로그인 하시겠습니까?")){
				location.href = "/box/login";				
			}
		}else{
		
			$.ajax({
				type: "GET",
				url: location.href + movieCode + "/" + "${sessionScope.member.getId()}",
				contentType: "application/json",
				datatype: JSON,
				data: JSON.stringify,
				async: true,

				success: function (data) {
					console.log(data);
					console.log(movieCode);
				}
			});
		}
	})
</script>
</html>