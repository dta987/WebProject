<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
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

<style>
th {
	border-color: #cbe7cb;
	color: gray;
}


</style>

</head>
<body>
	<%-- <div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>"
		style="border-color: #cbe7cb">
		<div class="panel" style="border-color: #cbe7cb">
			<c:if test="${bean.order_no == 0}">
				<div class="panel-head" style="background-color:#cbe7cb" >
				
					<h5><font color="green"><strong>${bean.board_title}</strong></font></h5>
					<c:forEach var="i" begin="1" end="30" step="1">
								&nbsp;&nbsp;&nbsp;
							</c:forEach>
					<font> ${bean.user_nickname} &nbsp;&nbsp;
						${bean.board_writ_date}</font><br>
				</div>
				<!-- <hr style="border: 2px solid #cbe7cb"> -->
				<div class="panel-body">${bean.board_content}</div>
			</c:if>
		</div>
	</div> --%>
	<c:if test="<%=loginfo != null%>">
		<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
			<form id="replyForm" action="<%=MyCtrlByForm%>" method="post">
				<input type="hidden" name="command" value="boReplyInsert"> <input
					type="hidden" name="id" value="<%=loginfo.getUser_id()%>">
				<input type="hidden" name="nickname"
					value="<%=loginfo.getUser_nickname()%>"> <input
					type="hidden" name="group_no" value="${bean.group_no}"> <input
					type="hidden" name="order_no" value="${bean.order_no}"> <input
					type="hidden" name="depth" value="${bean.depth}">
				<table>
					<tr>
						<td><label class="control-label col-sm-<%=formleft%>"></label>sdafsdaff</td>
						<td><textarea name="content"
								style="resize: none; border-color: #cbe7cb;"
								class="col-sm-<%=formright%>" rows="3" cols=""></textarea></td>
						<td><button type="submit" class="topmybutton topmybutton1">ADD</button></td>

					</tr>
					<tr>
					</tr>
				</table>
			</form>



		</div>
	</c:if>

	<c:forEach var="rebean" items="${requestScope.lists}">
		<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
			<table>
				<tr>
					<td>${rebean.user_nickname}&nbsp;&nbsp;<font>${rebean.board_writ_date}</font>
					</td>

				</tr>
				<tr>
					<td>${rebean.board_content}</td>
				</tr>
			</table>
			<hr>
		</div>
	</c:forEach>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>"
		align="center">
		<footer>${requestScope.pagingHtml}</footer>
	</div>


	<div class="container col-sm-offset-5 col-sm-<%=mywidth%>"
		align="center">
		<br>
		<button class="topmybutton topmybutton1" type="button" id="gotoback">BACK</button>
	</div>


	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		
		$(document).ready(function() {
			$("#gotoback").click(function() {
				location.href='<%=MyCtrlCommand%>
		boList&${requestScope.parameter}';
											});
						});
	</script>
</body>
</html>