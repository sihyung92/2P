<%@page import="com.bit.model.BbsDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.bxslider.css" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
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
            
           	$(".user").click(function(){
           		location.href="<%=request.getContextPath()%>/lms/useredit.bit";
           	});
           	//내 강의실 버튼 클릭
        	$("#myclassbtn").click(function(){
           		location.href="<%=request.getContextPath()%>/lms/myClass.bit";
           	});

        	$(".lecture").click(function(){
           		location.href="<%=request.getContextPath()%>/lms/lecturemanage.bit";
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
			if(session.getAttribute("isLogin")!=null&&((String)session.getAttribute("id")).equals((String)session.getAttribute("pw"))&&Integer.parseInt((String)session.getAttribute("userKind"))!=2){
%>
	<script type="text/javascript">
		alert("최초 접속시 개인정보 수정이 필요합니다. 개인정보 수정 페이지로 이동합니다.");
		location.href="<%=request.getContextPath()%>/lms/useredit.bit";
	</script>
<%
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
                    <li><a href="<%=request.getContextPath()%>/lms/questlist.bit">질문게시판</a></li>
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
                <%}else if(userKind==3){
                	
                }%>
            </div>
        </div>
    </div>
    <!-- *****content start*****    -->
    <div id="content">
        <!--    상단이미지     -->
        <div id="bxslider">
            <div id="imgcontent">
                <img alt="main" src="<%=request.getContextPath()%>/imgs/1.PNG" />
                <img alt="main" src="<%=request.getContextPath()%>/imgs/2.PNG" />
                <img alt="main" src="<%=request.getContextPath()%>/imgs/3.PNG" />
            </div>
        </div>
        <!--    공지사항     -->
        <div id="notic">
            <h3>공지사항</h3>
            <a href="<%=request.getContextPath() %>/lms/bbsnotice.bbs">전체보기</a>
            <div>
                <table>
            <%ArrayList<BbsDto> list=(ArrayList<BbsDto>)request.getAttribute("list");
            	int size = list.size();
            	if(size>5){size=5;}
            	for(int i=0; i<size; i++){
            		BbsDto bean = list.get(i);%>
                    <tr>
                        <td id="td1"><%=bean.getTitle()%></td>
                        <td id="td2"><%=bean.getId()%></td>
                        <td id="td3"><%=bean.getNalja() %></td>
                    </tr>
            <%}%>
                </table>
            </div>
        </div>
        <!--    로그인     -->
        <div id="logincontent">
        <!-- ***************로그인 전 상황*********** -->
        <%
if(session.getAttribute("userKind")==null){%> 
		<form action="<%=request.getContextPath()%>/lms/intro.bit" method="post">
            <div id="nologin">
                <div>
                    <label for="id">ID</label>
                    <input type="text" name="id" id="id" />
                    <label for="pw">PW</label>
                    <input type="password" name="pw" id="pw" />
                </div>
                <input type="submit" id="loginbtn" value="로그인"/>
                <button id="idpwckbtn">아이디/비밀번호 찾기</button>
            </div>
		</form>

        <!-- ****************학생 로그인 상황************* -->
<%}else if (((String)session.getAttribute("userKind")).equals("0")){ %>
            <div id="loginstu">
                <p><%=session.getAttribute("id") %>님이 로그인하셨습니다.</p>
                <div>
                    <button id="myclassbtn">내 강의실</button>
                    <button>출석관리</button>
                    <button id="logoutbtn">로그아웃</button>
                </div>
            </div>
        <!-- ***************강사 로그인 상황************ -->
<%}else if(((String)session.getAttribute("userKind")).equals("1")){%>
            <div id="logintea">
                <p><%=session.getAttribute("id") %>님이 로그인하셨습니다.</p>
                <div>
                    <button id="myclassbtn">내 강의실</button>
                    <button>과 제</button>
                    <button id="logoutbtn">로그아웃</button>
                </div>
            </div>
        <!-- **************관리자 로그인 상황************** -->
<%}else if(((String)session.getAttribute("userKind")).equals("2")){%>
            <div id="loginadm">
                <p><%=session.getAttribute("id") %>님이 로그인하셨습니다.</p>
                <button class="user">회원관리</button>
                <button class="lecture" id="myclassbtn">강의관리</button>
                <button class="attendance">출결관리</button>
                <button class="scheduler">일정관리</button>
            </div>
<%} %>
        </div>
        <!--    개설예정강좌     -->
        <div id="notic2">
            <h5>개설 예정 강좌</h5>
            <div>
                <table>
                    <tr>
                        <td id="mozip">응용SW 엔지니어링</td>
                        <td rowspan="2">모집중</td>
                    </tr>
                    <tr>
                        <td>19.03.27~19.09.25</td>
                    </tr>
                    <tr>
                        <td>　</td>
                    </tr>
                    <tr>
                        <td>응용SW 엔지니어링</td>
                        <td rowspan="2">모집중</td>
                    </tr>
                    <tr>
                        <td>19.03.27~19.09.25</td>
                    </tr>
                </table>
            </div>
        </div>
        <!--    SNS     -->
        <div id="sns">
            <img alt="icon1" src="<%=request.getContextPath()%>/imgs/icon1.PNG" name="icon1" />
            <img alt="icon2" src="<%=request.getContextPath()%>/imgs/icon2.PNG" name="icon2" />
            <img alt="icon3" src="<%=request.getContextPath()%>/imgs/icon3.PNG" name="icon3" />
            <img alt="icon4" src="<%=request.getContextPath()%>/imgs/icon4.PNG" name="icon4" />
        </div>

    </div>
    <!-- *****content end***** -->
    <!--    바닥글     -->
    <div id="footer">
        <table>
            <tr>
                <td height="126" align="right">
                    <img src="<%= request.getContextPath() %>/imgs/logo.jpg" width="284" height="75" />
                </td>
                <td>
                    비트캠프 서울시 서초구 강남대로 459 (서초동, 백암빌딩)｜ 사업자등록번호 : 214-85-24928<br />
                    (주)비트컴퓨터 서초본원 대표이사 : 조현정 / 문의 : 02-3486-9600 / 팩스 : 02-6007-1245<br />
                    통신판매업 신고번호 : 제 서초-00098호 / 개인정보보호관리책임자 : 최종진<br />
                    Copyright &copy; 비트캠프 All rights reserved.
                </td>
            </tr>
            <a href="<%=request.getContextPath() %>/lms/attendance.bit?lecNum=1">aaaaaaaaaaaaaaaaaa</a>
        </table>
    </div>
</body>