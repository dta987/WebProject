<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../member/meMypage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="panel panel-primary">
		<div class="panel-heading">회원목록</div>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>닉네임</th>
					<th>가입일자</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>

			<c:forEach var="bean" items="${requestScope.lists}">
				<tr>
					<td>${bean.user_id}</td>
					<td><a href="<%=MyCtrlCommand%>meDetailView&id=${bean.user_id}">${bean.user_name}</a></td>
					<td>${bean.user_email}</td>
					<td>${bean.user_nickname}</td>
					<td>${bean.sign_date}</td>
					<td><a href="<%=MyCtrlCommand%>meUpdateFrom&id=${bean.user_id}">수정</a></td>
					<td><a href="<%=MyCtrlCommand%>myDelete&id=${bean.user_id}">삭제</a></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="10" align="center">
					<form class="form-inline" role="form" name="myform" action="<%=MyCtrlByForm%>" method="get">
					<input type="hidden" name="command" value="meList">
						<div class="form-group">
							<select class="form-control" name="mode" id="mode">
								<option value="-" selected="selected">-- 선택하세요---------
								<option value="user_name">이름
								<option value="user_id">아이디
								<option value="user_nickname">닉네임
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control btn-xs" name="keyword" id="keyword"
								placeholder="검색 키워드">
						</div>
						<button class="btn btn-default btn-warning" type="submit">검색</button>
						<button class="btn btn-default btn-warning" type="button" onclick="searchAll();">전체
							검색</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<p class="form-control-static">${requestScope.pagingStatus}</p>
					</form>
				</td>
			</tr>
		</table>
		<div align="center">
			<footer>${requestScope.pagingHtml}</footer>
		</div>
	</div>
</body>
</html>