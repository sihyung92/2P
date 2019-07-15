<%@page import="com.bit.model.*"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
     <style type="text/css">
        #content{
            position: relative;
            top: 150px;
        }
        
        #content>div{ 
            width: 800px;
            height: 500px;
            margin: 0px auto;
            border: 1px solid gray;
            
        }
        #content>div>div{
            width: 700px;
            margin: 50px auto;
            height: 400px;
        }
        #content>div>div>div{
            border-bottom:  1px solid gray;
        } 
        
        #content>div>div>div p{
            font-size: 14px;
            margin: 10px 0px;
            
        }
        #content>div>div>div #writer,
        #content>div>div>div #nalja{
            position: relative;
            top: 10px;
            width: 150px;
            
        }
        #content>div>div>div #nalja{
            position: relative;
            top: -10px;
            left: 600px;
        }
        #content>div>div>div:nth-child(3){
            border: 0px;
        }
        .button1{
            position: relative;
            top: 10px;
            left: 760px;
            border: 0px;
            background-color: darkblue;
            color: white;
            border-radius: 3px;
            width: 60px;
            height: 30px;
            color: white;
        }
        .button2{
     		position: relative;
            top: 10px;
            left: 750px;
            border: 0px;
            background-color: darkblue;
            color: white;
            border-radius: 3px;
            width: 60px;
            height: 30px;
            color: white;
        }

        #footer{
            top: 300px;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
    
    	var userkind=<%=session.getAttribute("userKind")%>
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
            
            
           	if(userkind==0){
           		console.log(userkind);
           		$('#content [name="edit"]').show() //학생만 보이게
           	}else if(userkind==1){
           		console.log(userkind);
           		$('#content [name="edit"]').css("display","none");
           	}else{
           		console.log(userkind);
           		$('#content [name="edit"]').css("display","none");
           	}

          });
        
        	function goback(){
        		
        			window.location.href='question.bbs';
        		
        	}
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
                    <li><a href="#">내 정보</a></li>
                    <li><a href="intro.bit">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
                <ul id="topmenu">
                    <li><a href="myClass.bit">내 강의실</a></li>
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
	<%
		BbsDto bean=(BbsDto)request.getAttribute("detail");
	%>
		<div>
            <div>
                <div >
                    <h2><%=bean.getTitle() %></h5>
                    <p id="writer">작성자&nbsp&nbsp&nbsp<%=bean.getId() %></p>
                    <p id="nalja"><%=bean.getNalja() %></p>
                </div>
                <div>
                    <p>첨부파일 : <a href="#">첨부파일.jpg</a></p>
                </div>
                <div>
                    <p><%=bean.getContent() %></p>
                </div>
            </div>
        </div>
        <input type="button" value="수정" class="button2" name="edit"/>
        <input type="reset" value="이전" class="button1" onclick="goback()"/>
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