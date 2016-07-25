<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
#main {
	padding-top: 17%;
}


.mybutton {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    size:10px;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    
}

.mybutton1 {
    background-color: white; 
    color: #4CAF50; 
    border: 2px solid #4CAF50;
    border-radius: 24px;    
}

.mybutton1:hover {
    background-color: #4CAF50;
    color: white;
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

</style>

</head>
<body>
	<div align="center" id="main">

		<a href="Main.jsp"><img alt="main_img" src="../View/images/나뭇잎.png"></a>
		<br><br>
		<a href="Main.jsp"><button type="button" class="mybutton mybutton1">Y A M A M A N</button></a>

	</div>
</body>
</html>
