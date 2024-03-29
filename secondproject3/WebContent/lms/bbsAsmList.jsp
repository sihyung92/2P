<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.bit.model.BbsDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
    <style type="text/css">
       	#topmargin{
    		height:100px;
    	}
        .bbs{
            width: 800px;
            height:490px;
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
        .bbs tr>td{
        	text-align:center;
        }
        .bbs{
        	margin: 0px auto;
        	width:100%
        	z-index:3;
        }
        #bbs2{
        	margin:0px auto; 
        	width:800px;
        		
        }
        .bbs th:nth-child(2){
        	width:40%;
        }
        input[name="serch"]{
        	text-align:right;
        }
        #ca{
        text-align:center;
        }
        select{
        	text-align:left;
        }
        .section{
        	clear:both;
        	height:800px;
        	margin:0px auto;
        }
        #bbs2>tr>td{
        	background:pink;
        }
        select{
        	text-align:center;
        }
        #bbs2 tr>td{
        	text-align:left;
        }
        #bbs2 tr>td+td{
        	text-align:right;
        }
       
       	#btn{
       	
        	text-align:right;
       	}
        #btn button{
        	background-color:lightblue;
        	font-size:10;
        	border-radius:6px;
        }
        button[name="delebtn"]{
        	font-size:6px;
        	background-color:lightblue;
        	border-radius:6px;
        }
        
        .ing{
	        margin:0px auto;
	        float: center;
       		width: 800px;
       		padding:50px;
        	
        	height:250px;
        	background-color: #e4e4e4;
        }
        
        .ing tr:FIRST-CHILD{
	       
        }
        
        .ing tr:FIRST-CHILD>td:nth-child(2){
	        width:200px;
        }
        
        .ing tr:FIRST-CHILD>td:nth-child(3){
	        width:100px;
        }
        
        #footer {
        	top:300px;
        }
        
    </style>
    <script type="text/javascript">
        $(document).ready(function() {
        	var userKind = <%=session.getAttribute("userKind")%>;
        	
        	
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
            
            //강사접속시만 글쓰기 버튼보임
            $("#teacher").css('display','none');
            if(userKind==1){
            	$("#teacher").show();
            }
            
            //학생 접속시 삭제열 안보임
            
            if(userKind==0){
            	$('table tr>th:nth-child(7)').hide();
            	$('table td:nth-child(7)').hide();
            }

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
     <section class="section">
    <div id="content">
    <div id="topmargin"></div>
	        <h1>과제 게시판</h1>
	        <br/>
	        <div >
	        <h3>진행중 과제</h3>
	        <%
		        BbsDto last=(BbsDto)request.getAttribute("last");
	        %>
	        <table style="margin: 0px auto;" class="ing">
	        	
		        	<tr>
		        		<td>
		        		<h2><%=last.getTitle() %></h2></td>
		        		<td>제출기한:<%=last.getNalja() %></td>
		        		<td>진행중</td>
					</tr>	   
					<tr>
		        		<td colspan="3"> <%=last.getContent() %></td>
		        		
					</tr>	     	
	        	
	        	</table>
	        <br/>
	        <h3>과제목록</h3>
	       </div>
	      <table id="bbs2">
		       		<tr>
		       			<td>
					        <select>
					        	<option value="">전체보기</option>
					        </select>
				        </td> <td>
				                <input type="text" id="search" name="search" />
				                <button>검색</button>
				        </td>
		            </tr>
	        </table>
        <table class="bbs">
            <tr>
                <th >NO.</th>
                <th>제목</th>
                <th>상태</th>
                <th>작성자</th>
                <th>등록일</th>
                <th>조회수</th>
                <th>삭제</th>
            </tr>
            <%
            	ArrayList<BbsDto> list=(ArrayList<BbsDto>)request.getAttribute("list");
            	for(int i=0;i<list.size();i++){
            		BbsDto bean=list.get(i);
            %>
            <tr>
                <td><%=bean.getListNum() %></td>
              	<td><a href="bbsasmdetail.bit?listNum=<%=bean.getListNum()%>&lecNum=<%=bean.getLecNum()%>"><%=bean.getTitle() %></a></td>
                <td>진행중</td>
                <td><%=bean.getId() %></td>
                <td><%=bean.getNalja() %></td>
                <td>0</td>
	            <td><a href="<%=request.getContextPath()%>/lms/asmdelete.bit?listNum=<%=bean.getListNum()%>&lecNum=<%=bean.getLecNum()%>"><button type="button" name="delebtn">삭제</button></a></td>
            </tr>
            <%
            }
            %>
        </table>
	        <div id="ca">
	            <a href="#">이전</a>
	            <a href="#">1</a>
	            <a href="#">2</a>
	            <a href="#">3</a>
	            <a href="#">다음</a>
	        </div>
	         <div id="btn">
	          <a href="<%=request.getContextPath()%>/lms/bbsasmadd.bit"><button type="button" id="teacher">등록하기</button></a>
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