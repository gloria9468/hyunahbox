<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 등록 페이지</title>
</head>
<body>
	<div class="container">
		<form id="screenInfoAddForm" action="<c:url value='/admin/theater/${theaterCode}/screenInfo/add'/>" method="post">
			<div class="form-line">
				<h3 class="title">상영관 등록 페이지</h3>

				<div class="d-grid gap-2 col-6 mx-auto">
					<div class="form-group">


						<div class="row mb-3 mx-auto">
							<label class="col-sm-2 col-form-label mx-auto">몇 상영관</label>

							<div class="col-sm-10">
								<input class="form-control" type="number" name="screenNum">
							</div>
						</div>
						<div class="row mb-3 mx-auto">
							<label class="col-sm-2 col-form-label mx-auto">총 좌석수</label>

							<div class="col-sm-10">
								<input class="form-control" type="number" name="sitTotal">
							</div>
						</div>
						
						<div class="d-grid gap-2 col-6 mx-auto">
							<button class="blank btn btn-success" type="button" onclick="postHtml('#screenInfoAddForm', '#adminContent');">상영관 등록</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>