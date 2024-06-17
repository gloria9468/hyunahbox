<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 변경 페이지</title>
</head>
<body>
<div class="container">
		<div class="form-line">
			<h3 class="title">극장 변경 페이지</h3>

			<form id="theaterUpdateform" action="<c:url value='/admin/theater/update/${item.theaterCode}'/>" method="post">
				<div class="d-grid gap-2 col-6 mx-auto">
					<div class="form-group">
						<div class="bigBlock"></div>


						<div class="row mb-3 mx-auto">
							<label class="col-sm-3 col-form-label">극장 코드</label>
							<div class="col-sm-8">
								<input class="form-control" type="number" name="theaterCode" value="${item.theaterCode}" readonly="readonly">
							</div>
						</div>

						<div class="row mb-3 mx-auto">
							<label class="col-sm-3 col-form-label">극장 명</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" name="theater" value="${item.theater}">
							</div>
						</div>
						<div class="smBlock"></div>
						<div class="d-grid gap-2 col-6 mx-auto">
							<button type="button" class="blank btn btn-secondary" onclick="postHtml('#theaterUpdateform', '#adminContent');" >변경</button>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>