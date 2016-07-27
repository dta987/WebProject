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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.condition {width ="70%";height ="50%";
	
}

.floating-box0 {
	display: inline-block;
	width: 80px;
	height: 30px;
	margin: 10px;
	border: 3px solid #cbe7cb;
}

.floating-box1 {
	display: inline-block;
	width: 130px;
	height: 30px;
	margin: 10px;
	border: 3px solid #cbe7cb;
}

.floating-box2 {
	display: inline-block;
	width: 200px;
	height: 100px;
	margin: 10px;
	border: 3px solid #cbe7cb;
}
</style>
</head>
<body>

	<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<form class="form-horizontal" role="form" action="<%=MyCtrlByForm%>" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="command" value="tiUpdate"> <label>TITLE DetailView</label><br>
			<hr style="border: solid; color: #cbe7cb">
			<table>
				<td>
					<div id="iddiv" class="form-group has-feedback">
						<label for="name" class="col-sm-<%=label%> control-label">타이틀 이름</label>
						<div class="col-sm-<%=input%>">
							<div class="floating-box1">${bean.title_name}</div>

							<%-- <input type="text" class="form-control" id="name" name="name"
								readonly="readonly" value="${bean.title_name}"> --%>
						</div>
					</div>
					<div class="form-group">
						<label for="condition" class="col-sm-<%=label%> control-label">타이틀 조건</label>
						<div class="col-lg-<%=input%>">
							<div class="floating-box2">${bean.title_condition}</div>

							<%-- <input type="text" class="form-control" id="condition" 
								name="condition" readonly="readonly"
								value="${bean.title_condition}"> --%>
						</div>
					</div>
				</td>
				<td>
					<div class="form-group" align="center">
						&nbsp;&nbsp; <img id="title_img" src="<%=img%>" class="img-rounded" alt="Cinque Terre"
							width="200px" height="200px">
					</div>
				</td>
				<tr>
					<td>
						<div class="form-group" align="right">
							<br>
							<button type="submit" class="topmybutton topmybutton1">UPDATE</button>
							&nbsp;
							<button class="topmybutton topmybutton1" type="button" id="gotoback">BACK</button>
						</div>
					</td>

				</tr>

			</table>
			<div id="iddiv" class="form-group has-feedback">
				<div class="col-sm-<%=input%>">
					<input type="hidden" id="no" name="no" value="${bean.title_no}">
				</div>
			</div>
		</form>
	</div>




</body>
</html>
