<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 영화</title>
</head>
<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<script>

</script>
<body>
	<div>
		<table border="1">
			<thead>
			
				<tr>
					<th>영화코드</th>
					<th>영화명</th>
					<th>개봉일</th>
					<th>상영시간</th>
					<th>하트</th>
					<th>관리</th>
				</tr>
			</thead>
			
		
			<tbody>
				
				<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="6">등록된 영화가 없다.</td>
					</tr>
				</c:if>
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.movieCode}</td>
						<td>${item.title}</td>
						<td><fmt:formatDate value="${item.openDate}" pattern="yyyy년 MM월 dd일"/></td>
						<td>${item.movieTime}</td>
						<td>${item.heart}</td>
						<td><a href="update/${item.movieCode}">변경</a><a href="delete/${item.movieCode}">삭제</a></td>
					</tr>	
				</c:forEach>
				
			</tbody>
		</table>
		<a href="add">영화 등록</a>
		
	</div>
</body>
</html>