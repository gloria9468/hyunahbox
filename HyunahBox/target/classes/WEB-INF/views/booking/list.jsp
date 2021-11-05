<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠른 예약</title>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link href="/resources/css/form.css" rel="stylesheet">




<style>
	

	/* 상단의 날짜 및 요일에 대한 스타일*/
	.dateList {
		width : 100%;
		height :50px;
		border : 1px solid red;	
		font-size : 20px;
		display: flex;
	    justify-content: center;
	    flex-direction: column;
	}
	.dateList ul{
		padding : 0;
		
	}
	.dateList ul li {
		display : inline-block;
		width : 12.5%;
		text-align : center;
	}
	.dateList ul #click_pn{
		height :50px;
		display: flex;
	    justify-content: center;
	    flex-direction: column;
		width:5%;
		float:left;
	}
	.dateList ul #click_pn:last-child{
		float:right;
	}
	
	
	/* oneBlock 안의 대한 스타일 */
	.oneBlock{
		width : 100%;
	}
	.oneBlock div{
		display : inline-block;
		text-align: center;
		width: -webkit-fill-available;
	}
	
	
	.oneBlock .oneBlockIn{
		border : 2px solid #BDBDBD;
		width : 30%;
		height : 500px;
		margin : 1%;
		vertical-align: top;
	}
	
	
	.oneBlock .oneBlockIn .pickTM{
		text-align: -webkit-left;
		border : 1px solid #EAEAEA;
		overflow : auto;
		width : 93%;
		height : 60%;
		margin : 3%;
	}
	.oneBlock .oneBlockIn .pickTM:last-child{
		text-align: -webkit-left;
		border : 1px solid #EAEAEA;
		overflow : auto;
		width : 93%;
		height : 90%;
		margin : 3%;
		display: flex;
  		align-items: center;
	}
	.oneBlock .oneBlockIn .pickTM ul{
		border : 1px solid #EAEAEA;
		padding:0;
		margin:0;
	}
	.oneBlock .oneBlockIn .pickTM ul li{
		width : 100%;
		border : 1px solid #EAEAEA;
	}
	.oneBlock .oneBlockIn .pickTM ul li on,
	.oneBlock .oneBlockIn .pickTM ul li:hover{
		color:#000;
    	background:#EEE;
	}
	.colorPick{ /* 선택된 행을 색칠 */
		color:#000;
    	background:#EEE;
	}
	
	
	
	

	#pickTMTime{
		display: none;
	}
	 .pickTMTime{
	 	height : 40px;
	 	width : 100%;
	 }
	 .pickTMTime div{
	 	padding : 0;
	  	border : 1px solid #EAEAEA;
	 	display: inline-block;
	 	width : auto;
	 }

	 .pickTMTime .time_div_div {
   		width: -webkit-fill-available;
	}

	 .pickTMTime .time_div_div .time_div{
	 	width : calc( 100% - 30px );
	 	overflow : scroll;  
	 	white-space: nowrap;
	 	
	 }
	 
	<%--
	.pickTMTime .time_div_div .time_div{
	    -ms-overflow-style: none; /* IE and Edge */
	    scrollbar-width: none; /* Firefox */
	}
	.pickTMTime .time_div_div .time_div::-webkit-scrollbar {
	    display: none; /* Chrome, Safari, Opera*/
	}
	--%>
	
	 .pickTMTime div ul{
	 	margin : 0;
	 	padding : 0;
	 }
	 .pickTMTime div ul li p{
	 	 display: inline-block;
	 	 border : 1px solid #EAEAEA;
	 	 margin : 0;
	 	 padding : 0 5px;
	 }
	 
	
	/* 시간표에 대한 스타일 */
	.oneBlock .oneBlockIn .pickTM:last-child .selectTimeTable{
		  margin: auto 0;
	}
	
	.selectTimeTable ul{
		padding : 0;
		margin:0;
	}
	.selectTimeTable ul li{
		border : 1px solid #EAEAEA;
	}
	.selectTimeTable ul li on,
	.selectTimeTable ul li:hover{
		color:#000;
    	background:#EEE;
	}
	
	.selectTimeTable ul li p {
	    display: inline-block;
	    padding-right: 10px;
	}
	
