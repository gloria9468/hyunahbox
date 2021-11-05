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
<link href="/resources/css/form.css" rel="stylesheet">
<script>
$(function(){
	//miniNavi 부분 넣음.
	const loc = location.href;
	let miniNavi = "<div>✔  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>극장</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>전체 극장</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
});
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
					<th>영화관</th>
				</tr>
			</thead>
			
		
			<tbody>
				
				<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="1">등록된 영화관이 없다.</td>
					</tr>
				</c:if>
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.theater}</td>
					</tr>	
				</c:forEach>
				
			</tbody>
		</table>
		<div class="smBlock"></div>
		
	</div>
</body>
</html>