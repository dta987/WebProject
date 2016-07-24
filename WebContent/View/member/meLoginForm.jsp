<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>

<%
	int myoffset = 4;
	int mywidth = twelve - 2 * myoffset;
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
	<div class="container-fluid col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<form id="loginForm" class="form-inline" role="form" action="<%=MyCtrlByForm%>" method="post">
			<input type="hidden" name="command" value="meLogin">
			<div class="form-group" align="left">
				<label for="ID" class="col-sm-<%=label%> control-label">ID</label>
				<div class="col-sm-<%=input%>">
					<input type="id" class="form-control" id="id" name="id" placeholder="id" value="admin">
				</div>
				<label for="passoword" class="col-sm-<%=label%> control-label">PW</label>
				<div class="col-sm-<%=input%>">
					<input type="password" class="form-control" id="password" name="password"
						placeholder="password" value="1234">
				</div>
			</div><br><br>
		</form>
	</div>
	<div class="container-fluid col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="form-group">
			<div class="col-sm-offset-<%=label%> col-sm-<%=twelve - label%>">
				<button id="mesubmit" type="button" class="btn btn-default btn-sm">로그인</button>
				<button type="button" class="btn btn-default btn-sm">ID/PW 찾기</button>
				<a href="<%=MyCtrlCommand%>meSignupForm">
					<button type="button" class="btn btn-default btn-sm">회원가입</button>
				</a>
			</div>
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