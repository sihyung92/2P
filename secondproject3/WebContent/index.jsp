<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" />
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

nav>ul {
	margin-left: -100px;
}

nav>ul>li {
	display: inline-block;
	margin: 0px 0px 0px 30px;
}

nav>ul>li>a {
	text-align: center;
}

nav>ul>li>a:visited, nav>ul>li>a:link {
	color: black;
}

section, aisde {
	float: center;
}

footer {
	margin: 500px 0px;
}

body {
	font-family: 14px "Nanum Gothic";
}

nav>ul>li>a:hover {
	height: 40px;
	border-bottom: 5px solid #024977;
	color: black;
}

nav>ul>li>a {
	display: inline-block;
	width: 115px;
	height: 50px;
	background-color: white;
	line-height: 45px;
	text-decoration: none;
	color: #024977;
	font-weight: 100;
	font-size: 16px;
}

#header1 {
	border-bottom: 1.5px solid lightgray;
}

#header2 {
	border-top: 1.5px solid lightgray;
	border-bottom: 1.5px solid lightgray;
}

#header3 {
	border-right: 1.5px solid lightgray;
}

#footer1 {
	width: 100%;
	text-align: center;
	float: none;
}

#footer2 {
	width: 100%;
	text-align: center;
	float: none;
	background: #e8e8e8;
	padding: 10px 0px;
	text-decoration: none;
}

table.table01 td {
	text-align: center;
	border-right: 1px solid lightgray;
	width: 100px;
}

table.table01 td:nth-child(1) {
	font-style: bold;
}

table.table01 {
	margin: 15px 1100px 10px 0px;
	width: 500px;
}

#content {
	width: 1200px;
	margin: 0px auto;
}

#bxslider {
	width: 1000px;
	margin: 30px auto;
}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.js"></script>
<script type="text/javascript">
	var big;
	$(document).ready(function() {
		big = $('#imgcontent').bxSlider({
			minSlides : 1,
			maxSlides : 1,
			slideWidth : 880,
			pager : true,
			auto : true,
			speed : 500,
			pause : 4000
		});
	});
</script>
</head>

<body>
	<center>
		<header>
			<table class="table01">
				<td>비트캠프</td>
				<td>서초본원</td>
				<td>강남센터</td>
				<td>신촌센터</td>
				<td>종로센터</td>
				<td>안양센터</td>
			</table>
			<div id="header1"></div>
			<a href="<%=request.getContextPath()%>"> <img alt="logo"
				src="imgs/logo.jpg">
			</a>
		</header>
		<div id="header2">
			<nav>
				<ul>
					<li><a href="#">학원소개</a></li>
					<li><a href="#">오시는길</a></li>
					<li><a href="<%=request.getContextPath()%>/lecture.bit">강좌소개</a></li>
					<li><a href="<%=request.getContextPath()%>/lms/intro.bit">학습관리시스템</a></li>
				</ul>
			</nav>
		</div>
		<div id="content">
			<div id="bxslider">
				<div id="imgcontent">
					<img alt="main" src="imgs/1.PNG" /> <img alt="main"
						src="imgs/2.PNG" /> <img alt="main" src="imgs/3.PNG" />
				</div>
			</div>
		</div>
		<section>
			<img alt="main" width="1000" src="imgs/main2.png">
		</section>
		<center>
			<div id="footer1">
				<a href="https://www.bit.kr/" target=blank> <img
					src="imgs/link2.png" height="59" /></a> <a
					href="https://www.chohyunjung.org/" target=blank><img
					src="imgs/link1.png" height="59" /></a> <a
					href="https://www.moel.go.kr/" target=blank> <img
					src="imgs/link3.png" height="59" /></a>
				<div class=clear10></div>
				<div class=clear10></div>
			</div>
		</center>
		<div id="footer2">
			<center>
				<table width="700" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="122" align="center">강사채용</td>
						<td width="164" align="center">홈페이지 이용약관</td>
						<td width="141" align="center">개인정보취급방침</td>
						<td width="130" align="center">이메일수집거부</td>
						<td width="114" align="center">오시는 길</td>
					</tr>
				</table>
			</center>
		</div>
		<table width="1174">
			<tr>
				<td height="126" align="right"><img src="imgs/logo2.jpg"
					width="284" height="75" /></td>
				<td>비트캠프 서울시 서초구 강남대로 459 (서초동, 백암빌딩)｜ 사업자등록번호 : 214-85-24928<br />
					(주)비트컴퓨터 서초본원 대표이사 : 조현정 / 문의 : 02-3486-9600 / 팩스 : 02-6007-1245<br />
					통신판매업 신고번호 : 제 서초-00098호 / 개인정보보호관리책임자 : 최종진<br /> Copyright (c)
					비트캠프 All rights reserved.
				</td>
			</tr>
		</table>
	</center>
</body>
</html>
