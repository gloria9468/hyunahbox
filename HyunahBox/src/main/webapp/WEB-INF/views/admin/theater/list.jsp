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

<body>
	<div class="container">
		<div class="filter">
			<div class="list_cnt_div">총 <c:out value="${list.size()}"/> 건</div>
			<div class="search_filter_div">
				<input type="text" name="theaterName" value="" placeholder="극장명 검색"/>
				<p class="active" onclick="">검색</p>
				<select name="cntperpage">
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="30">30</option>
				</select>
			</div>
		</div>
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