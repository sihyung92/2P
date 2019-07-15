<%@page import="com.bit.model.AttendanceDto"%>
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
        	position : absolute;
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
            text-align : center;
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
            top: -73px;
            left: 79px;

        }
        #content #dailydiv table {
            width: 1000px;
        }
        #content #dailydiv p {
            position: relative;
            top: -90px;
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
        	var lecPage= <%=request.getAttribute("lecNum")%>;
        	$('#className option[value='+ lecPage +']').attr('selected', true);
        	
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
            
            var userKind=<%=session.getAttribute("userKind")%>;
            
            if(userKind==1){//강사로 접속할 때 
            	$(".adminsession").css("display","none");
            
            }else if(userKind==2){//관리자로 접속할 때
           		$("#dailydiv").css("display","none");
            //과정명 Select
	            
	            $("#footer").css("top","950px");
	         }
	            $("#className").change(function() {
	            	
	            	lecPage=$("#className option:selected").val();
	            	
					location.href="<%=request.getContextPath()%>/lms/attendance.bit?lecNum="+lecPage;
	 
				});
	            
            
            var y = $('#fronttable tr').length-2;
        	var tds=$('#studiv table td');
        	tds.each(function(idx,item){
        		$(item).click(function(){
        			var cls = $(item).attr('class')
        			var txt = $.trim($(item).text());
        			if(txt==""){
        				$(item).text("O").css("color","green");
        				$('input.'+cls).val(cls+"and0");
        			}else if(txt=="O"){
        				$(item).text("△").css("color","blue");
        				$('input.'+cls).val(cls+"and1");
        			}else if(txt=="△"){
	        			$(item).text("X").css("color","red");
        				$('input.'+cls).val(cls+"and2");
        			}else if(txt=="X"){
	        			$(item).text(" ").css("color","black");
        				$('input.'+cls).val("");
        			}
        		});
        	});
        	
            $.ajax({
            	type:"POST",
            	url:"../data/attendance.jsp",
            	data: {"lecNum":"<%=request.getParameter("lecNum")%>"},
            	dataType:"JSON",
            	cache : false,
            	success: function(data){
            		console.log('성공해따');
            		console.log(data);
            		$.each(data,function(i,v){
            			var name=v.data;
            			var values = name.split('and');
            			var cls= values[0]+'and'+values[1];
            			var status = values[2];
            			if(status==0){
            				$('td.'+cls).text("O").css({"background-color":"rgb(230,230,230)","color":"green"}).off();
            				$('input.'+cls).removeAttr("name");
            			}else if(status==1){
            				$('td.'+cls).text("△").css({"background-color":"rgb(230,230,230)","color":"blue"}).off();
            				$('input.'+cls).removeAttr("name");
            			}else if(status==2){
            				$('td.'+cls).text("X").css({"background-color":"rgb(230,230,230)","color":"red"}).off();
            				$('input.'+cls).removeAttr("name");
            			}
            			//데이터 들어오는 애들 jq로 잡아서 값넣어주기 0이면 O 1이면 세모 2면 x
            			//cls가 클래스 이름이고 status가 상태 넣은 td는 이벤트 제거해줄것
            		});
            	},
				error:function(){
					console.log("실패해따..");
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
            <%
           	ClassDto classBean = (ClassDto)request.getAttribute("bean");
           	ClassDto classBean2 = (ClassDto)request.getAttribute("bean2");
           
            ///시간 얻어오기
           	String startDay = classBean.getStartdate(); 
           	String endDay = classBean.getEnddate(); 
           	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
           	Date day = df.parse(startDay);
           	Date end = df.parse(endDay);
           	Calendar cal = Calendar.getInstance();
           	String tableNalja = "";
           	String sendNalja = "";
           	cal.setTime(day);
           	///유저리스트 얻어오기
            ArrayList<UserDto> userList = (ArrayList<UserDto>)request.getAttribute("userList");
            ArrayList<AttendanceDto> atteList = (ArrayList<AttendanceDto>)request.getAttribute("atteList");
            
            //강의리스트 출력
            ArrayList<ClassDto> beanAsc=(ArrayList<ClassDto>)request.getAttribute("beanAsc");
     		%>
        <h3><%=classBean2.getName() %></h3>
        <div class="adminsession">
       		<span><%=df.format(day)%>~<%=df.format(end)%></span>
        	<select id="className">
            <%
				for(int i=0; i<beanAsc.size(); i++) {
				ClassDto bean2=beanAsc.get(i);
			%>
				<option value=<%=i+1 %>><%=bean2.getName() %></option>
			<% 
			}
			%>	
            </select>
        </div>
        <table id="fronttable">
            <tr>
                <th>일차</th>
            </tr>
            <tr>
                <th>일자</th>
            </tr>
            <%for(int i=0; i<userList.size(); i++){ 
            UserDto userBean = userList.get(i);%>
            <tr>
                <th><%=userBean.getName() %></th>
            </tr>
       		<%} %>
        </table>
        <div id="studiv">
        <form method="POST">
            <table>
                <tr>
            	<%for(int i=1; i<=90; i++){ %>
                    <th><%=i %></th>
                <%} %>
                </tr>
                <tr>
                   <%for(int i=1; i<=90; i++){
                	   cal.add(Calendar.DAY_OF_YEAR,1);
                	   tableNalja = cal.get(Calendar.MONTH)+1+"/"+cal.get(Calendar.DAY_OF_MONTH);
                	   %>
                    <th>
                    	<%=tableNalja%>
                    </th>
                <%} %>
                </tr>
                <%for(int i=0; i<userList.size(); i++){ 
                	UserDto userBean = userList.get(i);
                %>
                <tr>
                <%cal.setTime(day);
 	              for(int j=0; j<90; j++){
                	 cal.add(Calendar.DAY_OF_YEAR,1);
                	sendNalja = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
                %>
                    <td class="<%=userBean.getUserNum()+"and"+sendNalja%>">&nbsp;</td>
                    <input class="<%=userBean.getUserNum()+"and"+sendNalja%>" type=hidden name="data">
                <%} %>
                </tr>
                <%}%>           
            </table>
            <input type="submit" value="입력" id="subBtn"/>
        </form>
        </div>
        <table id="percenttable">
            <tr>
                <th>　</th>
            </tr>
            <tr>
                <th>출석률</th>
            </tr>
            <%for(int i=0; i<atteList.size(); i++){
            	AttendanceDto atteBean = atteList.get(i);
            	%>
            <tr>
                <th><%=(int)(atteBean.getRate()*100.0)%>%</th>
            </tr>
            <%} %>
        </table>
        <div class="teachersession" id="dailydiv">
<%
	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy년 MM월 dd일  ");
	String day2 = format1.format(new Date());
	ArrayList<ArrayList<String>> daliyList = (ArrayList<ArrayList<String>>)request.getAttribute("daliy");
%>
            <span><%=day2%> 출결상황</span>
            <table id="thtable">
                <tr>
                    <th>출석</th>
                </tr>
                <tr>
                    <th>이상</th>
                </tr>
                <tr>
                    <th>결석</th>
                </tr>
            </table>
            <div>
                <table>
                    <tr>
                        <td>&nbsp;<%for(String name : daliyList.get(0))
                        		out.print(name + " ");%>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;<%for(String name : daliyList.get(1))
                        		out.print(name + " ");%>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;<%for(String name : daliyList.get(2))
                        		out.print(name + " ");%>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                출석: <%=daliyList.get(0).size() %>명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |지각 조퇴 외출: <%=daliyList.get(1).size()%>명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                |결석: <%=daliyList.get(2).size()%>명</p>
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