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
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th>수정일자</th>
					<th>조회수</th>
					<th>수정</th>
					<th>삭제</th>
					<th>답글</th>
				</tr>
			</thead>

			<c:forEach var="bean" items="${requestScope.lists}">
				<tr>
					<td>${bean.board_no}</td>
					<td>${bean.board_title}</td>
					<td>${bean.user_nickname}</td>
					<td>${bean.board_writ_date}</td>
					<td>${bean.board_update}</td>
					<td>${bean.board_readhit}</td>
					<td>수정</td>
					<td>삭제</td>
					<td>답글</td>
				</tr>
			</c:forEach>


			</div>
</body>
</html>
