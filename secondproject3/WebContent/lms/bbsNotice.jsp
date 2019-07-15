<%@page import="com.bit.model.BbsDao"%>
<%@page import="com.bit.model.BbsDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
/*             height:490px; */
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
        
         #content #bbs2 select{
            display: inline-block;
            width: 250px;
            height: 28px;
        }
        #content #ca{
        	align-content: center;
        	position: relative;
        	top: 10px;
        	width:210px;
        	
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
        #btn{
       	 text-align:right;
       	 
        }
        
        #content input[type="button"],
        #content input[type="submit"],
        #content button{
        	background-color:white;
        	border: 1px solid black;
        	width: 80px;
          	height: 35px;
          	margin: 2px;
        	
        }
                
        #content table a{
        	color: black;
        	text-decoration: none;
        }
        
         #content #bbs2 input[type="text"]{
        	height: 26px;
        }
        select{
        	text-align:left;
        }
        .section{
        	claer:both;
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
        
        #content .bbs th,
        #content .bbs td{
        	height: 42px;
        }
        
       #footer{
       	top: 100px;
       }
    </style>
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
            
            //입력버튼
           	$('#addbtn').click(function(){
           		window.location.href="<%=request.getContextPath()%>/lms/bbsnoticeadd.bit";
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
                    <li><a href="lecturemanage.bit">강의관리</a></li>
                    <li><a href="#">출결관리</a></li>
                    <li><a href="#">일정관리</a></li>
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
    <div id="topmargin">    
    </div>
	        <h1>공지사항</h1><br/>
	        <table id="bbs2">
		       		<tr>
		       			<td>
					        <select>
					        	<option value="">전체보기</option>
					        </select>
				        </td>		   
				        <td>
			                <input type="text" id="search" name="search" />
			                <button>검색</button>
				        </td>
		            </tr>
	        </table>
        <table class="bbs">
            <tr>
                <th >NO.</th>
                <th>제목</th>
                <th>등록일</th>
                <th>조회수</th>
            </tr>
            <%  ArrayList<BbsDto> list = null;
           	 	list = (ArrayList<BbsDto>)request.getAttribute("list"); 
				for(BbsDto bean : list)  {          
            %>
            <tr>
                <td><%=bean.getListNum() %></td>
                <td><a href="bbsnoticedetail.bit?listnum=<%=bean.getListNum()%>"><%=bean.getTitle() %></a></td>
                <td><%=bean.getNalja() %></td>
                <td>0</td>
            </tr>
            <%} %>
        </table>
	        <div id="ca">
        <%
        String param=request.getParameter("page");
		String param2=request.getParameter("limit");
		if(param==null){param="1";}
		int p=Integer.parseInt(param);
		if(param2==null){param2="10";}
		int limit=Integer.parseInt(param2);	
		
        BbsDao dao=new BbsDao(); 
        int total=dao.getTotlaCount();
    	int start=((p-1)/5)*5;
    	int end=total/limit;
    	if(total%limit!=0){
    		end++;
    	}
    	int end2=end;
    	if(start+5<end){
    		end=start+5;
    	}
    	
    	if(start>0){
    		%><a href="<%=request.getContextPath() %>/lms/bbsnotice.bbs?page=<%=start-1%>&limit=<%=limit%>"><button class="movebtn">〈</button></a><%
    		}
    		for(int i=start; i<end; i++){
    		%><a href="<%=request.getContextPath() %>/lms/bbsnotice.bbs?page=<%=i+1%>&limit=<%=limit%>"	><button><%=i+1%></button></a><%
    		}
    		if(end+1<=end2){
    		%><a href="<%=request.getContextPath() %>/lms/bbsnotice.bbs?page=<%=end+1 %>&limit=<%=limit%>"><button class="movebtn">〉</button></a>
    		<%} %>
	        </div>
	        <div id="btn">
	            <button id="addbtn">작성</button>
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
