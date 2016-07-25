<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 1;
	int mywidth = twelve - 2 * myoffset;
	String img = contextPath + "/View/images/산타니05.jpg";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

#myImg:hover {
	opacity: 0.7;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: #eef7ee; /* Fallback color */
	background-color: #eef7ee; /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
}

/* Caption of Modal Image */
#caption {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	text-align: center;
	color: #eef7ee;
	padding: 10px 0;
	height: 150px;
}

/* Add Animation */
.modal-content, #caption {
	-webkit-animation-name: zoom;
	-webkit-animation-duration: 0.6s;
	animation-name: zoom;
	animation-duration: 0.6s;
}

@
-webkit-keyframes zoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes zoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

img.resize {
width: 300px;
height: 200px
}

/* The Close Button */
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #4CAF50;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #4CAF50;
	text-decoration: none;
	cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
	}
}
</style>
</head>
<body>

	<!-- 사진 5개 랜덤 돌리기 -->
	<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="w3-container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
			<p>
				<b>MOUNTAIN OF JAPAN</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 일본의 산 <br>
			</p>

			<div class="embed-responsive embed-responsive-16by9" align="center">
				<iframe class="embed-responsive-item" width="1280" height="300px"
					src="https://www.youtube.com/embed/1oNBs_eXVyA" frameborder="0"></iframe>
			</div>
		</div>
		<div class="w3-row-padding col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
			<br> <br> <br>

			<div class="w3-third w3-container w3-margin-bottom">
				<div class="w3-container">
					<p>
						<br> <b>AREA</b>
					</p>
					<p>일본 지역별 명산</p>
				</div>
				<div class="col-sm-12 col-md-12">
					<a href="<%=MyCtrlCommand%>moList&selecter=지역별" class="thumbnail"><img class="resize" src="<%=contextPath%>/View/images/일본산이미지/혼슈오제2.png" alt="moArea"
						class="w3-hover-opacity thumbnail"></a>
				</div>
			</div>

			<div class="w3-third w3-container w3-margin-bottom">

				<div class="w3-container">
					<p>
						<br> <b>SEASON</b>
					</p>
					<p>일본 계절별 명산</p>
				</div>
				<div class="col-sm-12 col-md-12">
				<a href="<%=MyCtrlCommand%>moList&selecter=계절" class="thumbnail"><img class="resize" src="<%=contextPath%>/View/images/일본산이미지/혼슈후지산.png" alt="moSeason"
					class="w3-hover-opacity"></a>
				</div>
			</div>

			<div class="w3-third w3-container w3-margin-bottom">

				<div class="w3-container">
					<p>
						<br> <b>FLOWER</b>
					</p>
					<p>일본 꽃 명산</p>
				</div>
				<div class="col-sm-12 col-md-12">
				<a href="<%=MyCtrlCommand%>moList&selecter=꽃" class="thumbnail"><img class="resize" src="<%=contextPath%>/View/images/일본산이미지/혼슈쵸카이산2.jpg" alt="moFlower"
					class="w3-hover-opacity"></a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
