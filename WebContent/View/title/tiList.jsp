<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 1;
	int mywidth = twelve - 2 * myoffset;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<head>
<style>

tr:hover{background-color:#cbe7cb}

</style>

</head>
<body>
<br><br>
	<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
	<label>TITLE LIST</label><br><br>
	<table class="table" align="center">
			<thead>
				<tr> 
					<th>&nbsp;&nbsp;&nbsp;&nbsp;번호</th>
					<th>타이틀 명</th>
					<th>타이틀 컨디션</th>
					<th>사진</th>
				</tr>
			</thead>
			
			<c:forEach var="bean" items="${requestScope.lists}">
				<tr>
					<td>${bean.title_no}</td>
					<td>${bean.title_name}</td>
					<td>${bean.title_condition}</td>
					<td>${bean.title_img}</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="10" align="center">
					<form class="form-inline" role="form" name="myform" action="<%=MyCtrlByForm%>tiListForm"
						method="post">
						<div class="form-group">
							<select class="form-control" name="mode" id="mode">
								<option value="-" selected="selected">-- 선택하세요---------
								<option value="title_no">타이틀 번호
								<option value="title_name">타이틀 이름
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
					
			
			
			
</body>
</html>