/* 	p.timeTableDate {
    	float: left;
	}
	p.endTime {
    	float: left;
	}
	p.theater {
	    float: right;
	}
	p.screenNum {
	    float: right;
	}*/
	
	p.emptySits{
		color: #B5B2FF;
		font-weight: 900;
	} 
	
	/* 극장이나 영화를 누르면 추가되는 픽박스에 대한 스타일 */
	.pick{
		width : 100%;
		text-align : center;
	}
	.pick div{
		width : 30%;	
		vertical-align : top;
		
	}
	.pick div div{
		width : 100%;
		display : inline-block;
		margin-top : 10px;
		border : 1px solid gray;
		font-weight: 900;
		font-size : 20px;
		height : 100px;
		text-align : center;
		
	}
	
	
	
	
	
	
	
	
	/* 시간표 누르면 나오는 알림 */ 
	.swal-overlay {
	    margin-top: 130px;
		height : calc(100vh - 130px);
		width : 100%;
		background-color: rgba(45, 45, 45, 0.9);
	}
	.swal-text{
		text-align : center;
	}
	
	.swal-button {
		padding: 7px 19px;
		border-radius: 2px;
		background-color: #4D00ED;
		font-size: 12px;
		border: 1px solid #2900C9;
		box-shadow:none;
	}
	
	.swal-button:focus{outline:none;box-shadow:none;}
	.swal-button--cancel:focus{box-shadow:none;}
	
	
	.swal-button--confirm:not([disabled]):hover{
		background-color : #1700B7;
	}
	
	.swal-footer {
    	text-align: center;
    }
    
	.swal-button--cancel{
		background-color : #EAEAEA;
		color : black;
		border: 1px solid #D8D8D8;
	}
	.swal-button--cancel:not([disabled]):hover{
		background-color : #A2A2A2;
	}
	
	
	.highlight{
		display: inline;
		box-shadow : 0 5px #8324FF;
		transition: all .5s;
	}
	
	
	
	
	/* 공통부분 - 상단의 선택한 상영시간표에 대한 부분 */
	.pickScheduleInfo{ 
	 	border: 1px solid black
	 }
	.pickScheduleInfo ul{
		margin : 0;
		text-align: center;
	}
	.pickScheduleInfo ul li{
		display: inline-block;
		margin-right: 10px;
    	padding: 10px;
	}
	.pre_next_stage_btn{
		text-align: center;
	}
	.pre_next_stage_btn button{
		margin: 10px;
	}
	
	
	/* 좌석 예매 부분 */
	.pickSits{
		height : calc(100vh - 170px);
		width : 100%;
		
		display: none;
	}
	.pickSits .container{
		height: calc(100vh - 170px);
	}
	.pickSits .container .title {
		text-align: center;
	}


	.pickSits .container .sitsList{
		display: flex;
		justify-content: center;
		align-items: center;
		height: 500px;
		position: relative;
		top: 50%;
		transform: translateY(-50%);
	}

	.pickSits .container .sitsList .innerSitsList{
		height : 70%;
		width: 100%;
		position: relative;
		left: 50%;
		transform: translateX(-50%);
	}
	

	.pickSits .container .sitsList .innerSitsList p{
		display: inline-block;
		border: 1px solid gray;
		padding-right: 5px;
		margin: 5px;
		text-align: center;
	}
	
	.colorPurple{
		background: #B5B2FF;
	}


	/* 결제 단계 부분 */
	.payment{
		height : calc(100vh - 170px);
		width : 100%;
		
		display: none;
	}
	.payment .innerPayment div h2{
		display: inline-block;
	}
	.payment #selectedSits{
		display: inline-block;
	    font-size: 20px;
	}


</style>


<script> 

// 상단의 날짜 관련 코드
var now = new Date();
var year = now.getFullYear();
var month = now.getMonth() + 1;    // 1월이 0으로 되기때문에 +1을 함
var date = now.getDate();
var day = now.getDay();
var hour = now.getHours();
var min = now.getMinutes();

// 가장 처음에는 -> 일자는 오늘 일자를 기준으로 타임 테이블이 나오게 함.
var clickDay = year + "-" + month + "-" + date;


