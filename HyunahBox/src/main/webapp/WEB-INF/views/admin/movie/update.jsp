<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 변경 페이지</title>
</head>

<body>
<div class="container">
	<div class="form-line">
		<h3 class="title">영화 변경 페이지</h3>
		
		<form id="movieUpdateform" action="<c:url value='/admin/movie/update/${item.movieCode}'/>" method="post">
		<div class="d-grid gap-2 col-6 mx-auto">
			<div class="form-group">
			<div class="bigBlock"></div>
			
				<div class="row mb-3 mx-auto">
					<label class="col-sm-2 col-form-label">영화코드</label>
					<div class="col-sm-9" >
						<input class="form-control" type="number" name="movieCode" value="${item.movieCode}" readonly="readonly">
					</div>
				</div>
				
				<div>
				<div class="row mb-3 mx-auto">
					<label class="col-sm-2 col-form-label">영화명</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" name="title" value="${item.title}">
					</div>
					</div>
				</div>
				
				<div>
				<div class="row mb-3 mx-auto">
					<label class="col-sm-2 col-form-label">개봉일</label>
					<div class="col-sm-9">
						<fmt:parseDate value="${item.openDate}" var="parsedDate" pattern="yyyyMMdd" />
						<input class="form-control" type="date" name="openDate" value="<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" />">
					</div>
				</div>
				</div>
				
				<div>
				<div class="row mb-3 mx-auto">
					<label class="col-sm-2 col-form-label">하트</label>
					<div class="col-sm-9">
						<input class="form-control" type="number" name="heartCnt" value="${item.heartCnt}" readonly="readonly">
					</div>
				</div>
				</div>
				
				<div>
				<div class="row mb-3 mx-auto">
					<label class="col-sm-2 col-form-label">상영시간</label>
					<div class="col-sm-9">
						<input class="form-control" type="number" name="movieTime" value="${item.movieTime}">
					</div>
				</div>
				</div>
				
				</div>
				
				<div class="smBlock"></div>
				<div class="d-grid gap-2 col-6 mx-auto">
					<button type="button" class="blank btn btn-secondary" onclick="postHtml('#movieUpdateform', '#adminContent');" >변경</button>
				</div>
			</div>
		</form>
	</div>
</div>	
</body>
</html>