<%@page import="java.util.Calendar"%>
<%@page import="com.bit.model.UserDto"%>
<%@page import="com.bit.model.ClassDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
  <style type="text/css">
        #content {
            position: relative;
            top: 150px;
        }

        #content span {
            font-weight: bold;
            font-size: 18px;
            margin: 0px 50px;
            height: 50px;
            line-height: 50px;
            display: inline-block;
        }

        #content select {
            display: inline-block;
            margin: 0px auto 0px 443px;
            height: 28px;
            width: 250px;
        }
		
        #content table,
        #content th,
        #content td {
            border: 1px solid gray;
            border-collapse: collapse;
            padding: 2px;
            font-size: 12px;
        }

        #content #fronttable {
            position: absolute;
            top: 75px;
            width: 80px;
            background-color: rgba(0, 0, 0, 0.1);
        }

        #content #studiv {
            display: block;
            width: 800px;
            overflow-x: scroll;
            position: absolute;
            top: 75px;
            left: 79px;
        }

        #content #studiv table th {
        }

        #content #percenttable {
            width: 80px;
            background-color: rgba(0, 0, 0, 0.1);
            position: absolute;
            top: 75px;
            left: 878px;
        }

        #content #dailydiv {
            /*display: none;*/
            position: absolute;
            top: 800px;
            width: 1000px;
            height: 500px;
        }
 		#content #dailydiv table,#dailydiv th,#dailydiv td{
 			font-size: 15px;
 		}
        #content #dailydiv #thtable {
            width: 80px;
            background-color: rgba(0, 0, 0, 0.1);
        }

        #content #dailydiv div {
            width: 800px;
            overflow-x: scroll;
            position: relative;
            top: -126px;
            left: 79px;

        }
        #content #dailydiv table {
            width: 1000px;
        }
        #content #dailydiv p {
            position: relative;
            top: -110px;
        }
        #footer {
            top: 1300px;
        }
  </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.bxslider.js"></script>
    <script type="text/javascript">
        var big;
        $(document).ready(function() {
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
            
            var userKind=$("#userKind").val();
            
            if(userKind==1){//강사로 접속할 때 
            	$(".adminsession").css("display","none");
            
            }else if(userKind==2){//관리자로 접속할 때
           		$("#dailydiv").css("display","none");

            //과정명 Select
	            className();
	            $("#className").click(function() {
	                className();
	            });
	            
	            $("#footer").css("top","950px");
	         }

        });
        
        function className() {
            var val = $("#className").val();
            $("h3").html(val);
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
                    <li><a href="attendance.jsp">출결관리</a></li>
                    <li><a href="#">일정관리</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 비 로그인  -->
                <%}else{}%>
            </div>
        </div>
    </div>
    <!-- *****content start***** -->
    <div id="content">
        <h3>해당 강좌명 받아오기</h3>
        <div class="adminsession">
       		<span>startdate~enddate</span>
       		<input type="hidden" value="<%=userKind %>" id="userKind"/>
        	<select id="className">
            	<option value="응용SW 엔지니어링 양성과정 1회차">응용SW 엔지니어링 양성과정 1회차</option>
	            <option value="응용SW 엔지니어링 양성과정 2회차">응용SW 엔지니어링 양성과정 2회차</option>
	            <option value="응용SW 엔지니어링 양성과정 3회차">응용SW 엔지니어링 양성과정 3회차</option>
	            <option value="응용SW 엔지니어링 양성과정 4회차">응용SW 엔지니어링 양성과정 4회차</option>
	            <option value="응용SW 엔지니어링 양성과정 5회차">응용SW 엔지니어링 양성과정 5회차</option>
	            <option value="응용SW 엔지니어링 양성과정 6회차">응용SW 엔지니어링 양성과정 6회차</option>
	        </select>
        </div>
            <%
           	ClassDto classBean = (ClassDto)request.getAttribute("bean");
            ///시간 얻어오기
           	String startDay = classBean.getStartdate(); // MM-dd
           	Date day = new SimpleDateFormat("YYYY-MM-dd").parse(startDay);
           	Calendar cal = Calendar.getInstance();
           	String nalja = "";
           	cal.setTime(day);
           	///유저리스트 얻어오기
            ArrayList<UserDto> userList = (ArrayList<UserDto>)request.getAttribute("list");
           	int size = userList.size()+1;
            for(int i=0; i<userList.size(); i++){ 
            UserDto userBean = userList.get(i);%>
        <table id="fronttable">
            <tr>
                <th>일차</th>
            </tr>
            <tr>
                <th>일자</th>
            </tr>
            <tr>
                <th><%=userBean.getName() %></th>
            </tr>
       		<%} %>
        </table>
        <div id="studiv">
            <table>
                <tr>
            	<%for(int i=1; i<=90; i++){ %>
                    <th><%=i %></th>
                <%} %>
                </tr>
                <tr>
                   <%for(int i=1; i<=90; i++){
                	   cal.add(Calendar.DAY_OF_YEAR,1);
                	   nalja = cal.get(Calendar.MONTH)+1+"/"+cal.get(Calendar.DAY_OF_MONTH);
                	   %>
                    <th>
                    	<%=nalja%>
                    </th>
                <%} %>
                </tr>
                <%for(int i=1; i<userList.size()+1; i++){ %>
                <tr>
                   <%for(int j=1; j<=90; j++){ %>
                    <td class="td<%=i+"x"+j%>">ㅇ<input class="td<%=j%>" type=hidden name="<%=nalja%>"></td>
                <%} %>
                </tr>
                <%}%>             
            </table>
        </div>
        <table id="percenttable">
            <tr>
                <th>　</th>
            </tr>
            <tr>
                <th>출석률</th>
            </tr>
            <%for(int i=0; i<userList.size(); i++){ %>
            <tr>
                <th>100%</th>
            </tr>
            <%} %>
        </table>
        <div class="teachersession" id="dailydiv">
<%
	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy년 MM월 dd일  ");
	String day2 = format1.format(day);
%>
            <span><%=day2%> 출결상황</span>
            <table id="thtable">
                <tr>
                    <th>출석</th>
                </tr>
                <tr>
                    <th>지각</th>
                </tr>
                <tr>
                    <th>조퇴</th>
                </tr>
                <tr>
                    <th>외출</th>
                </tr>
                <tr>
                    <th>결석</th>
                </tr>
            </table>
            <div>
                <table>
                    <tr>
                        <td>출석한 학생이름 출력</td>
                    </tr>
                    <tr>
                        <td>지각한 학생이름 출력</td>
                    </tr>
                    <tr>
                        <td>조퇴한 학생이름 출력</td>
                    </tr>
                    <tr>
                        <td>외출한 학생이름 출력</td>
                    </tr>
                    <tr>
                        <td>결석한 학생이름 출력</td>
                    </tr>
                </table>
            </div>
            <br />
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                출석: 0명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |지각: 0명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |조퇴: 0명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |외출: 0명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |결석: 0명</p>
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
</html>