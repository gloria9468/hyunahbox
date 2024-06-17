<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 등록 페이지</title>
</head>
<body>
	<div class="container">

		<div class="form-line">
			<h3 class="title">극장 등록 페이지</h3>
			<div>
				<form id="theaterAddform" action="<c:url value='/admin/theater/add'/>" method="post">
					<div class="d-grid gap-2 col-6 mx-auto">
						<div class="form-group">
							<div class="bigBlock"></div>
							<div class="row mb-3 mx-auto">
								<label class="col-sm-2 col-form-label mx-auto">극장</label>
								<div class="col-sm-10">
								<input class="form-control" type="text" name="theater">
								</div>
							</div>
						</div>
					</div>

					<div class="smBlock"></div>
						<div class="d-grid gap-2 col-3 mx-auto">
							<button class="blank btn btn-success" type="button" onclick="postHtml('#theaterAddform', '#adminContent');">등록</button>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>