$(function(){
	
	
	//miniNavi 부분 넣음.
	const loc = location.href;
	let miniNavi = "<div>✔  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>예매</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>빠른 예매</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
	
	
	//영화페이지에서 예매 누르면 넘어 오는 영화코드
	const mCode = sessionStorage.getItem("mCode");
	const mName = sessionStorage.getItem("mName");

	if(mCode != null && mName != null){
		pickMovie[0] = mCode;
		pickMovieName[0] = mName;
		
		putPick('pickMovie', mCode, mName, 0); 
		
		sessionStorage.removeItem("mCode");	
		sessionStorage.removeItem("mName");	// 새로고침하면 이 mMovieCode 값이 없어야하니까. selectedMovie 에 값 넘겨주고 바로 삭제해버림
	};
	
	
	// 상단의 날짜 부분 
	const ul = $("<ul>");
		
	
	let click_pre ="<li id='click_pn' data-click='todayP' data-pn='pre'> < </li>";
	$(ul).append(click_pre);
	
	for(let i = 0; i < 7 ; i++){
		let html = "<li id='todayP";
			html += i;
			html += "' onclick='clickDate(this)'>";
			html += "</li>";
		$(ul).append( $(html) );
	}
	
	
	
	let click_next = "<li id='click_pn' data-click='todayP' data-pn='next'> > </li>";
	$(ul).append(click_next);
	
	$("#dateList").append( ul );
	
	$("#todayP0").addClass("highlight");
	
	function switchDay(day){
		var dayday="";
		switch (day){
			case 0 : dayday = "일"; break;
			case 1 : dayday = "월"; break;
			case 2 : dayday = "화"; break;
			case 3 : dayday = "수"; break;
			case 4 : dayday = "목"; break;
			case 5 : dayday = "금"; break;
			case 6 : dayday = "토"; break;
	 	}
		return dayday;
	}
	
	for(let i=0; i<7; i++){
		var todayP = "todayP" + i;
		var switchD = (day+i) % 7; // 토 : 6, 일 : 0
		var overDate = date + i;
		
		
		if(switchD == 6){
			document.getElementById(todayP).style.color = "blue";
		} else if(switchD == 0){
			document.getElementById(todayP).style.color = "red";
		}
		if( overDate > 31 ){
			var nextMonthDate = overDate % 31;
			
		 	if(i==0){
				document.getElementById(todayP).innerText += year + "." + month + "\n" + "오늘 " + nextMonthDate + "일";
				document.getElementById(todayP).style.fontSize = "15px";
				document.getElementById(todayP).style.color = "#8324FF";
			} else if (i==1){
				document.getElementById(todayP).innerText += "내일 " + nextMonthDate + "일";
			} else  {
				document.getElementById(todayP).innerText += nextMonthDate + "일";
				document.getElementById(todayP).innerText += " " + switchDay(switchD);
			}
		}else {
			if(i==0){
				document.getElementById(todayP).innerText += year + "." + month + "\n" + "오늘 " + (date + i) + "일";
				document.getElementById(todayP).style.fontSize = "15px";
				document.getElementById(todayP).style.color = "#8324FF";
			} else if (i==1){
				document.getElementById(todayP).innerText += "내일 " + (date + i) + "일";
			} else  {
				document.getElementById(todayP).innerText += (date + i) + "일";
				document.getElementById(todayP).innerText += " " + switchDay(switchD);
			}
		}
	}

	
	

	
	$(".pickTM ul li").on('click', function(){
		var pickTM = $(this).parent().parent().data("select"); //pickMovie || pickTheater
		var pickTMArr = eval(pickTM);	//pickMovie[] || pickTheater[]
		var pickTMName = pickTM + "Name";  //pickMovieName || pickTheaterName
		var pickTMNameArr = eval(pickTM + "Name"); //pickMovieName[] || pickTheaterName[]
			
		var pickCode = $(this).val();
		var pickName = $(this).text();
		
		
		
		for(let i = 0; i < 3; i++){
			if(pickCode == pickTMArr[i]){
				pickTMArr[i]=0;
				pickTMNameArr[i] ="";
				remv(pickCode);
				break;
				
			}
			if(pickTMArr[i] == 0){
				pickTMArr[i] = pickCode;
				pickTMNameArr[i] = pickName;
				putPick(pickTM, pickCode, pickName, i);
				break;
			}
			
		}
		
		getTimeTable();
		
	});
	
	
	$(document).on('click', "#click_pn", function(){
		var clickWhat = $(this).data("click"); // 날짜를 눌렀는지, 시간을 눌렀는 지
		var click_pre_next = $(this).data("pn"); // click_pre or click_next
		
		if(click_pre_next == "pre"){
			var pre = -1;
		}else if(click_pre_next == "next"){
			var pre = 1;
		}
		
		if(clickWhat == "todayP"){
			var highlight_id = $( document.getElementsByClassName("highlight")[0] ).attr('id'); //현재 하이라이트가 되어있는 날짜의 id 값
			$(document.getElementById(highlight_id)).removeClass("highlight");

			var highlight_id_ = Number( highlight_id.replace(/[^0-9]/g,'') ) + pre;
			if(highlight_id_ < 0){
				alert("더 이전으로 갈 수 없습니다.");
				$(document.getElementById("todayP0")).addClass("highlight");
			}else if(highlight_id_ > 6){
				alert("더 이상의 날짜는 안나옵니다.");
				$(document.getElementById("todayP6")).addClass("highlight");
			}else{
				var preId = highlight_id.replace(/[^todayP]/g, highlight_id_); //이전 또는 이후 날짜의 id 값
				$(document.getElementById(preId)).addClass("highlight");
				
				var clickday  = (($( document.getElementById(preId) ).text()).replace(/[^0-9]/g,'')).slice(-2);
				clickDay = year + "-" + month + "-" + clickday;
				getTimeTable();
			}
		}
		
		if(clickWhat == "schTime"){
			$(".time_div p[value='"+ hour +"']").focus();
			console.log(hour);
		}
		
	});
	
	$(document).on("click", ".time_div p", function(){
		for(var i=0; i<28; i++){
			var clickTime = "clickTime" + i;
			$('#' + clickTime).removeClass("colorPick");
		}
		
		var clickTime = $(this).text();
		$(this).addClass("colorPick");
		
	});
	

	$(document).on('click', '#pickSchedule', function(){
		var pickInfo = [];
		
		//pickInfo[timeTableDate, endTime, title, theater, screenNum,  emptySits, totalSits, scheduleCode, screenCode]
		for(let i = 0 ; i < 7 ; i++){
			pickInfo[i] = $(this).children().eq(i).text();
		}
		pickInfo[7] = $(this).data("scheduleCode");
		pickInfo[8] = $(this).data("screenCode");
		
			swal({
				  icon: "warning",
				  text: "코로나 감염 예방을 위해 한칸띄기를 시행중입니다. \n 관람 중 음식물 섭취는 불가하며 \n 반드시 마스크를 착용해주시기 바랍니다.",
				  closeOnClickOutside: false,
				  closeOnEsc: false,
				  buttons: ["취소", "확인"],
			})
			.then((willDelete) => {
				  if (willDelete) {
				    pickYourSit(pickInfo);
				  } else {
				    swal("동의하지 않으시면 영화 관람이 불가합니다. \n 양해부탁드립니다.", {icon : "error", button : "확인" ,});
				  }
			});
			
	});

//document.reday 끝
});


