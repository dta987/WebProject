<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="w3-container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
	<p>
		<b>MOUNTAIN OF JAPAN</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 일본의 산
		<br>
	</p>
	</div>
	<img id="myImg" src="<%=contextPath%>/View/images/일본산이미지/알프스가사가다케.png"
		alt="알프스가사가다케 혼슈" width="300" height="200">
	<!-- The Modal -->
	<div id="myModal" class="modal">
		<span class="close">×</span> <img class="modal-content" id="img01">
		<div id="caption"></div>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the image and insert it inside the modal - use its "alt" text as a caption
		var img = document.getElementById('myImg');
		var modalImg = document.getElementById("img01");
		var captionText = document.getElementById("caption");
		img.onclick = function() {
			modal.style.display = "block";
			modalImg.src = this.src;
			modalImg.alt = this.alt;
			captionText.innerHTML = this.alt;
		}

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
	</script>



	<!-- First Photo Grid-->
	<%-- <div
		class="w3-row-padding col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<br> <br> <br> <br>
		<div class="w3-third w3-container w3-margin-bottom ">

			<img src="<%=contextPath%>/View/images/산타니05.jpg" alt="moJapan" style="width: 100%"
				class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p>
					<b>MOUNTAIN OF JAPAN</b>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 일본의 산
				</p>
				
			</div>
		</div>

	</div> --%>

	<!-- Second Photo Grid-->
	<div
		class="w3-row-padding col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<br>
		<br>
		<br>

		<div class="w3-third w3-container w3-margin-bottom">
			<div class="w3-container">
				<p>
					<br>
					<b>AREA</b>
				</p>
				<p>일본 지역별 명산</p>
			</div>
			<a href="#"><img src="<%=contextPath%>/View/images/japanArea.png"
				alt="moArea" style="width: 80%" class="w3-hover-opacity"></a>
		</div>

		<div class="w3-third w3-container w3-margin-bottom">

			<div class="w3-container">
				<p>
					<br>
					<b>SEASON</b>
				</p>
				<p>일본 계절별 명산</p>
			</div>
			<a href="#"><img
				src="<%=contextPath%>/View/images/일본산이미지/혼슈후지산.png" alt="moSeason"
				style="width: 100%" class="w3-hover-opacity"></a>
		</div>

		<div class="w3-third w3-container w3-margin-bottom">

			<div class="w3-container">
				<p>
					<br>
					<b>FLOWER</b>
				</p>
				<p>일본 꽃 명산</p>
			</div>
			<a href="#"><img
				src="<%=contextPath%>/View/images/일본산이미지/혼슈쵸카이산2.jpg" alt="moFlower"
				style="width: 92%" class="w3-hover-opacity"></a>
		</div>
	</div>

	<!-- Pagination -->
	<!-- <br>
	<br>
	<br>
	<div class="w3-center w3-padding-32">
		<ul class="w3-pagination">
			<li><a class="w3-green" href="#">1</a></li>
			<li><a class="w3-hover-green" href="#">2</a></li>
			<li><a class="w3-hover-green" href="#">3</a></li>
			<li><a class="w3-hover-green" href="#">4</a></li>
			<li><a class="w3-hover-green" href="#">»</a></li>
		</ul>
	</div>
 -->



	<!-- <div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<div style="position: fixed; background-color: yellow; width:250px ; text-align:left;">
					<h3>&nbsp;&nbsp;&nbsp;카테고리</h3>
					<ul class="nav nav-pills nav-stacked">
						<li class="active" id="menu1"><a href="#section1">&nbsp;&nbsp;&nbsp;지역별</a></li>
						<li><a href="#section2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홋카이도</a></li>
						<li><a href="#section3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;혼슈</a></li>
						<li><a href="#section3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시코쿠</a></li>
						<li><a href="#section4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;큐슈</a></li>
					</ul>
					<ul class="nav nav-pills nav-stacked">
						<li class="active"><a href="#section5">&nbsp;&nbsp;&nbsp;테마별</a></li>
						<li><a href="#section6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;초심자 산</a></li>
						<li><a href="#section7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마니아 산</a></li>
						<li><a href="#section8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전문가 산</a></li>
					</ul>
				</div>



			</div>
			<div class="col-sm-9">
				<h4>
					<small>RECENT POSTS</small>
				</h4>
				<hr>
				<h2>I Love Food</h2>
				<p>
				<h1>내용입니다.</h1>
				<br>
				<h1>내용입니다.</h1>
				<br>
				<h1>내용입니다.</h1>
				<br>
				<h1>내용입니다.</h1>
				<br>
				<h1>내용입니다.</h1>
				<br>
				<h1>내용입니다.</h1>
				<br>
				<h1>홋카이도</h1>
				<br>
				<h1>내용입니다.</h1>
				<br>
				</p>
			</div>
		</div>
	</div> -->


</body>
</html>
