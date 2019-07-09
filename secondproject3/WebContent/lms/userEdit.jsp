<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/userEdit.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.bxslider.js"></script>
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

		//분류 중 강사 선택시 추가상황
		ctgselect();
		$("#ctg").click(function() {
			ctgselect();
		});

		//이메일 셀렉박스
		$("#emailselbox").click(function() {
			emailselect();
		});

		$("#editbtn").click(function() {
			id_chk();
		});
	});

	function emailselect() {
		var emailval = $("#emailselbox").val();
		$("#email2").val(emailval).attr("readonly","readonly");
	};

	function ctgselect() {
		var ctgval = $("#ctg").val();
		if (ctgval != "강사") {
			$("#teacherinfo").css("display", "none");
			$("#labelback").css("height", "430px");
			$("#editbtn").css("margin", "110px auto 100px 50px");
		} else {
			$("#teacherinfo").css("display", "block");
			$("#labelback").css("height", "1080px");
			$("#editbtn").css("margin", "670px auto 100px 50px");
		}
	};

	function id_chk() {
		var id = $("#id").val();
		console.log(id);
		if (id == "" && id == null) {
			$("#idspan").css("display", "block");
		} else {
			$("#idspan").css("display", "none");
		}
	}
	
	function goPopup() {
		var pop = window.open("<%=request.getContextPath()%>/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		document.form.fullAddr.value = roadFullAddr; //전체 도로명주소
		document.form.addr1.value = roadAddrPart1; //도로명
		//document.form.roadAddrPart2.value = roadAddrPart2; 지번
		document.form.addr2.value = addrDetail; //상세주소
		document.form.zipNo.value = zipNo; //우편번호
	}
</script>
<title>비트캠프 학습관리시스템</title>
</head>
<body>
	<!--    헤더     -->
	<div id="header">
		<div>
			<!--    왼쪽 메뉴     -->
			<div id="menuleft">
				<img alt="menulefticon"
					src="<%=request.getContextPath()%>/imgs/leftmenu.PNG" id="lefticon" />
				<ul>
					<li><a href="#">내 강의실</a></li>
					<li><a href="#">질문게시판</a></li>
					<li><a href="#">과제게시판</a></li>
					<li><a href="#">수업자료실</a></li>
					<li><a href="#">스케줄</a></li>
				</ul>
			</div>
			<img alt="logo" src="<%=request.getContextPath()%>/imgs/logo.jpg"
				id="logo" />
			<div id="top">
				<p>
					환영합니다 <img alt="topmenuicon"
						src="<%=request.getContextPath()%>/imgs/topmenu.PNG" id="topicon" />
				</p>
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
	<!-- *****content start***** -->
	<div id="content">
		<h1>회원등록</h1>
		<p>비트캠프 안양지점 회원등록페이지 입니다.</p>
		<div>
			<label id="point"> </label>
			<h3>회원 기본 정보</h3>
			<div id="labelback"></div>
			<div id="basicinfo">
				<div>
					<label for="ctg">분류</label> <select name="ctg" id="ctg">
						<option value="">분류</option>
						<option value="학생">학생</option>
						<option value="강사">강사</option>
						<option value="직원">직원</option>
					</select>
				</div>
				<div>
					<label for="id">아이디</label> <input type="text" name="id" id="id" />
					<button id="idbtn">중복</button>
					<span id="idspan">필수입력</span>
				</div>
				<div>
					<label for="pw">비밀번호</label> <input type="password" name="pw"
						id="pw" /> <span id="pwspan">필수입력</span> <span id="pwcheck">비밀번호
						불일치</span>
				</div>
				<div>
					<label for="pw2">비밀번호 확인</label> <input type="password" name="pw2"
						id="pw2" /> <span id="pw2span">필수입력</span>
				</div>
				<div>
					<label for="name">이름</label> <input type="text" name="name"
						id="name" /> <span id="namespan">필수입력</span>
				</div>
				<div>
					<label for="tel">연락처</label> <input type="text" name="tel" id="tel" />
					<span id="telspan">필수입력</span>
				</div>
				<div id="brth">
					<label for="year">생년월일</label> <select name="year">
						<option value="">년도</option>
						<option value="2019">2019</option>
						<option value="2018">2018</option>
						<option value="2017">2017</option>
					</select> <label for="year">년</label> <select name="month">
						<option value="">월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select> <label for="month">월</label> <select name="day">
						<option value="">일</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select> <label for="day">일</label>

				</div>
				<div id="emaildiv">
					<label for="email1">이메일</label> <input type="text" name="email1"
						id="email1" /> <label for="email2" id="골뱅이">@</label> <input
						type="text" name="email2" id="email2" /> <select id="emailselbox">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
					</select>
				</div>
				<div id="addr">
					<form name="form" id="form" method="post">
						<input type="hidden" id="fullAddr" name="fullAddr" /><br>
						<input id="addrbtn" type="button" onClick="goPopup();" value="주소검색" />
						도로명주소 <input type="text" id="addr1" readonly="readonly"/><br>
						고객입력 상세주소<input type="text" id="addr2" readonly="readonly"/><br>
						<!-- 참고주소<input type="text" id="roadAddrPart2" name="roadAddrPart2" /><br>-->
						우편번호<input type="text" id="zipNo" readonly="readonly"/>
					</form>
				</div>
			</div>
			<!-- *********************************강사 정보 hidden part*********************************** -->
			<div id="teacherinfo">
				<div id="div1">
					<div>
						<label for="">전공</label> <input type="text" name="major" />
					</div>
					<div>
						<label for="" class="areala">자격사항</label>
						<textarea></textarea>
					</div>
					<div>
						<label for="" class="plusla">추가</label>
						<form id="form1">
							<div>
								<label for="">자격증명</label> <input type="text" />
								<button>검색</button>
							</div>
							<div>
								<label for="">발급처</label> <input type="text" />
							</div>
							<div>
								<label for="">취득일</label> <input type="text" />
							</div>
							<div class="addfile">
								<input type="text" />
								<button>첨부</button>
							</div>
						</form>
						<input type="submit" value="추가" />
					</div>
				</div>
				<div id="div2">
					<div>
						<label for="" class="areala">경력사항</label>
						<textarea></textarea>
					</div>
					<div>
						<label for="" class="plusla">추가</label>
						<form id="form2">
							<div>
								<label for="">직장명</label> <input type="text" />
								<button>검색</button>
							</div>
							<div>
								<label for="">직책</label> <input type="text" />
							</div>
							<div>
								<label for="">근무시간</label> <input type="text" />
							</div>
							<div class="addfile">
								<input type="text" />
								<button>첨부</button>
							</div>
						</form>
						<input type="submit" value="추가" />
					</div>
				</div>
			</div>
		</div>
		<button id="editbtn">수정</button>
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