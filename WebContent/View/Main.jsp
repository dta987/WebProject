<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../View/review/rvTOP.jsp"%>
<%!String[] carousel_img = { "/View/images/산타니05.jpg",
			"/View/images/일본지도5.png", "/View/images/산타니05.jpg",
			"/View/images/산타니05.jpg" };%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<c:forEach var="carousel_img" items="<%=carousel_img%>" varStatus="status">
				<c:if test="${status.first}">
					<div class="item active" align="center">
						<img src="<%=contextPath%>${carousel_img}" alt="Chania" width="300px" height="100px">
					</div>
				</c:if>
				<c:if test="${not status.first}">
					<div class="item" align="center">
						<img src="<%=contextPath%>${carousel_img}" alt="Chania" width="300px" height="100px">
					</div>
				</c:if>
			</c:forEach>

		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
</body>
</html>
