<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 내역 페이지</title>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/resources/css/form.css" rel="stylesheet">


<script>

	
</script>
	
</head>
<body>
	<div class="container">
	<div class="innercontainer">
		
		<div>
			<h1 class="title">${sessionScope.member.getName()} 님의 예매리스트</h1>
		</div>
		<div class="smBlock"></div>
		<table class="text-center table table-sm table-light table-secondary table-hover" border="1">
			<thead>
			
				<tr>
					<th>아이디</th>
					<th>스케쥴코드</th>
					<th>영화명</th>
					<th>극장명</th>
					<th>상영관</th>
					<th>예매 좌석</th>
					<th>시작시간</th>
					<th>종료시간</th>
				</tr>
			</thead>
			
		
			<tbody>
				
				<c:if test="${list.size() < 0}">
					<tr>
						<td colspan="9">예매내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="item" items="${item}">
					<tr>
						<td>${item.id}</td>
						<td>${item.scheduleCode}</td>
						<td>${item.title}</td>
						<td>${item.theater}</td>
						<td>${item.screenNum}</td>
						<td>${item.sitsCode}</td>
						<td><fmt:formatDate value="${item.timeTableDate}" pattern="yyyy년 MM월 dd일 HH:mm"/></td>
					 	<td><fmt:formatDate value="${item.endTime}" pattern="yyyy년 MM월 dd일 HH:mm"/></td>							
					</tr>	
				</c:forEach>
				
			</tbody>
		</table>
		
		
			
			<div>
				<button type="button" class="btn btn-primary" onclick="이전버튼">이전</button>
			</div>
				
	
	</div>
</div>

</body>
</html>