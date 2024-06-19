<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 정보 리스트</title>
</head>

<body>
	<div>
		<div class="container">
			<form id="adminScreenInfoList" action="<c:url value="/admin/theater/${item.theaterCode}/screenInfo/list" />">
			<div class="filter">
				<div class="list_cnt_div">총 <c:out value="${item.totalCnt}"/> 건</div>
				<div class="search_filter_div">
					<select name="cntperpage"  onchange="clickSearch('#adminScreenInfoList');">
						<option value="3" <c:if test ="${item.cntperpage eq 3}">selected="selected"</c:if>>3</option>
						<option value="5" <c:if test ="${item.cntperpage eq 5}">selected="selected"</c:if>>5</option>
						<option value="10" <c:if test ="${item.cntperpage eq 10}">selected="selected"</c:if>>10</option>
						<option value="30" <c:if test ="${item.cntperpage eq 30}">selected="selected"</c:if>>30</option>
					</select>
				</div>
			</div>
			<table
				class="text-center table table-sm table-light table-secondary table-hover"
				border="1">
				<thead>

					<tr>
						<th>극장 코드</th>
						<th>극장 명</th>
						<th>상영관 코드</th>
						<th>몇 상영관</th>
						<th>총 좌석 수</th>
						<th colspan="3">관리</th>
					</tr>
				</thead>


				<tbody>

					<c:if test="${screenInfoList.size() < 1}">
						<tr>
							<td colspan="8">등록된 상영관이 없다.</td>
						</tr>
					</c:if>
					<c:forEach var="screenInfoList" items="${screenInfoList}">
						<c:set var="theaterCode" value="${screenInfoList.theaterCode}"></c:set>
						<tr>
							<td>${screenInfoList.theaterCode}</td>
							<td>${screenInfoList.theater}</td>
							<td>${screenInfoList.screenCode}</td>
							<td>${screenInfoList.screenNum}상영관</td>
							<td>${screenInfoList.sitTotal} 좌석</td>
							<td>
								<a onclick="setHtml('/admin/theater/${screenInfoList.theaterCode}/screenInfo/${screenInfoList.screenCode}/timeTable', '#adminContent');" class="btn btn-sm btn-outline-primary mx-1">시간표 리스트</a>
							</td>
							<td> 
								<a onclick="setHtml('/admin/theater/${screenInfoList.theaterCode}/screenInfo/update/${screenInfoList.screenCode}', '#adminContent');" class="btn btn-sm btn-outline-secondary mx-1">상영관 변경</a>
							</td>
							<td> 
								<a onclick="setHtml('/admin/theater/${screenInfoList.theaterCode}/screenInfo/delete/${screenInfoList.screenCode}', '#adminContent');" class="btn btn-sm btn-outline-danger mx-1">상영관 삭제</a>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			
			<div>
				<input type="hidden" name="pageindex" value="${item.pageindex}" />
					<a onclick="setPageIndex('#adminScreenInfoList', '1');" class="btn">처음으로</a>
					
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
					<a onclick="setPageIndex('#adminScreenInfoList', '${status.index}');" class="btn <c:if test="${item.pageindex eq status.index}">btn-primary</c:if>">${status.index}</a>
				</c:forEach>
					<a onclick="setPageIndex('#adminScreenInfoList', '${item.pageunit}');" class="btn">끝으로</a>
			</div>
			
			</form>
			<div class="d-grid gap-2 col-6 mx-auto">
				<a onclick="setHtml('<c:url value="/admin/theater/${item.theaterCode}/screenInfo/add" />', '#adminContent');" class="btn btn-sm btn-outline-success">상영관 등록</a>
			</div>
		</div>
	</div>
</body>
</html>