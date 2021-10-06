<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관별 시간표 리스트</title>
<jsp:include page="../../include/header.jsp" />
<link href="/box/resources/css/form.css" rel="stylesheet">
</head>
<body>


<div class="container">
	<div>
		<h3 class="title">상영관별 시간표 리스트</h3>
	</div>
	<div class="smBlock"></div>
	<table border="1" class="text-center table table-sm table-light table-secondary table-hover">
		<thead>
			<tr>
				<th>타임테이블 코드</th>
				<th>타임테이블 시간</th>
				<th>영화 명</th>
				<th>상영 종료 시간</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="timeTable" items="${timeTable}">
		<tr>
			<td>${timeTable.timeTableCode}</td>
			<td><fmt:formatDate value="${timeTable.timeTableDate}" pattern="yyyy-MM-dd HH:mm" /></td>
			<td>${timeTable.title}</td>
			<td><fmt:formatDate value="${timeTable.endTime}" pattern="yyyy-MM-dd HH:mm" /></td>
		</tr>

	</c:forEach>

	</tbody>
	</table>
</div>
</body>
</html>