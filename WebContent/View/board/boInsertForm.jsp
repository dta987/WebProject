<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 1;
	int formright = twelve - formleft;
%>

<!-- SmartEditor -->
<script type="text/javascript" src="<%=contextPath%>/SmartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<!-- SmartEditor -->

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

	<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<!-- <div class="panel-heading">게시물 작성</div> -->
		<!-- <div class="panel-body"> -->
			<form class="form-horizontal" role="form" action="<%=MyCtrlByForm%>" method="post" id="frm">
				<input type="hidden" name="command" value="boInsert">
					<label>BOARD WRITE</label><br><br>
				<div class="form-group ">
					<label class="control-label col-sm-<%=formleft%>" for="subject">TITLE</label>
					<div class="col-sm-<%=myoffset%>">
						<select class="form-control " name="category" id="category">
							<option value="-" selected="selected">--분류 선택--
							<option value="자유게시판">자유게시판
						</select>
					</div>
					<div class="col-sm-<%=mywidth%>">
						<input type="text" class="form-control" name="title" id="title">
					</div>
				</div>
				<br>
				<div class="form-group">
					<label class="control-label col-sm-<%=formleft%>" for="content">NOTE</label>
					<div class="col-sm-<%=formright%>">
						<textarea class="form-control" rows="10" cols="30" id="content" name="content"
							style="width: 100%; height: 5;"></textarea>
						<script>
							var oEditors = [];
							$(function(){
								nhn.husky.EZCreator.createInIFrame({
									oAppRef: oEditors,
									elPlaceHolder: "content",
									//SmartEditor2Skin.html 파일이 존재하는 경로
									sSkinURI: "<%=request.getContextPath()%>/SmartEditor/SmartEditor2Skin.html",	
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
										oEditors.getById["content"].exec("PASTE_HTML", [""]);	
									},
									fCreator: "createSEditor2"
									});
								});
							</script>
					</div>
				</div>
				<div class="form-group">
					<div align="center" class="col-sm-offset-5 col-sm-10">
						<button class="topmybutton topmybutton1" type="button" id="savebtn">SAVE</button>
						&nbsp;&nbsp;&nbsp;	
						<button class="topmybutton topmybutton1" type="button" id="gotoback">BACK</button>
					</div>
				</div>
			</form>
		</div>

<script>

$(document).ready(function() {
	$("#savebtn").click(function() {	
			if($("#category").val() != "-"){
				if($("#title").val() != null || $("#title").val() != "") {
						oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
						$("#frm").submit();
			        	//폼 submit
				} else {
					alert("타이틀을 입력해주세요");
					return false;
				}
			} else {
				alert("카테고리를 선택해주세요");
				return false;
			}
	});
});

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
				location.href='<%=MyCtrlCommand%>boList&${requestScope.parameters}';
				});
			});//뒤로가기
		
		</script>
</body>
</html>
