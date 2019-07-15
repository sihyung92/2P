<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/template.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/userEdit.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.bxslider.js"></script>
<script type="text/javascript">
	var userKind = <%=session.getAttribute("userKind")%>;
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

		//분류 중 강사 선택시 추가상황
		ctgselect();
		$("#ctg").click(function() {
			ctgselect();
		});

		//이메일 셀렉박스
		$("#emailselbox").click(function() {
			emailselect();
		});

		$("#idbtn").click(function() {
			id_chk();
		});
		
		if(userKind==2){
			$('#kindOfPage1').text('회원등록');
			$('#kindOfPage2').text('비트캠프 안양지점 회원등록페이지 입니다.');
		}else{
			$('#id').val('<%=session.getAttribute("id")%>').attr("readonly","readonly");
			$('#idbtn').hide();
			if(userKind==0){
					$('#ctg>option[value="0"]').attr("selected","selected");
			}else{
					$('#ctg>option[value="1"]').attr("selected","selected");
			}
			$('#ctg').attr('disabled','disabled');
		}
		submit();
		
		$("#certBtn").click(function(){
			var certText='';
			$('.cert').each(function(){
					certText+=$(this).val();
					certText+=' ';
				});
			console.log(certText);
			$("#cert").append(certText);
			$("#certBtn").attr('disabled','true')
		});
		
		$('#pw2').add('#pw').keyup(function(){
			if($('#pw').val()!=$('#pw2').val()){
				$('#pw2span').show();
			}else{
				$('#pw2span').hide();
			}
		});
	});
	
	function submit(){
		$("#editbtn").click(function(){
			var id = $("#id").val();
			var pw = $("#pw").val();
			var name = $("#name").val();
			var phone = $("#tel").val();
			var kind = $("#ctg").val();
			var birth = $("#birthdate").val();
			var email = $("#email1").val()+"@"+$("#email2").val();
			var addr = $("#fullAddr").val();
			var major = $("#major").val();
			var cert = $("#cert").val();
			var lecNum = $("#lecture").val();
			$.ajax({
				url:"useredit.bit",
				method:"POST",
				data:{'id':id,'pw':pw,'name':name,'phone':phone,'userKind':kind,'birth':birth,'email':email,'addr':addr,'major':major,'cert':cert,'lecNum':lecNum},
				success:function(){
					alert("등록 성공!");
					<%session.removeAttribute("pw");%>
					window.location.href = "<%=request.getContextPath()%>/lms/intro.bit";
				},
				error:function(){
					alert("등록 실패! 다시 시도해주세요.");
					window.location.href = "<%=request.getContextPath()%>/lms/intro.bit";
				}
			});
		});	
	}
	function emailselect() {
		var emailval = $("#emailselbox").val();
		if(emailval=='manual'){
			$("#email2").val('').removeAttr("readonly")
		}else{
			$("#email2").val(emailval).attr("readonly","readonly");
		}
		
	};

	function ctgselect() {
		var ctgval = $("#ctg").val();
		if (ctgval != "1") {
			$("#teacherinfo").css("display", "none");
			$("#labelback").css("height", "480px");
			$("#editbtn").css("margin", "110px auto 100px 50px");
		} else {
			$("#teacherinfo").css("display", "block");
			$("#labelback").css("height", "780px");
			$("#editbtn").css("margin", "370px auto 100px 50px");
		}
			$('#lecture').removeAttr('disabled');
		if(ctgval=="2"){
			$('#lecture').attr('disabled','disabled');
		}
	};
	function id_chk() {
		var isAlready=0;
		$.ajax({
			  url: '../data/idcheck.jsp?id='+$("#id").val(),
			  method: "GET",
			  dataType: "text",
			  success:function(data){
				  isAlready=$.trim(data);
				  console.log(isAlready);
				if (isAlready==1) {
					$('#idspan1').show();
					$('#idspan2').hide();
				} else {
					$('#idspan2').show();
					$('#idspan1').hide();
				}
			  },
			  error: function(request,status,error){
				  var msg = "ERROR : " + request.status + " /// "
				  msg+="내용 : " + request.responseText + " /// " + error;
				  console.log(msg);
			  }
			});
	};
	
	function goPopup() {
		var pop = window.open("<%=request.getContextPath()%>/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	};

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		document.form.fullAddr.value = roadFullAddr; //전체 도로명주소
		document.form.addr1.value = roadAddrPart1; //도로명
		//document.form.roadAddrPart2.value = roadAddrPart2; 지번
		document.form.addr2.value = addrDetail; //상세주소
		document.form.zipNo.value = zipNo; //우편번호
	};
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
	<!-- *****content start***** -->
	<div id="content">
		<h1 id="kindOfPage1">개인정보수정</h1>
		<p id="kindOfPage2">비트캠프 안양지점 개인정보 수정페이지 입니다.</p>
		<div>
			<label id="point"> </label>
			<h3>회원 기본 정보</h3>
			<div id="labelback"></div>
			<div id="basicinfo">
				<div>
					<label for="ctg">분류</label> <select name="ctg" id="ctg">
						<option value="" disabled>분류</option>
						<option value="0">학생</option>
						<option value="1">강사</option>
						<option value="2">직원</option>
					</select>
				</div>
				<div>
					<label for="id">아이디</label> <input type="text" name="id" id="id" />
					<button id="idbtn">중복</button>
					<span id="idspan1">중복아이디입니다.</span>
					<span id="idspan2">생성 가능한 아이디입니다.</span>
				</div>
				<div>
					<label for="pw">비밀번호</label> <input type="password" name="pw"
						id="pw" /> <span id="pwspan">필수입력</span> <span id="pwcheck">비밀번호
						불일치</span>
				</div>
				<div>
					<label for="pw2">비밀번호 확인</label> <input type="password" name="pw2"
						id="pw2" /> <span id="pw2span">비밀번호가 일치하지 않습니다.</span>
				</div>
				<div>
					<label for="name">이름</label> <input type="text" name="name"
						id="name" /> <span id="namespan">필수입력</span>
				</div>
				<div>
					<label for="tel">연락처</label> <input type="text" name="tel" id="tel" />
					<span id="telspan">필수입력</span>
				</div>
				<div id="birth">
					<label for="birthdate">생년월일</label> <input type="date" name="birth"
						id="birthdate"></input>
				</div>
				<div id="emaildiv">
					<label for="email1">이메일</label> <input type="text" name="email1"
						id="email1" /> <label for="email2" id="골뱅이">@</label> <input
						type="text" name="email2" id="email2" /> <select id="emailselbox">
						<option value="manual">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
					</select>
				</div>
				<div id="addr">
					<form name="form" id="form" method="post">
						<input type="hidden" id="fullAddr" name="fullAddr" /> 
						<label for="addr1">도로명주소</label>
						<input type="text" id="addr1" readonly="readonly" />
						<label for="addr2">상세주소</label>
						<input type="text" id="addr2" readonly="readonly" /><br>
						<!-- 참고주소<input type="text" id="roadAddrPart2" name="roadAddrPart2" /><br>-->
						<label for="zipNo">우편번호</label><input type="text" id="zipNo" readonly="readonly" />
						<input id="addrbtn" type="button" onClick="goPopup();" value="주소검색" /><br> 
					</form>
				</div>
				<div id="lecturediv">
						<label for="lecture">강좌 번호</label>
						<input type="text" name="lecture" id="lecture"></input>
				</div>
			</div>
			<!-- *********************************강사 정보 hidden part*********************************** -->
			<div id="teacherinfo">
				<div id="div1">
					<div>
						<label for="">전공</label> <input type="text" name="major"
							id="major" />
					</div>
					<div>
						<label for="" class="areala">자격사항</label>
						<textarea name="certArea" id="cert" readonly="readonly"></textarea>
					</div>
					<div>
						<label for="" class="plusla">추가</label>
						<form id="form1">
							<div>
								<label for="">자격증명</label><input type="text" class="cert" />
							</div>
							<div>
								<label for="">발급처</label><input type="text" class="cert" />
							</div>
							<div>
								<label for="">취득일</label><input type="text" class="cert" />
							</div>
						</form>
						<input type="submit" value="추가" id="certBtn" />
					</div>
				</div>
			</div>
		</div>
		<button id="editbtn">등록</button>
	</div>
	<!-- *****content end***** -->
	<!--    바닥글     -->
	<div id="footer">
		<table>
			<tr>
				<td height="126" align="right"><img
					src="<%=request.getContextPath()%>/imgs/logo.jpg" width="284"
					height="75" /></td>
				<td>비트캠프 서울시 서초구 강남대로 459 (서초동, 백암빌딩)｜ 사업자등록번호 : 214-85-24928<br />
					(주)비트컴퓨터 서초본원 대표이사 : 조현정 / 문의 : 02-3486-9600 / 팩스 : 02-6007-1245<br />
					통신판매업 신고번호 : 제 서초-00098호 / 개인정보보호관리책임자 : 최종진<br /> Copyright
					&copy; 비트캠프 All rights reserved.
				</td>
			</tr>
		</table>
	</div>
</body>
</html>