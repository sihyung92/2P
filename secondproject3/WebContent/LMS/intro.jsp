<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="../css/jquery.bxslider.css" />
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        /*헤더, 상단메뉴*/
        #header {
            background-color: white;
            width: 100%;
            position: fixed;
            height: 80px;
            border-bottom: 2px solid rgba(0, 0, 0, 0.6);
            z-index: 2;
        }

        #header>div {
            width: 1200px;
            height: 80px;
            margin: 0px auto;
        }

        @media screen and (max-width:1100px) {
            #header>div {
                width: 1100px;
            }
        }

        @media screen and (max-width:1000px) {
            #header>div {
                width: 1000px;
            }
        }

        @media screen and (max-width:900px) {
            #header>div {
                width: 900px;
            }
        }

        @media screen and (max-width:800px) {
            #header>div {
                width: 800px;
            }
        }

        @media screen and (max-width:700px) {
            #header>div {
                width: 700px;
            }
        }

        @media screen and (max-width:600px) {
            #header>div {
                width: 600px;
            }
        }

        #header #logo {
            display: block;
            position: relative;
            top: 15px;
            left: -50px;
        }

        #header div>p {
            display: inline-block;
            font-size: 14px;
        }

        #header div>p>img {
            width: 25px;
            margin: 0px 30px auto 5px;
            display: inline-block;
        }

        /*상단메뉴*/
        #top {
            display: block;
            width: 150px;
            float: right;
            position: relative;
            top: -15px;
            left: -100px;
        }

        #topicon {
            position: relative;
            top: 5px;
        }

        #topmenu {
            display: none;
            list-style: none;
            position: relative;
            width: 120px;
            z-index: 2;
        }

        #topmenu li {
            height: 40px;
            width: 150px;
            line-height: 40px;
            text-align: center;
        }

        #topmenu li>a {
            display: block;
            text-decoration: none;
            height: 40px;
            color: black;
            font-weight: bold;
            background-color: white;
        }

        #topmenu li>a:hover {
            background-color: darkblue;
            color: white;

        }

        /*왼쪽메뉴*/
        #menuleft {
            display: inline-block;
            width: 160px;
            float: left;
            position: relative;
            top: 14px;
            left: 65px;
            z-index: 2;
        }

        #lefticon {
            display: block;
            width: 70px;
        }

        #menuleft ul {
            list-style: none;
            margin: 0px;
            padding: 0px;
            width: 160px;
            display: inline-block;
            display: none;
        }

        #menuleft ul>li {
            height: 60px;
            line-height: 60px;
        }

        #menuleft ul>li>a {
            text-decoration: none;
            display: block;
            width: 160px;
            text-align: center;
            color: black;
            font-weight: bold;
            font-size: 18px;
            background-color: white;
        }

        #menuleft ul>li>a:hover {
            display: block;
            width: 160px;
            color: white;
            font-weight: bold;
            background-color: darkblue;
        }


        /*content 사이즈는 1000!!!!*/
        #content {
            width: 1000px;
            margin: 0px auto;
        }

        /*이미지슬라이더*/
        #bxslider {
            clear: both;
            display: inline-block;
            width: 800px;
            margin: 30px auto;
            position: relative;
            left: 90px;
            top: 80px;
            z-index: 1;
        }

        /*공지사항*/
        #notic {
            clear: both;
            position: relative;
            top: 50px;
            left: 80px;
            display: inline-block;
            background-color: rgba(0, 0, 0, 0.1);
            width: 520px;
            height: 280px;
            margin: 10px;
            border-radius: 10px;
        }

        #notic h3 {
            margin: 25px auto 0px 10px;
            display: inline-block;
        }

        #notic a {
            text-decoration: none;
            color: black;
            float: right;
            margin: 30px 15px 10px auto;
            font-size: 14px;
        }

        #notic table {
            width: 97%;
            height: 210px;
            margin: 0px auto;
            border: 1px solid black;
            background-color: white;
            border-radius: 3px;
            font-size: 14px;
        }

        #notic table>tr {}

        #notic table>tr>td {}

        #td2 {
            width: 80px;
        }

        #td3 {
            width: 100px;
        }

        /*로그인*/
        #logincontent {
            float: right;
            display: inline-block;
            position: relative;
            top: 10px;
            left: -10px;
            width: 260px;
            height: 110px;
            margin: 30px 100px;
        }

        #logincontent #nologin {
            width: 260px;
        }

        #logincontent #nologin>div {
            float: left;
            padding: 10px 0px;
            width: 190px;
            height: 50px;
            /*            margin: 10px 0px;*/
            display: inline-block;
        }

        #logincontent #nologin label {
            display: inline-block;
            width: 30px;
            height: 30px;
            line-height: 30px;
        }

        #logincontent #nologin input {
            width: 150px;
            height: 20px;
            border-radius: 3px;
            border: 2px solid rgba(0, 0, 0, 0.3);
        }

        #loginbtn {
            margin: 13px 2px 2px 2px;
            padding: 0px;
            background-color: darkblue;
            border: 0px;
            border-radius: 3px;
            display: inline-block;
            width: 58px;
            height: 55px;
            color: white;
        }

        #idpwckbtn {
            margin: 3px 0px;
            padding: 0px;
            background-color: darkblue;
            border: 0px;
            border-radius: 3px;
            display: block;
            width: 250px;
            height: 25px;
            color: white;
        }

        /*로그인성공시*/
        #loginstu,
        #logintea,
        #loginadm {
            display: none;
        }

        #logincontent #loginstu,
        #logintea,
        #loginadm {
            height: 80px;
            width: 260px;
        }

        #logincontent p {
            font-size: 14px;
            width: 210px;
            margin: 20px auto;
        }

        #logincontent #loginstu div,
        #logintea div {
            margin: 20px auto;
        }

        #logincontent #loginstu button,
        #logintea button {
            display: inline-block;
            padding: 0px;
            background-color: darkblue;
            border: 0px;
            border-radius: 3px;
            width: 60px;
            height: 30px;
            color: white;
            margin: 0px 10px;

        }

        #logincontent #loginadm button {
            display: inline-block;
            padding: 0px;
            background-color: darkblue;
            border: 0px;
            border-radius: 3px;
            width: 60px;
            height: 30px;
            color: white;
        }

        /*개설예정강좌*/
        #notic2 {
            float: right;
            position: relative;
            top: -140px;
            left: -120px;
            display: inline-block;
            width: 260px;
            height: 180px;
            background: rgba(0, 0, 0, 0.1);
            border-radius: 10px;

        }

        #notic2 h5 {
            margin: 10px 30px;
        }

        #notic2 div {
            display: inline-block;
            width: 240px;
            height: 130px;
            margin: 0px 10px;
            background-color: white;
            border-radius: 10px;
        }

        #notic2 table {
            width: 210px;
            margin: 10px auto;
            font-size: 14px;
        }

        #mozip {
            width: 140px;
        }

        /*SNS*/
        #sns {
            float: right;
            position: relative;
            top: 50px;
            left: 150px;
            display: inline-block;
            width: 150px;
        }

        #sns img {
            width: 30px;
        }

        /*풋터*/
        #footer {
            clear: both;
            width: 100%;
            position: relative;
            top: -80px;
            border-top: 2px solid rgba(0, 0, 0, 0.6);
            font-size: 14px;
        }

        #footer table {
            clear: both;
            width: 1174px;
            align-content: center;
            margin: 20px auto;
        }
    </style>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/jquery.bxslider.js"></script>
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

            //로그인버튼 클릭
            $("#loginbtn").click(function() {
                $("#nologin").css("display", "none");
                $("#loginstu").css("display", "block");
            });

            //로그아웃버튼 클릭
            $("#logoutbtn").click(function() {
                $("#nologin").css("display", "block");
                $("#loginstu").css("display", "none");
                $("#logintea").css("display", "none");
            });
        });
    </script>
    <title>비트캠프 학습관리시스템</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/lms/intro.bit" method="post">
