<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>


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
		setHtml("/menu/list", "#menu_list");
		
		$('.movie_navi').hide();
		$('.movie').hover(function(){
			$('.movie_navi').show();
		});
		
		
	});
	
	
	function setHtml(url_, setDiv){
        $.ajax({
            url : url_,
            type : 'get',
            success: function(data) {
                $(setDiv).html(data);
            },
                error: function() {
                $(setDiv).text('페이지 점검중 입니다.');
            }
        });
    }
	
	
</script>

<div id="menu_list"></div>

<div class="secNavi">
	<div id="miniNavi"></div>
</div>	
		