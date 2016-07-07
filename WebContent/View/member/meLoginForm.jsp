<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../review/rvTOP.jsp"%>
<%
	int myoffset = 3;
	int mywidth = twelve - 2 * myoffset;
	int label = 4;
	int input = twelve - 2 * label;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

	<div class="col-md-offset-<%=myoffset%> col-md-<%=mywidth%>">

		<div style="text-align: center">
			<img width="30%" height="40%" src="<%=contextPath%>/View/images/산타니05.jpg"> <br> 
			<img width="50%" height="40%" src="<%=contextPath%>/View/images/yamaman01.jpg"> <br>
		</div>
		<form class="form-horizontal" action="<%=MyCtrlByForm%>" method="post">
			<input type="hidden" name="command" value="meLogin">
			<div class="form-group">
				<label for="ID" class="col-sm-<%=label%> control-label">ID</label>
				<div class="col-sm-<%=input%>">
					<input type="id" class="form-control" id="id" name="id" placeholder="id">
				</div>
			</div>
			<div class="form-group">
				<label for="passoword" class="col-sm-<%=label%> control-label">Password</label>
				<div class="col-sm-<%=input%>">
					<input type="password" class="form-control" id="password" name="password" placeholder="password">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-<%=label%> col-sm-<%=twelve - label%>">
					<button type="submit" class="btn btn-default btn-sm">로그인</button>
					<button type="button" class="btn btn-default btn-sm">>ID/PW 찾기</button>
					<button type="button" class="btn btn-default btn-sm">>회원가입</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>