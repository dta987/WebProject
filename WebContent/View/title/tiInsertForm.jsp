<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>

<%
	int myoffset = 3;
	int mywidth = twelve - 2 * myoffset;
	int label = 4;
	/* int input = twelve - 2 * label; */
	int input = twelve - (label + 2);

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
			<input type="hidden" name="command" value="tiInsert"> <label>TITLE UPDATE</label><br>
			<hr style="border: solid; color: #cbe7cb">
			<table>
				<td></td>
				<td>
					<div id="iddiv" class="form-group has-feedback">
						<label for="name" class="col-sm-<%=label%> control-label">타이틀 이름</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="name" name="name">
						</div>
					</div>
					<div class="form-group" id="mainthemadiv">
						<label for="condition" class="col-sm-<%=label%> control-label">테마</label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="mainthema" id="mainthema">
								<option value="-" selected="selected">--테 마--
								<option value="지역">지역
								<option value="계절">계절
								<option value="꽃">꽃
							</select>
						</div>
					</div>
					<div class="form-group hide" id="sebthemadiv">
						<label for="condition" class="col-sm-<%=label%> control-label">테 마</label>
						<div class="col-sm-<%=input / 2%>">
							<select class="form-control " name="subthema" id="subthema">
								<option value="-">--테 마--
								<option value="지역">지역
								<option value="계절" selected="selected">계절
								<option value="꽃">꽃
							</select>
						</div>
						<div class="col-sm-<%=input / 2%>">
							<select class="form-control " name="season" id="season">
								<option value="-" selected="selected">--테 마--
								<option value="봄">봄
								<option value="여름">여름
								<option value="가을">가을
								<option value="겨울">겨울
							</select>
						</div>
					</div> 
					<!-- 봄 -->
					<div class="form-group hide" id="seasoncondition1div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="haruseason1" id="haruseason1">
								<option value="-" selected="selected">-- 산 --
								<option value="리시리다케">리시리다케
								<option value="보로시리다케">보로시리다케
								<option value="후지산">후지산
								<option value="오오아사히다케">오오아사히다케
							</select>
						</div>
					</div>
					<div class="form-group hide" id="seasoncondition2div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="haruseason2" id="haruseason2">
								<option value="-" selected="selected">-- 산 --
								<option value="리시리다케">리시리다케
								<option value="보로시리다케">보로시리다케
								<option value="후지산">후지산
								<option value="오오아사히다케">오오아사히다케
							</select>
						</div>
					</div>
					<div class="form-group hide" id="seasoncondition3div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="haruseason3" id="haruseason3">
								<option value="-" selected="selected">-- 산 --
								<option value="리시리다케">리시리다케
								<option value="보로시리다케">보로시리다케
								<option value="후지산">후지산
								<option value="오오아사히다케">오오아사히다케
							</select>
						</div>
					</div>
					<div class="form-group hide" id="seasoncondition4div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="haruseason4" id="haruseason4">
								<option value="-" selected="selected">-- 산 --
								<option value="리시리다케">리시리다케
								<option value="보로시리다케">보로시리다케
								<option value="후지산">후지산
								<option value="오오아사히다케">오오아사히다케
							</select>
						</div>
					</div> 
					<!-- 봄 --> 
					
					<!-- 지역 -->
					<div class="form-group hide" id="areacondition1div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="area1" id="area1">
								<option value="-" selected="selected">-- 산 --
								<option value="리시리다케">리시리다케
								<option value="보로시리다케">보로시리다케
								<option value="후지산">후지산
								<option value="오오아사히다케">오오아사히다케
								<option value="이데산">이데산
								<option value="시부츠">시부츠
								<option value="묘우코우산">묘우코우산
								<option value="호타카야마">호타카야마
								<option value="카사가다케">카사가다케
								<option value="츠루기다케">츠루기다케
								<option value="타테야마">타테야마
								<option value="호오잔">호오잔
								<option value="소보산">소보산
								<option value="아소산">아소산
							</select>
						</div>
					</div>
					<div class="form-group hide" id="areacondition2div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="area2" id="area2">
								<option value="-" selected="selected">-- 산 --
								<option value="리시리다케">리시리다케
								<option value="보로시리다케">보로시리다케
								<option value="후지산">후지산
								<option value="오오아사히다케">오오아사히다케
								<option value="이데산">이데산
								<option value="시부츠">시부츠
								<option value="묘우코우산">묘우코우산
								<option value="호타카야마">호타카야마
								<option value="카사가다케">카사가다케
								<option value="츠루기다케">츠루기다케
								<option value="타테야마">타테야마
								<option value="호오잔">호오잔
								<option value="소보산">소보산
								<option value="아소산">아소산
							</select>
						</div>
					</div>
					<div class="form-group hide" id="areacondition3div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="area3" id="area3">
								<option value="-" selected="selected">-- 산 --
								<option value="리시리다케">리시리다케
								<option value="보로시리다케">보로시리다케
								<option value="후지산">후지산
								<option value="오오아사히다케">오오아사히다케
								<option value="이데산">이데산
								<option value="시부츠">시부츠
								<option value="묘우코우산">묘우코우산
								<option value="호타카야마">호타카야마
								<option value="카사가다케">카사가다케
								<option value="츠루기다케">츠루기다케
								<option value="타테야마">타테야마
								<option value="호오잔">호오잔
								<option value="소보산">소보산
								<option value="아소산">아소산
							</select>
						</div>
					</div>
					<div class="form-group hide" id="areacondition4div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="area4" id="area4">
								<option value="-" selected="selected">-- 산 --
								<option value="리시리다케">리시리다케
								<option value="보로시리다케">보로시리다케
								<option value="후지산">후지산
								<option value="오오아사히다케">오오아사히다케
								<option value="이데산">이데산
								<option value="시부츠">시부츠
								<option value="묘우코우산">묘우코우산
								<option value="호타카야마">호타카야마
								<option value="카사가다케">카사가다케
								<option value="츠루기다케">츠루기다케
								<option value="타테야마">타테야마
								<option value="호오잔">호오잔
								<option value="소보산">소보산
								<option value="아소산">아소산
							</select>
						</div>
					</div>
					<div class="form-group hide" id="areacondition5div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="area5" id="area5">
								<option value="-" selected="selected">-- 산 --
								<option value="리시리다케">리시리다케
								<option value="보로시리다케">보로시리다케
								<option value="후지산">후지산
								<option value="오오아사히다케">오오아사히다케
								<option value="이데산">이데산
								<option value="시부츠">시부츠
								<option value="묘우코우산">묘우코우산
								<option value="호타카야마">호타카야마
								<option value="카사가다케">카사가다케
								<option value="츠루기다케">츠루기다케
								<option value="타테야마">타테야마
								<option value="호오잔">호오잔
								<option value="소보산">소보산
								<option value="아소산">아소산
							</select>
						</div>
					</div> 
					<!-- 지역 --> 
					
					
					<!-- 꽃 -->
					<div class="form-group hide" id="flowercondition1div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="flower1" id="flower1">
								<option value="-" selected="selected">-- 산 --
								<option value="타이세츠잔">타이세츠잔
								<option value="하야치네산">하야치네산
								<option value="쵸우카이산">쵸우카이산
								<option value="자오우산">자오우산
								<option value="시로우마다케">시로우마다케
								<option value="하쿠산">하쿠산
								<option value="키타다케">키타다케
								<option value="아카이시다케">아카이시다케
								<option value="쿠쥬우산">쿠쥬우산
								<option value="미야노우라다케">미야노우라다케
							</select>
						</div>
					</div>
					<div class="form-group hide" id="flowercondition2div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="flower2" id="flower2">
								<option value="-" selected="selected">-- 산 --
								<option value="타이세츠잔">타이세츠잔
								<option value="하야치네산">하야치네산
								<option value="쵸우카이산">쵸우카이산
								<option value="자오우산">자오우산
								<option value="시로우마다케">시로우마다케
								<option value="하쿠산">하쿠산
								<option value="키타다케">키타다케
								<option value="아카이시다케">아카이시다케
								<option value="쿠쥬우산">쿠쥬우산
								<option value="미야노우라다케">미야노우라다케
							</select>
						</div>
					</div>
					<div class="form-group hide" id="flowercondition3div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="flower3" id="flower3">
								<option value="-" selected="selected">-- 산 --
								<option value="타이세츠잔">타이세츠잔
								<option value="하야치네산">하야치네산
								<option value="쵸우카이산">쵸우카이산
								<option value="자오우산">자오우산
								<option value="시로우마다케">시로우마다케
								<option value="하쿠산">하쿠산
								<option value="키타다케">키타다케
								<option value="아카이시다케">아카이시다케
								<option value="쿠쥬우산">쿠쥬우산
								<option value="미야노우라다케">미야노우라다케
							</select>
						</div>
					</div>
					<div class="form-group hide" id="flowercondition4div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="flower4" id="flower4">
								<option value="-" selected="selected">-- 산 --
								<option value="타이세츠잔">타이세츠잔
								<option value="하야치네산">하야치네산
								<option value="쵸우카이산">쵸우카이산
								<option value="자오우산">자오우산
								<option value="시로우마다케">시로우마다케
								<option value="하쿠산">하쿠산
								<option value="키타다케">키타다케
								<option value="아카이시다케">아카이시다케
								<option value="쿠쥬우산">쿠쥬우산
								<option value="미야노우라다케">미야노우라다케
							</select>
						</div>
					</div>
					<div class="form-group hide" id="flowercondition5div">
						<label for="condition" class="col-sm-<%=label%> control-label"></label>
						<div class="col-sm-<%=input%>">
							<select class="form-control " name="flower5" id="flower5">
								<option value="-" selected="selected">-- 산 --
								<option value="타이세츠잔">타이세츠잔
								<option value="하야치네산">하야치네산
								<option value="쵸우카이산">쵸우카이산
								<option value="자오우산">자오우산
								<option value="시로우마다케">시로우마다케
								<option value="하쿠산">하쿠산
								<option value="키타다케">키타다케
								<option value="아카이시다케">아카이시다케
								<option value="쿠쥬우산">쿠쥬우산
								<option value="미야노우라다케">미야노우라다케
							</select>
						</div>
					</div> <!-- 꽃 -->


				</td>
				<td>
					<div class="form-group" align="center">
						&nbsp;&nbsp; <img id="title_img" src="<%=img%>" class="img-rounded" alt="Cinque Terre"
							width="200px" height="200px">
					</div>
					<div class="form-group" align="center">

						<button type="button" id="image_add" class="imamybutton imamybutton1">IMAGE</button>
						&nbsp;&nbsp;
						<button type="button" id="image_remove" class="imamybutton imamybutton1">DELETE</button>
						<input type="file" name="image" id="image" class="hide">
					</div>
					<div class="form-group" align="right">
						<br>
						<button type="submit" class="topmybutton topmybutton1">ADD</button>
						&nbsp;
						<button id="gotoback" type="button" class="topmybutton topmybutton1">BACK</button>
						<br>
					</div>
				</td>

			</table>

		</form>
	</div>
	<script>
	$(document).ready(function() {
		$("#mainthema").change(function() {
			if($("#mainthema").val() == "지역") {
				$("#areacondition1div").attr("class", "form-group ");
				$("#areacondition2div").attr("class", "form-group ");
				$("#areacondition3div").attr("class", "form-group ");
				$("#areacondition4div").attr("class", "form-group ");
				$("#areacondition5div").attr("class", "form-group ");
			} else {
				$("#areacondition1div").attr("class", "form-group hide");
				$("#areacondition2div").attr("class", "form-group hide");
				$("#areacondition3div").attr("class", "form-group hide");
				$("#areacondition4div").attr("class", "form-group hide");
				$("#areacondition5div").attr("class", "form-group hide");
			}
			
			if($("#mainthema").val() == "꽃") {
				$("#flowercondition1div").attr("class", "form-group ");
				$("#flowercondition2div").attr("class", "form-group ");
				$("#flowercondition3div").attr("class", "form-group ");
				$("#flowercondition4div").attr("class", "form-group ");
				$("#flowercondition5div").attr("class", "form-group ");
			} else {
				$("#flowercondition1div").attr("class", "form-group hide");
				$("#flowercondition2div").attr("class", "form-group hide");
				$("#flowercondition3div").attr("class", "form-group hide");
				$("#flowercondition4div").attr("class", "form-group hide");
				$("#flowercondition5div").attr("class", "form-group hide");
			}
			
			if($("#mainthema").val() == "계절") {
				$("#sebthema option").each(function(index) {
					if ($(this).val() == $("#mainthema").val()) {
						$(this).attr("selected", "selected");
					}
				});
				$("#sebthemadiv").attr("class", "form-group");
				$("#mainthemadiv").attr("class", "form-group hide");
			} else {
				$("#sebthemadiv").attr("class", "form-group hide");
				$("#mainthemadiv").attr("class", "form-group ");
			}
		});
		$("#subthema").change(function() {
			if($("#subthema").val() != "계절") {
				$("#mainthemadiv").attr("class", "form-group ");
				$("#sebthemadiv").attr("class", "form-group hide");
			}
		});
		$("#season").change(function() {
			if($("#season").val() == "봄") {
				$("#flowercondition1div").attr("class", "form-group ");
				$("#flowercondition2div").attr("class", "form-group ");
				$("#flowercondition3div").attr("class", "form-group ");
				$("#flowercondition4div").attr("class", "form-group ");
				$("#flowercondition5div").attr("class", "form-group ");
			} else {
				$("#flowercondition1div").attr("class", "form-group hide");
				$("#flowercondition2div").attr("class", "form-group hide");
				$("#flowercondition3div").attr("class", "form-group hide");
				$("#flowercondition4div").attr("class", "form-group hide");
				$("#flowercondition5div").attr("class", "form-group hide");
			}
		});
	});
		
	$(document).ready(function() {
		$("#gotoback").click(function() {
			location.href='<%=MyCtrlCommand%>tiList&${requestScope.parameters}';
			});
		});//뒤로가기

		$(document).ready(function() {
			$("#image").change(function() {
				var ext = $('#image').val().split('.').pop().toLowerCase();
				if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1 && $("#image").val() !=""   ) {
					alert("gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.");
					$("#image").val("");
				} else {
					var thisDom = $("#image")[0];
					if (thisDom.files && thisDom.files[0]) {
						var file = new FileReader();
						file.onload = function(e) {
							$("#title_img").attr("src", e.target.result);
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
		});//이미지 추가
		
		$(document).ready(function() {
			$("#image_remove").click(function() {
				$("#title_img").attr("src", "<%=img%>");
				$("#image").val("");
			});
		});
	</script>
</body>
</html>