<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 1;
	int mywidth = twelve - 2 * myoffset;
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
<head>
<style>
tr:hover {
	background-color: #cbe7cb
}
</style>

</head>
<body>
	<br>
	<br>
	<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<!-- <div class="panel-heading">게시판</div> -->
		<label>BOARD LIST</label><br> <br>
		<table class="table" align="center">
			<thead>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th>수정일자</th>
					<th>조회수</th>
					<c:if test="${sessionScope.whologin == 2}">
						<th>수정</th>
						<th>삭제</th>
					</c:if>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
					<tr>
						<td>${bean.board_no}</td>
						<td><a
							href="<%=MyCtrlCommand%>boDetailView&no=${bean.board_no}&id=${bean.board_writer}&${requestScope.parameters}">${bean.board_title}</a></td>
						<td>${bean.user_nickname}</td>
						<td>${bean.board_writ_date}</td>
						<td>${bean.board_update}</td>
						<td>${bean.board_readhit}</td>
						<td><c:if test="${sessionScope.whologin == 2}">
								<a href="<%=MyCtrlCommand%>boUpdateForm&no=${bean.board_no}&${requestScope.parameters}">
									수정 </a>
							</c:if></td>
						<td><c:if test="${sessionScope.whologin == 2}">
								<a id="del" href="<%=MyCtrlCommand%>boDelete&no=${bean.board_no}&${requestScope.parameters}">
									삭제 </a>
							</c:if></td>

					</tr>
				</c:forEach>
			</tbody>

			<tr>
				<td colspan="10" align="center">
					<form class="form-inline" role="form" name="myform" action="<%=MyCtrlByForm%>" method="post">
					<input type="hidden" name="command" value="boList">
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
						<button id="search" class="topmybutton topmybutton1" type="submit">SEARCH</button>
						<button class="topmybutton topmybutton1" type="button" id="searchAll">ALL</button>
						<button class="topmybutton topmybutton1" type="button" id="insertForm">WRITE</button>
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
		$("#search").click(function() {
			if($("#mode").val() != "-") {
				if($("#keyword").val() == "" || $("#keyword").val() != null) {
					return true;
				} else {
					alert("키워드 값을 입력해주세요");
					return false;
				}
			} else {
				alert("검색 모드를 선택해주세요");
				return false;
			}
			
		});
	});
	
	$(document).ready(function() {
		$("#searchAll").click(function() {
			location.href = '<%=MyCtrlCommand%>boList'
		});
	});
	$(document).ready(function() {
		$("#insertForm").click(function() {
			if("${sessionScope.whologin}" != 0) { 
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

		$(document).ready(function() {
			$("#del").click(function() {
				var result = confirm("삭제 하시겠습니까??");
				if (result) {
					return true;
				}
				return false;
			});
		});
	</script>
</body>
</html>
