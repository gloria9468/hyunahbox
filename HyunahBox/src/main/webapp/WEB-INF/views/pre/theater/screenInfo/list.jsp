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
<jsp:include page="../../include/header.jsp"></jsp:include>
<link href="/box/resources/css/form.css" rel="stylesheet">
<script>

</script>
<body>
	<div>
		<div class="container">
			<div>
				<h3 class="title">영화 리스트</h3>
			</div>
			<div class="smBlock"></div>
			<table
				class="text-center table table-sm table-light table-secondary table-hover"
				border="1">
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
							<td>${screenInfoList.screenNum}상영관</td>
							<td>${screenInfoList.sitTotal} 좌석</td>
							<td>${screenInfoList.sitRow}</td>
							<td>${screenInfoList.sitCol}</td>
							<td><a href="${screenInfoList.screenCode}/timeTable" class="btn btn-sm btn-outline-primary mx-1">시간표 리스트</a> 
								<a href="update/${screenInfoList.screenCode}" class="btn btn-sm btn-outline-secondary mx-1">상영관 변경</a> 
								<a href="delete/${screenInfoList.screenCode}" class="btn btn-sm btn-outline-danger mx-1">상영관 삭제</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div class="smBlock"></div>
		<div class="d-grid gap-2 col-6 mx-auto">
			<a href="add" class="btn btn-sm btn-outline-success">상영관 등록</a>
		</div>
		</div>
	</div>
</body>
</html>