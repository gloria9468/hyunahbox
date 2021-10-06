<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록 페이지</title>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/box/resources/css/form.css" rel="stylesheet">
<script type="text/javascript">

</script>

<body>
<div class="container">
		<div class="form-line">
			<h3 class="title">관리자 영화 등록 페이지</h3>
			<form method="post">
				<div class="d-grid gap-2 col-6 mx-auto">
					<div class="form-group">
						<div class="bigBlock"></div>

						<div class="row mb-3 mx-auto">
							<label class="col-sm-2 col-form-label mx-auto">영화명</label>

							<div class="col-sm-10">
								<input class="form-control" type="text" name="title">
							</div>
						</div>

						<div class="row mb-3 mx-auto">
							<label class="col-sm-2 col-form-label">개봉일</label>

							<div class="col-sm-10">
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<input class="form-control" type="date" name="openDate" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>">
							</div>

						</div>
						<div class="row mb-3 mx-auto">
							<label class="col-sm-2 col-form-label">하트</label>
							<div class="col-sm-10">
								<input class="form-control" type="number" name="heart">
							</div>
						</div>

						<div class="row mb-3 mx-auto">
							<label class="col-sm-2 col-form-label">상영시간</label>
							<div class="col-sm-10">
								<input class="form-control" type="number" name="movieTime">
							</div>
						</div>
						<div class="smBlock"></div>
						<div class="d-grid gap-2 col-6 mx-auto">
							<button class="blank btn btn-success" type="submit">등록</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>