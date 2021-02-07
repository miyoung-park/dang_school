<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../../../resources/css/main.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
</head>
<body class="is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<div id="dangmark"> </div>
				<a href="/main.do" id="headermain" class="mainfont">댕댕아 놀면 뭐하니?</a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
								<li><a href="/main.do">Home</a></li>
								<c:choose>
									<c:when test ="${sessionScope.schoolMember != null}"><li><a href="/school/schoolpage.do">마이페이지</a></li></c:when>
									<c:when test ="${sessionScope.userMember != null}"><li><a href="/user/userpage.do">마이페이지</a></li></c:when>
								</c:choose>
								<li><a href="/map/map.do">유치원 찾기</a></li>
								<li><a href="#">캘린더</a></li>
								<c:choose>
									<c:when test ="${sessionScope.schoolMember != null}"><li><a href="/school/logout.do">로그아웃</a></li></c:when>
									<c:when test ="${sessionScope.userMember != null}"><li><a href="/user/logout.do">로그아웃</a></li></c:when>
								</c:choose>
							</ul>
						</div></li>
				</ul>
			</nav>
		</header>








		<!-- Main -->
		<section class="myprofile_board">
			<div class="school_info_form" id="school_profile">
				<form action="${context}/school/info.do" method="post" id="school_modify_form">
					<fieldset >
						<div id="school_info_part">
							<div id ="school_info_detail">
								<ul id="school_modify_info">
									<li><h3>업체명</h3>
										<input type="text" value="${sessionScope.schoolMember.kgName}" id="kgName" name="kgName" readonly>
									</li>
									<li><br><h3>주소</h3>
										<textarea rows = "5" cols = "20" style = "resize: none" id="kgAddress" name="kgAddress">${sessionScope.schoolMember.kgAddress}</textarea>
									</li>
									<li><br><h3>전화번호</h3>
										<input type ="text" value="${sessionScope.schoolMember.kgTell}" id="kgTell" name="kgTell">
									</li>
									<li><br><h3>운영시간</h3>
										<input type ="text" value="${sessionScope.schoolMember.kgOperateTime}" id="kgOperateTime" name="kgOperateTime">
									</li>
									<li><br><h3>안내사항</h3>
										<textarea rows = "5" cols = "20" style = "resize: none" id="kgNotice" name="kgNotice">${sessionScope.schoolMember.kgNotice}</textarea>
									</li>
									<li>
										<div id="modify_part">
											<button type="submit" id="school_modify_btn">기본 프로필수정</button>
										</div>
									</li>
								</ul>
							</div>							
						</div>
						
					</fieldset>
				</form>
				
				
				<div id="separate_part">
					<div id="school_service">
						<form action="${context}/school/profileservice.do" method="post" id="school_service_form">
							<fieldset id="sort_school_service">
								<h3>제공서비스</h3><br>
						 		<label for ="isKg"><input type = "checkbox" id = "isKg" name ="service1"  value = "isKg"> 유치원</label>
								<label for = "isCafe"><input type = "checkbox" id = "isCafe"  name ="service2" value = "isCafe"> 카페</label>
								<label for = "isHotel"> <input type = "checkbox" id = "isHotel"  name ="service3" value = "isHotel"> 호텔</label>
								<label for ="isPickup"><input type = "checkbox" id = "isPickup"  name ="service4" value = "isPickup"> 픽업서비스</label>
								<label for = "isMedic"><input type = "checkbox" id = "isMedic"  name ="service5" value = "isMedic"> 메니컬센터</label>
								<label for = "isAcademy"><input type = "checkbox" id = "isAcademy"  name ="service6" value = "isAcademy"> 아카데미</label>
								<label for = "isSpa"><input type = "checkbox" id = "isSpa"  name ="service" value = "isSpa"> 스파</label>
						 		<button id="school_modify_btn">제공 서비스 수정</button>
							</fieldset>
						</form>
					</div>
					<form action="${context}/school/profilephoto.do" method="post" id="school_photo_form">
						<div>
							<h3>유치원사진</h3><br>
							<label><input type ="file" id="kg_photo"></label>
						</div>
						<div id="photo_border">
							사진 첨부
						</div>
						<button id="file_upload_btn">파일 업로드</button>
					</form>
				</div>
			</div>
		</section>













		<!-- Footer -->
		<footer id="footer">
			<ul class="icons">

			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</footer>

	</div>

	<!-- Scripts -->
 <script src="../../../../resources/js/jquery.min.js"></script>
	<script src="../../../../resources/js/jquery.scrollex.min.js"></script>
	<script src="../../../../resources/js/jquery.scrolly.min.js"></script>
	<script src="../../../../resources/js/browser.min.js"></script>
	<script src="../../../../resources/js/breakpoints.min.js"></script>
	<script src="../../../../resources/js/util.js"></script>
	<script src="../../../../resources/js/main.js"></script>
	<script src="../../../../resources/js/member.js"></script>
	
</body>
</html>