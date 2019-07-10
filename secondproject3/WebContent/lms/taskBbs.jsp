<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
  <style type="text/css">
        #content {
            position: relative;
            top: 150px;
        }

        #content h3+input+div {
            margin: 20px;
        }

        #content h3+input+div span {
            position: relative;
            top: 10px;
            left: 30px;
            font-weight: bold;
        }

        #content h3+input+div label {
            font-size: 14px;
            position: relative;
            left: 610px;
            top:10px;
        }

        #content h3+input+div select {
            width: 250px;
            height: 26px;
            position: relative;
            left: 370px;
            top:10px;
        }

        #content #designdiv {
            width: 900px;
            height: 300px;
            margin: 20px auto;
            background-color: rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        #content #designdiv #contentdiv {
            width: 600px;
            height: 200px;
            position: relative;
            top: 50px;
            left: 50px;
        }

        #content #designdiv #contentdiv span {
            font-size: 25px;
        }

        #content #designdiv #contentdiv label {
            font-size: 14px;
            position: relative;
            left: 250px;
        }

        #content #designdiv #contentdiv p {
            width: 500px;
            height: 150px;
            margin: 10px auto;
            overflow: hidden;
        }

        #content #designdiv #colordiv {
            width: 200px;
            height: 260px;
            position: relative;
            top: -180px;
            left: 660px;
        }

        #content #designdiv #colordiv div {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            border-radius: 30px;
            width: 150px;
            height: 50px;
            line-height: 50px;
            background-color: dodgerblue;
            position: absolute;
            left: 30px;

        }

        #content #designdiv #colordiv div+div {
            position: absolute;
            top: 200px;
            left: 30px;
            background-color: firebrick;
        }

        #content #tablediv {
            width: 900px;
            margin: 50px auto;
        }

        #content #tablediv span {
            position: relative;
            top: 10px;
            left: 30px;
            font-weight: bold;
        }

        #content #tablediv input[type="text"] {
            width: 200px;
            height: 25px;
            position: relative;
            left: 550px;
        }

        #content #tablediv input[type="button"] {
            background-color: white;
            border: 1px solid black;
            height: 28px;
            width: 50px;
            position: relative;
            top: 2px;
            left: 550px;
        }

        #content #tablediv table {
            margin: 0px auto;
            width: 900px;
            position: relative;
            top: 10px;
            border: 1px solid gray;
            border-collapse: collapse;
            padding: 5px;
            font-size: 14px;
            text-align: center;
        }

        #content #tablediv tr,
        #content #tablediv td,
        #content #tablediv th {
            border: 1px solid gray;
            border-collapse: collapse;
            padding: 5px;
            font-size: 14px;
            text-align: center;
            height: 18px;
        }

        #content #tablediv #noth {
            width: 40px;
        }

        #content #tablediv tr>td:nth-child(2) {
            text-align: left;
            padding: 0px 15px;
        }

        #content #tablediv #statusth {
            width: 50px;
        }

        #content #tablediv #writerth {
            width: 100px;
        }

        #content #tablediv #dateth {
            width: 120px;
        }

        #content #tablediv #cntth {
            width: 50px;
        }

        /********체크박스 테이블**************/
        #content #tablediv table+table {
            width: 10px;
            border: 0px;
            position: relative;
            top: -130px;
            left: -460px;
        }

        #content #tablediv table+table tr,
        #content #tablediv table+table td {
            border: 0px;
            height: 18px;
            border-collapse: collapse;
            padding: 5px;
        }
        /**********************************/

        #content #tablediv #btn1 {
            position: relative;
            top: -100px;
            width: 123px;
            margin: 0px auto;
        }

        #content #tablediv #btn1 button {
            background-color: white;
            border: 1px solid black;
            height: 20px;
            width: 20px;
        }

        #content #tablediv #btn1 .movebtn {
            position: relative;
            top: 2px;
        }

        #content #tablediv #btn2 {
            position: relative;
            left: 753px;
            top: -130px;
        }

        #content #tablediv #btn2 button {
            background-color: white;
            border: 1px solid black;
            height: 30px;
            width: 70px;
        }

        #footer {
            top: 80px;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
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

            //로그아웃버튼 클릭
            $("#logoutbtn").click(function() {
               location.href="<%=request.getContextPath()%>/lms/logout.bit";
            });
            
            //로그인별 상황
            userKind();
            

          });
        
        function userKind(){
        	var userKind=$("#userKind").val();
        	if(userKind==0){ //학생일 때
        		
        		$(".stuhid").css("display", "none");
        		$("#btn1").css("top","30px");
        		$("#footer").css("top","200px");
        		
        	}else if(userKind==1){ //강사일 때
        
        		$(".teahid").css("display", "none");
        	
        	}else if(userKind==2){ //관리자일 대
        		
        		$(".admhid").css("display", "none");
        		$("#admselect").css("left", "570px");
        		$("#btn2").css("left", "828px");
        		
        	}else{}//비로그인일 때
        };
    </script>
    <title>비트캠프 학습관리시스템</title>
</head>
<body>
<%
     		if (request.getAttribute("loginWrong") != null) {
    			out.println(request.getAttribute("loginWrong"));
    		}
		
			int userKind=3;//접속하지 않았을 때 
			if(session.getAttribute("userKind")!=null){
				userKind=(Integer)session.getAttribute("userKind");
				//0학생 1강사 2관리자
			}
