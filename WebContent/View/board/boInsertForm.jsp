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
				<h4>게시물 등록</h4>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" action="<%=MyCtrlByForm%>" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="command" value="boWriter">
					<input type="hidden" name="command" value="boWriter">
					<input type="hidden" name="command" value="boWriter">
					
					<div class="form-group">
					<select class="form-control" name="category" id="category">
							<option value="-" selected="selected">-------- 너와 나의 '카테' 고리 이건 우리 안의 고리 --------
							<option value="잡담">너와 나의 '잡담' 고리
							<option value="질문">이건 우리 '질문' 고리
							<option value="요청">너와 나의 '요청' 고리
							<option value="꿀팁">이건 우리 '꿀팁' 고리
						</select>
					</div>	
						
					<div class="form-group">	
					<label class="control-label" for="subject"></label>	 
							<input type="text" class="form-control" name="contents" id="contents" placeholder="제목 입력해주세요">
					</div>
					
					<div class="form-group">
						<label class="control-label" for="image"></label>
							<input type="file" class="form-control" name="image" id="image">
					</div>

					<div class="form-group">
						<label class="control-label>" for="content"></label>
							<textarea name="content" id="content" rows="20" cols="" class="form-control"></textarea>
					</div>

					<div class="form-group">
						<div align="center" class="col-sm-offset-3 col-sm-6">
							<button class="btn btn-default" type="submit">새글 쓰기</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-default" type="reset">취소</button>
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
	</script>
</body>
</html>