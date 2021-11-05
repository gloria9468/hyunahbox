<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>스케쥴 등록 페이지</title>
	
<style>
	
	#timeList{
		border : 1px solid black;
	}
	
	.hide{
    display:none;
	}
	
</style>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/resources/css/form.css" rel="stylesheet">
<script>
$(function(){
	//miniNavi 부분 넣음.
	const adminLoc = "/admin/admin-main/";
	const loc = location.href;
	
	
	let miniNavi = "<div>✔  >  <a href='";
		miniNavi += adminLoc;
		miniNavi += "'>관리자</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>스케쥴 등록</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
	
});	

$(function(){
	
	toggleScreen(0);
	
	var date = document.getElementById("date").value;
	var time = document.getElementById("time").value;
	var timeTableDate = document.getElementById("timeTableDate").value;
	var dateAndTime = date + " " + time;
	
	console.log(dateAndTime);
	
	DateAndTime(dateAndTime);


	$("#date").on("change", function(){
		date = document.getElementById("date").value;
		dateAndTime = date + " " + time;
		DateAndTime(dateAndTime);
	});
	

	$("#time").on("change", function(){
		time = document.getElementById("time").value;
		dateAndTime = date + " " + time;
		DateAndTime(dateAndTime);
	});
});

	
	function DateAndTime(dateAndTime){
		document.getElementById("timeTableDate").value = dateAndTime;
		console.log(dateAndTime);
	}

	function selectMovie(){
		var movieCode = $('#selectedMovie option:selected').val();
		document.getElementById("movieCode").value = movieCode;
	}
	
	
	function selectTheater() {
		//선택한 상영관 코드
		var theaterCode = $('#selectedTheater option:selected').val();
		document.getElementById("theaterCode").value = theaterCode;
		console.log(theaterCode);
		
		$.ajax({
			type: "post",
			url: location.href + "/" + theaterCode +"/screenList",
			contentType: "application/json",
			datatype: JSON,
			data: JSON.stringify({
				SCREEN_CODE : screenCode
			}),
			async: true,

			success: function (data) {
				const leng = data.list.length;
				if (data != "" && leng > 0) {
					toggleScreen(2);
					
					let reset = "<option selected='selected' disabled='disabled'>상영관을 선택해주세요</option>";
					$("#selectedScreen").html($(reset));
					
					for(let i=0; i<leng ; i++) {
						let screenCode = data.list[i].screenCode;
						let screenNum = data.list[i].screenNum;
						
						let html = "<option value=";
						html +=	screenCode;
						html += ">";
						html += screenNum;
						html += " 상영관 </option>";
						
						$("#selectedScreen").append($(html));
					};

				} else { // 상영관 자체가 없음.
					toggleScreen(0);
					alert("상영관 정보가 없습니다");
				}
			}
		})
	};
	


	
	function toggleScreen(mode){
		if(mode == 0){ // 극장 선택 안함 및 극장에 상영관이 없다
			$("#screenList").removeClass("row mb-3 mx-auto");
			$("#screenList").addClass("hide");
			$("#timeList").addClass("hide");
		} else if(mode == 1){ // 극장의 상영관 있고, 상영관을 골랐음
			$("#screenList").addClass("row mb-3 mx-auto");
			$("#screenList").removeClass("hide");
			
			$("#timeList").addClass("text-center table table-sm table-light table-secondary table-hover");
			$("#timeList").removeClass("hide");
		}else if(mode == 2){ // 극장을 바꿨다.
			$("#screenList").addClass("row mb-3 mx-auto");
			$("#screenList").removeClass("hide");
			$("#timeList").addClass("hide");
		}
	}
	
	
	
	
	

	function selectScreen(){ // 극장에 따른 상영관을 고르면. 그에 따른 타임 테이블.
		var screenCode = $('#selectedScreen option:selected').val();
		document.getElementById("screenCode").value = screenCode;
		

		$.ajax({
			type: "POST",
			url: location.href + "/" + screenCode + "/timeList",
			
			datatype: JSON,
			contentType: "application/json",
			data: JSON.stringify({
				SCREEN_CODE : screenCode
			}),
			async: true,
			success: function (data) {
				const leng = data.length;
				
				toggleScreen(1);
				
				let reset = "";
				$("#timeList").html($(reset));
				
				const thead = $("<thead>");
				const tr = $("<tr>");
				
				
				let htmlTime = "<th>시간</th>"
				let htmlTitle = "<th>영화 명</th>"
				let htmlEndTime = "<th>종료 시간</th>"
				$(thead).append( $(htmlTime) );
				$(thead).append( $(htmlTitle) );
				$(thead).append( $(htmlEndTime) );
				
				$("table").append( $(thead) );

				const tbody = $("<tbody>");
				for(let i=0; i<leng; i++){
					let timeTableDate = data[i].timeTableDate;
					let title = data[i].title;
					let endTime = data[i].endTime;
					
					let html = "<tr>";
						html += "<td>";
						html += timeTableDate;
						html += "</td>";
						html += "<td>"
						html += title;
						html += "</td>";
						html += "<td>";
						html += endTime;
						html += "</td>";
						html += "</tr>";
					$(tbody).append( $(html) );
				}
				$("table").append( $(tbody) );
			}
				
			
		});		
	}
	

	
	
</script>

<body>
<div class="container">
		<div class="form-line">
			<h3 class="title">스케쥴 등록 페이지</h3>

	<form name="scheduleForm" method="post">
		<div class="d-grid gap-2 col-6 mx-auto">
		<div class="form-group">
			<div class="bigBlock"></div>
			
		<div class="row mb-3 mx-auto">
			<label class="col-sm-3 col-form-label mx-auto">스케쥴 코드</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" name="scheduleCode">
			</div>
		</div>
		
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
		
		<div id="screenList">
			<label class="col-sm-3 col-form-label mx-auto">상영관</label>
			<div class="col-sm-8">
			<input type="hidden" name="screenCode" id="screenCode">
			<select class="form-select" size="4" aria-label="size 3 select example" id="selectedScreen" onchange="selectScreen()">
				<option selected="selected" disabled="disabled">상영관을 선택해주세요</option>

			</select>
			</div>
		</div>

		<div>
			<div class="row mb-3 mx-auto">
			<label class="col-sm-3 col-form-label mx-auto">상영 시간</label>
			<div class="col-sm-8">
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<input type="hidden" name="timeTableDate" id="timeTableDate">
			
			<input type="date" id="date" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>" >
			<input type="time" id="time" value="<fmt:formatDate value="${now}" pattern="HH:mm"/>" >
		</div>
		</div>
		</div>
		<div class="smBlock"></div>
		<div class="timeBorder">
			<table id="timeList">
			</table>
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