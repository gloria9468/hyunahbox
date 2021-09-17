<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 변경 페이지</title>
</head>
<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<script>


</script>
<body>
	<form method="post">
		<div>
			<label>영화코드</label>
			<input type="number" name="movieCode" value="${item.movieCode}" readonly="readonly">
		</div>
		<div>
			<label>영화명</label>
			<input type="text" name="title" value="${item.title}">
		</div>
		<div>
			<label>개봉일</label>
			<input type="date" name="openDate" value="<fmt:formatDate value="${item.openDate}" pattern="yyyy-MM-dd"/>">
		</div>
		<div>
			<label>하트</label>
			<input type="number" name="heart" value="${item.heart}">
		</div>
		<div>
			<label>상영시간</label>
			<input type="number" name="movieTime" value="${item.movieTime}">
		</div>
		<button>변경</button>
	</form>
</body>
</html>