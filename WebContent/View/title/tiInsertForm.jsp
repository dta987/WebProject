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
	<form class="form-horizontal" role="form" action="<%=MyCtrlByForm%>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="tiInsert"> <label>TITLE UPDATE</label><br><br>
		<table>
			<td>
				<div id="iddiv" class="form-group has-feedback">
					<label for="no" class="col-sm-<%=label%> control-label">번호</label>
					<div class="col-sm-<%=input%>">
						<input type="text" class="form-control" id="fake" name="fake"
							disabled="disabled" value="${bean.title_no}">
						<input type="hidden" id="no" name="no" value="${bean.title_no}">	
					</div>
				</div>
				<div id="iddiv" class="form-group has-feedback">
					<label for="name" class="col-sm-<%=label%> control-label">타이틀
						이름</label>
					<div class="col-sm-<%=input%>">
						<input type="text" class="form-control" id="name" name="name"
							value="${bean.title_name}">
					</div>
				</div>
				<div class="form-group">
					<label for="condition" class="col-sm-<%=label%> control-label">상태</label>
					<div class="col-sm-<%=input%>">
						<input type="text" class="form-control" id="condition"
							name="condition" value="${bean.title_condition}">
					</div>
				</div>

			</td>
			<td>
				<div class="form-group" align="center">
					&nbsp;&nbsp; <img id="title_img"	src="<%=img%>" class="img-rounded" alt="Cinque Terre" width="200px" height="200px">
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
					<button type="submit" class="topmybutton topmybutton1">ADD</button>
					&nbsp;
					<button type="reset" class="topmybutton topmybutton1">BACK</button>
					<br>
				</div>
			</td>

		</table>

	</form>
</div>
<script>
		function goBack() {
			window.history.back();
		}

		$(document).ready(function() {
			$("#image").change(function() {
				var ext = $('#image').val().split('.').pop().toLowerCase();
				if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1 && $("#image").val() !=""   ) {
					alert("gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.");
					$("#image").val("");
				} else {
					var thisDom = $("#image")[0];
					if (thisDom.files && thisDom.files[0]) {
						var file = new FileReader();
						file.onload = function(e) {
							$("#title_img").attr("src", e.target.result);
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
		});//이미지 추가
		
		$(document).ready(function() {
			$("#image_remove").click(function() {
				$("#title_img").attr("src", "<%=img%>");
				$("#image").val("");
			});
		});

		</script>
</body>
</html>