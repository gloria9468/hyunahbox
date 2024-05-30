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
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/resources/css/form.css" rel="stylesheet">
<script>
$(function(){
	//miniNavi 부분 넣음.
	const adminLoc = "/admin/admin-main/";
	const loc = location.href;
	
	
	let miniNavi = "<div>✔  >  <a href='";
		miniNavi += adminLoc;
		miniNavi += "'>관리자</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>스케쥴 리스트</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
	
});	
	
</script>
<body>
<div class="container">
		<div>
			<h3 class="title">스케쥴 리스트</h3>
		</div>
		<div class="smBlock"></div>
		<table class="text-center table table-sm table-light table-secondary table-hover" border="1">
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
						<td><fmt:formatDate value="${scheduleList.timeTableDate}" pattern="yyyy년 MM월 dd일 HH:mm"/></td>
					 	<td><fmt:formatDate value="${scheduleList.endTime}" pattern="yyyy년 MM월 dd일 HH:mm"/></td>							
						<td><a href="./update/${scheduleList.scheduleCode}" class="btn btn-sm btn-outline-secondary mx-1">변경</a>
							<a href="./delete/${scheduleList.scheduleCode}" class="btn btn-sm btn-outline-danger mx-1">삭제</a></td>
					</tr>	
				</c:forEach>
				
			</tbody>
		</table>
		<div class="smBlock"></div>
		<div class="d-grid gap-2 col-6 mx-auto">
			<a href="add" class="btn btn-sm btn-outline-success">스케쥴 등록</a>
		</div>
		
		
	</div>
</body>
</html>