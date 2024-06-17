<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 영화</title>

</head>
<body>
	<div class="container"> 
		<form id="adminMovieList" action="<c:url value="/admin/movie/list" />">
			<div class="filter">
				<div class="list_cnt_div">총 <c:out value="${movie.totalCnt}"/> 건</div>
				<div class="search_filter_div">
					<!-- <p class="active">예매 가능작</p> -->
					<input type="text" name="keyword" placeholder="영화명 검색" value="${movie.keyword}" onKeyPress="if(event.keyCode==13) { clickSearch('#adminMovieList'); return false; }"/>
					<p class="active" onclick="clickSearch('#adminMovieList');">검색</p>
					<select name="cntperpage"  onchange="clickSearch('#adminMovieList');">
						<option value="3" <c:if test ="${movie.cntperpage eq 3}">selected="selected"</c:if>>3</option>
						<option value="5" <c:if test ="${movie.cntperpage eq 5}">selected="selected"</c:if>>5</option>
						<option value="10" <c:if test ="${movie.cntperpage eq 10}">selected="selected"</c:if>>10</option>
						<option value="30" <c:if test ="${movie.cntperpage eq 30}">selected="selected"</c:if>>30</option>
					</select>
				</div>
			</div>
			
			<table class="text-center table table-sm table-light table-secondary table-hover" border="1">
				<thead>
				
					<tr>
						<th>영화코드</th>
						<th>영화명</th>
						<th>개봉일</th>
						<th>상영시간</th>
						<th>하트</th>
						<th>관리</th>
					</tr>
				</thead>
				
			
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="6">등록된 영화가 없다.</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.movieCode}</td>
							<td>${item.title}</td>
							<td><fmt:parseDate value="${item.openDate}" var="parsedDate" pattern="yyyyMMdd" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일" />
							</td>
							<td>${item.movieTime} 분</td>
							<td>♡ ${item.heartCnt} ♥</td>
							<td><a onclick="setHtml('<c:url value="/admin/movie/update/${item.movieCode}"/>', '#adminContent');" class="btn btn-sm btn-outline-secondary mx-1">변경</a>
							<a onclick="setHtml('<c:url value="/admin/movie/delete/${item.movieCode}"/>', '#adminContent');" class="btn btn-sm btn-outline-danger mx-1">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<input type="hidden" name="pageindex" value="${movie.pageindex}" />
					<a onclick="setPageIndex('#adminMovieList', '1');" class="btn">처음으로</a>
					
					<fmt:parseNumber var="midPageIndex" value="${movie.pagesize /2}" integerOnly="true"/>
					<c:if test="${movie.pageindex <= midPageIndex}">
						<c:set var="beginIndex" value="1"/>
						<c:set var="endIndex" value="${movie.pageunit < movie.pagesize ? movie.pageunit : movie.pagesize}"/>
					</c:if>
					<c:if test="${movie.pageindex > midPageIndex}">
						<c:set var="beginIndex" value="${movie.pageindex - midPageIndex}"/>
						<c:set var="endIndex" value="${movie.pageindex + midPageIndex -1}"/>
					</c:if>
					<c:if test="${movie.pageunit - midPageIndex > 0 and movie.pageindex > movie.pageunit - midPageIndex}">
						<c:set var="beginIndex" value="${movie.pageunit - movie.pagesize +1}"/>
						<c:set var="endIndex" value="${movie.pageunit}"/>
					</c:if>
					
				<c:forEach begin="${beginIndex}" end="${endIndex}" step="1" varStatus="status">
					<a onclick="setPageIndex('#adminMovieList', '${status.index}');" class="btn <c:if test="${movie.pageindex eq status.index}">btn-primary</c:if>">${status.index}</a>
				</c:forEach>
					<a onclick="setPageIndex('#adminMovieList', '${movie.pageunit}');" class="btn">끝으로</a>
			</div>
		</form>
	</div>
</body>
</html>