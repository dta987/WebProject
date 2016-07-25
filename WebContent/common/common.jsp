<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int twelve = 12;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath = request.getContextPath(); //현재 진행 중인 프로젝트 이름 
	String CommandName = "/YamaManCtrl"; //요청을 위한 url 패턴 이름
	String MyCtrlByForm = contextPath + CommandName; //폼이 있는 경우에 사용된다. 
	String MyCtrlCommand = contextPath + CommandName + "?command=";
	//out.print( MyCtrlCommand + "<br>" ); // Model2/MiniShopCtrl?command=
%>

<%
	String myurl = request.getRequestURL().toString();
	String uri = request.getRequestURI();
	String relativeWebPath = "/View/images/일본산이미지";
	String absoluteWebPath = getServletContext().getRealPath(relativeWebPath);
	
	
	
	int idx = myurl.indexOf(uri);

	String url = "/View/Main.jsp";
	//웹 서버의 이미지를 올릴경로
	String uploadPath = "/upload/";
	String uploadedFolder = myurl.substring(0, idx) + contextPath
			+ uploadPath;

  	/*
  	out.print("url=" + myurl + "<br>");
	out.print("uri=" + uri + "<br>");
	out.print("uploadedFolder=" + uploadedFolder + "<br>");
	out.print("absoluteWebPath : "+absoluteWebPath+"<Br>");
	String realPath1 = application.getRealPath(uploadPath);
	out.print("realPath1=" + realPath1 + "<br>");
	*/   
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- 부트스트랩 -->



<link rel="stylesheet" href="<%=contextPath%>/View/layout/Style.css">

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">

<title>Insert title here</title>
</head>
<body>
</body>
</html>
