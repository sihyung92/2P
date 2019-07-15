<%@page import="com.bit.model.ClassDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
    <style type="text/css">
    	#topmargin{
    		height:100px;
    	}
        #content .bbs{
            width: 800px;
            height:490px;
            background-color: white;
            border-top:1px solid black;
            border-bottom:1px solid black;
            z-index:1;
        }
       	#content .bbs th{
       		border-bottom: 1px solid #ccc;
       	}
       	#content .bbs td{
       		border-bottom: 1px solid #ccc;
       	}
        
        #content>div{
            width: 800px;
            margin: 0px auto;
        }
            
        #content div>div{
            display: inline-block;
            margin: 0px 0px 10px 450px;
        }
        #content .bbs tr>td{
        	text-align:center;
        }
        #content .bbs{
        	margin: 0px auto;
        	width:100%
        	z-index:3;
        }
        #content .bbs th:nth-child(3){
        	width:40%;
        }
       #content #bbs2{
        	margin:0px auto; 
        	width:800px;
        		
        }
        #content #bbs2 select{
            display: inline-block;
            width: 250px;
            height: 28px;
        }
        
        #content #bbs2 input[type="text"]{
        	height: 26px;
        }
        #content input[name="serch"]{
        	text-align:right;
        }
        #content #ca{
        	position: relative;
        	top: 10px;
        	width:150px;
        }
        #content #ca .movebtn{
        	position: relative;
        	top: 2px;
        	
        }
        #content #ca button{
        	text-decoration:none;
        	text-align:center;
        	color:black;
        	width: 25px;
        	height: 25px;
        	border: 1px solid black;
        }
        #content #btn{
       	 text-align:right;
       	 
        }
        #content button{
        	background-color:white;
        	border: 1px solid black;
        	width: 80px;
          	height: 35px;
        	
        }
        
        #content #searchbtn{
         	width: 50px;
       		height: 28px;
         }
        #content select{
        	text-align:left;
        }
       #content  .section{
        	claer:both;
        	height:800px;
        	margin:0px auto;
        }
        #content #bbs2>tr>td{
        	background:pink;
        }
       #content  select{
        	text-align:center;
        }
        #content #bbs2 tr>td{
        	text-align:left;
        }
        #content #bbs2 tr>td+td{
        	text-align:right;
        }
        
        #footer{
        	top: 100px;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
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
            
            //등록버튼 경로
           	$("#addbtn").click(function(){
           		location.href="<%=request.getContextPath()%>/lms/lectureadd.bit";
           	});
            	
            	
            
        });
    </script>
    <title>비트캠프 학습관리시스템</title>
</head>
<body>

<!-- 강의관리게시판 관리자 -->
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
                    <li><a href="quesion.bbs">질문게시판</a></li>
                    <li><a href="#">과제게시판</a></li>
                    <li><a href="material.bbs">수업자료실</a></li>
                    <li><a href="#">스케줄</a></li>
                </ul>
                <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
				<ul>
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="#">출석 관리</a></li>
                    <li><a href="quesion.bbs">질문게시판</a></li>
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
   <section class="section">
    <div id="content">
    <div id="topmargin"></div>
	        <h1>강의관리</h1>
	        <br/>
	        <table id="bbs2">
	       		<tr>
	       			<td>
				        <select>
				        	<option value="">전체보기</option>
				        </select>
			        </td>
			        <td>
		                <input type="text" id="search" name="search" />
		                <button id="searchbtn">검색</button>
			        </td>
	            </tr>
	        </table>
        <table class="bbs">
            <tr>
            	<th><input type="checkbox" name="chk"></th>
                <th >NO.</th>
                <th>강의명</th>
                <th>강사명</th>
                <th>기간</th>
                <th>인원</th>
                <th>상태</th>
                <th>강의실</th>
            </tr>
            <%
           
            ArrayList<ClassDto> list =null;
            list=(ArrayList<ClassDto>)request.getAttribute("list"); 
            	for(ClassDto bean:list){
            %>
            <tr>
            	<td><input type="checkbox" name="chk10" value="<%=bean.getNum() %>"></td>
                <td><%=bean.getNum() %></td>
                <td><a href="lecturedetail.bit?num=<%=bean.getNum() %>"><%=bean.getName() %></a></td>
                <td><%=bean.getTeacherName() %></td>
                <td><%=bean.getStartdate() %></td>
                <td><%=bean.getPersonal() %>/30</td>
                <td>모집중</td>
                <td><%=bean.getNum() %></td>
            </tr>
           <%} %>
        </table>
	        <div id="ca">
	            <a href="#"><button class="movebtn">〈</button></a>
	            <a href="#"><button>1</button></a>
	            <a href="#"><button>2</button></a>
	            <a href="#"><button>3</button></a>
	            <a href="#"><button class="movebtn">〉</button></a>
	        </div>
	        <div id="btn">
	            <button type="button" id="addbtn">등록</button>
	            <button type="button">삭제</button>
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