function scheduleInfo(pickInfo){

	let timeTableDate = pickInfo[0];
	let endTime = pickInfo[1];
	let title = pickInfo[2];
	let theater = pickInfo[3];
	let screenNum = pickInfo[4];
	let emptySits = pickInfo[5];
	let totalSits = pickInfo[6];
	let scheduleCode = pickInfo[7];
	let screenCode = pickInfo[8];

	
	//고른 상영시간표에 대한 세부 정보
	
	let html = "<li>시작시간 : ";
		html += timeTableDate;
		html += "</li>";
		html += "<li>종료시간 : ";
		html += endTime;
		html += "</li>";
		html += "<li>영화명 : ";
		html += title;
		html += "</li>";
		html += "<li>극장 : ";
		html += theater;
		html += "</li>";
		html += "<li>상영관 : ";
		html += screenNum;
		html += "</li>";
		
		
	// TODO : $("#pickScheduleInfo").data('code' , scheduleCode); 는 안되던데 ?? 
	$("#pickScheduleInfo").attr('data-schedulecode' , scheduleCode); 
	$("#pickScheduleInfo").attr('data-screencode' , screenCode);	
	$("#pickScheduleInfo ul").html( html );
	
	
}


//pickInfo[timeTableDate, endTime, title, theater, screenNum, emptySits, totalSits, scheduleCode, screenCode]
function pickYourSit(pickInfo){
	
	let scheduleCode = pickInfo[7];
	let screenCode = pickInfo[8];

	$("#pickSits").show();
	$("#container").hide();
	
	scheduleInfo(pickInfo);
	
	
	//좌석
	let row = Math.floor( pickInfo[6] / 10 ) + 1; 
	let restColum = pickInfo[6] % 10;
	let colum = 10;

	const div = $("<div>");	

	for(let i = 1 ; i <= row ; i++){ //행
	
		// TODO : let html 부분 중복 되는 데 -> 중복 없애는 거 모르겟음... ㅠㅠ (함수로 만들어서 넣나?)
		if(i == row) { // 마지막 행일 때는 나머지로 해야되서
			for(let j = 1; j <= restColum ; j++){ //열
				let html = "<p data-sitscode='";
					html += (i-1)*10 + j;
					html += "'>";
				 	html += i;
				 	html += "행 " 
				 	html += j;
				 	html += "열</p>";
				 
				 $( div ).append ( $(html) );
			}
		}
		else{
			for(let j = 1; j <= colum ; j++){ //열
				let html = "<p data-sitscode='";
					html += (i-1)*10 + j;
					html += "'>";
				 	html += i;
				 	html += "행 " 
				 	html += j;
				 	html += "열 </p>";
				 
				$( div ).append ( $(html) );
			}
		}
	
		$( div ).append( "<br/>" );
	} 
	
	$("#innerSitsList").html( $(div) );

	
	$.ajax({
		type:"POST",
		url : "/booking/getSitsInfo",
		contentType: "application/JSON",
		datatype : JSON,
		data: JSON.stringify({
			SCHEDULE_CODE : scheduleCode,
			SCREEN_CODE : screenCode
		}),
		async: true,
		success: function(data){
			
			
			let leng = data.length;
			for(let i = 0 ; i < leng ; i++){
				let sitsCode = data[i].sitsCode;
				$(".innerSitsList div p[data-sitscode='"+ sitsCode +"']").addClass('colorPick'); //이미 예매 된 부분 색칠함.
			}
			
		}
	
	});
};

