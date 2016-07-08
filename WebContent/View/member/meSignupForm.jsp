<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../review/rvTOP.jsp"%>
<%
	int myoffset = 3;
	int mywidth = twelve - 2 * myoffset;
	int label = 4;
	int input = twelve - 2 * label;
	
	String idOverlapCheck = ""; 
	
	String pwOverlapCheck = ""; 
%>

<script>
	$(document).ready(function() {
		$("#id").keyup(function() {

			if ($("#id").val().length > 4) {
				var id = $("#id").val();
				$("#idcheck").html("<div class='alert-success col-sm-3' > 6글자이상 입니다</div>");
				$.ajax({
					type : "post",
					url : "<%=MyCtrlCommand%>meIDcheck",
					dataType : "JSON",
					data : {
						"id" : $("#id").val(),
					},
					success : function(obj) {
						var result = JSON.parse(obj);
						if(result.check) {
							$("#idcheck").html("<div class='alert-success col-sm-3' > 사용가능한 아이디 입니다</div>");
						} else {
							$("#idcheck").html("<div class='alert-danger col-sm-3' > 이미 사용중입 아이디입니다</div>");
						}
					}
				});
			} else {
				$("#idcheck").html("<div class='alert-danger col-sm-3'> 6글자이상 입력해주세요</div>");
			}
		});
	});
</script>
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
					<input type="text" class="form-control" id="id" name="id" placeholder="id">
				</div class="col-sm-1">
				<div id="idcheck">
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