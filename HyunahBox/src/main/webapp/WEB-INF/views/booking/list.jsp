<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠른 예약</title>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/box/resources/css/form.css" rel="stylesheet">
<script>

	
</script>
<body>
<div class="container">
		<div>
			<h3 class="title">빠른 예약</h3>
		</div>
		<div class="smBlock"></div>
				
		<!-- 영화 선택 -->
		<div class="row mb-3 mx-auto">
			<label class="col-sm-3 col-form-label mx-auto">영화 명</label>
			<div class="col-sm-8">
			<input type="hidden" name="movieCode" id="movieCode">
			<select class="form-control form-select col-sm-8" size="5" aria-label="size 3 select example" id="selectedMovie" onchange="selectMovie()">
				<option selected="selected" disabled="disabled">영화를 선택해주세요</option>
				<c:forEach var="movieList" items="${movieList}">
					<option value="${movieList.movieCode}">${movieList.title}</option>
				</c:forEach>
			</select>
			</div>
		</div>
		<!-- //영화 선택 끝-->
		
		
		<!-- 극장 선택-->
		<div>
			<div class="row mb-3 mx-auto">
			<label class="col-sm-3 col-form-label mx-auto">극장 명</label>
			<div class="col-sm-8">
			<input type="hidden" name="theaterCode" id="theaterCode">
			<select class="form-select" size="4" aria-label="size 3 select example" id="selectedTheater" onchange="selectTheater()">
				<option selected="selected" disabled="disabled">극장을 선택해주세요</option>

				<c:forEach var="theaterList" items="${theaterList}">
					<option value="${theaterList.theaterCode}" id="theaterCode">${theaterList.theater}
					</option>
				</c:forEach>
			</select>
			</div>
		</div>
		</div>
		<!-- //극장 선택 끝-->
		
		

		<div class="smBlock"></div>
	</div>
</body>
</html>