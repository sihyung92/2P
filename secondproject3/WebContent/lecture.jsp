<%@page import="com.bit.model.ClassDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
	text-align: center;
}

body {
	width: 100%;
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

nav>ul {
	margin-left: -100px;
}

nav>ul>li {
	display: inline-block;
	margin: 0px 0px 0px 30px;
}

nav>ul>li>a {
	display: inline-block;
	width: 115px;
	height: 50px;
	line-height: 45px;
	text-decoration: none;
	color: #024977;
	font-weight: 100;
	font-size: 16px;
}

nav>ul>li>a:hover {
	height: 40px;
	border-bottom: 5px solid #024977;
	color: black;
}

nav>ul>li>a:visited, nav>ul>li>a:link {
	color: black;
}

section {
	text-align: center;
}

section>table {
	width: 873px;
	height: 400px;
	margin: 0px auto;
}

section>table>thead>tr>td {
	text-align: left;
	font-size: 20px;
	font-weight: 600;
	padding-top: 20px;
	padding-bottom: 20px;
}

section>table>tbody>tr {
	
}

section>table>tbody>tr>td:nth-child(2n-1) {
	border-right-width: 10px;
	border-right-style: solid;
	border-right-color: white;
}

section>table>tbody>tr>td:nth-child(2n) {
	border-left-width: 10px;
	border-left-style: solid;
	border-left-color: white;
}

section>table>tbody>tr>td {
	background-color: rgb(211, 237, 255);
	border-bottom-width: 20px;
	border-bottom-color: white;
	border-bottom-style: solid;
	text-align:left;
	padding-top:40px;
	padding-bottom:40px;
	width: 424px;
	height: 150px;
	display: inline-block;
}

section>table+div {
	margin: 30px auto 30px;
	width: 843px;
	height: 80px;
	background-color: rgb(211, 237, 255);
	padding-top: 40px;
}
section>h1{
	padding-top : 40px;
	padding-bottom : 20px;
}
section div>p {
	font-size: 15px;
	font-weight: normal;
}

#footer1 {
	width: 100%;
	text-align: center;
	float: none;
}

#footer2 {
	width: 100%;
	float: none;
	background: #e8e8e8;
	padding: 10px 0px;
	text-decoration: none;
}
#footer2 table {
	margin: 0 auto;
}
.title{
	margin-left : 20px;
	margin-right : 20px;
	font-weight: 800;
	font-family: "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
}
#soon{
	text-align : center;
	font-size : 20pt;
	font-weight: bold;
	line-height: 140px;
}
.red{
	color:rgb(230,80,80);
	font-weight:800;
}
.blue{
	color:rgb(80,80,250);
	font-weight:800;
}
#slimbar{
	display : block;
	background-color : rgb(180,180,180);
	margin: 10px auto;
	height:2px;
	width: 400px;
}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$()
	});
</script>
</head>
<body>
	<center>
		<header>
			<table class="table01">
				<tr>
					<td>비트캠프</td>
					<td>서초본원</td>
					<td>강남센터</td>
					<td>신촌센터</td>
					<td>종로센터</td>
					<td>안양센터</td>
				</tr>
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
		<section>
					<%
						ArrayList<ClassDto> list = (ArrayList<ClassDto>) request.getAttribute("bean");
						if (list==null) {
							out.print("<h1>현재 수강가능한 강좌가 없습니다.<h1>");
						} else {
							%>
			<table>
				<thead>
					<tr>
						<td>비트캠프 안양센터 개강일정</td>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 0; i < list.size(); i++) {
								ClassDto bean = list.get(i);
					%>
					<td><span class="title">강의명</span><%=bean.getName()%></br><span class="title"> 강사명</span><%=bean.getTeacherName()%></br>
						<span class="title">수강기간</span><%=bean.getTotalDate()%></br><span class="title">강의일정</span>월 - 금 (09:30 ~ 18:00)</br>
						<span class="title">모집여부</span><%if(bean.isRecruitng()){
							out.print("<span class=\"blue\">모집중</span></br>");
						}else{
							out.print("<span class=\"red\">마감</span></br>");
						}%>
						<div id="slimbar"></div>
						<span class="title">강의과정</span><%=bean.getContent()%>
					</td>
					<%
						}
					if(list.size()%2==1){
						%>
						<td id="soon"><span>개강 예정</span></td>
						<%
					}
					%>
				</tbody>
			</table>
					<%
						}
					%>
			<div>
				<p>
					상세 개강일정 및 교육관련 문의사항은<br /> (서초) 02-3486-9600 (신촌) 02-707-1480~1
					(안양) 031-112-119로 부탁드립니다.
				</p>
			</div>
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
			<table width="700" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="122" align="center">강사채용</td>
					<td width="164" align="center">홈페이지 이용약관</td>
					<td width="141" align="center">개인정보취급방침</td>
					<td width="130" align="center">이메일수집거부</td>
					<td width="114" align="center">오시는 길</td>
				</tr>
			</table>
		</div>
		<center>
			<table width=1174>
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