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
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/resources/css/form.css" rel="stylesheet">

<script type="text/javascript">
$(function(){
	//miniNavi 부분 넣음.
	const loc = location.href;
	const adminLoc = "/admin/admin-main/";
	let miniNavi = "<div>✔  >  <a href='";
		miniNavi += adminLoc;
		miniNavi += "'>관리자</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>영화 리스트</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
	
});	
</script>
<body>
	<div class="container">
		<div>
			<h3 class="title">영화 리스트</h3>
		</div>
		<div class="smBlock"></div>
		<table class="text-center table table-sm table-light table-secondary table-hover" border="1">
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
						<td>${item.movieTime} 분</td>
						<td>♡ ${item.heartCnt} ♥</td>
						<td><a href="update/${item.movieCode}" class="btn btn-sm btn-outline-secondary mx-1">변경</a>
						<a href="delete/${item.movieCode}" class="btn btn-sm btn-outline-danger mx-1">삭제</a></td>
					</tr>	
				</c:forEach>
				
			</tbody>
		</table>
		
		<div class="smBlock"></div>
		<div class="d-grid gap-2 col-6 mx-auto">
			<a href="add" class="btn btn-sm btn-outline-success">영화 등록</a>
		</div>
		
	</div>
</body>
</html>