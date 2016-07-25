<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Member"%>
<%@ include file="./../../common/common.jsp"%>
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
<script type="text/javascript">
function function1(  ){
	alert('') ;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TOP</title>
<style type="text/css">
.navbar-right {
	margin-right: 5px;
}
</style>

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

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 70px;
	left: 0;
	background-color: #cbe7cb;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus {
	color: #f1f1f1;
}

.closebtn {
	position: absolute;
	top: 0px;
	right: 20px;
	font-size: 36px !important;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
	
	.scrollsidenav {
		padding-top: 15px;
	}
	.scrollsidenav a {
		font-size: 18px;
	}
}
</style>

</head>
<body>
<div class="container-fluid">
	<c:if test="${sessionScope.whologin != 0}">
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><span
				class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
			<c:if test="${sessionScope.whologin == 2}">
				<a href="<%=MyCtrlCommand%>meList">MEMBER</a>
				<a href="<%=MyCtrlCommand%>boList">BOARD</a>
				<a href="<%=MyCtrlCommand%>moAdminList">MOUNTAIN</a>
				<a href="<%=MyCtrlCommand%>tiList">TITLE</a>
			</c:if>
			<c:if test="${sessionScope.whologin == 1}">
				<a href="<%=MyCtrlCommand%>boMyList&id=<%=loginfo.getUser_id()%>">내가 쓴글</a>
				<a href="<%=MyCtrlCommand%>boMyReplyList&id=<%=loginfo.getUser_id()%>">내가 단 덧글</a>
				<a href="<%=MyCtrlCommand%>boList">등산목록</a>
				<a href="<%=MyCtrlCommand%>tiList">타이틀</a>
			</c:if>
		</div>

		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">☰</span>
	</c:if>

	<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>


	<nav id="scrollMenu" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<ul class="nav navbar-nav navbar-left">
			<c:if test="${sessionScope.whologin != 0}">
				<div id="mySidenav" class="sidenav" >
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()"><span
						class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
					<c:if test="${sessionScope.whologin == 2}">
						<hr>
						<a href="<%=MyCtrlCommand%>meList">MEMBER</a>
						<a href="<%=MyCtrlCommand%>boList">BOARD</a>
						<a href="<%=MyCtrlCommand%>moMain">MOUNTAIN</a>
						<a href="<%=MyCtrlCommand%>tiList">TITLE</a>
					</c:if>
					<c:if test="${sessionScope.whologin == 1}">
						<hr>
						<a href="<%=MyCtrlCommand%>boList">내가 쓴글</a>
						<a href="<%=MyCtrlCommand%>meList">내가 단 덧글</a>
						<a href="<%=MyCtrlCommand%>boList">등산목록</a>
						<a href="<%=MyCtrlCommand%>tiList">타이틀</a>
					</c:if>
				</div>

				<span style="font-size: 30px; cursor: pointer" onclick="openNav()">☰</span>
			</c:if>
		</ul>

		<ul class="nav navbar-nav navbar">
			<li>
				<p class="navbar-text">
					<a href="<%=MyCtrlCommand%>moMain">MOUNTAIN</a> &nbsp;&nbsp;&nbsp; <a
						href="<%=MyCtrlCommand%>boList">BOARD</a>
				</p>
			</li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<c:if test="${whologin == 0}">
				<li>
					<p class="navbar-text">
						<a href="<%=MyCtrlCommand%>meLoginForm"><button type="button"
								class="topmybutton topmybutton1">LOGIN</button></a> <a href="<%=MyCtrlCommand%>meSignupForm"><button
								type="button" class="topmybutton topmybutton1">JOIN</button></a>
					</p>
				</li>
			</c:if>
			<c:if test="${whologin != 0}">
				<li>
					<p class="navbar-text">
						<button type="button" class="topmybutton topmybutton1"><%=loginfo.getUser_nickname()%> </button></a> <a
							href="<%=MyCtrlCommand%>meLogout"><button type="button" class="topmybutton topmybutton1">LOGOUT</button></a>
					</p>
				</li>
			</c:if>
		</ul>
	</div>
	</nav>
	<ul class="nav navbar-nav navbar-right">
		<c:if test="${whologin == 0}">
			<li>
				<p class="navbar-text">
					<a href="<%=MyCtrlCommand%>meLoginForm"><button type="button"
							class="topmybutton topmybutton1">LOGIN</button></a> <a href="<%=MyCtrlCommand%>meSignupForm"><button
							type="button" class="topmybutton topmybutton1">JOIN</button></a>
				</p>
			</li>
		</c:if>
		<c:if test="${whologin != 0}">
			<li>
				<p class="navbar-text">
					<button type="button" class="topmybutton topmybutton1"><%=loginfo.getUser_nickname()%></button></a>
					<a href="<%=MyCtrlCommand%>meLogout"><button type="button" class="topmybutton topmybutton1">LOGOUT</button></a>
				</p>
			</li>
		</c:if>
	</ul>
	</div>

	<div class="container-fluid" align="center" style="font-size: 40px">
		Y A M A <a href="<%=contextPath%>/View/Main.jsp"><img alt="main_img"
			src="<%=contextPath%>/View/images/중간나뭇잎.png"></a> M A N
	</div>
	<div class="container-fluid" align="center">
		<br> <a href="<%=MyCtrlCommand%>moMain">MOUNTAIN</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
			href="<%=MyCtrlCommand%>boList">BOARD</a>
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
		
		$(document).ready(function() {
			$("#loginbtn").click(function() {
				location.href="<%=MyCtrlCommand%>meLoginForm";
			});
		});
	</script>
</body>
</html>