var selectedSits = []; //선택한 좌석의 코드
var selectedSitsName = []; //선택한 좌석의 이름 ( 몇행 몇열 )

//좌석 눌렀을 때.
$(document).on('click', '.innerSitsList div p', function(){
	var sitsName = $(this).text();
	var sitsCode = $(this).data("sitscode");
	var colorPick = $(this).attr('class'); // 예매된 부분인지 아닌 지 확인하기 위함.

	
	if( colorPick == 'colorPick'){
		 swal("이미 예약된 좌석입니다. \n다른 좌석을 선택해주세요.", {icon : "error", button : "확인" ,});
	}else {
		var i = selectedSits.indexOf( sitsCode );
		if( i > -1 ){ //selectedSits 배열에 선택 좌석이 있으니까 없애주기
			selectedSits.splice( i , 1 );
			selectedSitsName.splice( i , 1 );
			$(this).removeClass("colorPurple");
		}else{
			selectedSits.push( sitsCode );
			selectedSitsName.push( sitsName );
			$(this).addClass("colorPurple");
		}
	}
});


$(document).on('click', '#preStage', function(){
	//data-stage 를 둬서, 몇 번째 단계에서 누른 "이전" 버튼인 지.
	var stage = $(this).data("stage");
	
	if(stage == "secondStage"){//2번째 단계에서 누른 "이전"버튼
		$("#container").show();
		$("#pickSits").hide();
		$("#payment").hide();
	}else{//3번째 단계에서 누른 "이전"버튼
		$("#container").hide();
		$("#pickSits").show();
		$("#payment").hide();
	}
	
});


