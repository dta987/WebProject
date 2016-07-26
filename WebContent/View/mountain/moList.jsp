<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../review/rvTOP.jsp"%>
<%
	int myoffset = 1;
	int mywidth = 12;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
</style>
</head>
<body>

	<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">

		<div class="w3-row col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
			<div class="w3-twothird w3-container ">
				<h3>
					<font color="green"><strong>Mountain Of JAPAN</strong></font>
					<!-- #39ac39 -->
				</h3>
				<h5>
					<font color="#009933"><strong>&nbsp;&nbsp;산, 어디까지 가봤니?</strong></font>
				</h5>
				<br>
				<p>&nbsp;&nbsp;일본은 환태평양 조산대에 속하여 험준한 산맥과 화산이 많은데 국토의 약 73%가 산악지대입니다. 물론 일본의 산은 그 규모로는 히말라야
					지역과 비교할 수 없지만 나름의 웅장함을 자랑하고, 동시에 아기자기한 면모도 갖추어 우리나라와는 또 다른 색다른 트레킹을 즐길 수 있습니다.</p>
				<br> <br>
				<h5>
					<font color="#009933"><strong>&nbsp;&nbsp;산행 하기 위한 준비</strong></font>
				</h5>

				<p>
					<br> <font color="#009900"><strong>&nbsp;&nbsp;step 1 철저한 계획 세우기</strong></font> <br>&nbsp;&nbsp;&nbsp;철저한
					계획 세우기 일본의 산은 평균 6~10시간 정도 산행을 해야 하고, 산장에는 늦어도 오후 4시까지 도착해야 하므로 출발 전 계획을 철저하게 세우는 것이 중요합니다.
				</p>

				<p>
					<font color="#009900"><strong>&nbsp;&nbsp;step 2 준비물 갖추기</strong></font> <br>&nbsp;&nbsp;&nbsp;준비물
					갖추기 일본의 산은 등산로에 안내 표지판이 거의 없습니다. 우리나라와 달리 분기점과 지명 정도만 한자로 표시되어 있습니다. 게다가 산이 깊어 전파가 도달할 수 없어
					휴대폰이나 생활무전기 등을 사용하기가 어려운 만큼 일본 산행시에는 등산 지도, 나침반, GPS 등을 필수로 지참해야 합니다.
				</p>

				<p>
					<font color="#009900"><strong>&nbsp;&nbsp;step 3 날씨 확인은 필수</strong></font> <br>&nbsp;&nbsp;&nbsp;산의
					날씨는 변화무쌍합니다. 특히 일본은 2,000~3,000급의 고산이 많아 갑작스런 기상악화가 잦은 편입니다. 혹시 모를 저체온증이나 만일의 상황을 대비하여 방한복과 우비는
					필수로 갖추고, 등산 출발 전 반드시 날씨를 확인합니다.
				</p>

				<p>
					<font color="#009900"><strong>&nbsp;&nbsp;step 4 전문가와 동행하는 것을 추천</strong></font> <br>&nbsp;&nbsp;&nbsp;일본의
					등산로는 대부분이 자연 그대로의 모습으로, 붕괴가 심하거나 위험한 코스에만 가이드 로프와 사다리 등을 설치해 놓았습니다. 따라서 준비물을 잘 갖추고 철저하게 계획을 세운
					후에 전문가와 동행하는 것을 추천합니다. 전문가와 동행한다 해도 만일의 사고를 대비하여 자신의 산행 실력을 자만해서는 안 됩니다.
				</p>

				<p>
					<font color="#009900"><strong>&nbsp;&nbsp;step 5 산장 숙박시 유의할 점</strong></font> <br>&nbsp;&nbsp;&nbsp;산장
					숙박시에는 산장별 운영기간을 반드시 사전에 확인하고, 되도록 오후 시간대에 산장에 도착할 수 있도록 합니다. 일반적으로 석식은 오후 5시부터, 소등은 저녁 8시부터입니다.
					또한 일본 산장에서는 가스, 햇반 등은 판매하지 않지만 컵라면, 커피, 초콜릿 등은 판매합니다.
				</p>

			</div>
		</div>

		<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
			<br> <br> <br>
			<div class="w3-twothird w3-container ">
				<br> <br> <br>
				<c:if test="${requestScope.selecter == '지역별'}">
					<h3>
						<font color="green"><strong>AREA</strong></font>

					</h3>
					<h5>
						<font color="#009933"><strong>&nbsp;&nbsp;일본 지역별 명산</strong></font>
					</h5>
					<br>
				</c:if>

				<c:if test="${requestScope.selecter == '계절'}">
					<h3>
						<font color="green"><strong>SEASON</strong></font>
					</h3>
					<h5>
						<font color="#009933"><strong>&nbsp;&nbsp;일본 계절별 명산</strong></font>
					</h5>
					<br>
				</c:if>

				<c:if test="${requestScope.selecter == '꽃'}">
					<h3>
						<font color="green"><strong>FLOWER</strong></font>
					</h3>
					<h5>
						<font color="#009933"><strong>&nbsp;&nbsp;일본 꽃 명산</strong></font>
					</h5>
					<br>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '지역별'}">
					<h2>훗카이도</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_area == '훗카이도'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '지역별'}">
					<h2>혼슈</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_area == '혼슈'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '지역별'}">
					<h2>알프스 지역</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_area == '알프스 지역'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '지역별'}">
					<h2>큐슈</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_area == '큐슈'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '계절'}">
					<h2>봄</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_thema2 == '봄'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '계절'}">
					<h2>여름</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_thema2 == '여름'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '계절'}">
					<h2>가을</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_thema2 == '가을'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '계절'}">
					<h2>겨울</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_thema2 == '겨울'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '꽃'}">
					<h2>훗카이도</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_area == '훗카이도'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '꽃'}">
					<h2>혼슈</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_area == '혼슈'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<div class="w3-twothird w3-container ">
				<c:if test="${requestScope.selecter == '꽃'}">
					<h2>큐슈</h2>
					<c:forEach var="bean" items="${requestScope.lists}">
						<c:if test="${bean.mountain_area == '큐슈'}">
							<div class="w3-third w3-container w3-margin-bottom">
								<div class="w3-container">

									<p>${bean.mountain_name}</p>
								</div>
								<div class="col-sm-12 col-md-12">
									<a href="<%=MyCtrlCommand%>moDetailView&no=${bean.mountain_no}" class="thumbnail"><img
										class="resize" src="<%=uploadedFolder%>${bean.mountain_img}" alt=""
										class="w3-hover-opacity thumbnail"></a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<br> <br>
	</div>
</body>
</html>
