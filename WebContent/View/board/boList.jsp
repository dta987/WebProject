<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../member/meMypage.jsp"%>

<%
	url = "/View/Main.jsp";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <script type="text/javascript">
	function gotoForm(){
		location.href='<%=MyCtrlCommand%>boInsertForm';
	}
</script> --%>
</head>
<body>
	<div class="panel panel-success">
		<div class="panel-heading">게시판</div>
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
					<td><a
						href="<%=MyCtrlCommand%>boDetailView&no=${bean.board_no}&id=${bean.user_writer}&${requestScope.parameters}">${bean.board_title}</a></td>
					<td>${bean.user_nickname}</td>
					<td>${bean.board_writ_date}</td>
					<td>${bean.board_update}</td>
					<td>${bean.board_readhit}</td>
					<td><c:if test="${sessionScope.whologin == 2}">
							<a href="<%=MyCtrlCommand%>boUpdateForm&no=${bean.no}&${requestScope.parameters}"> 수정 </a>
						</c:if></td>
					<td><c:if test="${sessionScope.whologin == 2}">
							<a href="<%=MyCtrlCommand%>boDelete&no=${bean.no}&${requestScope.parameters}"> 삭제 </a>
						</c:if></td>
					<td>
						<!--  관리자만 게시물리스트에 직접 게시물 밑에 댓글형식의 게시글을 쓸 수 있다. 위 게시글의 상태나 변경을 리스트에서 바로 나타내도록   보통 유저들은 DetailView에서 Reply 가능 -->
						<c:if test="${bean.depth <= 1 and sessionScope.whologin == 2 }">
							<a
								href="<%=MyCtrlCommand%>boReplyForm&no=${bean.no}&${requestScope.parameters}&groupno=${bean.groupno}&orderno=${bean.orderno}&depth=${bean.depth}">
								답글 </a>
						</c:if>
					</td>

				</tr>
			</c:forEach>

			<tr>
				<td colspan="10" align="center">
					<form class="form-inline" role="form" name="myform" action="<%=MyCtrlByForm%>boListForm"
						method="post">
						<div class="form-group">
							<select class="form-control" name="mode" id="mode">
								<option value="-" selected="selected">-- 선택하세요---------
								<option value="board_no">글 번호
								<option value="board_title">제목
								<option value="user_nickname">닉네임
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control btn-xs" name="keyword" id="keyword"
								placeholder="검색 키워드">
						</div>
						<button class="btn btn-default btn-warning" type="submit">검색</button>
						<button class="btn btn-default btn-warning" type="button" id="searchAll">전체 검색</button>
						<button class="btn btn-default btn-warning" type="button" id="insertForm">글쓰기</button>
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

	<script type="text/javascript">
	$(document).ready(function() {
		$("#searchAll").click(function() {
			location.href = '<%=MyCtrlCommand%>boList'
		});
	});
	$(document).ready(function() {
		$("#insertForm").click(function() {
			if(${sessionScope.whologin} != 0) { 
				alert("${sessionScope.whologin != 0}");
				location.href = "<%=MyCtrlCommand%>boInsertForm";
			} else {
				alert("로그인 해주세요");
				location.href = "<%=MyCtrlCommand%>meLoginForm";
				}
			});
		});

		$(document).ready(function() {
			$("#mode option").each(function(index) {
				if ($(this).val() == "${requestScope.mode}") {
					$(this).attr("selected", "selected");
				}
			});
		});

		$(document).ready(function() {
			$("#keyword").val("${requestScope.keyword}");
		});
	</script>
</body>
</html>
