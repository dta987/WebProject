<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
#navbar {
	background-color:
}

#container-fluid {
	padding-right: 10 px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${whologin == 0}">
				<ul class="pager">
					<li><a href="<%=MyCtrlCommand%>meLoginForm">로그인</a></li>
					<li><a href="<%=MyCtrlCommand%>meSignupForm">회원가입</a></li>
				</ul>
			</c:if>
			<c:if test="${whologin != 0}">
				<ul class="pager">
					<li><a href="<%=MyCtrlCommand%>meMypage"><%=loginfo.getUser_nickname()%></a></li>
					<li><a href="<%=MyCtrlCommand%>meLogout">로그아웃</a></li>
				</ul>
			</c:if>
		</ul>
	</div>

	<div class="container-fluid" align="center">
		<a href="<%=contextPath%>/View/Main.jsp"><img alt="main_img" src="<%=contextPath%>/View/images/나뭇잎.png"></a>
	</div>
	<div class="container-fluid" align="center">
		<a href="#">MOUNTAIN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=MyCtrlCommand%>boList">BOARD</a>
	</div><br><br><br>

	<c:if test="${not empty requestScope.errmsg }">
		<script type="text/javascript">
			alert('${requestScope.errmsg}')
		</script>
	</c:if>
</body>
</html>