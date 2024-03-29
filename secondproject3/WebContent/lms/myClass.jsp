<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.bit.model.ClassDto, com.bit.model.BbsDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
 <style type="text/css">
		body {
			margin: 0px;
			padding: 0px;
		}

		a {
			text-decoration: none;
			color: black;
		}


		/*메인*/

		.wrapper>div {
			background-color: #e0e0e0;
		}

		.wrapper {
			margin: 0px 300px;
			display: grid;
			grid-template-columns: 1fr 1fr 3fr;
			grid-template-rows: 80px 380px;
			grid-gap: 20px;
		}
		
		.box1stu {
			grid-auto-columns: 1/2;
		}

		.box2stu {
			grid-column: 2/4;
		}
		

		.box1 {
			grid-column: 1/2;
			grid-row: 1/2;
			padding-top: 85px;
			font-size: 27px;
		}

		.box2 {
			grid-column: 2/3;
			grid-row: 1/2;
			text-align: right;
			padding-top: 85px;
			
		}

		.box3 {
			grid-column: 1/2;
			grid-row: 2/3;
			width: 554px;
			display: grid;
			margin-top:35px;
			
		}

		.box4 {
			grid-column: 2/3;
			grid-row: 2/3;
			padding-left: 0px;
			padding-top: 0px;
			padding-right: 0px;
			width: 403px;
			margin-top:35px;
		}

		.box4 p {
			font-size: 20px;
		}

		.box4 image {
			float: right;
		}

		.wrapper2>div {
			background-color: #e0e0e0;
		}
		
		.wrapper2{
			margin: -20px 300px;
			display: grid;
			grid-template-columns: 1fr 1fr 3fr;
			/*grid-template-rows: 80px 280px;*/
			grid-gap: 20px;
		}

		.box5 {
			grid-column: 1/2;
			grid-row: 3/4;
			width: 400px;
			height: 165px;
		}

		.box6 {
			grid-column: 1/2;
			grid-row: 4/5;
			width: 400px;
			height: 165px;
		}

		.box7 {
			grid-column: 1/2;
			grid-row: 5/6;
			width: 400px;
			height: 165px;
		}

		.box8 {
			grid-column: 2/3;
			grid-row: 3/6;
			width: 563px;
			text-align: center;
		}

		/*풋터*/
		#footer {
			width: 980px;
			margin: 60px auto;
		}

		#footer img {
			float: left;
			margin: 30px 10px;
		}

		#footer div {
			width: 980px;
		}

		/*그래프*/
		.graph1 {
			position: relative;
			width: 300px;
			height: 22px;
			border: 1px solid #f1c40f;
			padding: 2px;
			font-size: 11px;
			font-family: tahoma;
			margin-bottom: 0px;
			display: grid;
		}
		
		.graph2 {
			position: relative;
			width: 300px;
			height: 22px;
			border: 1px solid #3498db;
			padding: 2px;
			font-size: 11px;
			font-family: tahoma;
			margin-bottom: 0px;
			display: grid;
		}

		.graph1 .bar {
			display: block;
			position: relative;
			background: #f1c40f;
			text-align: center;
			color: #333;
			height: 2em;
			line-height: 2em;
		}
		
		.graph2 .bar {
			display: block;
			position: relative;
			background: #3498db;
			text-align: center;
			color: #333;
			height: 2em;
			line-height: 2em;
		}

		.graph1 .bar span {
			position: absolute;
			left: 1em;
		}
		
		.graph2 .bar span {
			position: absolute;
			left: 1em;
		}

		.table {
			border: 1px solid #cccccc;
		}

		.table td {
			border: 1px solid #cccccc;
			padding: 3px;
		}

		.table td:nth-child(odd) {
			width: 50px;
			text-align: center;
			background-color: ;
		}

		.table2 {
			width: 500px;
			margin: 0px auto;
			margin-top: 30px;
		}
		
		.table2 tr:nth-child(even){
			padding-bottom: 18px;
		}
		
		#browsers {
			background-color: white;
			border: 1px solid #eaeaea;
			border-radius: 10px;
			display: inline-block;
			font: inherit;
			line-height: 1.3em;
			padding: 0.5em 3.5em 0.5em 1em;

			margin: 0;
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
			-webkit-appearance: none;
			-moz-appearance: none;

			background-image:
				linear-gradient(45deg, transparent 50%, gray 50%),
				linear-gradient(135deg, gray 50%, transparent 50%),
				radial-gradient(#ddd 70%, transparent 72%);
			background-position:
				calc(100% - 20px) calc(1em + 2px),
				calc(100% - 15px) calc(1em + 2px),
				calc(100% - .5em) .5em;
			background-size:
				5px 5px,
				5px 5px,
				1.5em 1.5em;
			background-repeat: no-repeat;
		}
		
		/*캘린더*/
		
		#calendar {
	      	width: 400px;
	      	height: 450px;
		    margin: 0 auto;
		    padding-top: 130px;
		  }
		  
		  
	</style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
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
    $(document).ready(function() {
    var userKind = <%=session.getAttribute("userKind")%>;  
    var lecPage= <%=request.getAttribute("lecNum")%>;
    var lecNum;
    		$('#browsers option[value='+ lecPage +']').attr('selected', true);
    	
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
            
            //로그인 유저별 화면뷰
            $('.box1').css('display','none').hide();
    		$('.box2').css('display','none');
    		$('.box3').css('display','none');
    		$('.box4').css('display','none');
    		$('#teacher').hide();
    		if(userKind==0){
    			$('#atdStu').show();
    			$('#student').show();
    			
    		} else if(userKind==1){
    			$('#atdTea').show();
    			$('#student').show();
    			$('#teacher').show();
    		} else if(userKind==2){
    			$('#atdTea').show();
    			$('.box1stu').hide();
    			$('.box2stu').hide();
    			$('#admin').show();
    			$('.box1').show();
    			$('.box2').show();
    		}

    		//관리자 강의별 페이지 이동
			$("select").change(function(){
    			lecPage=$("#browsers option:selected").val();
    			
				location.href="<%=request.getContextPath()%>/lms/myClass.bit?lecNum="+lecPage;

				//$('#browsers option[value='+ lecPage +']').attr('selected', true);
				//$("select").val(lacPage).prop("selected",true);
    			//alert(lecPage);

			});
			$('#writebtn').click(function(){
				location.href="attendance.bit?lecNum="+lecPage;
			});
			$('#gradebtn').click(function(){
				location.href="grade.bit";
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
   
	<%
	ClassDto bean=(ClassDto)request.getAttribute("bean"); //강의정보
	ArrayList<ClassDto> beanAsc=(ArrayList<ClassDto>)request.getAttribute("beanAsc"); //강의리스트
	ArrayList<BbsDto> bbs3List,bbs2List,bbs1List = null; //0 공지사항 게시판 상위 5개 출력
	bbs3List = (ArrayList<BbsDto>)request.getAttribute("bbs3List");
	bbs2List = (ArrayList<BbsDto>)request.getAttribute("bbs2List");
	bbs1List = (ArrayList<BbsDto>)request.getAttribute("bbs1List");
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String day = (String)session.getAttribute("day");
	Date startDate = format.parse(bean.getStartdate());
	Date sysdate = format.parse(day);
	long calDate = sysdate.getTime()-startDate.getTime();
	long calDateDays = calDate/(24*60*60*1000);
	calDateDays = Math.abs(calDateDays);
	double progress = (100*calDateDays/90)/1.0;
	
	int[] myRate = (int[])request.getAttribute("myRate");
	double rate = 0;
	int total=0;
	int roll=0;
	int late=0;
	int absent=0;
	if(myRate!=null){
		roll=myRate[0];
		total=myRate[1];
		late=myRate[2];
		absent=myRate[3];
		rate=100.0*(roll+late)/total;
	}
	%>

	<div class="wrapper">
		<div class="box1stu" style="background-color: white;"></div>
		<div class="box2stu" style="background-color: white;"></div>
		<div class="box1" style="background-color: white;"><b><%=bean.getName() %></b></div>
		<div class="box2" style="background-color: white;">
			<select id="browsers" name="browsers">
			
			<%
				for(int i=0; i<beanAsc.size(); i++) {
				ClassDto bean2=beanAsc.get(i);
				%>
				<option value=<%=i+1 %>><%=bean2.getName() %></option>
			<% }
			//System.out.println(request.getParameter("browsers"));
			%>
			</select>
		</div>
		<!-- student attendance start-->
		<div class="box3" id="atdStu">
			<table class="table2">
				<tr>
					<td colspan="5"><h2>나의 출석</h2></td>
				</tr>
				<tr>
					<td style="padding-bottom: 50px">출석: <%=roll %>회</td>
					<td style="padding-bottom: 50px">지각/조퇴/외출: <%=late %>회</td>
					<td style="padding-bottom: 50px">결석: <%=absent %>회</td>
				</tr>
				<tr>
					<td colspan="5"><h2>오늘의 출석</h2></td>
				</tr>
				<tr>
					<td >나의 출석률</td>
					<td colspan="4">
						<div class="graph1">
							<strong class="bar" style="width: <%=rate%>%;"><%=rate%>%(<%=roll+late %>/<%=total %>일)</strong>
						</div>
					</td>
				</tr>
				<tr>
					<td>과정 진행률</td>
					<td colspan="4">
						<div class="graph2">
							<strong class="bar" style="width: <%=progress%>%;"><%=progress %>% (<%=calDateDays%>/90일)</strong>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- student attendance end-->
		<!-- teacher attendance start-->
	<%ArrayList<ArrayList<String>> daliyList=(ArrayList<ArrayList<String>>)request.getAttribute("daliyList");%>
		<div class="box3" id="atdTea">
			<table class="table" style="margin: auto;">
				<tr>
					<td style="width: 150px; height: 30px;">오늘의 출석 현황</td>
					<td style="text-align: right"><b><%=session.getAttribute("day") %></b></td>
				</tr>
				<tr>
					<td style="width: 50px"></td>
				</tr>
				<tr>
					<td style="width: 90px; height: 35px;">과정진행률</td>
					<td>
						<div class="graph">
							<strong class="bar" style="width: <%=progress%>%;"><%=progress%>% (<%=calDateDays%>/90일)</strong>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<table class="table2" style="margin: auto;">
							<tr>
								<td>출석</td>
								<td style="width: 450px"><%for(String name : daliyList.get(0))
                        		out.print(name + " ");%></td>
							</tr>
							<tr>
								<td>지각<br/>조퇴<br/>외출</td>
								<td><%for(String name : daliyList.get(1))
                        		out.print(name + " ");%></td>
							</tr>
							<tr>
								<td>결석</td>
								<td><%for(String name : daliyList.get(2))
                        		out.print(name + " ");%></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2">출석: <%=daliyList.get(0).size() %>명 ｜지각 조퇴 외출: <%=daliyList.get(1).size() %>명｜결석: <%=daliyList.get(2).size() %>명 <img id="writebtn" alt="writebtn" src="<%=request.getContextPath()%>/imgs/writebtn.png" style="float: right;"></td>
				</tr>

			</table>
		</div>
		<!-- teacher attendance end-->
		<!-- class box4 #student start-->
		<div class="box4" id="student">
			<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<td style="width: 350px; height: 215px;">
						<p><b>내 강의정보</b><br></p>
						비트캠프 안양센터<br>
						(경기도 안양 031-1234-1234)<br><br>
						<%=bean.getName() %><br>
						<%=bean.getClassroom() %><br>
						<%=bean.getTeacherName() %> 강사님<br>
					</td>
				</tr>
				<tr>
					<td style="width: 340px; height: 50px;"><img id="teacher" alt="gradebtn" src="<%=request.getContextPath()%>/imgs/gradebtn.png" align="right" hspace="10px"><img id="gradebtn" alt="gradebtn" src="<%=request.getContextPath()%>/imgs/viewgradebtn.png" align="right"></td>
				</tr>
				<tr>

				</tr>
			</table>
		</div>
		<!-- class box4 #student end-->
		<!-- class box4 #admin start-->
		
		<div class="box4" id="admin">
			<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<td style="width: 350px; height: 215px;">
						<p><b>나는관리자다 내 강의정보</b><br></p>
						비트캠프 안양센터<br>
						(경기도 안양 031-1234-1234)<br><br>
						<%=bean.getName() %><br>
						<%=bean.getClassroom() %><br>
						<%=bean.getTeacherName() %> 강사님<br>
					</td>
				</tr>
				<tr>
					<td style="width: 340px; height: 50px;"><img alt="gradebtn" src="<%=request.getContextPath()%>/imgs/viewgradebtn.png" align="right"></td>
				</tr>
			</table>
		</div>
		</div>
		<!-- class box4 #admin 종료-->
		
		<div class="wrapper2">
		<div class="box5">
			<table style="width: 370px; margin-left: auto; margin-right: auto;">
				<tr>
					<td style="height: 30px">질문 게시판</td>
					<td colspan="2" style="text-align: right;"><a href="question.bbs"><b>전체보기</b></a></td>
				</tr>
				<tr>		
					<!-- td colspan="3" style="height: 130px; background-color: white;"-->
					<% 
						for(BbsDto bbs3bean:bbs3List){
					%>
						
						<tr>
							<td>
								<%=bbs3bean.getTitle() %>
							</td>
							<td>
								<%=bbs3bean.getId() %>
							</td>
							<td>
								<%=bbs3bean.getNalja() %>
							</td>
						</tr>
						
					<% 
						}
					%>
				<!--  /td-->
				</tr>
			</table>
		</div>
		<div class="box6">
			<table style="width: 370px; margin-left: auto; margin-right: auto;">
				<tr>
					<td style="height: 30px">과제 게시판</td>
					<td colspan="2" style="text-align: right;"><a href="assignment.bbs"><b>전체보기</b></a></td>
				</tr>
				<tr>
					<!--td colspan="2" style="height: 110px; background-color: white;"-->
					<% 
						for(BbsDto bbs2bean:bbs2List){
					%>
						
						<tr>
							<td>
								<%=bbs2bean.getTitle() %>
							</td>
							<td>
								<%=bbs2bean.getId() %>
							</td>
							<td>
								<%=bbs2bean.getNalja() %>
							</td>
						</tr>
						
					<% 
						}
					%>
				<!--/td-->
				</tr>
			</table>
		</div>
		<div class="box7">
			<table style="width: 370px; margin-left: auto; margin-right: auto;">
				<tr>
					<td style="height: 30px">수업자료 게시판</td>
					<td colspan="2" style="text-align: right;"><a href="material.bbs"><b>전체보기</b></a></td>
				</tr>
				<tr>
					<!--td colspan="2" style="height: 110px; background-color: white;"-->
					<% 
						for(BbsDto bbs1bean:bbs1List){
					%>
						
						<tr>
							<td>
								<%=bbs1bean.getTitle() %>
							</td>
							<td>
								<%=bbs1bean.getId() %>
							</td>
							<td>
								<%=bbs1bean.getNalja() %>
							</td>
						</tr>
						
					<% 
						}
					%>
				<!--/td-->
				</tr>
			</table>
		</div>
		<div class="box8" style="text-align: center;"><div id='calendar'></div></div>
	</div>
</div>

    <br/>
    <br/>
    <br/>
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