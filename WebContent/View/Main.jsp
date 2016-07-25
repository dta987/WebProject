<%@page import="java.util.Random, java.io.File, java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./review/rvTOP.jsp"%>
<% 
	
	File file = new File(absoluteWebPath);
	File[] imgFiles = file.listFiles();
	Random ran = new Random();
	HashSet<String> imgset = new HashSet<String>();
	for( int i=0 ; imgset.size() < 5; i++){
		String randomIMG = null;
		int j = ran.nextInt(imgFiles.length);
		randomIMG = imgFiles[j].toString();
		int num = randomIMG.indexOf("\\View\\images\\일본산이미지");
		randomIMG = randomIMG.substring(num);
		imgset.add(randomIMG);
	}
	
	String[] carousel_img = imgset.toArray(new String[0]);
	 /*
	 String[] carousel_img = {"/View/images/일본산이미지/알프스가사가다케.png",
			"/View/images/일본산이미지/큐슈기리시마야마봄1.png", "/View/images/일본산이미지/알프스다테야마.png",
			"/View/images/일본산이미지/혼슈기타다케여름2.jpg"};*/ 
	
%>
<%
	int myoffset = 3;
	int mywidth = twelve - 2 * myoffset;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<style type="text/css">

.mybutton {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    size:10px;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    
}

.mybutton1 {
    background-color: white; 
    color: #4CAF50; 
    border: 2px solid #4CAF50;
    border-radius: 24px;    
}

.mybutton1:hover {
    background-color: #4CAF50;
    color: white;
}


</style>
</head>
<body>

	<div class="container-fluid ">
		<c:forEach var="carousel_img" items="<%=carousel_img%>">
			<div class="w3-display-container mySlides col-sm-offset-1 col-sm-7">
				<div class="container-fluid">
					<img src="<%=contextPath %>${carousel_img}" style="width:150%; height:330px">
					<br><br><br>
				</div>
			</div>
		</c:forEach>

		
		<div class="w3-container w3-padding-5 col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
			<div class="w3-left w3-hover-text-teal w3-large" onclick="plusDivs(-1)">❮</div>
			<div class="w3-right w3-hover-text-teal w3-large" onclick="plusDivs(1)">❯</div>

			<div class="w3-center">
				<c:forEach begin="1" var="i" end="<%=carousel_img.length%>" step="1">
					<span class="w3-tag demodots w3-border w3-transparent w3-hover-green"
						onclick="currentDiv(${i})"></span>
				</c:forEach>	
			</div>
		</div>
	</div>
		<br><br><br><br>
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
