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

        #content #tablediv {
            width: 500px;
            position: relative;
            left: 30px;

        }

        #content h3 {
            position: relative;
            top: 10px;
        }

        #content #btndiv {
            width: 123px;
            position: relative;
            left: 360px;
            top: -10px;
        }

        #content #btndiv button {
            background-color: white;
            border: 1px solid black;
            height: 20px;
            width: 20px;
        }

        #content #btndiv .movebtn {
            position: relative;
            top: 2px;
        }

        #content table {
            width: 500px;
            height: 300px;

        }

        #content table,
        #content tr,
        #content th,
        #content td {
            border: 1px solid gray;
            border-collapse: collapse;
            text-align: center;
        }

        #content th {
            background-color: rgba(0, 0, 0, 0.1);
            height: 30px;
        }

        #content #adddiv {
            width: 300px;
            position: absolute;
            top: 50px;
            left: 550px;
        }

        #content #adddiv span {
            font-weight: bold;
            font-size: 15px;
        }

        #content #adddiv select {
            width: 250px;
            height: 28px;
            position: absolute;
            left: -0px;
        }

          #content #adddiv input[type="text"] {
            position: absolute;
            top: 32px;
            left: 0px;
            height: 26px;
            width: 280px;
        }

        #content #adddiv input[type="text"]+div {
            position: absolute;
            top: 65px;
        }

        #content #adddiv input[type="text"]+div div,
        #content #adddiv input[type="text"]+div+div div {
            width: 60px;
            text-align: center;
            height: 25px;
            line-height: 25px;
            border-radius: 5px;
            display: inline-block;
            margin: 5px;

        }

        #content #adddiv input[type="text"]+div+div {
            position: absolute;
            top: 65px;
        }

        #content #adddiv #datediv {
            position: absolute;
            top: 100px;
        }

        #content #adddiv input[type="date"] {
            width: 137px;
            height: 26px;
            margin: 2px 0px;
        }

        #content #adddiv textarea {
            width: 296px;
            height: 120px;
            resize: none;
            position: absolute;
            top: 140px;
            left: -0px;
        }

        #content #adddiv input[type="submit"] {
            background-color: white;
            border: 1px solid black;
            height: 30px;
            width: 100px;
            position: absolute;
            top: 270px;
            left: 90px;
        }

        /*일정 색상 관리자*/
        .stuhid>div {
            background-color: red;
        }

        .stuhid>div+div {
            background-color: blueviolet;
        }

        .stuhid>div+div+div {
            background-color: dodgerblue;
        }

        .stuhid>div+div+div+div {
            background-color: gray;
        }

        /*일정 색상 학생*/
        .admhid>div {
            background-color: coral;
        }

        .admhid>div+div {
            background-color: chartreuse;
        }

        .admhid>div+div+div {
            background-color: yellow;
        }

        .admhid>div+div+div+div {
            background-color: pink;
        }

        #footer {
            top: 300px;
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
            
            //접속자 분류별 화면
            userKind();
            
            //제목 안내문 없애기
			sub();
            
			//현재날짜 받기
            date();
          });
        
        function date() {
            var date = new Date();

            var year = date.getFullYear();
            var month = (date.getMonth() + 1) > 9 ? '' + (date.getMonth() + 1) : '0' + (date.getMonth() + 1);
            var day = date.getDate() > 9 ? '' + date.getDate() : '0' + date.getDate();

            var nowdate = year + '-' + month + '-' + day;
            console.log(nowdate);

            //1. 현재 날짜로 자동세팅
            $("input[type='date']").val(nowdate);

            //2. Startdate날 짜로 enddate 자동설정
            $("#startdate").change(function() {
                var startdate = $("#startdate").val();
                $("#enddate").val(startdate);
            });
        }
        
        function sub() {
            $("#sub").val("제목을 입력하세요");
            $("#sub").click(function() {
                if ($("#sub").val() == "제목을 입력하세요") {
                    $("#sub").val("");
                }
            });
            $("#sub").focusin(function() {
                if ($("#sub").val() == "제목을 입력하세요") {
                    $("#sub").val("");
                }
            });
        }
        
        function userKind(){
        	var userKind = $("#userKind").val();
        	
        	if(userKind==0){ //학생일 때
        		
        		$(".stuhid").css("display","none");
        	
        	}else if(userKind==1){ //강사일 때 
        		
        		$(".teahid").css("display","none");
        	
        	}else if(userKind==2){ //관리자일 때
        		
        		$(".admhid").css("display","none");
        	
        	}else{}//비로그인
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
				userKind=Integer.parseInt((String)session.getAttribute("userKind"));
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
                    <li><a href="myClass.bit">내 강의실</a></li>
                    <li><a href="question.bbs">질문게시판</a></li>
                    <li><a href="assignment.bbs">과제게시판</a></li>
                    <li><a href="material.bbs">수업자료실</a></li>
                    <li><a href="schedule.jsp">스케줄</a></li>
                </ul>
                <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
				<ul>
                    <li><a href="myClass.bit">내 강의실</a></li>
                    <li><a href="attendance.bit">출석 관리</a></li>
                    <li><a href="question.bbs">질문게시판</a></li>
                    <li><a href="assignment.bbs">과제게시판</a></li>
                    <li><a href="material.bbs">수업자료실</a></li>
                    <li><a href="schedule.jsp">스케줄</a></li>
                </ul>
                <!-- 관리자일 때  -->
                <%}else if(userKind==2){ %>
                <ul id="userKind2">
                    <li><a>내 강의실</a></li>
                    <li><a href="#">강사</a></li>
                    <li><a href="#">학생</a></li>
                    <li><a href="#">관리자</a></li>
                    <li><a href="lecturemanage.bit">강의관리</a></li>
                    <li><a href="attendance.bit">출결관리</a></li>
                    <li><a href="scheduleDetail.jsp">일정관리</a></li>
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
                    <li><a href="intro.bit">내 강의실</a></li>
                    <li><a href="#">내 정보</a></li>
                    <li><a href="intro.bit">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
                <ul id="topmenu">
                    <li><a href="intro.bit">내 강의실</a></li>
                    <li><a href="#">내 정보</a></li>
                    <li><a href="intro.bit">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 관리자일 때  -->
                <%}else if(userKind==2){ %>
                <ul id="topmenu">
                    <li><a href="useredit.bit">회원관리</a></li>
                    <li><a href="lecturemanage.bit">강의관리</a></li>
                    <li><a href="attendance.bit">출결관리</a></li>
                    <li><a href="scheduleDetail.jsp">일정관리</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 비 로그인  -->
                <%}else if(userKind==3){}%>
            </div>
        </div>
    </div>
    <!-- *****content start*****    -->
    <div id="content">
        <div id="tablediv">
            <h3>일정등록</h3>
            <div id="btndiv">
                <button class="movebtn">〈</button>
                <button>7</button>
                <button>8</button>
                <button>9</button>
                <button class="movebtn">〉</button>
            </div>
            <table>
                <tr>
                    <th>Sun</th>
                    <th>Mon</th>
                    <th>Tue</th>
                    <th>Wen</th>
                    <th>Thu</th>
                    <th>Fri</th>
                    <th>Sat</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                    <td>7</td>
                </tr>
            </table>
        </div>
        <div id="adddiv">
            <form method="post">
	            <span class="admhid">응용SW 엔지니어링 양성과정 1회차</span>
	            <select class="stuhid teahid">
	                <option value="응용SW 엔지니어링 양성과정 1회차">응용SW 엔지니어링 양성과정 1회차</option>
	                <option value="응용SW 엔지니어링 양성과정 2회차">응용SW 엔지니어링 양성과정 2회차</option>
	                <option value="응용SW 엔지니어링 양성과정 3회차">응용SW 엔지니어링 양성과정 3회차</option>
	                <option value="응용SW 엔지니어링 양성과정 4회차">응용SW 엔지니어링 양성과정 4회차</option>
	                <option value="응용SW 엔지니어링 양성과정 5회차">응용SW 엔지니어링 양성과정 5회차</option>
	            </select>
	            <input type="text" id="sub" name="sub" value="제목을 입력하세요" />
	            <div class="admhid teahid">
	                <div>일정</div>
	                <div>일정</div>
	                <div>일정</div>
	                <div>일정</div>
	            </div>
	            <div class="stuhid">
	                <div>공지</div>
	                <div>과제</div>
	                <div>시험</div>
	                <div>일정</div>
	            </div>
	            <div id="datediv">
	                <input type="date" id="startdate" name="startdate" /><label for="startdate">~</label>
	                <input type="date" id="enddate" name="enddate" />
	            </div>
	            <textarea></textarea>
            </form>
            <input type="submit" value="입력" />
            
            <!--sesstion uerKind-->
            <input type="hidden" value="<%=userKind %>" id="userKind"/>
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