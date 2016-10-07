<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../review/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.form-group {
	margin-bottom: 3px;
}

.form-control {
	height: 25px;
}
</style>
<script type="text/javascript">
	function gotoBack(){
		location.href='<%=MyCtrlCommand%>moAdminList&${requestScope.parameters}';
		//alert('${requestScope.parameter}') ;
	}
</script>
</head>
<%
	int myoffset = 2; //전체 외관의 옵셋
	int mywidth = twelve - 2 * myoffset;
	int leftside = 4; //판넬의 좌측
	int rightside = twelve - leftside; //판넬의 우측
%>
<body>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default panel-success">
			<div class="panel-heading">
				<h1 class="panel-title" align="left">산 상세 보기</h1>
			</div>
			<div class="panel-body">
				<div class="col-sm-<%=leftside%> col-sm-<%=leftside%>">
					<table>
						<tr>
							<td align="center"><img align="middle" src="<%=uploadedFolder%>${bean.mountain_img}"
								class="img-rounded" width="200" height="200"></td>
						</tr>
					</table>
				</div>
				<div class="col-sm-<%=rightside%> col-sm-<%=rightside%>">
					<table class="table table-hover table-condensed">				
						<tr>
							<td width="25%" align="center">산 이름</td>
							<td width="75%" align="left">${bean.mountain_name}</td>
						</tr>
						<tr>
							<td width="25%" align="center">산 지역</td>
							<td width="75%" align="left">${bean.mountain_area}</td>
						</tr>
						<tr>
							<td width="25%" align="center">산 상세주소</td>
							<td width="75%" align="left">${bean.mountain_address}
							</td>
						</tr> 
						<tr>
							<td width="25%" align="center">산 소개글</td>
							<td width="75%" align="left">${bean.mountain_introduce}</td>
						</tr>
						<tr>
							<td width="25%" align="center">산 분류</td>
							<td width="75%" align="left">${bean.mountain_thema}</td>
						</tr>
					</table>
				</div>
				<hr>
				<div class="col-sm-offset-5 col-sm-4">
					<button class="topmybutton topmybutton1" type="button" id="gotoback">BACK</button>
				</div>
			</div>
			<!-- end panel-body -->
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
		
		$(document).ready(function() {
			$("#gotoback").click(function() {
				location.href='<%=MyCtrlCommand%>moAdminList&${requestScope.parameters}';
				});
			});//뒤로가기
	</script>
</body>
</html>