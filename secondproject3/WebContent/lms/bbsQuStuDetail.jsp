<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.bxslider.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
    <style type="text/css">
    	#topmargin{
    		height:100px;
    	}
        .bbs{
        	margin:0px auto;
            width: 800px;
            height:490px;
            border-collapse: collapse;
            background-color: white;
            border:1px solid black;
            z-index:1;
        }
       	td{
       		border:1px solid black;
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
        .bbs tr>td{
        	text-align:left;
        }
        
        select{
        	text-align:left;
        }
        .section{
        	claer:both;
        	height:800px;
        	margin:0px auto;
        }
       	tr:nth-child(1){
       		width:100%;
       		height:10%;
       	}
       	tr:nth-child(2){
       		height:10%;
       		width:100%;
       	}
       	tr:nth-child(3){
       		height:60%;
       		width:100%;
       	}
       	tr:nth-child(4){
       		height:20%;
       		width:100%;
       	}
       	textarea{
       		width:650px;
       		height:50px;
       	}
       	.bbs{
       		border:1px solid black;
       	}
       	btn{
       		font-size:20px;
       		width: 60px;
       		height:40px;
       	}
       	#bot{
       		margin:0px auto;
       		width:800px;
       		text-area:right;
       	}
       	#bot>button{
       		float:right;
       		width:60px;
       		height:40px;
       	}
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.bxslider.js"></script>
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
                <p>관리자님
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
	        
        <table class="bbs">
            <tr>
                <td></td>
            </tr>
            
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <th><textarea name="bb"></textarea>&nbsp<button id="btn">입력</button></th>
            </tr>
        </table>
        <br/><br/>
        
        <div id="bot">
        	<button>수정</button>
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