<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		
		<form action="action_page.php">
		  ID  <input type="text" name="id" value="id">
		  <br><br>
		  PassWord <input type="text" name="password" value="password">
		  <br><br>
		  <input align="right" type="submit" value="LOGIN">
		  <br><br>
		  <input type="button" value="Forgot?">
		  <input type="button" value="Register">
		  
		</form>  -->

	<form class="form-horizontal" >
		<div class="form-group"  style="text-align: center">
			
			<img width="10%" height="10%" src="산타니05.jpg" >
			<br>
			<img width="20%" height="20%" src="yamaman01.jpg">
			<br>
				<label 
					class="col-sm-2 control-label">ID &nbsp;&nbsp;</label> <input
					align="center" type="text" class="form-control" id="id"
					placeholder="id"> <br>
		</div>
		<br>
	
		<div class="form-group" style="text-align: center">
			<label for="inputPassword3" class="col-sm-2 control-label">Password &nbsp;&nbsp;</label>
			<input type="password" class="form-control" id="inputPassword3"
				placeholder="Password">
		</div>
		<br>
	
		
		<div class="form-group" >
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">LOGIN</button>
				<button type="button">Forgot ID/PW ?</button>
				<button type="button">Sign in</button>
				
			</div>
		</div>

	</form>

</body>
</html>