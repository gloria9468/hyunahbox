<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link href="/resources/css/form.css" rel="stylesheet">

<style type="text/css">
	.cardP{
		text-align: center;
		
	}
	.card{
		display: inline-block;
		margin : 20px 30px;
	}
	.cardP img{
		height : 250px;
		width : 250px;
	}
	.cardP a{
		text-decoration: none;
		color: dimgray;
		font-size : 20px;
	}
	
</style>

<script type="text/javascript">
$(function(){
	//miniNavi 부분 넣음.
	const loc = location.href;
	let miniNavi = "<div>✔  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>관리자</a>  >  <a href='";
		miniNavi += loc;
		miniNavi += "'>관리자</a></div>";
	
	$(document.getElementById("miniNavi")).append( $(miniNavi) );
	
});	
</script>

</head>


<body>
	<div class="cardP">
		<c:set var="prevLvl" value="0"/>
			<ul>
		<c:forEach var="adminMenuList" items="${adminMenuList}" varStatus="status">
			<c:set var="currentLvl" value="${adminMenuList.lvl}"/>
			<c:if test="${prevLvl != 0 and prevLvl >= currentLvl}">
				<c:forEach begin="0" end="${prevLvl-currentLvl}">
					</ul>
				</c:forEach>
			<ul>
			</c:if>
			<c:if test="${prevLvl != 0 and prevLvl < currentLvl}">
				</li>
				<ul>
			</c:if>
				<li><p onclick="setAdminContentHtml('<c:url value="${adminMenuList.menuPath}"/>', this);">${adminMenuList.menuName}</p>
			
			<c:set var="prevLvl" value="${currentLvl}"/>
		</c:forEach> 
			</ul>
	</div>
</body>
</html>