<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../review/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=MyCtrlCommand%>meMypage">Brand</a>
		</div>
		<c:if test="${sessionScope.whologin == 2}" >
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-expanded="false">회원관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<%=MyCtrlCommand%>meList">회원 목록</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-expanded="false">게시판 관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<%=MyCtrlCommand%>boList">게시글 목록</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-expanded="false">소개글 관리<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">지역별</a></li>
					</ul></li>
			</ul>
		</div>
		</c:if>
	</div>
	</nav>

</body>
</html>