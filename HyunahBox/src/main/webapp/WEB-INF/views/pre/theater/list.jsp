<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 영화관</title>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<link href="/box/resources/css/form.css" rel="stylesheet">
<script>

</script>

<style>

</style>
<body>
	<div class="container">
		<div>
			<h3 class="title">영화관 리스트</h3>
		</div>
		<div class="smBlock"></div>
		
		
		<table class="text-center table table-sm table-light table-secondary table-hover" border="1">
			<thead>
			
				<tr>
					<th>영화관 코드</th>
					<th>영화관</th>
					<th>관리</th>
					<th>영화관 관리</th>
					<th>상영관 관리</th>
				</tr>
			</thead>
			
		
			<tbody>
				
				<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="5">등록된 영화관이 없다.</td>
					</tr>
				</c:if>
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.theaterCode}</td>
						<td>${item.theater}</td>
						<td>-----</td>
						<td><a href="update/${item.theaterCode}" class="btn btn-sm btn-outline-secondary mx-2">영화관 변경</a><a href="delete/${item.theaterCode}" class="btn btn-sm btn-outline-danger mx-2">영화관 삭제</a></td>
						<td><a href="${item.theaterCode}/screenInfo/" class="btn btn-sm btn-outline-primary">상영관 관리</a></td>
					</tr>	
				</c:forEach>
				
			</tbody>
		</table>
		<div class="smBlock"></div>
		<div class="d-grid gap-2 col-6 mx-auto">
			<a href="add" class="btn btn-sm btn-outline-success">영화관 등록</a>
		</div>
		
	</div>
</body>
</html>