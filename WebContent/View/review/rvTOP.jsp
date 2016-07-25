<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.Member"%>
<%@ include file="../../common/common.jsp"%>

<%
	String myurl = request.getRequestURI().toString();
	String uri = request.getRequestURI();
	int idx = myurl.indexOf(uri);

	String url = "/View/Main.jsp";
	//웹 서버의 이미지를 올릴경로
	String uploadPath = "/upload/";
	String uploadedFolder = myurl.substring(0, idx) + contextPath
			+ uploadPath;

	/* 	out.print("url=" + myurl + "<br>");
	 out.print("uri=" + uri + "<br>");
	 out.print("uploadedFolder=" + uploadedFolder + "<br>");

	 String realPath1 = application.getRealPath(uploadPath);
	 out.print("realPath1=" + realPath1 + "<br>");  */
%>

<%
	Member loginfo = (Member) session.getAttribute("loginfo");

	int whologin = 0; // 0 : 미로그인,  1 : 회원 로그인, 2 : 관리자 로그인

	if (loginfo == null) {
		whologin = 0;

	} else { //관리자는 아이디가 admin이라고 가정한다.
		if (loginfo.getUser_id().equals("admin")) {
			whologin = 2;
		} else {
			whologin = 1; //일반 사용자 로그인 
		}
	}
	//out.println("whologin : " + whologin);
	session.setAttribute("whologin", whologin);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TOP</title>

<style type="text/css">
.topmybutton {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.topmybutton1 {
	background-color: white;
	color: #4CAF50;
	border: 2px solid #4CAF50;
	border-radius: 20px;
}

.topmybutton1:hover {
	background-color: #4CAF50;
	color: white;
}
</style>

</head>
<body>

	<nav id="scrollMenu" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<c:if test="${sessionScope.whologin != 0}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">MY PAGE<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<c:if test="${sessionScope.whologin == 1}">
								<li><a href="<%=MyCtrlCommand%>boList">내 게시글 목록</a></li>
								<li><a href="<%=MyCtrlCommand%>boList">내 댓글 목록</a></li>
								<li><a href="<%=MyCtrlCommand%>boList">회원정보</a></li>
								<li><a href="<%=MyCtrlCommand%>boList">등산목록</a></li>
							</c:if>

							<c:if test="${sessionScope.whologin == 2}">
								<li><a href="<%=MyCtrlCommand%>boList">게시글 목록</a></li>
								<li><a href="<%=MyCtrlCommand%>boList">회원 목록</a></li>
								<li><a href="<%=MyCtrlCommand%>boList">타이틀 관리</a></li>
								<li><a href="<%=MyCtrlCommand%>boList">산 관리</a></li>
							</c:if>
						</ul></li>
				</c:if>
				<li>
					<p class="navbar-text">
						<c:forEach var="i" begin="1" end="37" step="1">
						&nbsp;&nbsp;&nbsp;
						</c:forEach>
						<a href="#">MOUNTAIN</a> &nbsp;&nbsp;&nbsp; <a
							href="<%=MyCtrlCommand%>boList">BOARD</a>
						<c:forEach var="i" begin="1" end="8" step="1">
						&nbsp;&nbsp;
						</c:forEach>
						<a href="<%=MyCtrlCommand%>meLoginForm"><button type="button"
								class="topmybutton topmybutton1">LOGIN</button></a> <a
							href="<%=MyCtrlCommand%>meSignupForm"><button type="button"
								class="topmybutton topmybutton1">JOIN</button></a>
					</p>
				</li>

				<%-- <li>
					<p class="navbar-text">
					<c:forEach var="i" begin="1" end="35" step="1">
					&nbsp;&nbsp;
					</c:forEach>
					<a href="<%=MyCtrlCommand%>meLoginForm"><button type="button" class="mybutton mybutton1">LOGIN</button></a>
					<a href="<%=MyCtrlCommand%>meSignupForm"><button type="button" class="mybutton mybutton1">JOIN</button></a>
					</p>
				</li> --%>

			</ul>
		</div>
	</div>
	</nav>



	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<c:if test="${whologin == 0}">
				<li>
					<p class="navbar-text">
						<c:forEach var="i" begin="1" end="39" step="1">
						&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
						<a href="<%=MyCtrlCommand%>meLoginForm"><button type="button"
								class="topmybutton topmybutton1">LOGIN</button></a> <a
							href="<%=MyCtrlCommand%>meSignupForm"><button type="button"
								class="topmybutton topmybutton1">JOIN</button></a>
					</p>
				</li>
			</c:if>
			<c:if test="${whologin != 0}">
				<li>
					<p class="navbar-text">
						<a href="<%=MyCtrlCommand%>meMypage"><button type="button"
								class="topmybutton topmybutton1"><%=loginfo.getUser_nickname()%></button></a>

						
						<c:forEach var="i" begin="1" end="39" step="1">
						&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
						<a href="<%=MyCtrlCommand%>meLogout"><button type="button"
								class="topmybutton topmybutton1">LOGOUT</button></a>
					</p>
				</li>
			</c:if>
		</ul>

		<%-- <ul class="nav navbar-nav navbar-right">
			<c:if test="${whologin == 0}">
				<ul class="pager">
					<li>
					<a href="<%=MyCtrlCommand%>meLoginForm"><button type="button" class="topmybutton topmybutton1">LOGIN</button></a>
					<a href="<%=MyCtrlCommand%>meSignupForm"><button type="button" class="topmybutton topmybutton1">JOIN</a> 
					</li>
				</ul>
			</c:if>
			<c:if test="${whologin != 0}">
				<ul class="pager">
					<li><a href="<%=MyCtrlCommand%>meMypage"><%=loginfo.getUser_nickname()%></a></li>
					<li><a href="<%=MyCtrlCommand%>meLogout">LOGOUT</a></li>
				</ul>
			</c:if>
		</ul> --%>
	</div>

	<div class="container-fluid" align="center" style="font-size: 40px">
		Y A M A <a href="<%=contextPath%>/View/Main.jsp"><img
			alt="main_img" src="<%=contextPath%>/View/images/중간나뭇잎.png"></a> M
		A N
	</div>
	<div class="container-fluid" align="center">
		<br> <a href="#">MOUNTAIN</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=MyCtrlCommand%>boList">BOARD</a>
	</div>

	<br>
	<br>


	<c:if test="${not empty requestScope.errmsg }">
		<script type="text/javascript">
			alert('${requestScope.errmsg}')
		</script>
	</c:if>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#scrollMenu").hide();
			$(function() {
				$(window).scroll(function() {
					if ($(this).scrollTop() > 100) {
						$("#scrollMenu").fadeIn();
					} else {
						$("#scrollMenu").fadeOut();
					}
				})
			});
		});
	</script>
</body>
</html>