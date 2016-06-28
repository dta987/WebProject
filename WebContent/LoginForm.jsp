<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%@ include file="TOP.jsp"%>
	</div>

	<div style="text-align: center">
		<img width="10%" height="10%" src="IMG/산타니05.jpg"> <br> <img
			width="20%" height="20%" src="IMG/yamaman01.jpg"> <br>
	</div>
	<form class="form-horizontal" action="Login.servlet">
		<div class="form-group">
			<label for="ID" class="col-sm-5 control-label">ID</label>
			<div class="col-sm-2">
				<input type="id" class="form-control" id="id" name="id" placeholder="id">
			</div>
		</div>
		<div class="form-group">
			<label for="passoword" class="col-sm-5 control-label">Password</label>
			<div class="col-sm-2">
				<input type="password" class="form-control" id="password" name="password"
					placeholder="password">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-5 col-sm-10">
				<div class="checkbox">
					<label> <input type="checkbox"> Remember me
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-5 col-sm-10">
				<button type="submit" class="btn btn-default">Login</button>
				<button type="button">Forgot ID/PW ?</button>
				<button type="button">Sign in</button>
			</div>
		</div>
	</form>



</body>
</html>