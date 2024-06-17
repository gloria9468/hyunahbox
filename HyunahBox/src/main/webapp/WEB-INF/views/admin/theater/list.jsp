<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 극장</title>
</head>

<body>
	<div class="container">
		<form id="adminTheaterList" action="<c:url value="/admin/theater/list" />">
			<div class="filter">
				<div class="list_cnt_div">총 <c:out value="${item.totalCnt}"/> 건</div>
				<div class="search_filter_div">
					<input type="text" name="theaterName" value="" placeholder="극장명 검색"/>
					<p class="active" onclick="">검색</p>
					<select name="cntperpage">
						<option value="3">3</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="30">30</option>
					</select>
				</div>
			</div>
			<table class="text-center table table-sm table-light table-secondary table-hover" border="1">
				<thead>
				
					<tr>
						<th>극장 코드</th>
						<th>극장</th>
						<th colspan="2">극장 관리</th>
						<th>상영관 관리</th>
					</tr>
				</thead>
				
			
				<tbody>
					
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="5">등록된 극장이 없다.</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.theaterCode}</td>
							<td>${item.theater}</td>
							<td>
								<a onclick="setHtml('<c:url value="/admin/theater/update/${item.theaterCode}"/>', '#adminContent');" class="btn btn-sm btn-outline-secondary mx-2">극장 변경</a>
							</td>
							<td>
								<a onclick="setHtml('<c:url value="/admin/theater/delete/${item.theaterCode}"/>', '#adminContent');" class="btn btn-sm btn-outline-danger mx-2">극장 삭제</a>
							</td>
							<td>
								<a onclick="setHtml('<c:url value="/admin/theater/${item.theaterCode}/screenInfo/list"/>', '#adminContent');" class="btn btn-sm btn-outline-primary">상영관 관리</a>
							</td>
						</tr>	
					</c:forEach>
					
				</tbody>
			</table>
			<div>
				<input type="hidden" name="pageindex" value="${item.pageindex}" />
					<a onclick="setPageIndex('#adminTheaterList', '1');" class="btn">처음으로</a>
					
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
					<a onclick="setPageIndex('#adminTheaterList', '${status.index}');" class="btn <c:if test="${item.pageindex eq status.index}">btn-primary</c:if>">${status.index}</a>
				</c:forEach>
					<a onclick="setPageIndex('#adminTheaterList', '${item.pageunit}');" class="btn">끝으로</a>
			</div>
		</form>
		
	</div>
</body>
</html>