// TODO : *****  제이쿼리에서 session 값 가져오는 다른 방법.
// sessionId 에 다가 꼭 "null" 로 넣어야하나?? null 로는 안되던데... 안되는 이유. + 로그인 안했는데도 sessionId가 있는 경우 있었음.
$(document).on('click', '#nextStage', function(){
	var sessionId = "<%=session.getAttribute("id") %>";
	
	var stage = $(this).data("stage");
	var scheduleCode = $("#pickScheduleInfo").attr('data-schedulecode');
	var screenCode = $("#pickScheduleInfo").attr('data-screenCode');
	
	
	if(stage == "secondStage" && sessionId != "null"){ // 2단계에서 누르는 "다음" 버튼 && 세션 아이디 있음.
		var pickScheduleInfo = document.getElementById("pickScheduleInfo");
	
		//만약 선택한 좌석이 없다면 좌석을 선택하라고 알림창.
		let leng = selectedSits.length;
		if(	leng > 0 ){
			const p = $("<p>");
			for( let i = 0 ; i < leng ; i++){
				if(i == leng-1){
					let html = selectedSitsName[i];

					$( html ).attr('style', 'color : #B5B2FF;')
					$(p).append( html );
					$(p).append( "입니다." );
				}else{
					let html = selectedSitsName[i];
					html += " 과 "; 
					$(p).append( html );
				}
			}
			$("#selectedSits").html( p );
			
			$("#pickSits").hide();
			$("#container").hide();
			$("#payment").show();
		}else{
			 swal("좌석을 선택하지 않았습니다. \n 좌석을 선택해주세요.", {icon : "error", button : "확인" ,});
		}
	}else if(stage == "thirdStage"){ //"결제하기" 버튼
		console.log("결제하기 버튼-----" + sessionId);
		
		
		$.ajax({
			type:"POST",
			url : "/booking/payment",
			contentType: "application/json",
			datatype : JSON,
			data: JSON.stringify({
				id : sessionId,
				scheduleCode : scheduleCode, 
				screenCode : screenCode,
				selectedSits : selectedSits
			}),
			async: true,
			success: function(data){
				swal({
					  icon: "success",
					  text: "예매가 완료되었습니다!",
					  closeOnClickOutside: false,
					  closeOnEsc: false,
					  button: "확인",
				})
				.then((willDelete) => {
					  if (willDelete) {
					    location.href = "/";
					  }
				});
				
			}, error : function(){
				
			 	alert("뭔가 이상해!!");
			}
			
		});
	
	}else{ //세션 아이디가 없음
		swal("로그인을 해주세요.", {icon : "warning", button : "확인" ,});
	}
	
});


function clickDate(e){
	
	// 클릭하면 하이라이트 효과
	for(var i=0; i<7; i++){
		var todayP = "todayP" + i;
		$('#' + todayP).removeClass("highlight");
	}
	$(e).addClass("highlight");

	
	// 원하는 날짜를 클릭하게 되면 그 날짜를 기준으로 타임 테이블이 나오게
	
	var clickday  = (($(e).text()).replace(/[^0-9]/g,'')).slice(-2); //끝에 두자리 뽑는 이유 : 오늘을 누르게 되면 2021.1014 로 나오게 되니까. 몇 일인지를 빼기 위해 뒤의 2자리를 빼는 걸로 함.

	date = clickday; 
	clickDay = year + "-" + month + "-" + date;
	
	getTimeTable();
};



// 날짜. 극장1. (required=true)
// 극장2,3 과 영화1,2,3 은 (required=false)
var pickTheater = [0,0,0];
var pickTheaterName = ["","",""];
var pickMovie = [0,0,0];
var pickMovieName = ["","",""];



function putPick(pickTM, pickCode, pickName, i){ //픽한 극장||영화의 밑의 상자에 표현하기 위한.
	var putLoc = pickTM + i;
	
	let pick = "<div id='remv";
		pick +=  pickCode;
		pick += "' onclick='remv(";
		pick += pickCode;
		pick += ")' data-select='";
		pick += pickTM;
		pick += "' style='display:block; height : 15px; width : 15px; font-size : 10px; text-align:center; vertial-align:middle; float: right; margin: 0px;'>X</div>";
		
	if(pickCode == 0 || pickName == ""){
		$('#' + putLoc).children().html( "+" );
	}else{
		$('#' + putLoc).children().html( $(pick) );
		$('#' + putLoc).children().append( pickName );
		$(".pickTM li[value='"+ pickCode +"']").addClass('colorPick');
	}
}