%>
  <!--    헤더     -->
    <div id="header">
        <div>
            <!--    왼쪽 메뉴     -->
            <div id="menuleft">
                 <a href="intro.bit">
                <img alt="menulefticon" src="<%=request.getContextPath()%>/imgs/leftmenu.PNG" id="lefticon" />
                </a>
                <!-- 학생일 때  -->
                <%if(userKind==0){%>
                <ul>
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="#">질문게시판</a></li>
                    <li><a href="#">과제게시판</a></li>
                    <li><a href="#">수업자료실</a></li>
                    <li><a href="#">스케줄</a></li>
                </ul>
                <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
				<ul>
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="#">출석 관리</a></li>
                    <li><a href="#">질문게시판</a></li>
                    <li><a href="#">과제게시판</a></li>
                    <li><a href="#">수업자료실</a></li>
                    <li><a href="#">스케줄</a></li>
                </ul>
                <!-- 관리자일 때  -->
                <%}else if(userKind==2){ %>
                <ul id="userKind2">
                    <li><a>내 강의실</a></li>
                    <li><a href="#">강사</a></li>
                    <li><a href="#">학생</a></li>
                    <li><a href="#">관리자</a></li>
                    <li><a href="#">강의관리</a></li>
                    <li><a href="#">출결관리</a></li>
                    <li><a href="#">일정관리</a></li>
                 </ul>
                 <!-- 비 로그인  -->
                 <%}else{}%>
            </div>
            <img alt="logo" src="<%=request.getContextPath()%>/imgs/logo.jpg" id="logo" />
            <div id="top">
                <p><%if(session.getAttribute("isLogin")!=null) {
                	out.println(session.getAttribute("id")+" 님");
                }else{%>환영합니다<%}%>
                    <img alt="topmenuicon" src="<%=request.getContextPath()%>/imgs/topmenu.PNG" id="topicon" />
                </p>
                <!--   상단메뉴   -->
                 <!-- 학생일 때  -->
                <%if(userKind==0){ %>
                <ul id="topmenu">
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="#">내 정보</a></li>
                    <li><a href="#">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
                <ul id="topmenu">
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="#">내 정보</a></li>
                    <li><a href="#">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 관리자일 때  -->
                <%}else if(userKind==2){ %>
                <ul id="topmenu">
                    <li><a href="#">회원관리</a></li>
                    <li><a href="#">강의관리</a></li>
                    <li><a href="#">출결관리</a></li>
                    <li><a href="#">일정관리</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 비 로그인  -->
                <%}else if(userKind==3){}%>
            </div>
        </div>
    </div>
    <!-- *****content start*****    -->
    <div id="content">
        <h3>과제 게시판</h3>
        <input type="hidden" id="userKind" value="<%=userKind %>"/>
        <div>
            <span>진행중 과제</span>
            <label class="admhid">응용SW 엔지니어링 양성 1회차</label>
            <select class="stuhid teahid" id="admselect">
                <option value="응용SW 엔지니어링 양성 1회차">응용SW 엔지니어링 양성 1회차</option>
                <option value="응용SW 엔지니어링 양성 2회차">응용SW 엔지니어링 양성 2회차</option>
                <option value="응용SW 엔지니어링 양성 3회차">응용SW 엔지니어링 양성 3회차</option>
                <option value="응용SW 엔지니어링 양성 4회차">응용SW 엔지니어링 양성 4회차</option>
                <option value="응용SW 엔지니어링 양성 5회차">응용SW 엔지니어링 양성 5회차</option>
            </select>
        </div>
        <div id="designdiv">
            <div id="contentdiv">
                <span>구구단 출력하기</span>
                <label for="">제출기한: 2019-12-31</label>
                <p>설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명</p>
            </div>
            <div id="colordiv">
                <div>진행중</div>
                <div class="teahid admhid">미제출</div>
            </div>
        </div>
        <div id="tablediv">
            <div>
                <span>과제목록</span>
                <input type="text" id="search" />
                <input type="button" value="검색" id="searchbtn" />
            </div>
            <table>
                <tr>
                    <th id="noth">No.</th>
                    <th id="subth">제목</th>
                    <th id="statusth">상태</th>
                    <th id="writerth">작성자</th>
                    <th id="dateth">등록일</th>
                    <th id="cntth">조회수</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>질문제목질문제목</td>
                    <td>진행중</td>
                    <td>강사1</td>
                    <td>2019-06-27</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>질문제목질문제목</td>
                    <td>진행중</td>
                    <td>강사1</td>
                    <td>2019-06-27</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>질문제목질문제목</td>
                    <td>진행중</td>
                    <td>강사1</td>
                    <td>2019-06-27</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>질문제목질문제목</td>
                    <td>진행중</td>
                    <td>강사1</td>
                    <td>2019-06-27</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>질문제목질문제목</td>
                    <td>진행중</td>
                    <td>강사1</td>
                    <td>2019-06-27</td>
                    <td>0</td>
                </tr>
            </table>
            <table id="chk_table" class="stuhid">
                <tr>
                    <td>
                        <input type="checkbox" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" />
                    </td>
                </tr>
            </table>
            <div id="btn1">
                <button class="movebtn">〈</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button class="movebtn">〉</button>
            </div>
            <div id="btn2" class="stuhid">
                <button class="admhid">과제내기</button>
                <button>삭제</button>
            </div>
        </div>
    </div>
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