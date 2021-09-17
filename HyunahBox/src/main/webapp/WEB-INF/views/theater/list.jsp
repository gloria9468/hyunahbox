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
<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<script>

</script>
<body>
	<div>
		<table border="1">
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
						<td><a href="update/${item.theaterCode}">영화관 변경</a><a href="delete/${item.theaterCode}">영화관 삭제</a></td>
						<td><a href="${item.theaterCode}/screenInfo/">상영관 관리</a></td>
					</tr>	
				</c:forEach>
				
			</tbody>
		</table>
		<a href="add">영화관 등록</a>
		
	</div>
</body>
</html>