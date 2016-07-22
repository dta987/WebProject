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

		<form id="signup" class="form-horizontal" action="<%=MyCtrlByForm%>" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="command" value="meUpdate">
			
			<div class="form-group" align="center">
				<img id="user_img" src="<%=uploadedFolder%>${bean.user_img}" class="img-rounded"
					alt="Cinque Terre" width="200px" height="200px">
			</div>
			<div class="form-group" align="center">
				<button type="button" id="image_add" class="btn btn-default">이미지 추가</button>
				<button type="button" id="image_remove" class="btn btn-default">삭제</button>
				<input type="file" name="image" id="image" class="hide">
			</div>

			<div id="iddiv" class="form-group">
				<label for="ID" class="col-sm-<%=label%> control-label">아이디</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="faked" name="faked" disabled="disabled" 
						value="${bean.user_id}">
					<input type="hidden" name="id" id="id" value="${bean.user_id}" >
				</div class="col-sm-1">
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-<%=label%> control-label">이름</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="faked" name="faked" disabled="disabled"
						value="${bean.user_name}">
						<input type="hidden" class="form-control" id="name" name="name" 
						value="${bean.user_name}">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-<%=label%> control-label">비밀번호</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="password" name="password" placeholder="password"
						value="${bean.user_password}">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-<%=label%> control-label">이메일</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="email" name="email" placeholder="email"
						value="${bean.user_email}">
				</div>
			</div>
			<div id="nicknamediv" class="form-group">
				<label for="nickname" class="col-sm-<%=label%> control-label">별명</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="nickname" name="nickname" placeholder="nickname"
						value="${bean.user_nickname}">
				</div>
				<div id="nicknamecheck"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-<%=label%> col-sm-<%=twelve - label%>">
					<button type="submit" class="btn btn-default">수 정</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="btn btn-default" id="gotoback">뒤로가기</button>
				</div>
			</div>
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