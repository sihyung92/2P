<%@page import="com.bit.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.bit.model.BbsDto"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.bxslider.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.bxslider.js"></script>
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
       
       	#btn{
       	
        	text-align:right;
       	}
        #btn button{
        	background-color:darkblue;
        	font-size:10;
        	border-radius:6px;
        	color: white;
        }
        button[name="delebtn"]{
        	font-size:8;
        	background-color:darkblue;
        	border-radius:6px;
        	color: white;
        }
        
        #under{
        	text-align:center;
        	font-size:5;
        }
    </style>
 
    <script type="text/javascript">
        var big;
        var userkind = <%=session.getAttribute("userKind")%>; 
        console.log(userkind);
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
            
			
           
            console.log(userkind);
            if(userkind==0){
            	console.log(userkind);
            	$('button[name="enroll"]').show(); //학생에게만
            }else if(userkind==1){
            	console.log(userkind);
            	$('button[name="enroll"]').hide();
            }else{
            	console.log(userkind);
            	$('button[name="enroll"]').hide(); 
            }
            
            if(userkind==0){
            	console.log(userkind);
            	$('button[name="delebtn"]').hide(); 
            }else if(userkind==1){
            	console.log(userkind);
            	$('button[name="delebtn"]').hide();
            }else{
            	console.log(userkind);
            	$('button[name="delebtn"]').show(); //관리자
            }
           
            
            
        });
    </script>
    <title>비트캠프 학습관리시스템</title>
</head>
<body>

<!-- 질문게시판 -->
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
                    <li><a href="<%=request.getContextPath()%>/lms/myClass.bit">내 강의실</a></li>
                    <li><a href="#">내 정보</a></li>
                    <li><a href="intro.bit">메인</a></li>
                    <li><a href="logout.bit">로그아웃</a></li>
                </ul>
                 <!-- 강사일 때  -->
                <%}else if(userKind==1){ %>
                <ul id="topmenu">
                    <li><a href="<%=request.getContextPath()%>/lms/myClass.bit">내 강의실</a></li>
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
   <section class="section">
    <div id="content">
    <div id="topmargin"></div>
	        <h1>질문 게시판</h1>
	        <br/>
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
            	int lecnum=Integer.parseInt((String)session.getAttribute("lecNum"));
            	ArrayList<BbsDto> list=(ArrayList<BbsDto>)request.getAttribute("list");
            	BbsDao dao=new BbsDao();
            	
            	int total=0;
        		total=dao.getPage(lecnum,3);
        		//System.out.println(total);
        		String param=request.getParameter("idx");
        		if(param==null)param="1";
        		int pageNum=Integer.parseInt(param);
        		//System.out.println(pageNum);
        		//pageNum 1= 1~10
        		//pageNum 2= 11~20
        		int start=(pageNum-1)*10;
        		//1 = 0
        		//2 = 10
        		//3 = 20
        		int end1=(pageNum*10);
        		//1=10
        		//2=20
        		//3=30 
        		int fin=(total/10)+1;
        		if(fin==pageNum){
        			end1=list.size();
        		}
            	for(int i=start;i<end1;i++){
            		BbsDto bean=list.get(i);
            %>
            <tr>
                <td><%=bean.getListNum() %></td>
              	<td><a href="bbsqudetail.bit?listNum=<%=bean.getListNum()%>&lecNum=<%=bean.getLecNum()%>"><%=bean.getTitle() %></a></td>
                <td>미답변</td>
                <td><%=bean.getId() %></td>
                <td><%=bean.getNalja() %></td>
                <td>0</td>
	            <td><a href="<%=request.getContextPath()%>/lms/qudelete.bit?listNum=<%=bean.getListNum()%>&lecNum=<%=bean.getLecNum()%>"><button type="button" name="delebtn">삭제</button></a></td>
            </tr>
            <%
           		 }
            %>
        </table>
	       <!--  
	        <div id="ca">
	            <a href="#">이전</a>
	            <a href="#">1</a>
	            <a href="#">2</a>
	            <a href="#">3</a>
	            <a href="#">다음</a>
	        </div>
	       -->
	       
	        <div id="btn">
	          <a href="<%=request.getContextPath()%>/lms/bbsQuAdd.jsp"><button type="button" name="enroll">등록하기</button></a>
	        </div>
	    <%
			int pStart=0;
			pStart=((pageNum-1)/5)*5;
			int end2=0;
			end2=total/10;
			if(total%10!=0){
				end2++;
			}
			int end3=end2;
			if(pStart+5<end2){
				end2=pStart+5;
			}
			int endPage=pageNum+1;
		%>
		<div id="under">
		<%
		if(pStart>0){
		%><a href="question.bbs?idx=<%=pageNum-1%>"> ◀ </a><%
		}
		%>
		<%for(int i=pStart; i<end2; i++){ %>
		<a href="question.bbs?idx=<%=i+1%>">[&nbsp;<%=i+1 %>&nbsp;]</a>
		<%}%>
		<%if(endPage==fin+1){
			
		}else if(end2<=end3){ %>
		<a href="question.bbs?idx=<%=endPage%>"> ▶ </a><%} %>
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