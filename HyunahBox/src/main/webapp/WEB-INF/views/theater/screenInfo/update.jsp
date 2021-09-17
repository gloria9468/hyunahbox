<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 변경 페이지</title>
</head>
<script type="text/javascript">

</script>
<body>
	<form method="post">
		
		<div>
			<label>상영관 코드</label>
			<input type="number" name="screenCode" value="${screen.screenCode}" readonly="readonly">
		</div>
		<div>
			<label>몇 상영관</label>
			<input type="number" name="screenNum" value="${screen.screenNum}">
		</div>
		<div>
			<label>총 좌석 수</label>
			<input type="number" name="sitTotal" value="${screen.sitTotal}">
		</div>
		<div>
			<label>좌석 행 수</label>
			<input type="text" name="sitRow" value="${screen.sitRow}">
		</div>
		<div>
			<label>좌석 열 수</label>
			<input type="number" name="sitCol" value="${screen.sitCol}">
		</div>
	
		
		<button>상영관 변경</button>
	</form>
</body>
</html>