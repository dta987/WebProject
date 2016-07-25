<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 3;
	int mywidth = twelve - myoffset;
	int label = 1;
	int input = (twelve / 2) - label;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
		<br>
		<br>
		<br>
		<br>
		<div class="form-group" align="center">
		<form id="loginForm" class="form-inline" role="form" action="<%=MyCtrlByForm%>" method="post">
			<input type="hidden" name="command" value="meLogin">
			<div class="form-group" align="left">
				<label for="ID" class="col-sm-<%=label%> control-label">ID</label>
				<div class="col-sm-<%=myoffset + 1%>">
					<input type="id" class="form-control" id="id" name="id" placeholder="id" value="admin">
				</div>
				<label for="passoword" class="col-sm-<%=label + 1%> control-label">PASSWORD</label>
				<div class="col-sm-<%=input%>">
					<input type="password" class="form-control" id="password" name="password"
						placeholder="password" value="1234">
				</div>
			</div>
			<br>
			<br>
			<br>
			<br>
		</form>
	</div>
	<div class="container-fluid">
		<div class="form-group" align="center">
			<button id="mesubmit" type="button" class="topmybutton topmybutton1">LOGIN</button>
			&nbsp;&nbsp;&nbsp; <a href="#"><button type="button" class="topmybutton topmybutton1">ID/PW</button></a>
			&nbsp;&nbsp;&nbsp; <a href="<%=MyCtrlCommand%>meSignupForm"><button type="button"
					class="topmybutton topmybutton1">JOIN</button></a>
		</div>
	</div>



	<script type="text/javascript">
		$(document).ready(function() {
			$("#mesubmit").click(function() {
				$("#loginForm").submit();
			});
		});
	</script>
</body>
</html>
