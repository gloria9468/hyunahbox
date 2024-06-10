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
<style>
	
</style>
<body>
	<div class="container">
		<div class="filter">
			<div class="list_cnt_div">총 <c:out value="${list.size()}"/> 건</div>
			<div class="search_filter_div">
				<p class="active">예매 가능작</p>
			</div>
		</div>
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
						<td><fmt:parseDate value="${item.openDate}" var="parsedDate" pattern="yyyyMMdd" />
							<fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일" />
						</td>
						<td>${item.movieTime} 분</td>
						<td>♡ ${item.heartCnt} ♥</td>
						<td><a onclick="setHtml('<c:url value="/admin/movie/update/${item.movieCode}"/>', '#adminContent');" class="btn btn-sm btn-outline-secondary mx-1">변경</a>
						<a onclick="setHtml('<c:url value="/admin/movie/delete/${item.movieCode}"/>', '#adminContent');" class="btn btn-sm btn-outline-danger mx-1">삭제</a></td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</body>
</html>