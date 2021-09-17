<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>스케쥴 등록 페이지</title>
</head>
<script src="/box/resources/JS/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript">

	function selectMovie(){
		var movieCode = $('#selectedMovie option:selected').val();
		document.getElementById("movieCode").value = movieCode;
	}
	
	
	function selectTheater() {
		//선택한 상영관 코드
		var theaterCode = $('#selectedTheater option:selected').val();
		document.getElementById("theaterCode").value = theaterCode;
		
		$.ajax({
			type: "POST",
			url: location.href + "/" + theaterCode +"/screenList",
			data: theaterCode,
			datatype: JSON,
			async: true,

			success: function (data) {
				if (data != "") { // TODO 극장이 바뀌면 일단 스크린 option 값 들을 없애고 새로 넣음
					let reset = "<option selected='selected' disabled='disabled'>상영관을 선택해주세요</option>";
					$("#selectedScreen").html($(reset));
					
					data.forEach(element => {
						let html = "<option id='sCode' value="${";
						html +=	element;
						html += "}">";
						html += element;
						html += "</option>";
						

						console.log(html);
						$("#selectedScreen").append($(html));
					});

				} else { // 상영관 자체가 없음.
					alert("상영관 정보가 없습니다");
				}
			}
		})
	};
	
	
	

	function selectScreen(){ // 극장에 따른 상영관을 고르면. 그에 따른 타임 테이블.
		var screenCode = $('#selectedScreen option:selected').val();
		document.getElementById("screenCode").value = screenCode;
		alert(screenCode);
	}


	function selectTime(){
		var time = document.querySelector('input[type="datetime-local"]').value;
		console.log(time);
	}


	
</script>

<body>
	<form name="scheduleForm" method="post">
		<div>
			<label>스케쥴 코드</label>
			<input type="text" name="scheduleCode">
		</div>
		<div>
			<label>영화 명</label>
			<input type="hidden" name="movieCode" id="movieCode">
			<select id="selectedMovie" onchange="selectMovie()">
				<option selected="selected" disabled="disabled">영화를 선택해주세요</option>
				<c:forEach var="movieList" items="${movieList}">
					<option value="${movieList.movieCode}">${movieList.title}</option>
				</c:forEach>
			</select>

		</div>

		<div>
			<label>극장 명</label>
			<input type="hidden" name="theaterCode" id="theaterCode">
			<select id="selectedTheater" onchange="selectTheater()">
				<option selected="selected" disabled="disabled">극장을 선택해주세요</option>

				<c:forEach var="theaterList" items="${theaterList}">
					<option value="${theaterList.theaterCode}" id="theaterCode">${theaterList.theater}
					</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label>상영관</label>
			<input type="hidden" name="screenCode" id="screenCode">
			<select id="selectedScreen" onchange="selectScreen()">
				<option selected="selected" disabled="disabled">상영관을 선택해주세요</option>

			</select>

		</div>

		<div>
			<label>상영시간</label>
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<input type="datetime" name="screenTime" onchange="selectTime()" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm"/>">
			
		</div>
		<button>등록</button>
	</form>
</body>

</html>