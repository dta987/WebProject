<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath = request.getContextPath() ; //현재 진행 중인 프로젝트 이름 
	String CommandName = "/MiniShopCtrl"  ; //요청을 위한 url 패턴 이름
	String MyCtrlByForm = contextPath +  CommandName ; //폼이 있는 경우에 사용된다. 
	String MyCtrlCommand = contextPath +  CommandName + "?command=" ;
	//out.print( MyCtrlCommand + "<br>" ); // Model2/MiniShopCtrl?command=
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>