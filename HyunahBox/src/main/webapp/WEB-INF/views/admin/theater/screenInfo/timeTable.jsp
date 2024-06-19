<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관별 시간표 리스트</title>

</head>
<body>


<div class="container">
	<form id="adminTimeTableList" action="<c:url value="/admin/theater/${item.theaterCode}/screenInfo/${item.screenCode}/timeTable" />">
		<div class="filter">
			<div class="list_cnt_div">총 <c:out value="${item.totalCnt}"/> 건</div>
			<div class="search_filter_div">
				<input type="text" name="keyword" value="${item.keyword}" placeholder="영화 검색" onKeyPress="if(event.keyCode==13) { clickSearch('#adminTimeTableList'); return false; }"/>
				<p class="active" onclick="clickSearch('#adminTimeTableList');">검색</p> 
				<select name="cntperpage"  onchange="clickSearch('#adminTimeTableList');">
					<option value="3" <c:if test ="${item.cntperpage eq 3}">selected="selected"</c:if>>3</option>
					<option value="5" <c:if test ="${item.cntperpage eq 5}">selected="selected"</c:if>>5</option>
					<option value="10" <c:if test ="${item.cntperpage eq 10}">selected="selected"</c:if>>10</option>
					<option value="30" <c:if test ="${item.cntperpage eq 30}">selected="selected"</c:if>>30</option>
				</select>
			</div>
		</div>
		<div class="smBlock"></div>
		<table border="1" class="text-center table table-sm table-light table-secondary table-hover">
			<thead>
				<tr>
					<th>타임테이블 코드</th>
					<th>타임테이블 시간</th>
					<th>영화 명</th>
					<th>상영 종료 시간</th>
				</tr>
			</thead>
	
			<tbody>
				<c:forEach var="timeTableList" items="${timeTableList}">
					<tr>
						<td>${timeTableList.timeTableCode}</td>
						<td><fmt:formatDate value="${timeTableList.timeTableDate}" pattern="yyyy-MM-dd HH:mm" /></td>
						<td>${timeTableList.title}</td>
						<td><fmt:formatDate value="${timeTableList.endTime}" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<input type="hidden" name="pageindex" value="${item.pageindex}" />
				<a onclick="setPageIndex('#adminTimeTableList', '1');" class="btn">처음으로</a>
				
				<fmt:parseNumber var="midPageIndex" value="${item.pagesize /2}" integerOnly="true"/>
				<c:if test="${item.pageindex <= midPageIndex}">
					<c:set var="beginIndex" value="1"/>
					<c:set var="endIndex" value="${item.pageunit < item.pagesize ? item.pageunit : item.pagesize}"/>
				</c:if>
				<c:if test="${item.pageindex > midPageIndex}">
					<c:set var="beginIndex" value="${item.pageindex - midPageIndex}"/>
					<c:set var="endIndex" value="${item.pageindex + midPageIndex -1}"/>
				</c:if>
				<c:if test="${item.pageunit - midPageIndex > 0 and item.pageindex > item.pageunit - midPageIndex}">
					<c:set var="beginIndex" value="${item.pageunit - item.pagesize +1}"/>
					<c:set var="endIndex" value="${item.pageunit}"/>
				</c:if>
				
			<c:forEach begin="${beginIndex}" end="${endIndex}" step="1" varStatus="status">
				<a onclick="setPageIndex('#adminTimeTableList', '${status.index}');" class="btn <c:if test="${item.pageindex eq status.index}">btn-primary</c:if>">${status.index}</a>
			</c:forEach>
				<a onclick="setPageIndex('#adminTimeTableList', '${item.pageunit}');" class="btn">끝으로</a>
		</div>
	</form>
</div>
</body>
</html>