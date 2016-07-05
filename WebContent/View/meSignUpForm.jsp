<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../View/layout/style.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>

	<div>
		<%@ include file="rvTOP.jsp"%>
	</div>

	<form class="form-horizontal" action="<%=MyCtrlByForm%>" method="post">
		<input type="hidden" name="command" value="meSignup">
		<div class="form-group">
			<label for="ID" class="col-sm-5 control-label">ID</label>
			<div class="col-sm-2">
				<input type="id" class="form-control" id="id" name="id"
					placeholder="id">
			</div class="col-sm-1">
			<div>
				<button type="button" class="btn btn-default">중복체크</button>
			</div>
		</div>
		<div class="form-group">
			<label for="passoword" class="col-sm-5 control-label">Password</label>
			<div class="col-sm-2">
				<input type="password" class="form-control" id="password"
					name="password" placeholder="password">
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-5 control-label">Name</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="name">
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-5 control-label">email</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="email" name="email"
					placeholder="email">
			</div>
		</div>
		<div class="form-group">
			<label for="nickname" class="col-sm-5 control-label">Nickname</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="nickname"
					name="nickname" placeholder="nickname">
			</div>
			<div>
				<button type="button" class="btn btn-default">중복체크</button>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-10">
					<button type="submit" class="btn btn-default">Sign in</button>
					<button type="button" class="btn btn-default">Forgot ID/PW
						?</button>
					<button type="button" class="btn btn-default">Sign in</button>
				</div>
			</div>
	</form>

</body>
</html>