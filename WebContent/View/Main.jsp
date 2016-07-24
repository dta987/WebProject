<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./review/rvTOP.jsp"%>
<% 
	String[] carousel_img = {"/View/images/일본산이미지/알프스가사가다케.png",
			"/View/images/일본산이미지/큐슈기리시마야마봄1.png", "/View/images/일본산이미지/알프스다테야마.png",
			"/View/images/일본산이미지/혼슈기타다케여름2.jpg"};
%>
<%
	int myoffset = 3;
	int mywidth = twelve - 2 * myoffset;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>


	<div class="container-fluid col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<c:forEach var="carousel_img" items="<%=carousel_img%>">
			<div class="w3-display-container mySlides">
				<div class="container-fluid" align="center">
					<img src="<%=contextPath%>${carousel_img}" style="width: 100%; height: 500px">
					<br><br>
				</div>
			</div>
		</c:forEach>

		<!-- Slideshow next/previous buttons -->
		<div class="w3-container w3-dark-grey w3-padding-8">
			<div class="w3-left w3-hover-text-teal w3-large" onclick="plusDivs(-1)">❮</div>
			<div class="w3-right w3-hover-text-teal w3-large" onclick="plusDivs(1)">❯</div>

			<div class="w3-center">
				<c:forEach begin="1" var="i" end="<%=carousel_img.length%>" step="1">
					<span class="w3-tag demodots w3-border w3-transparent w3-hover-white"
						onclick="currentDiv(${i})"></span>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<img src="<%=contextPath%>/View/images/일본산이미지/알프스가사가다케.png" style="width: 100%; height: 500px">
	<img src="<%=contextPath%>/View/images/일본산이미지/알프스가사가다케.png" style="width: 100%; height: 500px">
	<img src="<%=contextPath%>/View/images/일본산이미지/알프스가사가다케.png" style="width: 100%; height: 500px">
	<img src="<%=contextPath%>/View/images/일본산이미지/알프스가사가다케.png" style="width: 100%; height: 500px">
	<img src="<%=contextPath%>/View/images/일본산이미지/알프스가사가다케.png" style="width: 100%; height: 500px">
	<img src="<%=contextPath%>/View/images/일본산이미지/알프스가사가다케.png" style="width: 100%; height: 500px">

	<script>
		// Slideshow script
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
		}

		function currentDiv(n) {
			showDivs(slideIndex = n);
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("demodots");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" w3-white", "");
			}
			x[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " w3-white";
		}
	</script>
</body>
</html>
