<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 1;
	int formright = twelve - formleft;
%>

<!-- SmartEditor -->
<script type="text/javascript" src="<%=contextPath%>/SmartEditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
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
	<form class="form-horizontal" role="form" action="<%=MyCtrlByForm%>" method="post" id="frm">
		<div class="panel panel-success col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
			<div class="panel-heading">답글 작성</div>
			<div class="panel-body">
				<input type="hidden" name="group_no" value="${requestScope.group_no}"> <input
					type="hidden" name="order_no" value="${requestScope.order_no}"> <input type="hidden"
					name="depth" value="${requestScope.depth}"> <input type="hidden" name="no"
					value="${requestScope.no}"> <input type="hidden" name="command" value="boDepthInsert">
				<div class="form-group ">
					<label class="control-label col-sm-<%=formleft%>" for="subject">글 제목</label>
					<div class="col-sm-<%=mywidth%>">
						<input type="text" class="form-control" name="title" id="title" value="${bean.board_title}">
					</div>
				</div>
				<div class="form-group">

					<label class="control-label col-sm-<%=formleft%>" for="content">글 내용</label>
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
			</div>
		</div>
		<hr>
		<div class="form-group">
			<div align="center" class="col-sm-offset-3 col-sm-6">
				<button class="btn btn-default" type="button" id="savebtn">저장</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-default" type="button" id="gotoback">뒤로가기</button>
			</div>
		</div>
	</form>

	<script>

$(document).ready(function() {
	$("#savebtn").click(function() {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#frm").submit();
        //폼 submit
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
				location.href='<%=MyCtrlCommand%>boList&${requestScope.parameter}';
				});
			});
	</script>
</body>
</html>
