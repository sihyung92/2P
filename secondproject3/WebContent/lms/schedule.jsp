<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
  <style type="text/css">
          body {
		    margin: 40px 10px;
		    padding: 0;
		    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
		    font-size: 14px;
		  }
		
		  #calendar {
		    max-width: 900px;
		    margin: 0 auto;
		    padding-top: 130px;
		  }
		  
		  #header {
		  	margin: 0px;
		  }

	      #footer {
	        top: 300px;
	      }
	      
	      
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.bxslider.js"></script>
    <link href='../fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='../fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<link href='../fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
	<link href='../fullcalendar/packages/list/main.css' rel='stylesheet' />
	<script src='../fullcalendar/packages/core/main.js'></script>
	<script src='../fullcalendar/packages/interaction/main.js'></script>
	<script src='../fullcalendar/packages/daygrid/main.js'></script>
	<script src='../fullcalendar/packages/timegrid/main.js'></script>
	<script src='../fullcalendar/packages/list/main.js'></script>
	<script src='../fullcalender/packages/core/locales/ko.js'></script>
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

          });
 
        //캘린더
       
    document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridDay'
      },

      navLinks: true, 
      selectable: true,
      selectMirror: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events: '/events.json',
      
      select: function(arg) {
        var title = prompt('일정 등록:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      
      eventDrop: function(event, delta, revertFunc) {
          event_data = { 
            event: {
              id: event.id,
              start: event.start.format(),
              end: event.end.format()
            }
          };
          $.ajax({
              url: event.update_url,
              data: event_data,
              type: 'PATCH'
          });
        },
      
      eventClick: function(event, jsEvent, view) {
    	  $.getScript(event.eidt_url, function() {});
      },
        
        events: [
                 {
                   title: '발표일',
                   start: '2019-07-16',
                 },
                 {
                   title: 'React 특강',
                   start: '2019-07-20',
                   end: '2019-07-21'
                 },
                 {
                     title: '과제 제출일',
                     start: '2019-07-03'
                   },
                 {
                   title: 'git 스터디',
                   start: '2019-07-02',
                   end: '2019-07-05'
                 },
                 {
                   title: '개인 미니 프로젝트',
                   start: '2019-07-19',
                   end: '2019-07-26'
                 },
                 {
                     title: '2차 프로젝트',
                     start: '2019-07-09',
                     end: '2019-07-16'
                   },
               ] 
      
    });
    
    calendar.render();
  });

        
        
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
                    <li><a href="<%=request.getContextPath()%>/lms/myClass.bit">내 강의실</a></li>
                    <li><a href="<%=request.getContextPath()%>/lms/question.bbs">질문게시판</a></li>
                    <li><a href="assignment.bbs">과제게시판</a></li>
                    <li><a href="<%=request.getContextPath()%>/lms/material.bbs">수업자료실</a></li>
                    <li><a href="schedule.jsp">스케줄</a></li>
                </ul>
                <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
				<ul>
                    <li><a href="<%=request.getContextPath()%>/lms/myClass.bit">내 강의실</a></li>
                    <li><a href="attendance.bit?lecNum=<%=session.getAttribute("lecNum")%>">출석 관리</a></li>
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
                    <li><a href="attendance.bit?lecNum=1">출결관리</a></li>
                    <li><a href="schedule.jsp">일정관리</a></li>
                 </ul>
                 <!-- 비 로그인  -->
                 <%}else{
                	 
                 }%>
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
                    <li><a href="myClass.bit">내 강의실</a></li>
                    <li><a href="useredit.bit">내 정보</a></li>
                    <li><a href="intro.bit">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
                <ul id="topmenu">
                    <li><a href="myClass.bit">내 강의실</a></li>
                    <li><a href="useredit.bit">내 정보</a></li>
                    <li><a href="intro.bit">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 관리자일 때  -->
                <%}else if(userKind==2){ %>
                <ul id="topmenu">
                    <li><a href="useredit.bit">회원관리</a></li>
                    <li><a href="lecturemanage.bit">강의관리</a></li>
                    <li><a href="attendance.bit?lecNum=1">출결관리</a></li>
                    <li><a href="schedule.jsp">일정관리</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 비 로그인  -->
                <%}else if(userKind==3){
                	
                }%>
            </div>
        </div>
    </div>
    <!-- *****content start*****    -->
    
    <div id='calendar'></div>
    
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