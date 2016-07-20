<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../member/meMypage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="panel panel-success">
		<div class="panel-heading">일본 명산 목록</div>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>산 관리번호</th>
					<th>산 이름</th>
					<th>산 지역</th>
					<th>산 상세주소</th>
					<th>산 분류</th>
				</tr>
			</thead>

			<c:forEach var="bean" items="${requestScope.lists}">
				<tr>
					<td>${bean.mountain_no}</td>
					<td><a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}&${requestScope.parameters}">${bean.mountain_name}</a></td>
					<td>${bean.mountain_area}</td>
					<td>${bean.mountain_address}</td>
					<td>${bean.mountain_thema}</td>
					<td>
					<c:if test="${ sessioScope.loginfo.getUser_id().equals('admin') }">
						<a href="<%=MyCtrlCommand%>boUpdateForm&no=${bean.no}&${requestScope.parameters}"> 수정 </a>
					</c:if>
					<c:if test="${ sessioScope.loginfo.getUser_id() != 'admin' }">수정</c:if>
					</td>
					<td>
					<c:if test="${sessionScope.loginfo.id == bean.writer}">
						<a href="<%=MyCtrlCommand%>boDelete&no=${bean.no}&${requestScope.parameters}"> 삭제 </a>
					</c:if> 
					</td>
					<td><c:if test="${ sessioScope.loginfo.getUser_id() != 'admin' }">삭제</c:if></td>
					
				</tr>
			</c:forEach>

			<tr>
				<td colspan="10" align="center">
					<form class="form-inline" role="form" name="myform" action="<%=MyCtrlByForm%>/moList" method="get">
						<div class="form-group">
							<select class="form-control" name="mode" id="mode">
								<option value="-" selected="selected">-- 선택하세요---------
								<option value="mountain_no">산 번호
								<option value="mountain_name">산 이름
								<option value="mountain_thema">산 분류
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control btn-xs" name="keyword" id="keyword" placeholder="검색 키워드">
						</div>
						<button class="btn btn-default btn-warning" type="submit">검색</button>
						<button class="btn btn-default btn-warning" type="button" onclick="searchAll();">전체 검색</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<p class="form-control-static">${requestScope.pagingStatus}</p>
					</form>
				</td>
			</tr>

		</table>
		
		<!-- 인식 안됨 -->
		<div align="center">
			<footer>${requestScope.pagingHtml}</footer>
		</div>
	</div>
</body>
</html>
