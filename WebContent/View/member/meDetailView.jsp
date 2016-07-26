<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 3;
	int mywidth = twelve - 2 * myoffset;
	int label = 4;
	int input = twelve - 2 * label;

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
</head>
<body>

	<div class="col-md-offset-<%=myoffset%> col-md-<%=mywidth%>">

		<form id="DetailView" class="form-horizontal" action="<%=MyCtrlByForm%>" method="post" >
			<input type="hidden" name="command" value="meUpdateForm">
			
			<table>
			<tr>
				<td>
					<div id="iddiv" class="form-group has-feedback">
						<label for="ID" class="col-sm-<%=label%> control-label">ID</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="fake" name="fake" disabled="disabled" value="${bean.user_id}">
							<input type="hidden" id="id" name="id" value="${bean.user_id}" >
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-<%=label%> control-label">NAME</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="name" name="name" disabled="disabled"
								value="${bean.user_name}">
							<input type="hidden" id="name" name="name" value="${bean.user_name}" >	
						</div>
					</div>
					<div id="emaildiv" class="form-group has-feedback">
						<label for="email" class="col-sm-<%=label%> control-label">E-MAIL</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="email" name="email" disabled="disabled"
								value="${bean.user_email}"> 
							<input type="hidden" id="email" name="email" value="${bean.user_email}" >	
								<span id="emailspan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="emailcheck"></div>
					</div>
				<div id="nicknamediv" class="form-group has-feedback">
						<label for="nickname" class="col-sm-<%=label%> control-label">NICKNAME</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="nickname" disabled="disabled"
								name="nickname" value="${bean.user_nickname}">
							<input type="hidden" id="nickname" name="nickname" value="${bean.user_nickname}" >	
								 <span
								id="nicknamespan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="nicknamecheck"></div>
					</div>
			</td>
			<td>
				<div class="form-group" align="center">
						&nbsp;&nbsp; <img id="user_img" src="<%=uploadedFolder%>${bean.user_img}" class="img-rounded"
							alt="Cinque Terre" width="200px" height="200px">
					</div>
			</td>
			</tr>
			<tr>
			<td><br>
					<button type="submit" class="topmybutton topmybutton1" >UPDATE</button>
					<button class="topmybutton topmybutton1" type="button" id="gotoback">BACK</button>
			</td>		
			</tr>
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
				location.href='<%=MyCtrlCommand%>meList&${requestScope.parameters}';
				});
			});//뒤로가기
	</script>
</body>
</html>