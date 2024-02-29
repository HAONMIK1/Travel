<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<style type="text/css">

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header {
	background-color: #fff;
	z-index: 999999;
	box-shadow: 1px -5px 24px #776b6bcc;
	padding: 17px 0px;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .main_menu li a {
	color: #000;
	transition: .6s;
	opacity: .7;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .main_menu li:hover a
	{
	color: #F24259;
}

.navbar.navbar-expand-xl.nav_area.sticky .logo-light {
	display: inline-block;
}

.navbar.navbar-expand-xl.nav_area.sticky .logo-dark {
	display: none;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .logo-light {
	display: none;
}

.navbar.navbar-expand-xl.nav_area.sticky.scroll-header .logo-dark {
	display: inline-block;
}

.nav_area {
	position: fixed;
	left: 0;
	right: 0;
	z-index: 9999;
	padding: 22px 0px;
	transition: .6s;
}

.logo {
	height: 41px;
	padding: 7px 0px;
}

.logo-light {
	font-size: 22px;
	font-weight: 700;
}

.logo-light:hover {
	text-decoration: none;
	color: #111;
}

.logo-dark {
	font-size: 22px;
	font-weight: 700;
	color: #111;
}

.logo-dark:hover {
	text-decoration: none;
	color: #111;
}

.main_menu li a:hover {
	color: #F24259;
}

.main_menu li a {
	color: #111;
	font-size: 14px;
}

.main_menu .blk_btn {
	background-color: #F24259;
	color: #fff;
	margin-left: 13px;
	border-radius: 50px;
	padding: 10px 17px;
	transition: all .6s;
}

.main_menu a {
	text-decoration: none;
}

.navbar-nav.ml-auto.navbar-center.main_menu.onepage_nav li.active a {
	color: #F24259;
}

.content {
	white-space: normal;
	width: 600px;
}

#content {
	text-align: center;
	height: 100px;
	width: 100%;
	overflow: auto;
	margin: auto;
}

#content::-webkit-scrollbar {
	width: 10px;
}

#content::-webkit-scrollbar-thumb {
	background-color: black;
}

#content::-webkit-scrollbar-track {
	background-color: #D5D5D5;
}


#btn{
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:12px;
	font-weight:bold;
	padding:6px 13px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
#btn:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
#btn:active {
	position:relative;
	top:1px;
}
.row{
	text-align: center;
}
#img{
	border-radius: 30%;
	box-shadow: 2px 2px 2px gray;	
}
.row{
	padding-top: 100px;
}
.btn{
	margin-bottom: 50px;
}
li{
	color: black;
}
li:hover{
	color: orange;
}
</style>

	<link href="<%=request.getContextPath()%>/resources/assets/img/logo.png" rel="icon">
	<link href="<%=request.getContextPath()%>/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

	<link href="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/main.css" />
	<link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">


<header id="header" class=" ">
		<div
			class="container d-flex align-items-center justify-content-lg-between">

			<h1 class="logo me-auto me-lg-0">
				<a href="mainScreen.m"><img alt=""
					src="<%=request.getContextPath()%>/resources/assets/img/logo.png"></a>
			</h1>

			<nav id="navbar" class="navbar order-last order-lg-0">
				<ul>
					<li><a class="nav-link scrollto active" href="#hero"> </a></li>
					<li><a class="nav-link scrollto" href="#about"> </a></li>
					<li><a class="nav-link scrollto" href="#services"> </a></li>
					<li><a class="nav-link scrollto " href="#portfolio"> </a></li>
					<li><a class="nav-link scrollto" href="#team"> </a></li>
					<li><a class="nav-link scrollto" href="#contact"> </a></li>
				</ul>
			</nav>
			<!-- .navbar -->

			<!-- 민희가 추가한 로그인 로그아웃입니다. -->
			<c:if test="${empty myname}">
				<a href="login.mb" class="get-started-btn scrollto">로그인</a>
			</c:if>

			<c:if test="${not empty myname}">
				<a href="myPage.mb" class="get-started-btn scrollto">${myname}님
					환영합니다</a>

				<a href="logout.mb" class="get-started-btn scrollto">로그아웃</a>
			</c:if>
			<!--민희가 주석처리 <a href="login.mb" class="get-started-btn scrollto">로그인</a>  -->

		</div>
	</header>

<div style="display: inline-block; width: 100%; margin-top: 100px;" align="center">
	<div
		style="display: inline-block; vertical-align: top;">
		<h2 style="color: black; padding-top: 15px;">
			${sessionScope.myname}님의 여정을 선택해주세요.
		</h2>
	</div>
</div>
<br><br>

<c:set var="count" value="0"/>
<nav id="nav" style="width: 100%; padding-top: 30px;">
						<ul>
					<c:forEach var="bd" items="${fn:split(getJnum,',')}">
<c:set var="count" value="${count+1}"/>
							<li><a href="#${bd}" class="active"><font color="black">${count}번째 여정</font></a></li>
					</c:forEach>
						</ul>
					</nav>
					

  <link href="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
    
<c:set var="count" value="0"/>
     <section id="services" class="services">
      <div class="container" data-aos="fade-up">
        <div class="row">
		<c:forEach var="bd" items="${fn:split(getJnum,',')}">
<c:set var="count" value="${count+1}"/>
          <div class="col-lg-4 col-md-6 align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
          <div id="${bd}">
	${count}번째 여정
	<br><br>
	<div><img id="img" alt="" src="<%=request.getContextPath()%>/resources/assets/img/logo.png" width="150" height="130"></div>
	<br>
		<div class="btn"><a id="btn" href="boardInsert2.bd?jnum=${bd}"><font color="black">이동</font></a></div>
	</div>
            </div>
		</c:forEach>
          </div>
          </div>
    </section>
    
			
	<script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.scrollex.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js2/jquery.scrolly.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js2/browser.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js2/breakpoints.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js2/main.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
