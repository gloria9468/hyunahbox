<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${code}에러의 ${msg}</title>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/resources/css/form.css" rel="stylesheet">
</head>

<style type="text/css">
	.cardP{
		text-align: center;
		
	}
	.card{
		display: inline-block;
		margin : 20px 30px;
		
	}
	.cardP img{
		height : 300px;
		width : 300px;
	}
	
	
</style>


<body>
	
	
	<div class="smBlock"></div>
	<div class="cardP">
		<div class="card" style="width: 18rem;">
		<img src="/resources/images/error/${code}.png" class="card-img-top" >
			<div class="card-body">${code}에러입니다. <br/> ${msg}</div>
		</div>
	</div>

</body>
</html>