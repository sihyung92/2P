<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <style type="text/css">
        #content {
            background-color:white;
            width:1000px
        }

        #content table {
            width: 800px;
            height:500px;
            margin: 0px auto;
            background-color: white;
            border-top:1px solid black;
            border-bottom:1px solid black;
            z-index:1;
           
        }
       	.bbs th{
       		border-bottom: 1px solid #ccc;
       	}
       	.bbs td{
       		border-bottom: 1px solid #ccc;
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
        tr>td{
        	text-align:center;
        }
        .bbs{
        	margin: 0px auto;
        	width:100%
        	z-index:3;
        }
        h1{
        	position:relative;
        	top:30px;
        }
        th:nth-child(3){
        	width:50%;
        }
        input[name="serch"]{
        	text-align:right;
        }
        #ca{
        text-align:center;
        }
        #btn{
       	 text-align:right;
        }
        select{
        	text-align:left;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="js/jquery.bxslider.js"></script>
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
            
            	$('button').click(function(){
            		window.location.href='Bbsadd.jsp';
            	});
            
        });
    </script>
    <title>비트캠프 학습관리시스템</title>
</head>
<body>
    <!--    헤더     -->
    <div id="header">
        <div>
            <img alt="logo" src="imgs/logo.jpg" />
            <p>환영합니다
                <img alt="topmenuicon" src="imgs/topmenu.PNG" id="topicon" /></p>
            <ul id="topmenu">
                <li><a href="#">내 강의실</a></li>
                <li><a href="#">내 정보</a></li>
                <li><a href="#">메인</a></li>
                <li><a href="#">로그아웃</a></li>
            </ul>
        </div>
    </div>
    <!--    왼쪽 메뉴     -->
    <div id="leftsize">
        <div id="menuleft">
            <img alt="menulefticon" src="imgs/leftmenu.PNG" id="lefticon" />
            <ul>
                <li><a href="#">내 강의실</a></li>
                <li><a href="#">질문게시판</a></li>
                <li><a href="#">과제게시판</a></li>
                <li><a href="#">수업자료실</a></li>
                <li><a href="#">스케줄</a></li>
            </ul>
        </div>
    </div>
    <!-- *****content start*****    -->
    <div id="content">
        <h1>질문 게시판</h1>
        <div>
            <div>
        <select>
        	<option value="">전체보기</option>
        </select>
                <input type="text" id="search" name="search" />
                <button>검색</button>
            </div>
        </div>
        <table class="bbs">
            <tr>
            	<th><input type="checkbox" name="chk"></th>
                <th >NO.</th>
                <th>제목</th>
                <th>상태</th>
                <th>작성자</th>
                <th>등록일</th>
                <th>조회수</th>
            </tr>
            <tr>
            	<td><input type="checkbox" name="chk"></td>
                <td>10</td>
                <td>sub</td>
                <td>미답변</td>
                <td>학생1</td>
                <td>2019.3.27</td>
                <td>0</td>
            </tr>
            <tr>
            <td><input type="checkbox" name="chk"></td>
                <td>9</td>
                <td>sub</td>
                <td>미답변</td>
                <td>학생1</td>
                <td>2019.3.27</td>
                <td>0</td>
            </tr>
             <tr>
             <td><input type="checkbox" name="chk"></td>
                <td>8</td>
                <td>sub</td>
                <td>미답변</td>
                <td>학생1</td>
                <td>2019.3.27</td>
                <td>0</td>
            </tr>
             <tr>
             <td><input type="checkbox" name="chk"></td>
                <td>7</td>
                <td>sub</td>
                <td>미답변</td>
                <td>학생1</td>
                <td>2019.3.27</td>
                <td>0</td>
            </tr>
             <tr>
             <td><input type="checkbox" name="chk"></td>
                <td>6</td>
                <td>sub</td>
                <td>미답변</td>
                <td>학생1</td>
                <td>2019.3.27</td>
                <td>0</td>
            </tr>
             <tr>
             <td><input type="checkbox" name="chk"></td>
                <td>5</td>
                <td>sub</td>
                <td>미답변</td>
                <td>학생1</td>
                <td>2019.3.27</td>
                <td>0</td>
            </tr>
             <tr>
             <td><input type="checkbox" name="chk"></td>
                <td>4</td>
                <td>sub</td>
                <td>미답변</td>
                <td>학생1</td>
                <td>2019.3.27</td>
                <td>0</td>
            </tr>
            <tr>
            <td><input type="checkbox" name="chk"></td>
                <td>3</td>
                <td>sub</td>
                <td>미답변</td>
                <td>학생1</td>
                <td>2019.3.27</td>
                <td>0</td>
            </tr>
             <tr>
             <td><input type="checkbox" name="chk"></td>
                <td>2</td>
                <td>sub</td>
                <td>미답변</td>
                <td>학생1</td>
                <td>2019.3.27</td>
                <td>0</td>
            </tr>
            <tr>
            <td><input type="checkbox" name="chk"></td>
                <td>1</td>
                <td>sub</td>
                <td>미답변</td>
                <td>학생1</td>
                <td>2019.3.27</td>
                <td>0</td>
            </tr>
        </table>
	        <div id="ca">
	            <a href="#">이전</a>
	            <a href="#">1</a>
	            <a href="#">2</a>
	            <a href="#">3</a>
	            <a href="#">4</a>
	            <a href="#">다음</a>
	        </div>
	        <div id="btn">
	            <button type="button">삭제</button>
	        </div>
    </div>
    <!-- *****content end***** -->
    <!--    바닥글     -->
    <div id="footer">
        <table>
            <tr>
                <td height="126" align="right">
                    <img src="/imgs/logo.jpg" width="284" height="75" />
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
