<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록 페이지</title>
</head>
<script type="text/javascript">

</script>
<body>
	<form method="post">
		<div>
			<label>영화명</label>
			<input type="text" name="title">
		</div>
		<div>
			<label>개봉일</label>
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<input type="date" name="openDate" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>">
		</div>
		<div>	<label>하트</label>
			<input type="number" name="heart">
		</div>
		<div>
			<label>상영시간</label>
			<input type="number" name="movieTime">
		</div>
		<button>등록</button>
	</form>
</body>
</html>