function remv(code){
	var remv = "remv" + code;
	var remvId = $('#' + remv).parent().parent().attr('id'); //pickTheater0 || pickMovie0
	var remvTM = remvId.slice(0,-1); // 뭐를 지웠는지. pickTheater || pickMovie
	var remvloc = Number(remvId.slice(-1)); // 몇번째가 지워졌는지. 0
	var selectTM = $('#' + remv).parent().parent().parent().siblings('#' + remvTM).data("select");
	var remvTMName = eval(remvTM + "Name");
		remvTM = eval(remvId.slice(0, -1));
	
	remvTM[remvloc] = 0;
	
	//pickTheater[] 값을 앞으로 한 칸씩 당겼음.
	for(let i=remvloc; i<2; i++){
		remvTM[i] = remvTM[i+1];
		remvTM[i+1] = 0;
		
		remvTMName[i] = remvTMName[i+1];
		remvTMName[i+1] = "";
		 
	}
	
	for(let i = 0; i < 3; i++){
		putPick(selectTM , remvTM[i], remvTMName[i], i );
	}
	$(".pickTM li[value='"+ code +"']").removeClass('colorPick');
	
	getTimeTable();
	

}
function getTimeTable(){
	const pickTMTimeDiv = $("<div>");
	$(pickTMTimeDiv).addClass("pickTMTime");
	$(pickTMTimeDiv).attr("id", "pickTMTime");
	var nowTime = hour + ":" + min;
	
	var js = {
			clickDay : clickDay,
			pickTheater1 : pickTheater[0],
			theaters : [pickTheater[1], pickTheater[2]],
			movies : [pickMovie[0], pickMovie[1], pickMovie[2]]
	}
	
	$.ajax({
		type:"POST",
		url : "/booking/getTimeTable",
		contentType: "application/json",
		datatype : JSON,
		data: JSON.stringify(js),
		async: true,
		
		success: function(data){// 극장명을 누르게 되면 그 극장에 따른 타임테이블이 append 될 수 있게.
			const leng = data.length;
		
			if(leng > 0){
				let reset = "";
				$("#selectTimeTable").html($(reset));
			}else{
				let reset = "<div>해당하는 상영 시간표가 없습니다.</div>";
				$(reset).addClass("plzPickTM");
				$("#pickTMTime").attr('style', 'display:none;');
				
				$(".oneBlock .oneBlockIn .pickTM:last-child").attr('style', 'display: flex; align-items: center; height:90%');
				$("#selectTimeTable").html($(reset));
			}
		
			for(let i=0; i<leng; i++){
				let timeTableDate = (data[i].timeTableDate).slice(-5);
				let title = data[i].title;
				let endTime =(data[i].endTime).slice(-5);
				let theater = data[i].theater;
				let screenNum = data[i].screenNum;
				let emptySits = data[i].emptySits;
				let sitTotal = data[i].sitTotal;
				let scheduleCode = data[i].scheduleCode;
				let screenCode = data[i].screenCode;

				//시간 선택 부분
				const t_div_div = $("<div>");
				const t_div = $("<div>");
				const t_ul = $("<ul>");
				const t_li = $("<li>");

				let timehtml_pre = "<div id='click_pn' data-click='schTime' data-pn='pre' style='float:left'> < </div>";
				$(t_div_div).append( $(timehtml_pre) );
				
				
				for(let i = 0 ; i < 28 ; i++){ 
					let timehtml = "<p id='clickTime";
						timehtml += i;
						timehtml += "' value=";
						timehtml += i;
						timehtml += ">";
						timehtml += i;
						timehtml += "</p>";
					$(t_li).append( $(timehtml) );
				}
					$(t_ul).append( $(t_li) );
					$(t_div).append( $(t_ul) );
					$(t_div).addClass("time_div");
					
				
				$(t_div_div).append( $(t_div) );
				$(t_div_div).addClass("time_div_div");
				
				let timehtml_next = "<div id='click_pn' data-click='schTime' data-pn='next' style='float:right'> > </div>";
				$(t_div_div).append( $(timehtml_next) );
 



				const ul = $("<ul>");
				const li = $("<li>");
			
				let html = "<p class='timeTableDate'>";
					html += timeTableDate;
					html += "</p><p class='endTime'>";
					html += endTime;
					html += "</p><p class='title'>";
					html += title;
					html += "</p><p class='theater'>";
					html += theater;
					html += "</p><p class='screenNum'>";
					html += screenNum;
					html += "상영관</p><p class='emptySits'>";
					html += emptySits;
					html += " / </p><p class='sitTotal'>";
					html += sitTotal;
					html += "</p>";
			
					
				$(li).append($(html));
				$(li).attr('id', 'pickSchedule');
				$(li).data('scheduleCode', scheduleCode);
				$(li).data('screenCode', screenCode);
				$(li).attr('style' ,'width:100%');
				
				
				$(ul).append( $(li) );
				
				$("#pickTMTime").attr('style', 'display:inline-block;');
				
							
				$("#selectTimeTable").parent().siblings("#pickTMTime").html( $( t_div_div ) );
				
				$("#selectTimeTable").append( $(ul) );
				$(".oneBlock .oneBlockIn .pickTM:last-child").attr('style', 'height:80%; display:inline-block; align-items:none;');
			} 
		},
	
	 error : function(){
			
		 	let reset = "<div>극장 및 영화를 선택해주세요.</div>";
			$("#selectTimeTable").html($(reset));
		}
	});
}



	
</script>



