<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../review/rvTOP.jsp"%>

<%-- <%
	int myoffset = 3;
	int mywidth = twelve - 2 * myoffset;
	int label = 3;
	int input = twelve - 2 * label;

	boolean idOverlapCheck = false;
	boolean nicknameOverlapCheck = false;
	boolean pwOverlapCheck = false;
	boolean emailOverlapCheck = false;
	String img = contextPath + "/View/images/산타니05.jpg";
%>
 --%>
<%
	int myoffset = 3;
	int mywidth = twelve - 2 * myoffset;
	int label = 4;
	int input = twelve - (label + 2);

	boolean idOverlapCheck = false;
	boolean nicknameOverlapCheck = false;
	boolean pwOverlapCheck = false;
	boolean emailOverlapCheck = false;
	String img = contextPath + "/View/images/산타니05.jpg";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../../View/script/script.js"></script>
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
</style>
</head>
<body>
	<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<form id="signup" class="form-horizontal" action="<%=MyCtrlByForm%>"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="meSignup">
			<table>
				<td>
					<div id="iddiv" class="form-group has-feedback">
						<label for="ID" class="col-sm-<%=label%> control-label">ID</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="id" name="id"
								placeholder="id"> <span id="idspan"
								class="glyphicon form-control-feedback"></span>
						</div>
					</div>
					<div id="pwdiv" class="form-group has-feedback">
						<label for="passoword" class="col-sm-<%=label%> control-label">PW</label>
						<div class="col-sm-<%=input%>">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="password"> <span
								id="pwspan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="pwcheck"></div>
					</div>
					<div id="pwdiv" class="form-group has-feedback">
						<label for="passoword2" class="col-sm-<%=label%> control-label">P.W
							CHECK</label>
						<div class="col-sm-<%=input%>">
							<input type="password" class="form-control" id="password2"
								name="password2" placeholder="password"> <span
								id="pwspan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="pwcheck"></div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-<%=label%> control-label">NAME</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="name">
						</div>
					</div>
					<div id="emaildiv" class="form-group has-feedback">
						<label for="email" class="col-sm-<%=label%> control-label">E-MAIL</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="email" name="email"
								placeholder="email"> <span id="emailspan"
								class="glyphicon form-control-feedback"></span>
						</div>
						<div id="emailcheck"></div>
					</div>
					<div id="nicknamediv" class="form-group has-feedback">
						<label for="nickname" class="col-sm-<%=label%> control-label">NICKNAME</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="nickname"
								name="nickname" placeholder="nickname"> <span
								id="nicknamespan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="nicknamecheck"></div>
					</div></td>
				<td>
					
					<div class="form-group" align="center">
						&nbsp;&nbsp; <img id="user_img" src="<%=img%>" class="img-rounded"
							alt="Cinque Terre" width="200px" height="200px">
					</div>
								<div class="form-group" align="center">
						<button type="button" id="image_add"
							class="imamybutton imamybutton1">IMAGE</button>
						&nbsp;&nbsp;
						<button type="button" id="image_remove"
							class="imamybutton imamybutton1">DELETE</button>
						<input type="file" name="image" id="image" class="hide">
					</div>
					<div class="form-group" align="right">
						<br>
						<button type="submit" class="topmybutton topmybutton1">JOIN</button>
						&nbsp;
						<button type="reset" class="topmybutton topmybutton1">BACK</button>
						<br>
					</div>
				</td>

			</table>
		</form>
	</div>


	<%-- <div class="panel panel-success col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel-heading">회원가입</div>
		<form id="signup" class="form-horizontal" action="<%=MyCtrlByForm%>" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="command" value="meSignup">
			<table>
				<br>
				<td class="col-sm-<%=input%>">
					<div id="iddiv" class="form-group has-feedback">
						<label for="ID" class="col-sm-<%=label%> control-label">ID</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="id" name="id" placeholder="id"> <span
								id="idspan" class="glyphicon form-control-feedback"></span>
						</div>
					</div>
					<div id="pwdiv" class="form-group has-feedback">
						<label for="passoword" class="col-sm-<%=label%> control-label">PW</label>
						<div class="col-sm-<%=input%>">
							<input type="password" class="form-control" id="password" name="password"
								placeholder="password"> <span id="pwspan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="pwcheck"></div>
					</div>
					<div id="pwdiv" class="form-group has-feedback">
						<label for="passoword2" class="col-sm-<%=label%> control-label">PwCheck</label>
						<div class="col-sm-<%=input%>">
							<input type="password" class="form-control" id="password2" name="password2"
								placeholder="password"> <span id="pwspan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="pwcheck"></div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-<%=label%> control-label">NAME</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="name" name="name" placeholder="name">
						</div>
					</div>
					<div id="emaildiv" class="form-group has-feedback">
						<label for="email" class="col-sm-<%=label%> control-label">eMail</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="email" name="email" placeholder="email">
							<span id="emailspan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="emailcheck"></div>
					</div>
					<div id="nicknamediv" class="form-group has-feedback">
						<label for="nickname" class="col-sm-<%=label%> control-label">NickName</label>
						<div class="col-sm-<%=input%>">
							<input type="text" class="form-control" id="nickname" name="nickname" placeholder="nickname">
							<span id="nicknamespan" class="glyphicon form-control-feedback"></span>
						</div>
						<div id="nicknamecheck"></div>
					</div>
				</td>

				<td>
					<div class="form-group" align="center">
						<button type="button" id="image_add" class="btn btn-default">이미지 추가</button>
						&nbsp;&nbsp;
						<button type="button" id="image_remove" class="btn btn-default">삭제</button>
						<input type="file" name="image" id="image" class="hide">
					</div>
					<div class="form-group" align="center">
						<img id="user_img" src="<%=img%>" class="img-rounded" alt="Cinque Terre" width="200px"
							height="200px">
					</div>

				</td>
			</table>
		</form>
	</div> --%>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#id").keyup(function() {
			 // 원하지 않는 값이 들어올 경우를 막기 위해		
		    if (this.value.match(/[^a-zA-Z0-9\_]/g)) {
		        //this.value = this.value.replace(/[^a-zA-Z0-9\_\s]/g, ''); //해당 값이 들어오면 ''으로 바꿔치기
				$("#idcheck").html("<div class='alert-danger col-sm-4' align='center'> 아이디는 특수기호 _  , 영문, 숫자만 입력 가능합니다.</div>");
				$("#iddiv").addClass("has-error");
				$("#idspan").addClass("glyphicon-remove");
				idOverlapCheck = false;
		    }else{
		    	if ($("#id").val().length > 5 && $("#id").val().length <= 14) {
		    		if(this.value.match( /^[a-zA-Z]{1}[\w]+[a-zA-Z0-9]{1}$/ )) {//최소 영문자 1개, _특수문자로 끝나지 않기, 영문자로 시작하기
		    			
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
									$("#idcheck").html("<div class='alert-success col-sm-4' align='center'> 사용가능한 아이디 입니다</div>");
									$("#idspan").switchClass("glyphicon-remove", "glyphicon-ok");
									idOverlapCheck = true;
								} else {
									$("#iddiv").switchClass("has-success has-feedback", "has-error has-feedback");
									$("#idcheck").html("<div class='alert-danger col-sm-4' align='center'> 이미 사용중인 아이디입니다</div>");
									idOverlapCheck = false;
								}
							}
						});
		    		
		    		}else{
						$("#idcheck").html("<div class='alert-danger col-sm-4' align='center'> 아이디는 영문자로 시작, 끝자리는 _ 기호가 불가능합니다.</div>");
						$("#iddiv").addClass("has-error");
						$("#idspan").addClass("glyphicon-remove");
						idOverlapCheck = false;
		    		}
				} else {
					$("#idcheck").html("<div class='alert-danger col-sm-4' align='center'> 6글자이상 14글자 이하로 입력해주세요</div>");
					$("#iddiv").addClass("has-error has-feedback");	
					$("#idspan").addClass("glyphicon-remove");
					idOverlapCheck = false;
				}
		    }
		});
	});
	
	$(document).ready(function() {
		    // 원하지 않는 값이 들어올 경우를 막기 위해
		$("#nickname").keyup(function() {
		    if (this.value.match(/[^a-zA-Z0-9가-히\_]/g)) {
		        // replace it with nothing
		        //this.value = this.value.replace(/[^a-zA-Z0-9가-히\_\s]/g, '');
				$("#nicknamecheck").html("<div class='alert-danger col-sm-4' align='center'> 닉네임은 _ 를 제외한 특수기호는 입력 불가능합니다.</div>");
				$("#nicknamediv").addClass("has-error");
				$("#nicknamespan").addClass("glyphicon-remove");
				nicknameOverlapCheck = false;
		    }else{
		    	if($("#nickname").val().length > 1) {
					$.ajax({
						type : "post",
						url : "<%=MyCtrlCommand%>meOverlapcheck",
						dataType : "JSON",
						data : {
							"nickname" : $("#nickname").val(),
							},
							success : function(result) {
								if (result.check) {
									$("#nicknamediv").switchClass("has-error", "has-success");
									$("#nicknamecheck").html("<div class='alert-success col-sm-4' align='center'> 사용가능한 닉네임 입니다</div>");
									$("#nicknamespan").switchClass("glyphicon-remove", "glyphicon-ok");
									nicknameOverlapCheck = true;
									} else {
										$("#nicknamediv").switchClass("has-success", "has-error");
										$("#nicknamecheck").html("<div class='alert-danger col-sm-4' align='center'> 이미 사용중인 닉네임 입니다</div>");
										nicknameOverlapCheck = false;
										}
								}
							});
				} else {
					$("#nicknamecheck").html("<div class='alert-danger col-sm-4' align='center'> 닉네임은 2글자 이상입니다</div>");
					$("#nicknamediv").addClass("has-error");
					$("#nicknamespan").addClass("glyphicon-remove");
					nicknameOverlapCheck = false;
				}
		    }
		});
	});
	
	$(document).ready(function() {
	    // 원하지 않는 값이 들어올 경우를 막기 위해
		$("#email").keyup(function() {
		    if( this.value.match(/[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,4}/)) {
				$.ajax({
					type : "post",
					url : "<%=MyCtrlCommand%>meOverlapcheck",
					dataType : "JSON",
					data : {
						"email" : $("#email").val(),
						},
						success : function(result) {
							if (result.check) {
								$("#emaildiv").switchClass("has-error", "has-success");
								$("#emailcheck").html("<div class='alert-success col-sm-4' align='center'> 사용가능한 이메일주소 입니다</div>");
								$("#emailspan").switchClass("glyphicon-remove", "glyphicon-ok");
								emailOverlapCheck = true;
								} else {
									$("#emaildiv").switchClass("has-success", "has-error");
									$("#emailcheck").html("<div class='alert-danger col-sm-4' align='center'> 이미 사용중인 이메일주소 입니다</div>");
									emailOverlapCheck = false;
									}
							}
						});
			} else {
				$("#emailcheck").html("<div class='alert-danger col-sm-4' align='center'> 잘못된 형식의 이메일 주소입니다</div>");
				$("#emaildiv").addClass("has-error");
				$("#emailspan").addClass("glyphicon-remove");
				emailOverlapCheck = false;
			}
		});
	});
	
	$(document).ready(function() {
		//비밀번호 유효성 검사. 특수문자 하나 추가해야, 특수문자 최소 1개 들어가기, 8글자 이상, 16자 이하
		$("#password").keyup(function() {
			if ( $("#password").val().length > 7 && $("#password").val().length < 17  ){
				if (this.value.match(/^[\w]+[!-)]{1,}[0-9]{1,}/)){
					$("#pwdiv").switchClass("has-error has-feedback", "has-success has-feedback");
					$("#pwcheck").html("<div class='alert-success col-sm-3' align='center'> 사용가능한 비밀번호입니다.</div>");
					$("#pwspan").switchClass("glyphicon-remove", "glyphicon-ok");
				}else{
					$("#pwdiv").addClass("has-error has-feedback");
					$("#pwcheck").html("<div class='alert-danger col-sm-4' align='center'> 사용할 수 없는 비밀번호입니다. 특수기호와 숫자 하나를 포함해야 합니다.</div>");
					$("#pwspan").addClass("glyphicon-remove");
				}
			}else{
				$("#pwdiv").addClass("has-error has-feedback");
				$("#pwcheck").html("<div class='alert-danger col-sm-4' align='center'> 비밀번호는 8글자 이상 16글자 이하로 입력해주세요.</div>");
				$("#pwspan").addClass("glyphicon-remove");
			}
		});
	});
	
	$(document).ready(function() {
		//패스워드 1번과 2번이 동일한지에 대한 유효성 검사
		$("#password2").keyup(function() {
			if ($("#password").val() == $("#password2").val() && $("#password").val()!= null   ) {
				$("#pwdiv2").switchClass("has-error has-feedback", "has-success has-feedback");
				$("#pwcheck2").html("<div class='alert-success col-sm-3' align='center'> 사용가능</div>");
				$("#pwspan2").switchClass("glyphicon-remove", "glyphicon-ok");
				
				pwOverlapCheck = true;
				} else {
					$("#pwdiv2").addClass("has-error has-feedback");
					$("#pwcheck2").html("<div class='alert-danger col-sm-4' align='center'> 비밀번호를 확인해주세요</div>");
					$("#pwspan2").addClass("glyphicon-remove");
					pwOverlapCheck = false;
					}
			});
		});
	
		$(document).ready(function() {
			$("#signup").submit(function() {
				if (idOverlapCheck) {
					if (pwOverlapCheck) {
						if (nicknameOverlapCheck) {
							if(emailOverlapCheck){
								alert("가입을 축하드립니다!");
								return true;	
							}else{
								alert("이메일 주소를 확인해주세요");
								$("#nickname").focus();
								return false;
							}
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
		$(document).ready(function() {
			$("#image").change(function(){
				var ext = $('#image').val().split('.').pop().toLowerCase();
				if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
					alert("gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.");
					$("#image").val("");
					} else {
						var thisDom = $("#image")[0];
						if(thisDom.files && thisDom.files[0]){
							var file = new FileReader();
							file.onload = function(e) {
								$("#user_img").attr("src", e.target.result);
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
		});
		
		//이게 무슨 의미지? 왜 만든거야 성민아? 이미지 삭제 버튼 누르면 사용가능한 아이디입니다?
		$(document).ready(function() {
			$("#image_remove").click(function() {
				$("#user_img").attr("src", "<%=img%>
		");
			});
		});
	</script>
</body>
</html>
