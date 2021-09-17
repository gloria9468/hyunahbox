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
			<label>영화관 코드</label>
			<input type="number" name="theaterCode" value="${item.theaterCode}" readonly="readonly">
		</div>
		<div>
			<label>영화관 명</label>
			<input type="text" name="theater" value="${item.theater}">
		</div>
		<button>변경</button>
	</form>
</body>
</html>