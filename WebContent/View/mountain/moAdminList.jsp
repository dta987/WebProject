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
		<label>MOUNTAIN LIST</label><br> <br>
		<table class="table" align="center">
			<thead>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;번호</th>
					<th>지역</th>
					<th>산 이름</th>
					<th>작성일자</th>
					<th>테 마</th>
					<th>상세테마</th>
					<c:if test="${sessionScope.whologin == 2}">
						<th>수정</th>
						<th>삭제</th>
					</c:if>
				</tr>
			</thead>

			<c:forEach var="bean" items="${requestScope.lists}">
				<tr>
					<td>${bean.mountain_no}</td>
					<td>${bean.mountain_area}</td>
					<td><a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}&${requestScope.parameters}">${bean.mountain_name}</a></td>
					<td>${bean.update_date}</td>
					<td>${bean.mountain_thema}</td>
					<td>${bean.mountain_thema2}</td>
					<td><c:if test="${sessionScope.whologin == 2}">
							<a href="<%=MyCtrlCommand%>moUpdateForm&no=${bean.mountain_no}&${requestScope.parameters}">
								수정 </a>
						</c:if></td>
					<td><c:if test="${sessionScope.whologin == 2}">
							<a id="del" href="<%=MyCtrlCommand%>moDelete&no=${bean.mountain_no}&${requestScope.parameters}">
								삭제 </a>
						</c:if></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="10" align="center">
					<form class="form-inline" role="form" name="myform" action="<%=MyCtrlByForm%>"method="post">
					<input type="hidden" name="command" value="moAdminList">
						<div class="form-group">
							<select class="form-control" name="mode" id="mode">
								<option value="-" selected="selected">-- 선택하세요---------
								<option value="mountain_no">산 번호
								<option value="mountain_name">산 이름
								<option value="mountain_area">지 역
								<option value="mountain_thema">테 마 
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control btn-xs" name="keyword" id="keyword"
								placeholder="검색 키워드">
						</div>
						<button class="topmybutton topmybutton1" type="submit">SEARCH</button>
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
			location.href = '<%=MyCtrlCommand%>moAdminList'
		});
	});
	$(document).ready(function() {
		$("#insertForm").click(function() {
			if("${sessionScope.whologin}" != 0) { 
				location.href = "<%=MyCtrlCommand%>moInsertForm";
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
		
		$(document).ready(function() {
			$("#gotoback").click(function() {
				location.href='<%=MyCtrlCommand%>moAdminList&${requestScope.parameters}';
				});
			});//뒤로가기
	</script>
</body>
</html>
