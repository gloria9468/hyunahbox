<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



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
<script>

	
	$(function(){
		// $("ul.endLine > li.fstNavi").children().eq(1).removeClass("dsp_none"); 
			
		var total = $("ul.menu_navi_ul").length;
		$("ul.menu_navi_ul").each(function(index, item){
			var parLi = $(this).parent();
			var menuId = $(parLi).attr("data-menuid");
			
			var firstUl = $(parLi).children("ul:eq(0)");
			var moveLi = $(this).children();
			
			$(firstUl).append(moveLi);
			
			
			if(index === total -1){
				$("ul.endLine > li.fstNavi > ul").each(function(){
					var lng = $(this).children().length;
					if(lng < 1) $(this).remove();
				});
			}
			
		});
		
		/*
		$("ul.menu_navi_ul").promise().done(function() {    
			$("ul.endLine > li.fstNavi").children("ul:not(:eq(0))").remove();
		});
		*/
	});
	
	
	
	$("ul.endLine > li.fstNavi").hover(
		function(){ 
			$(this).children("ul.menu_navi_ul").removeClass("dsp_none"); 
		},
		function(){
			$(this).children("ul.menu_navi_ul").addClass("dsp_none"); 
		}
	);
	
	
</script>
<style>
	.dsp_none{display:none !important;}
	
	.topBlock{height:initial;}
	.navi .endLine{display:flex; justify-content: center; align-items: center; width: 100%; margin: 15px 0 0 0;}
	.navi .endLine .fstNavi a{line-height:initial; display:flex; width:100%; justify-content: center;}
	.navi .endLine .fstNavi ul{width:auto; position:absolute; height:60px; top:100px;}
	.navi .endLine .fstNavi ul a{font-size:1.2em; color:white;}
	.navi .endLine .fstNavi ul li{display:inline-block; top:initial; width:auto; position:relative; height:100%; padding:10px;}
	.navi .endLine li{padding: 0px 20px; height: 65px; display:inline-flex; flex-direction: column; justify-content: center;}
	.navi .endLine > li{ width:90px; }
	
</style>






	<div class="topBlock">
		<div class="member">
			<div class="member1">
				<a href="viplounge">소개말</a>
			</div>
			<div class="member2">
				<c:if test="${sessionScope.member != null }">
					<a href="<c:url value='/member/mypage'/>">마이페이지</a>
					<a href="<c:url value='/logout'/>">로그아웃</a>
				</c:if>
				<c:if test="${sessionScope.member == null }">
					<a href="<c:url value='/login/'/>">로그인</a>
					<a href="<c:url value='/signup/'/>">회원가입</a>
				</c:if>
				
				<a href="<c:url value='/booking/'/>">빠른예매</a>
				<c:if test="${sessionScope.member.getId() == 'admin' && sessionScope.member.getName() == '관리자' }">
					<a href="<c:url value='/admin/admin-main/'/>">관리자</a>
				</c:if>
			</div>
		</div>
		<nav class ="navi">
			<ul class="endLine">
				<c:set var="lvl2Cnt" value="0"/>
				<li id="logo_li">
					<a href="<c:url value='/'/>">
						<img src="<c:url value='/resources/images/logo.png'/>" height="60px" width="60px">
					</a>
				</li>
				<c:forEach var="menuList" items="${menuList}" varStatus="status">
					<c:if test="${menuList.lvl eq '2'}">
						<c:set var="lvl2Cnt" value="${lvl2Cnt+1}" />
						<c:if test="${status.index ne 0}"></li></c:if>
						<li class="fstNavi" data-menuid="${menuList.menuId}">
					</c:if>
					<c:if test="${menuList.lvl eq '3'}">
						<ul class="menu_navi_ul dsp_none">
							<li data-menuid="${menuList.menuId}"> 
					</c:if>
								<a href="<c:url value='${menuList.menuPath}'/>">${menuList.menuName}</a>
					<c:if test="${menuList.lvl eq '3'}">
							</li>
						</ul>
					</c:if>
				</c:forEach>
					</li>
				<c:if test="${lvl2Cnt%2!=0}">
					<li></li>
				</c:if>
				
			</ul>
		</nav>
		
		
</div>

<script>
	$(function(){
		var midNum = Number('<c:out value="${lvl2Cnt}"/>');
		midNum = Math.ceil(midNum / 2) -1;
		$("nav.navi li#logo_li").insertAfter("li.fstNavi:eq("+midNum+")");
	});
</script>	