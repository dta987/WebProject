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

	<div class="col-md-offset-<%=myoffset%> col-md-<%=mywidth%>"">

		<form class="form-horizontal" action="<%=MyCtrlByForm%>" method="post">
			<input type="hidden" name="command" value="meSignup">

			<div class="form-group">
				<label for="ID" class="col-sm-<%=label%> control-label">ID</label>
				<div class="col-sm-<%=input%>">
					<input type="id" class="form-control" id="id" name="id" placeholder="id">
				</div class="col-sm-1">
				<div>
					<button type="button" class="btn btn-default">중복체크</button>
				</div>
			</div>
			<div class="form-group">
				<label for="passoword" class="col-sm-<%=label%> control-label">Password</label>
				<div class="col-sm-<%=input%>">
					<input type="password" class="form-control" id="password" name="password"
						placeholder="password">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-<%=label%> control-label">Name</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="name" name="name" placeholder="name">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-<%=label%> control-label">email</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="email" name="email" placeholder="email">
				</div>
			</div>
			<div class="form-group">
				<label for="nickname" class="col-sm-<%=label%> control-label">Nickname</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="nickname" name="nickname" placeholder="nickname">
				</div>
				<div>
					<button type="button" class="btn btn-default">중복체크</button>
				</div>
				<br>
				<div class="form-group">
					<div class="col-sm-offset-<%=label%> col-sm-<%=twelve - label%>">
						<button type="submit" class="btn btn-default">저 장</button>
						<button type="reset" class="btn btn-default">취 소</button>
					</div>
				</div>
		</form>
	</div>
</body>
</html>