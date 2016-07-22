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

<%
	String Brandimg = contextPath + "/View/images/GreenSanIcon.png";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TOP</title>
</head>
<body>
	<nav class="navbar  navbar-default navbar-fixed-top ">
	<div class="container-fluid">
		<a class="navbar-brand" href="<%=contextPath%>/View/Main.jsp""> 
				<img src="/images/나뭇잎.png" alt="flower" width="400" height="300">
		</a>
	
		
	</div>
	</nav>


	<c:if test="${not empty requestScope.errmsg }">
		<script type="text/javascript">
			alert('${requestScope.errmsg}')
		</script>
	</c:if>
</body>
</html>