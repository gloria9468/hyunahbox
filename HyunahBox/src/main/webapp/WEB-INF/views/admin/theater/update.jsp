<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 변경 페이지</title>
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
		miniNavi += "'>극장 수정</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
	
});	
</script>
<body>
<div class="container">
		<div class="form-line">
			<h3 class="title">극장 변경 페이지</h3>

			<form method="post">
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
							<button type="submit" class="blank btn btn-secondary">변경</button>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>