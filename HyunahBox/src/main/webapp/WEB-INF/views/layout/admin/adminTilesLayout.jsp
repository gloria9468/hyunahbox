<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
	
	<script src="<c:url value='/resources/JS/jquery-3.6.0.min.js'/>"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	
	
	 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
	
	<link href="<c:url value='/resources/css/otherMain.css'/>" rel="stylesheet">
	<script src="<c:url value='/resources/JS/sweetalert.min.js'/>"></script>
	
	<link href="<c:url value='/resources/css/form.css'/>" rel="stylesheet">
	
	<head>
		<meta charset="UTF-8">
		
		<script>
			$(function(){
				setHtml("/admin/menu/list", "#adminTop");
				
			});
			
			function setAdminContentHtml(url_, e){
				setHtml(url_, "#adminContent");
				$("#adminTop li p").removeClass("menu_active");
				$(e).addClass("menu_active");
			}
			
			function postHtml(formId, setHtmlDiv){
				var formAction = $(formId).attr("action");
				var datas = $(formId).serialize();
				$.ajax({
		            url : formAction,
		            type : "post",
		            data : datas,
		            success: function(data) {
		            	if(data.msg != null){
		            		alert(data.msg);
		            	}
		                setHtml(data.url, setHtmlDiv);
		            },
		                error: function() {
		                alert("요청 처리 중 오류가 발생하였습니다! \n관리자에게 문의하세요!");
		            }
		        });
			}
			
			function clickSearch(formId){
				var formAction = $(formId).attr("action");
				var params = $(formId).serialize();
				$("#adminContent").load(formAction + "?" + params);
			}
			
			function setPageIndex(formId, pageIndex){
				$(formId).find("input[name=pageindex]").val(pageIndex);
				clickSearch(formId);
			}
		</script>
	</head>
	
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		<div style="padding:20px;">
			<div style="height:calc(100% - 400px); border:1px solid green;">
				<header id="adminTop" style="border: 1px solid red; width:300px; display: inline-flex;">
					<tiles:insertAttribute name="adminTop"/>
				</header>
			
				<div id="adminContent" style="border: 1px solid blue; width:calc(100% - 310px); display: inline-flex;" >
					<tiles:insertAttribute name="adminContent"/>
				</div>
			</div>
		 
			<footer id="adminBottom">
				<tiles:insertAttribute name="adminBottom"/>
			</footer>
		</div>
	</body>
</html>