<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>

<%
	int myoffset = 3;
	int mywidth = twelve - 2 * myoffset;
	int label = 4;
	/* int input = twelve - 2 * label; */
	int input = twelve - (label + 2);

	boolean idOverlapCheck = false;
	boolean nicknameOverlapCheck = false;
	boolean pwOverlapCheck = false;

	String img = contextPath + "/View/images/산타니05.jpg";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.imabutton {
	background-color: #cbe7cb;
	border: none;
	color: white;
	padding: 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.imamybutton1 {
	background-color: white;
	color: #cbe7cb;
	border: 2px solid #cbe7cb;
	border-radius: 20px;
}

.imamybutton1:hover {
	background-color: #cbe7cb;
	color: white;
}
</style>
</head>
<body>
	<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<form id="Update" class="form-horizontal" action="<%=MyCtrlByForm%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="meUpdate">
			<table>
				<td>
					<div id="iddiv" class="form-group has-feedback">
						<label for="ID" class="col-sm-<%=label%> control-label">ID</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="id" name="id"
								disabled="disabled" value="${bean.user_id}"> <span
								id="idspan" class="glyphicon form-control-feedback"></span>
								<input type="hidden" name="id" id="id" value="${bean.user_id}">
						</div>
					</div>
					<div id="pwdiv" class="form-group has-feedback">
						<label for="passoword" class="col-sm-<%=label%> control-label">PW</label>
						<div class="col-sm-<%=input%>">
							<input type="password" class="form-control" id="password"
								name="password" value="${bean.user_password}"> <span
								id="pwspan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="pwcheck"></div>
					</div>
					
					<div class="form-group">
						<label for="name" class="col-sm-<%=label%> control-label">NAME</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="name" name="name"
								value="${bean.user_name}">
						</div>
					</div>
					<div id="emaildiv" class="form-group has-feedback">
						<label for="email" class="col-sm-<%=label%> control-label">E-MAIL</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="email" name="email"
								value="${bean.user_email}"> <span id="emailspan"
								class="glyphicon form-control-feedback"></span>
						</div>
						<div id="emailcheck"></div>
					</div>
					<div id="nicknamediv" class="form-group has-feedback">
						<label for="nickname" class="col-sm-<%=label%> control-label">NICKNAME</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="nickname"
								name="nickname" value="${bean.user_nickname}"> <span
								id="nicknamespan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="nicknamecheck"></div>
					</div>
				</td>
				<td>
					<div class="form-group" align="center">
						&nbsp;&nbsp; <img id="user_img"
							src="<%=uploadedFolder%>${bean.user_img}" class="img-rounded"
							alt="Cinque Terre" width="200px" height="200px">
					</div>
					<div class="form-group" align="center">
					
						<button type="button" id="image_add"
							class="imamybutton imamybutton1">IMAGE</button>
						&nbsp;&nbsp;
						<button type="button" id="image_remove"
							class="imamybutton imamybutton1">DELETE</button>
						<input type="file" name="image" id="image" class="hide">
					</div>
					<div class="form-group" align="right">
						<br>
						<button type="submit" class="topmybutton topmybutton1">CORRECT</button>
						&nbsp;
						<button type="reset" class="topmybutton topmybutton1">BACK</button>
						<br>
					</div>
				</td>

			</table>
		</form>
	</div>

	<script>
	$(document).ready(function() {
			$("#image").change(function(){
				var ext = $('#image').val().split('.').pop().toLowerCase();
				if($.inArray(ext, ['png','jpg','jpeg']) == -1) {
					alert("gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.");
					$("#image").val("");
					} else {
						var thisDom = $("#image")[0];
						if(thisDom.files && thisDom.files[0]){
							var file = new FileReader();
							file.onload = function(e) {
								$("#user_img").attr("src", e.target.result);
								}
							file.readAsDataURL(thisDom.files[0]);	
							}	
						}
				});
			});//이미지 확장자 검사및  이미지 보여주기
	
		$(document).ready(function() {
			$("#image_add").click(function() {
				$("#image").click();
			});
		});//이미지 추가
		
		$(document).ready(function() {
			$("#image_remove").click(function() {
				$("#user_img").attr("src", "<%=img%>");
			});
		});//이미지 삭제 기본이미지가 들어간다
		
		$(document).ready(function() {
			$("#gotoback").click(function() {
				location.href='<%=MyCtrlCommand%>meList&${requestScope.parameter}';
											});
						});//뒤로가기
	</script>
</body>
</html>
