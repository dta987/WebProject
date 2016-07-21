<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../review/rvTOP.jsp"%>
<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 1;
	int formright = twelve - formleft;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
				<h4>게시물 수정</h4>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" action="<%=MyCtrlByForm%>" method="post" enctype="multipart/form-data">
					<input type="hidden" name="command" value="boUpdate">

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
							<textarea name="content" id="content" rows="20" cols="" class="form-control">${bean.board_content}</textarea>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="image">이미지</label>
						<div class="col-sm-<%=formright%>">
							<input type="file" class="form-control" name="image" id="image">
						</div>
					</div>

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
			})
		})
		
	</script>
</body>
</html>