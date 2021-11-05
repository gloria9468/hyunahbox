<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 극장</title>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/box/resources/css/form.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	//miniNavi 부분 넣음.
	const loc = location.href;
	const adminLoc = "/box/admin/admin-main/";
	
	let miniNavi = "<div>✔  >  <a href='";
		miniNavi += adminLoc;
		miniNavi += "'>관리자</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>극장 리스트</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
	
});	
</script>

<style>

</style>
<body>
	<div class="container">
		<div>
			<h3 class="title">극장 리스트</h3>
		</div>
		<div class="smBlock"></div>
		
		
		<table class="text-center table table-sm table-light table-secondary table-hover" border="1">
			<thead>
			
				<tr>
					<th>극장 코드</th>
					<th>극장</th>
					<th>관리</th>
					<th>극장 관리</th>
					<th>상영관 관리</th>
				</tr>
			</thead>
			
		
			<tbody>
				
				<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="5">등록된 극장이 없다.</td>
					</tr>
				</c:if>
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.theaterCode}</td>
						<td>${item.theater}</td>
						<td>-----</td>
						<td><a href="update/${item.theaterCode}" class="btn btn-sm btn-outline-secondary mx-2">극장 변경</a><a href="delete/${item.theaterCode}" class="btn btn-sm btn-outline-danger mx-2">극장 삭제</a></td>
						<td><a href="${item.theaterCode}/screenInfo/" class="btn btn-sm btn-outline-primary">상영관 관리</a></td>
					</tr>	
				</c:forEach>
				
			</tbody>
		</table>
		<div class="smBlock"></div>
		<div class="d-grid gap-2 col-6 mx-auto">
			<a href="add" class="btn btn-sm btn-outline-success">극장 등록</a>
		</div>
		
	</div>
</body>
</html>