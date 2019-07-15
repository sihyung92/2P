<%@page import="com.bit.model.ClassDto"%>
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

        #content>div {
            width: 600px;
            height: 520px;
            margin: 20px auto;
        }

        #content>div>div {
            width: 560px;
            height: 460px;
            margin: 30px auto;
            border-radius: 10px;
            background-color: rgba(0, 0, 0, 0.1);
        }

        #content>div>div>h4 {
            margin: 30px 20px;
            position: relative;
            top: 15px;
        }

        #content>div>div>form>div {
            width: 500px;
            margin: 0px auto;
            height: 180px;
        }

        #content #topdiv {
            position: relative;
            z-index: 2;
        }

        #content #bottomdiv {
            height: 150px;
            position: relative;
            z-index: 1;
        }

        #content #bottomdiv>div {
            position: relative;
            z-index: 2;
        }

        #content #bottomdiv #contentdiv {
            height: 10px;
            position: relative;
            top: -146px;
        }

        #content #bottomdiv #contentdiv label {
            position: relative;
            top: 12px;
        }

        #content #bottomdiv #btndiv {
            position: relative;
            left: 400px;
        }

        #content div>label {
            display: inline-block;
            width: 120px;
            height: 30px;

        }

        #content div>input[type="text"] {
            width: 250px;
            height: 26px;
            margin: 2px 0px;
        }

        #content #attach {
            width: 300px;
        }

        #content input[type="button"],
        input[type="submit"] {
            display: inline-block;
            background-color: white;
            border: 1px solid black;
            height: 26px;
            width: 50px;
            position: relative;
            top: 2px;
        }

        #content div>input[type="date"] {
            width: 120px;
            height: 26px;
            margin: 2px 0px;
        }

        #content div>input[type="time"] {
            width: 120px;
            height: 26px;
            margin: 2px 0px;
        }

        #content div>textarea {
            width: 350px;
            height: 150px;
            resize: none;
            overflow-y: auto;
            position: relative;
            top: 150px;

        }

        #content #btndiv {
            position: relative;
            top: 150px;
        }

        #footer {
            top: 250px;
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
            
            //현재날짜 받기
            date();
        });

        function date() {
            var date = new Date();

            var year = date.getFullYear();
            var month = (date.getMonth() + 1) > 9 ? '' + (date.getMonth() + 1) : '0' + (date.getMonth() + 1);
            var day = date.getDate() > 9 ? '' + date.getDate() : '0' + date.getDate();

            var nowdate = year + '-' + month + '-' + day;
            console.log(nowdate);

            //1. 현재 날짜로 자동세팅
            $("input[type='date']").val(nowdate);

            //2. Startdate날 짜로 enddate 자동설정
            $("#startdate").change(function() {
                var startdate = $("#startdate").val();
                $("#enddate").val(startdate);
            });
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
    <!-- *****content start***** -->
    <div id="content">
<div>
            <h3>강의등록</h3>
            <div>
                <h4>강의정보입력</h4>
                <form method="post">
                    <div id="topdiv">
                        <div>
                            <label for="name">강의명</label>
                            <input type="text" name="name" id="name" />
                        </div>
                        <div>
                            <label for="teacherName">강사</label>
                            <input type="text" name="teacherName" id="teacherName" />
                        </div>
                        <div>
                            <label for="startdate">수강기간</label>
                            <input type="date" name="startdate" id="startdate" />
                            <span>~</span>
                            <input type="date" name="enddate" id="enddate" />
                        </div>
                        <div>
                            <label for="starttime">수업일정</label>
                            <input type="time" name="starttime" id="starttime" />
                            <span>~</span>
                            <input type="time" name="endtime" id="endtime" />
                        </div>
                        <div>
                            <label for="classroom">강의실</label>
                            <input type="text" name="classroom" id="classroom" />
                        </div>
                    </div>
                    <div id="bottomdiv">
                        <div>
                            <label for="attach">강의계획서</label>
                            <input type="text" name="attach" id="attach" />
                            <input type="button" value="추가" />
                        </div>
                        <div id="contentdiv">
                            <label for="content">강의과정</label>
                            <textarea name="content" id="lecturecontent"></textarea>
                        </div>
                        <div id="btndiv">
                            <input type="submit" value="입력" />
                            <input type="button" value="취소" />
                        </div>
                    </div>
                </form>
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
</html>