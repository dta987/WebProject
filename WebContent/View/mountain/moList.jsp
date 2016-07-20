<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../member/meMypage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.row.content{height: 1500px}
	.sidenav {
      /* background-color: #41FF3A; */
      background-color: #469840;
      height: 30%;
    }
    .row.content {height: auto;} 
</style>
</head>
<body>
	
  <div class="container-fluid">
    <div class="row content">
    <div class="col-sm-3 sidenav">
      <h2>카테고리</h2>
       <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">지역별</a></li>
        <li><a href="#section2"><font color="white">홋카이도</font></a></li>
        <li><a href="#section3"><font color="white">혼슈</font></a></li>
        <li><a href="#section3"><font color="white">시코쿠</font></a></li>
        <li><a href="#section4"><font color="white">큐슈</font></a></li>
      </ul>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section5">테마별</a></li>
        <li><a href="#section6" color="white">초심자 산</a></li>
        <li><a href="#section7" color="white">마니아 산</a></li>
        <li><a href="#section8" color="white">전문가 산</a></li>
      </ul>
    
  
</div>
<div class="col-sm-9">
      <h4><small>RECENT POSTS</small></h4>
      <hr>
      <h2>I Love Food</h2>
      <p>
      					내용입니다.
      </p>
</div>
</div>			
</body>
</html>
