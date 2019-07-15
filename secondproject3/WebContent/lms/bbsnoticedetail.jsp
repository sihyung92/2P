<%@page import="com.bit.model.BbsDto"%>
<%@page import="com.bit.model.BbsDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.bxslider.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.bxslider.js"></script>
    <style type="text/css">
       	#topmargin{
    		height:100px;
    	}
        .bbs{
            width: 800px;
            height:490px;
            background-color: lightgray;
            z-index:1;
            border-collapse:collapse;
        }
       
        
        #content>div{
            width: 800px;
            margin: 0px auto;
            
        }
        #content div>select{
            display: inline-block;
        }
        #content div>div{
            display: inline-block;
            margin: 0px 0px 10px 450px;
        }
        
        .bbs{
        	border:1px solid;
        	margin: 0px auto;
        	width:100%
        	z-index:3;
        }
        .bbs tr:nth-child(1){
        	height:20%;
        	border:1px solid;
        }
        .bbs tr:nth-child(1)>td{
        	padding-left:20px;
        }
        .bbs tr:nth-child(2){
        	height:10%;
        }
         .bbs tr:nth-child(2)>td{
        	padding-left:20px;
        }
        .bbs tr:nth-child(3){
        	height:50%;
        }
        .bbs tr:nth-child(4){
        	height:20%;
        	border:1px solid;
        }
        .bbs tr:nth-child(4)>td+td{
        	position:relative;
        	left:-20px;
        }
       
        .span1{
        	float:right;
        	text-align:right;
        	margin-right:20px;
        	
        }
        button{
        	background-color:lightblue;
        	font-size:10
        }
        select{
        	text-align:left;
        }
        .section{
        	claer:both;
        	height:800px;
        	margin:0px auto;
        }
       
        select{
        	text-align:center;
        }
       	#span3{
       		float:left;
       		margin-left:30px;
       	}
       	textarea{
       		margin-left:50px;
       		height:50px;
       	}
       	input[name='goback']{
       		clear:both;
       		float:right;
       		right:100px;
       		margin-top:20px;
       	}
    </style>
    <script type="text/javascript">
        var big;
        $(document).ready(function() {
            //이미지 슬라이드
            big = $('#imgcontent').bxSlider({
                minSlides: 1,
                maxSlides: 1,
                slideWidth: 800,
                pager: true,
                auto: true,
                pause: 5000
            });
            //위쪽 메뉴아이콘 마우스오버
            $("#topicon").hover(function() {
                $("#topmenu").stop().fadeIn();
            }, function() {
                $("#topmenu").stop().fadeOut();
            });
            //위쪽 메뉴 마우스오버
            $("#topmenu").hover(function() {
                $("#topmenu").stop().fadeIn();
            }, function() {
                $("#topmenu").stop().fadeOut();
            });
            //왼쪽 메뉴아이콘 마우스오버
            $("#lefticon").hover(function() {
                $("#menuleft>ul").stop().fadeIn();
            }, function() {
                $("#menuleft>ul").stop().fadeOut();
            });

            //왼쪽 메뉴 마우스오버
            $("#menuleft>ul").hover(function() {
                $("#menuleft>ul").stop().fadeIn();
            }, function() {
                $("#menuleft>ul").stop().fadeOut();
            });
        });
        
        function goback(){
        		window.history.back();
        }
        function godelete(){
        	window.location.href='qudelete.bit';
        }
    </script>
    <title>비트캠프 학습관리시스템</title>
</head>
<body>

<!-- 질문게시판 강사 -->

     <!--    헤더     -->
    <div id="header">
        <div>
            <!--    왼쪽 메뉴     -->
            <div id="menuleft">
                <img alt="menulefticon" src="<%=request.getContextPath()%>/imgs/leftmenu.PNG" id="lefticon" />
                <ul>
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="#">질문게시판</a></li>
                    <li><a href="#">과제게시판</a></li>
                    <li><a href="#">수업자료실</a></li>
                    <li><a href="#">스케줄</a></li>
                </ul>
            </div>
            <img alt="logo" src="<%=request.getContextPath()%>/imgs/logo.jpg" id="logo" />
            <div id="top">
                <p>강사1
                    <img alt="topmenuicon" src="<%=request.getContextPath()%>/imgs/topmenu.PNG" id="topicon" /></p>
                <!--   상단메뉴   -->
                <ul id="topmenu">
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="#">내 정보</a></li>
                    <li><a href="#">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- *****content start*****    -->
   <section class="section">
    <div id="content">
    <div id="topmargin"></div>
    
	        <h1>상세페이지</h1>
	        <br/>
	      <%
	      	BbsDto bean=(BbsDto)request.getAttribute("detail"); 
	      %>
        <table class="bbs">
          <tr>
          	<td colspan="2">
          		<div></div>제목 &nbsp&nbsp<%=bean.getTitle() %><div><span>작성자&nbsp&nbsp<%=bean.getId() %></span> <span class="span1">등록일&nbsp&nbsp<%=bean.getNalja() %></span></div>
          	</td>
          </tr>
          <tr>
          	<td colspan="2"></td>
          </tr>
          <tr>
          	<td colspan="2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=bean.getContent() %></td>
          </tr>
          <tr>
          	<td rowspan="3"><textarea cols="80" readonly="readonly">준비중입니다.</textarea></td><td border="0" rowspan="3"><button>입력</button></td>
          </tr>
        </table>
        <div>
           <input type="button" value="뒤로" onclick=goback() name="goback"/>
        </div>
        
    </div>
	</section>
    <!-- *****content end***** -->
    <!--    바닥글     -->
    <div id="footer">
        <table>
            <tr>
                <td height="126" align="right">
                    <img src="<%=request.getContextPath()%>/imgs/logo.jpg" width="284" height="75" />
                </td>
                <td>
                    비트캠프 서울시 서초구 강남대로 459 (서초동, 백암빌딩)｜ 사업자등록번호 : 214-85-24928<br />
                    (주)비트컴퓨터 서초본원 대표이사 : 조현정 / 문의 : 02-3486-9600 / 팩스 : 02-6007-1245<br />
                    통신판매업 신고번호 : 제 서초-00098호 / 개인정보보호관리책임자 : 최종진<br />
                    Copyright &copy; 비트캠프 All rights reserved.
                </td>
            </tr>
        </table>
    </div>
</body>
</html>