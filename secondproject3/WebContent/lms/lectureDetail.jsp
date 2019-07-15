<%@page import="com.bit.model.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.model.UserDao"%>
<%@page import="com.bit.model.ClassDto"%>
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

        #content h3 {
            position: relative;
            top: -10px;
            left: 100px;

        }

        #content h3+div {
            width: 800px;
            height: 700px;
            margin: 0px auto;
            background-color: rgba(0, 0, 0, 0.1);
        }
		
        #content h3+div>div {
            width: 700px;
            margin: 0px auto;
            position: relative;
            top: 30px;
            border-bottom: 2px solid gray;
        }
		
		#content #editbtn,
		#content #deletebtn{
			color:black;
			background-color: white;
			border: 1px solid black;
			width: 70px;
			height: 40px;
			position: relative;
			top: 20px;
			left: 600px;
		}
		
        #content label {
            font-weight: bold;
            display: inline-block;
            width: 100px;
            margin: 10px;
        }

        #content p {
            display: inline-block;

        }

        #content button {
            background-color: darkblue;
            border: 0px;
            color: white;
            border-radius: 3px;
            height: 40px;
            width: 160px;
            position: relative;
            top: -30px;
            left: 500px; 
        }

        #content #lecturecontent {
            display: block;
            width: 660px;
            height: 150px;
            margin: 0px auto;
            overflow-y: scroll;
            ;
        }

        #content #studiv {
            border: 0px;
        }

        #content #studiv div {
            display: block;
            width: 660px;
            height: 80px;
            margin: 0px auto;
        }
        #content #studiv div p{
            font-size: 14px;
        } 
		#content #status{
			font-size: 18px;
			font-weight: bold;
			color:blue;
		}
        #footer {
            top: 300px;
        }
        
        button >a {
        	text-decoration:none;
       		 color:white;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
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

            //로그아웃버튼 클릭
            $("#logoutbtn").click(function() {
               location.href="<%=request.getContextPath()%>/lms/logout.bit";
            });
            
            //모집중, 마감 글자색 변경
            var statusval=$("#status").html();
            if(statusval=="마감"){
            	$("#status").css("color","red");
            };
            
            //수정 이동경로
            $("#editbtn").click(function(){
           		location.href="<%=request.getContextPath()%>/lms/lectureedit.bit?num=<%=request.getParameter("num")%>";
           	});
            
            //삭제 경로이동
            $("#deletebtn").click(function(){
        		var result=confirm('삭제하시겠습니까?');
        		if(result){
        			$.ajax({
        				url:'/lms/lecturedelete.bit',
        				method: 'post',
        				data: 'num='+<%=request.getParameter("num") %>,
        				error: function() {
        					alert('삭제실패');
        				},
        				success: function(){
        					window.location.href='<%=request.getContextPath()%>/lms/lecturemanage.bit';
        				}
        			});		
        		}
            });
            
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
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="question.bbs">질문게시판</a></li>
                    <li><a href="#">과제게시판</a></li>
                    <li><a href="material.bbs">수업자료실</a></li>
                    <li><a href="#">스케줄</a></li>
                </ul>
                <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
				<ul>
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="#">출석 관리</a></li>
                    <li><a href="question.bbs">질문게시판</a></li>
                    <li><a href="#">과제게시판</a></li>
                    <li><a href="material.bbs">수업자료실</a></li>
                    <li><a href="#">스케줄</a></li>
                </ul>
                <!-- 관리자일 때  -->
                <%}else if(userKind==2){ %>
                <ul id="userKind2">
                    <li><a>내 강의실</a></li>
                    <li><a href="#">강사</a></li>
                    <li><a href="#">학생</a></li>
                    <li><a href="#">관리자</a></li>
                    <li><a href="lecturemanage.bit">강의관리</a></li>
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
                    <li><a href="myClass.bit">내 강의실</a></li>
                    <li><a href="#">내 정보</a></li>
                    <li><a href="#">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
                <ul id="topmenu">
                    <li><a href="myClass.bit">내 강의실</a></li>
                    <li><a href="#">내 정보</a></li>
                    <li><a href="#">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 관리자일 때  -->
                <%}else if(userKind==2){ %>
                <ul id="topmenu">
                    <li><a href="#">회원관리</a></li>
                    <li><a href="lecturemanage.bit">강의관리</a></li>
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
    <%
    	ClassDto bean=(ClassDto)request.getAttribute("bean");
    ArrayList<String> list =null;
    list=(ArrayList<String>)request.getAttribute("stulist"); 
    
    String status="모집중";
    if(list.size()==30){
    	status="마감";
    }
    %>
  <h3>강의정보</h3>
        <div>
        	<button id="editbtn">수정</button>
        	<button id="deletebtn">삭제</button>
            <div>
                <div>
                    <label>강의명</label>
                    <p><%=bean.getName() %></p>
                </div>
                <div>
                    <label>강사명</label>
                    <p><%=bean.getTeacherName() %></p>
                </div>
                <div>
                    <label>수강기간</label>
                    <p><%=bean.getStartdate() %> ~ <%=bean.getEnddate() %></p>
                </div>
                <div>
                    <label>강의일정</label>
                    <p>월 - 금 (09:30~18:10) / 점심시간 (13:30~14:10)</p>
                </div>
                <div>
                    <label>모집현황 </label>
                    <p><%=list.size() %>/30</p>
                    <p id="status"><%=status %></p>
                </div>
                <div>
                    <label>강의실</label>
                    <p><%=bean.getClassroom() %></p>
                </div>
                <button><a href="myClass.bit?lecNum=<%=bean.getNum()%>">강의실로 바로가기</a></button>
            </div>
            <div>
                <label for="content">강의과정</label>
                <p id="lecturecontent"><%=bean.getContent() %></p>
            </div>
            <div>
                <label for="curriculum">첨부파일</label>
                <a href="#"><%=bean.getAttach() %></a>
            </div>
            <div id="studiv">
                <label for="stucnt">학생목록</label>
                <div>
            <%
            	for(String name :list){
            %>
                    <p><%=name %></p>
           <%} %>
                </div>
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