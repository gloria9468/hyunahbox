<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 정보 리스트</title>
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
					<th>상영관 코드</th>
					<th>몇 상영관</th>
					<th>총 좌석 수</th>
					<th>행 수</th>
					<th>열 수</th>
					<th>관리</th>
				</tr>
			</thead>
			
		
			<tbody>
				
				<c:if test="${screenInfoList.size() < 1}">
					<tr>
						<td colspan="7">등록된 상영관이 없다.</td>
					</tr>
				</c:if>
				<c:forEach var="screenInfoList" items="${screenInfoList}">
				<c:set var="theaterCode" value="${screenInfoList.theaterCode}"></c:set>
					<tr>
						<td>${screenInfoList.theaterCode}</td>
						<td>${screenInfoList.screenCode}</td>
						<td>${screenInfoList.screenNum}  상영관</td>
						<td>${screenInfoList.sitTotal}</td>
						<td>${screenInfoList.sitRow}</td>
						<td>${screenInfoList.sitCol}</td>
						<td><a href="${screenInfoList.screenCode}/addTime">시간표 등록</a>
						<a href="update/${screenInfoList.screenCode}">상영관 변경</a>
						<a href="delete/${screenInfoList.screenCode}">상영관 삭제</a></td>
					</tr>	
				</c:forEach>
				
			</tbody>
		</table>
		<a href="add">상영관 등록</a>
		
	</div>
</body>
</html>