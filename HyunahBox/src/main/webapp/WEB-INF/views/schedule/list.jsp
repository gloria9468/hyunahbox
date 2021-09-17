<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케쥴 리스트</title>
</head>
<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<script>

	
</script>
<body>
	<div>
		<table border="1">
			<thead>
			
				<tr>
					<th>스케줄 코드</th>
					<th>영화 명</th>
					<th>극장 명</th>
					<th>몇 상영관</th>
					<th>시간표</th>
					<th>종료 시간</th>
					<th>관리</th>
				</tr>
			</thead>
			
		
			<tbody>
				
				<c:if test="${scheduleList.size() < 1}">
					<tr>
						<td colspan="7">등록된 영화가 없다.</td>
					</tr>
				</c:if>
				<c:forEach var="scheduleList" items="${scheduleList}">
					<tr>
						<td>${scheduleList.scheduleCode}</td>
						<td>${scheduleList.title}</td>
						<td>${scheduleList.theater}</td>
						<td>${scheduleList.screenNum}  상영관</td>
						<td><fmt:formatDate value="${scheduleList.timeTable}" pattern="yyyy년 MM월 dd일 HH:mm"/></td>
					 	<td><fmt:formatDate value="${scheduleList.endTime}" pattern="yyyy년 MM월 dd일 HH:mm"/></td>							
						<td><a href="update/${scheduleList.scheduleCode}">변경</a><a href="delete/${scheduleList.scheduleCode}">삭제</a></td>
					</tr>	
				</c:forEach>
				
			</tbody>
		</table>
		<a href="add">스케쥴 등록</a>
		
	</div>
</body>
</html>