<input type="submit">
</form>
  <!--    헤더     -->
    <div id="header">
        <div>
            <!--    왼쪽 메뉴     -->
            <div id="menuleft">
                <img alt="menulefticon" src="../imgs/leftmenu.PNG" id="lefticon" />
                <ul>
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="#">질문게시판</a></li>
                    <li><a href="#">과제게시판</a></li>
                    <li><a href="#">수업자료실</a></li>
                    <li><a href="#">스케줄</a></li>
                </ul>
            </div>
            <img alt="logo" src="../imgs/logo.jpg" id="logo" />
            <div id="top">
                <p>환영합니다
                    <img alt="topmenuicon" src="../imgs/topmenu.PNG" id="topicon" /></p>
                <!--   상단메뉴   -->
                <ul id="topmenu">
                    <li><a href="#">내 강의실</a></li>
                    <li><a href="#">내 정보</a></li>
                    <li><a href="#">메인</a></li>
                    <li><a href="#">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- *****content start*****    -->
    <div id="content">
        <!--    상단이미지     -->
        <div id="bxslider">
            <div id="imgcontent">
                <img alt="main" src="../imgs/1.PNG" />
                <img alt="main" src="../imgs/2.PNG" />
                <img alt="main" src="../imgs/3.PNG" />
            </div>
        </div>
        <!--    공지사항     -->
        <div id="notic">
            <h3>공지사항</h3>
            <a href="#">전체보기</a>
            <div>
                <table>
                    <tr>
                        <td id="td1">공지제목이에요</td>
                        <td id="td2">작성자</td>
                        <td id="td3">2019-07-03</td>
                    </tr>
                    <tr>
                        <td>공지제목이에요</td>
                        <td>작성자</td>
                        <td>2019-07-03</td>
                    </tr>
                    <tr>
                        <td>공지제목이에요</td>
                        <td>작성자</td>
                        <td>2019-07-03</td>
                    </tr>
                    <tr>
                        <td>공지제목이에요</td>
                        <td>작성자</td>
                        <td>2019-07-03</td>
                    </tr>
                    <tr>
                        <td>공지제목이에요</td>
                        <td>작성자</td>
                        <td>2019-07-03</td>
                    </tr>
                </table>
            </div>
        </div>
        <!--    로그인     -->
        <div id="logincontent">
            <div id="nologin">
                <div>
                    <label for="id">ID</label>
                    <input type="text" name="id" id="id" />
                    <label for="pw">PW</label>
                    <input type="text" name="pw" id="pw" />
                </div>
                <button id="loginbtn">로그인</button>
                <button id="idpwckbtn">아이디/비밀번호 찾기</button>
            </div>
            <div id="loginstu">
                <p>학생1 님이 로그인하셨습니다.</p>
                <div>
                    <button>내 강의실</button>
                    <button>출석관리</button>
                    <button id="logoutbtn">로그아웃</button>
                </div>
            </div>
            <div id="logintea">
                <p>학생1 님이 로그인하셨습니다.</p>
                <div>
                    <button>내 강의실</button>
                    <button>과 제</button>
                    <button id="logoutbtn">로그아웃</button>
                </div>
            </div>
            <div id="loginadm">
                <p>관리자1 님이 로그인하셨습니다.</p>
                <button>회원관리</button>
                <button>강의관리</button>
                <button>출결관리</button>
                <button>일정관리</button>
            </div>
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
            <img alt="icon1" src="../imgs/icon1.PNG" name="icon1" />
            <img alt="icon2" src="../imgs/icon2.PNG" name="icon2" />
            <img alt="icon3" src="../imgs/icon3.PNG" name="icon3" />
            <img alt="icon4" src="../imgs/icon4.PNG" name="icon4" />
        </div>

    </div>
    <!-- *****content end***** -->
    <!--    바닥글     -->
    <div id="footer">
        <table>
            <tr>
                <td height="126" align="right">
                    <img src="../imgs/logo.jpg" width="284" height="75" />
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