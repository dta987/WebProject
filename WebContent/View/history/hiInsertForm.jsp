<%@page import="Model.MountainDao, Model.Mountain, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 4;
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

	<div class=" container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<form class="form-horizontal" role="form" action="<%=MyCtrlByForm%>" method="post" enctype="multipart/form-data">

			<input type="hidden" name="command" value="hiInsert"> <label>HISTORY INSERT</label><br>
			<hr style="border: solid; color: #cbe7cb">
			<br>
			<div class="form-group" id="themadiv">
				<label class="control-label col-sm-<%=formleft%>" for="subject">NAME</label>
				<div class="col-sm-<%=formright%>">
					<select class="form-control " name="thema" id="thema">
						<option value="-" selected="selected">--지역 선택---
						<option value="훗카이도">훗카이도
						<option value="혼슈">혼슈
						<option value="알프스 지역">알프스 지역
						<option value="큐슈">큐슈
					</select>
				</div>
			</div>

			<div class="form-group hide" id="subthemadiv">
				<label class="control-label col-sm-<%=formleft%>" for="subject">NAME</label>
				<div class="col-sm-<%=formright / 2%>">
					<select class="form-control" name="subthema" id="subthema">
						<option value="-" selected="selected">--지역 선택---
						<option value="훗카이도">훗카이도
						<option value="혼슈">혼슈
						<option value="알프스 지역">알프스 지역
						<option value="큐슈">큐슈
					</select>
				</div>
				<div class="form-group" id="areadiv">
					<div class="col-sm-<%=formright / 2%>">
						<select class="form-control" name="area" id="area">
							<option value=리시리다케>리시리다케
							<option value="보로시리다케">보로시리다케
						</select>
					</div>
				</div>
			</div>



			<div class="form-group">
				<label class="control-label col-sm-<%=formleft%>" for="subject">DATE</label>
				<div class="col-sm-<%=formright%>">
					<input type="text" id="datepicker" name="datepicker">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-<%=formleft%>" for="subject">MEMO</label>
				<div class="col-sm-<%=formright%>">
					<input type="text" class="form-control" name="memo" id="memo">
				</div>
			</div>

			<div class="form-group">
				<div align="center" class="col-sm-offset-5 col-sm-10">
					<button class="topmybutton topmybutton1" type="submit" id="savebtn">SAVE</button>
					&nbsp;&nbsp;&nbsp;
					<button class="topmybutton topmybutton1" type="button" id="gotoback">BACK</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
	$( function() {
	    $( "#datepicker" ).datepicker();
	  } );
	
	$(document).ready(function() {
		$("#gotoback").click(function() {
			location.href='<%=MyCtrlCommand%>hiList&${requestScope.parameters}';
											});
						});//뒤로가기

		$(document).ready(function() {
			$("#thema").change(function() {
				if ($("#thema").val() == "훗카이도") {
					$("#sebthema option").each(function(index) {
						if ($(this).val() == $("#thema").val()) {
							$(this).attr("selected", "selected");
						}
					});
					
					$("#subthemadiv").attr("class", "form-group");
					$("#areadiv").attr("class", "form-group");
					$("#themadiv").attr("class", "form-group hide");
				} else {
					$("#subthemadiv").attr("class", "form-group hide");
					$("#areadiv").attr("class", "form-group hide");
					$("#themadiv").attr("class", "form-group");
				}

			});
		});
						
		$.datepicker.setDefaults({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년'
		  });
	</script>

</body>
</html>
