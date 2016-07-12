<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../review/rvTOP.jsp"%>
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
<script type="text/javascript" src="../../View/script/script.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="col-md-offset-<%=myoffset%> col-md-<%=mywidth%>">



		<form id="signup" class="form-horizontal" action="<%=MyCtrlByForm%>" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="command" value="meSignup">
			<div class="form-group" align="center">
				<img src="../../View/images/산타니05.jpg" class="img-rounded" alt="Cinque Terre" width="20%" height="50%">
				<input type="file" name="image" id="image">
			</div>
			<div id="iddiv" class="form-group">
				<label for="ID" class="col-sm-<%=label%> control-label">아이디</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="id" name="id" placeholder="id">
				</div class="col-sm-1">
				<div id="idcheck"></div>
			</div>
			<div class="form-group">
				<label for="passoword" class="col-sm-<%=label%> control-label">비밀번호</label>
				<div class="col-sm-<%=input%>">
					<input type="password" class="form-control" id="password" name="password"
						placeholder="password">
				</div>
			</div>
			<div id="pwdiv" class="form-group">
				<label for="passoword2" class="col-sm-<%=label%> control-label">비밀번호 확인</label>
				<div class="col-sm-<%=input%>">
					<input type="password" class="form-control" id="password2" name="password2"
						placeholder="password">
				</div>
				<div id="pwcheck"></div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-<%=label%> control-label">이름</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="name" name="name" placeholder="name">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-<%=label%> control-label">이메일</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="email" name="email" placeholder="email">
				</div>
			</div>
			<div id="nicknamediv" class="form-group">
				<label for="nickname" class="col-sm-<%=label%> control-label">별명</label>
				<div class="col-sm-<%=input%>">
					<input type="text" class="form-control" id="nickname" name="nickname" placeholder="nickname">
				</div>
				<div id="nicknamecheck"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-<%=label%> col-sm-<%=twelve - label%>">
					<button type="submit" onclick="" class="btn btn-default">저 장</button>
					<button type="reset" class="btn btn-default">취 소</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#id").keyup(function() {
			if ($("#id").val().length > 4) {
				$.ajax({
					type : "post",
					url : "<%=MyCtrlCommand%>meOverlapcheck",
					dataType : "JSON",
					data : {
						"id" : $("#id").val(),
					},
					success : function(result) {
						if(result.check) {
							$("#iddiv").switchClass("has-error has-feedback", "has-success has-feedback");
							$("#idcheck").html("<div class='alert-success col-sm-3' > 사용가능한 아이디 입니다</div>");
							idOverlapCheck = true;
						} else {
							$("#iddiv").switchClass("has-success has-feedback", "has-error has-feedback");
							$("#idcheck").html("<div class='alert-danger col-sm-3' > 이미 사용중인 아이디입니다</div>");
							idOverlapCheck = false;
						}
					}
				});
			} else {
				$("#idcheck").html("<div class='alert-danger col-sm-3'> 6글자이상 입력해주세요</div>");
				$("#iddiv").addClass("has-error has-feedback");	
				idOverlapCheck = false;
			}
		});
	});
	
	$(document).ready(function() {
		$("#nickname").keyup(function() {
			if($("#nickname").val().length > 1) {
				$.ajax({
					type : "post",
					url : "<%=MyCtrlCommand%>
		meOverlapcheck",
																dataType : "JSON",
																data : {
																	"nickname" : $(
																			"#nickname")
																			.val(),
																},
																success : function(
																		result) {
																	if (result.check) {
																		$(
																				"#nicknamediv")
																				.switchClass(
																						"has-error has-feedback",
																						"has-success has-feedback");
																		$(
																				"#nicknamecheck")
																				.html(
																						"<div class='alert-success col-sm-3' > 사용가능한 닉네임 입니다</div>");
																		nicknameOverlapCheck = true;
																	} else {
																		$(
																				"#nicknamediv")
																				.switchClass(
																						"has-success has-feedback",
																						"has-error has-feedback");
																		$(
																				"#nicknamecheck")
																				.html(
																						"<div class='alert-danger col-sm-3' > 이미 사용중인 닉네임 입니다</div>");
																		nicknameOverlapCheck = false;
																	}
																}
															});
												} else {
													$("#nicknamecheck")
															.html(
																	"<div class='alert-danger col-sm-3'> 닉네임은 2글자 이상입니다</div>");
													$("#nicknamediv")
															.addClass(
																	"has-error has-feedback");
													nicknameOverlapCheck = false;
												}
											});
						});

		$(document)
				.ready(
						function() {
							$("#password2")
									.keyup(
											function() {
												if ($("#password").val() == $(
														"#password2").val()) {
													$("#pwdiv")
															.switchClass(
																	"has-error has-feedback",
																	"has-success has-feedback");
													$("#pwcheck")
															.html(
																	"<div class='alert-success col-sm-3' > 사용가능</div>");
													pwOverlapCheck = true;
												} else {
													$("#pwdiv")
															.addClass(
																	"has-error has-feedback");
													$("#pwcheck")
															.html(
																	"<div class='alert-danger col-sm-3' > 비밀번호를 확인해주세요</div>");
													pwOverlapCheck = false;
												}
											});
						});

		$(document).ready(function() {
			$("#signup").submit(function() {
				if (idOverlapCheck) {
					if (pwOverlapCheck) {
						if (nicknameOverlapCheck) {
							alert("가입을 축하드립니다!");
							return true;
						} else {
							alert("닉네임를 확인해주세요");
							$("#nickname").focus();
							return false;
						}
					} else {
						alert("비밀번호를 확인해주세요");
						$("#password").focus();
						return false;
					}
				} else {
					alert("아이디를 확인해주세요");
					$("#id").focus();
					return false;
				}
			});
		});
	</script>
</body>
</html>