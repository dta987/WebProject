<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../review/rvTOP.jsp"%>
<%
	int myoffset = 1;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 1;
	int formright = twelve - formleft;
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#contents {
	height: 500px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="panel panel-default">
		<div class="panel-body"></div>
	</div>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default panel-success">
			<div class="panel-heading">
				<h4>게시물 등록</h4>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" action="<%=MyCtrlByForm%>" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="command" value="boInsert">

					<div class="form-group ">

						<label class="control-label col-sm-<%=formleft%>" for="subject">글 제목</label>
						<div class="col-sm-<%=myoffset%>">
							<select class="form-control " name="category" id="category">
								<option value="-" selected="selected">-- 분류 선택---------
								<option value="자유게시판">자유게시판
							</select>
						</div>
						<div class="col-sm-<%=mywidth%>">
							<input type="text" class="form-control" name="title" id="title" value="${bean.board_title}">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="content">글 내용</label>
						<div class="col-sm-<%=formright%>">
							<div id="contents" style="overflow: scroll" class="form-control" contentEditable="true">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="image">이미지</label>
						<div class="col-sm-<%=formright%>">
							<button type="button" id="image_add" class="btn btn-default">이미지 추가</button>
							<button type="button" id="image_remove" class="btn btn-default">삭제</button>
							<input type="file" name="image" id="image" class="hide">
						</div>
					</div>
					<hr>
					<div class="form-group">
						<div align="center" class="col-sm-offset-3 col-sm-6">
							<button class="btn btn-default" type="submit">저장</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-default" type="button" id="gotoback">뒤로가기</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		
		$(document).ready(function() {
			$("#gotoback").click(function() {
				location.href='<%=MyCtrlCommand%>boList&${requestScope.parameter}';
				});
			});
		
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
								$("#contents").html("<img alt='' src="">");
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
	</script>
</body>
</html>