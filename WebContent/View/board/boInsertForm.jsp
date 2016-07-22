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
							<textarea class="form-control" rows="10" cols="30" id="content" name="content" style="width: 100%; height: 5;"></textarea>
							<script>
							var oEditors = [];
							$(function(){
								nhn.husky.EZCreator.createInIFrame({
									oAppRef: oEditors,
									elPlaceHolder: "content",
									//SmartEditor2Skin.html 파일이 존재하는 경로
									sSkinURI: "<%=contextPath%>/SmartEditor/SmartEditor2Skin.html",	
									htParams : {
										// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
										bUseToolbar : true,				
										// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
										bUseVerticalResizer : true,		
										// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
										bUseModeChanger : true,			
										fOnBeforeUnload : function(){
											
										}
									}, 
									fOnAppLoad : function(){
										//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
										oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);	
									},
									fCreator: "createSEditor2"
									});
								});
							</script>
						</div>
					</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-<%=formleft%>" for="image">이미지</label>
				<div class="col-sm-<%=formright%>">
					<button type="button" id="image_add" class="btn btn-default">이미지 추가</button>
				</div>
				<div id="filehide" class="hide"></div>
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
		var oEditors = [];
		$(function(){
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "ir1",
				//SmartEditor2Skin.html 파일이 존재하는 경로
				sSkinURI: "../SmartEditor/SmartEditor2Skin.html",	
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,				
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,		
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,			
					fOnBeforeUnload : function(){
						
					}
				}, 
				fOnAppLoad : function(){
					//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
					oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);	
				},
				fCreator: "createSEditor2"
				});
			});
		});
	
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		
		$(document).ready(function() {
			$("#gotoback").click(function() {
				location.href="<%=MyCtrlCommand%>boList&${requestScope.parameter}"
				});
			});

		$(document).ready(function() {

			/* $("#image_add").click(function() {
				var cnt = Number($("#img_count").val());
				alert(cnt);
				$("#filehide").append("<input type='file' id='image" + cnt + "' name='image' >");
				$("#image" + cnt).click();
			});
			
			$(document).on("change", "#image" + 1, function(){
				var ext = $("#image" + 1).val().split('.').pop().toLowerCase();
				if($.inArray(ext, ['png','jpg','jpeg']) == -1) {
					alert("png,jpg,jpeg 파일만 업로드 할수 있습니다.");
					$("#image" + $("#img_count").val()).val("");
					} else {
						var thisDom = $("#image" + 1)[0];
						if(thisDom.files && thisDom.files[0]){
							var file = new FileReader();
							file.onload = function(e) {
								$("#contents").append("<img id='user_img" + 1 + "' alt=' ' src=''>");
								$("#user_img" + 1).attr("src", e.target.result);		
								$("#img_count").val( 1 + 1);
								
								var str = "$(document).ready(function() {" 
								str += "$(document).on(\"change\", \"#image\" + 2, function(){";
								str += "var ext = $(\"#image\" + 2).val().split('.').pop().toLowerCase();";
								str += "if($.inArray(ext, ['png','jpg','jpeg']) == -1) {";
								str += "	alert(\"png,jpg,jpeg 파일만 업로드 할수 있습니다.\");\n";
								str += "	$(\"#image\" + $(\"#img_count\").val()).val(\"\");";
								str += "	} else {";
								str += "		var thisDom = $(\"#image\" + 2)[0];";
								str += "		if(thisDom.files && thisDom.files[0]){";
								str += "			var file = new FileReader();";
								str += "			file.onload = function(e) {";
								str += "				$(\"#contents\").append(\"<img id='user_img\" + 2 + \"' alt=' ' src=''>\");";
								str += "				$(\"#user_img\" + 2).attr(\"src\", e.target.result);"		
								str += "				$(\"#img_count\").val( 2 + 1);";
								str += "				alert($(\"#img_count\").val());";
								str += "				}\n";
								str += "			file.readAsDataURL(thisDom.files[0]);";	
								str += "			}\n";	
								str += "		}\n"
								str += "	});\n";
								str += "});\n";
								
								$("script").append(str);
								
								alert($("#img_count").val());
								}
							file.readAsDataURL(thisDom.files[0]);	
							}	
						}
				
				}); */

		});
	</script>
</body>
</html>