<body>

<!-- 스케쥴을 선택하는 단계 -->
<div class="container" id="container">
		
		<div>
			<h3 class="title" >빠른 예매</h3>
		</div>
		<div class="smBlock"></div>

		
		<div id="dateList" class="dateList">
	
		</div>
		<div class="smBlock"></div>
		<!-- oneBlock 시작 -->
		<div class="oneBlock">		
		<div>
			<!-- 영화 선택 -->
			<div class="oneBlockIn">
			<div class="str"><strong>영화</strong></div>
				<input type="hidden" name="movieCode" id="movieCode">
					<div class="pickTM" id="pickMovie" data-select="pickMovie">
						<ul>
						<c:forEach var="movieList" items="${movieList}">
							<li id="opt" value="${movieList.movieCode}">${movieList.title}</li>
						</c:forEach>
						</ul>
					</div>
				<div class = "pick">
					<div id="pickMovie0"><div>+</div></div>
					<div id="pickMovie1"><div>+</div></div>
					<div id="pickMovie2"><div>+</div></div>
				</div>
			</div>
			<!-- //영화 선택 끝-->
			
			
			<!-- 극장 선택-->
			<div class="oneBlockIn">
				<div class="str"><strong>극장</strong></div>
				<input type="hidden" name="theaterCode" id="theaterCode">
				<div class="pickTM" id="pickTheater" data-select="pickTheater">
					<ul>
					<c:forEach var="theaterList" items="${theaterList}">
						<li id="opt" value="${theaterList.theaterCode}">${theaterList.theater}</li>
					</c:forEach>
					</ul>
				</div>
					<div class = "pick">
					<div id="pickTheater0"><div>+</div></div>
					<div id="pickTheater1"><div>+</div></div>
					<div id="pickTheater2"><div>+</div></div>
				</div>
			</div>
			<!-- //극장 선택 끝-->
			
			<!-- 시간표 선택 시작 -->
			<div class="oneBlockIn">
				<div class="str"><strong>시간표</strong></div>
				<input type="hidden" name="timeList" id="timeList">
				<div class="pickTMTime" id="pickTMTime">
					
				</div>
				<div class="pickTM">
					<div class="selectTimeTable" id="selectTimeTable" data-role="selectBox">
						<div class='plzPickTM'><img src="/resources/images/movie.png" style="width:50px; height: 50px;" /> <br/><br/>영화와 극장을 선택하시면 <br/> 상영시간표를 비교하여 볼 수 있습니다.</div>
					</div>
				</div>
			</div>
			<!-- //시간표 선택 끝 -->
		</div>
		
		</div>
		<!-- //oneBlock 끝 -->

		<div class="smBlock"></div>
	</div>
	
	
	
	<!-- 스케쥴에 따른 좌석을 선택하는 단계 -->
	<div class="pickSits" id="pickSits">
		<div class="container">
			<div class="title">
				<h3>좌석 선택</h3>
			</div>
			<div class="peopleSits">
				<!-- 성인, 청소년, 보훈 --> 
				<div class="pickScheduleInfo" id="pickScheduleInfo">
					<ul>
						<!-- 각 상영관 별로 좌석이 들어가는 자리 -->
					</ul>
				</div>
				
			</div>
			<div class="sitsList">
				<div>
					<div class="innerSitsList" id="innerSitsList" style="border: 1px solid green;"></div>
					<div class="pre_next_stage_btn">
						<button class="btn btn-primary" id="preStage" type="button" data-stage="secondStage">이전</button>
						<button class="btn btn-success" id="nextStage" type="button" data-stage="secondStage">다음</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 결제 단계 -->
	<div class="payment" id="payment">
		<div class="container">
			<div class="title">
				<h3>결제</h3>
			</div>
			<div class="pickScheduleInfo" id="pickScheduleInfo">
				<ul>
				</ul>
			</div>
			
			<div class="innerPayment">
				<div>
					<h2>선택하신 좌석 :</h2>
					<div id="selectedSits"></div>
				</div>
				<div class="pre_next_stage_btn">
					<button class="btn btn-primary" id="preStage" type="button" data-stage="thirdStage">이전</button>
					<button class="btn btn-success" id="nextStage" type="button" data-stage="thirdStage">결제하기</button>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>