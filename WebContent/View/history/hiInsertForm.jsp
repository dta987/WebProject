<%@page import="Model.MountainDao, Model.Mountain, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 2;
	int formright = twelve - formleft;
%>
<%
	String mountain_area = "";
	MountainDao dao = new MountainDao();
	List<Mountain> mountain_list = dao.AreaSelectDataList(mountain_area);
%>
<html>
<head>


<style type="text/css">
#contents {
	height: 500px;
}

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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert history here</title>
</head>
<body>


<!-- <div class="container">
  <h2>Horizontal form</h2>
  <form class="form-horizontal" role="form">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="email" placeholder="Enter email">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" placeholder="Enter password">
      </div>
    </div>
	
 -->

	<div class=" container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<form class="form-horizontal" role="form" action="<%=MyCtrlByForm%>" method="post" id="frm"
			enctype="multipart/form-data">
			<input type="hidden" name="command" value="hiInsert"> <label>HISTORY INSERT</label><br>
			<hr style="border: solid; color:#cbe7cb ">
			<br>
			 <div class="form-group">
				<label class="control-label col-sm-<%=formleft%>" for="subject">NAME</label>
				<div class="col-sm-3">
					<select class="form-control " name="area" id="area">
						<option value="-" selected="selected">--지역 선택---
						<option value="훗카이도">훗카이도
						<option value="혼슈">혼슈
						<option value="알프스 지역">알프스 지역
						<option value="큐슈">큐슈
					</select>
				</div>
				<div class="col-sm-3" id="mountain_list_div">
					<select class="form-control hide" name="mountain_list" id="mountain_list">
						<option value="-" selected="selected">--테 마--
						<c:forEach var="bean" items="${mountain_list}">
							<option value="${bean.mountain_no }">${bean.mountain_no }
						</c:forEach>
					</select>
					</div>
			</div>
			
		<%--  <div class="form-group">
				<label class="control-label col-sm-<%=formleft%>" for="subject">NO</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="no" id="no" >
				</div>
		</div> --%>
		
			
		<div class="form-group">
				<label class="control-label col-sm-<%=formleft%>" for="subject">DATE</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="date" id="date">
				</div>
		</div>
		
		<div class="form-group">
				<label class="control-label col-sm-<%=formleft%>" for="subject">MEMO</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="memo" id="memo">
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

	<script type="text/javascript">
	
	$(document).ready(function() {
		$("#area").change(function() {
			if($("#area").val() == "홋카이도") {
				$("#mountain_list").removeClass("hide");
				mountain_area = $("#area").val();
				  
			} else if($("#area").val() == "혼슈") {
				$("#mountain_list").removeClass("hide");
				mountain_area = $("#area").val();
			} else if( $("#area").val() == "알프스지역" ){
				$("#mountain_list").removeClass("hide");
				mountain_area = $("#area").val();
			} else if( $("#area").val() == "큐슈" ){
				$("#mountain_list").removeClass("hide");
				mountain_area = $("#area").val();
			} else{
				$("#mountain_list").addClass("hide");
				
			}
			
		});
	});
	
	$(document).ready(function() {
		$("#savebtn").click(function() {	
			if($("#image").val() != null || $("#image").val() != "") {
				if($("#area").val() != "-"){
					if($("#name").val() != null || $("#name").val() != "") {
						oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
						$("#frm").submit();
				        	//폼 submit
					} else {
						alert("이름을 입력해주세요");
						return false;
					}
				} else {
					alert("지역을 선택해주세요");
					return false;
				}
			} else {
				alert("THUMBNAIL을 추가해주세요");
				return false;
			}
		});
	});
	
		$(document).ready(function() {
			$("#gotoback").click(function() {
				location.href='<%=MyCtrlCommand%>hiList&${requestScope.parameters}';
											});
						});//뒤로가기
	</script>

</body>
</html>
