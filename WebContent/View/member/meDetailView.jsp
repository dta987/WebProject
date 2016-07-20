<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../review/rvTOP.jsp"%>
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
	
		<form id="signup" class="form-horizontal" action="<%=MyCtrlByForm%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="meSignup">
			<div class="form-group" align="center">
				<img id="user_img" src="<%=uploadedFolder%>${bean.user_img}" class="img-rounded" alt="Cinque Terre" width="200px"
					height="200px">
			</div>
			
			<div id="iddiv" class="form-group">
				<label for="ID" class="col-sm-<%=label%> control-label">아이디</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="id" name="id" placeholder="id" value="${bean.user_id}" readonly="readonly">
				</div class="col-sm-1">
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-<%=label%> control-label">이름</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="name" name="name" placeholder="name" value="${bean.user_name}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-<%=label%> control-label">이메일</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="email" name="email" placeholder="email" value="${bean.user_email}" readonly="readonly">
				</div>
			</div>
			<div id="nicknamediv" class="form-group">
				<label for="nickname" class="col-sm-<%=label%> control-label">별명</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="nickname" name="nickname" placeholder="nickname" value="${bean.user_nickname}" readonly="readonly">
				</div>
				<div id="nicknamecheck"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-<%=label%> col-sm-<%=twelve - label%>">
					<button type="submit" class="btn btn-default">수 정</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="btn btn-default">뒤로가기</button>
				</div>
			</div>
		</form>
	</div>
	
	
	<script>
	$(document).ready(function() {
			$("#image").change(function(){
				var ext = $('#image').val().split('.').pop().toLowerCase();
				if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
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
			});
		$(document).ready(function() {
			$("#image_add").click(function() {
				$("#image").click();
			});
		});
		$(document).ready(function() {
			$("#image_remove").click(function() {
				$("#user_img").attr("src", "<%=img%>");
			});
		});
		</script>
</body>
</html>