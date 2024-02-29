<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<style type="text/css">
html{
	scroll-behavior: smooth;
}
#id {
	border-radius: 30px;
	border-color: silver;
}

.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}

#btn {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 13px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

#btn:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

#btn:active {
	position: relative;
	top: 1px;
}

#btn2 {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #DAD9FF 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 80%;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 10px 13px 10px 10px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
	width: 70px;
}

#btn2:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #D9E5FF 100%);
}

#btn2:active {
	position: relative;
	top: 1px;
}

#title, textarea {
	border-color: #EAEAEA;
	box-shadow: 1px 1px 1px gray inset;
}

textarea:focus, #title:focus {
	outline: 1px solid #F8FFFF;
}

#logo {
	width: 60px;
	height: 40px;
}

#date {
	font-size: 20px;
}

textarea {
	white-space: normal;
  width: 600px;
  height: 400px;
  font-size: 15px;
  border: 1px solid #CFCFCF;
  border-radius: 15px;
  padding: 10px;
  box-shadow: 1px 1px #E1E1E1
}

#title {
  width: 500px;
  height: 32px;
  font-size: 15px;
  border: 1px solid #CFCFCF;
  border-radius: 15px;
  padding-left: 10px;
}
#right{
	position: sticky;
	top: 0px;
}
#up{
	position: sticky;
	margin-right: 22px;
	padding-top: 150px;
	width: 0px;
	border-radius: 50%;
	margin-right: 100px;
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

<center>
<div style="margin-top: 30px;">
	<form:form action="boardInsert.bd" method="post" commandName="boardBean" enctype="multipart/form-data">
		<input type="hidden" name="jnum" value="${jnum}">
		<input type="hidden" name="writer" value="${sessionScope.myname}">
		<input type="hidden" name="mEmail" value="${myemail}">
		<input type="hidden" name="minDate" value="${minDate}">
		<input type="hidden" name="maxDate" value="${maxDate}">
		<input type="file" name="imgUpload" value="${boardBean.image}">
		<br>
		<form:errors cssClass="err" path="image" />
		<br>
		<br>
		<input id="title" type="text" name="title" placeholder="제목을 작성해주세요"
			maxlength="20" value="${boardBean.title}">
		<form:errors cssClass="err" path="title" />
		<br>
		<br>
		<textarea rows="20" cols="70" name="content"
			placeholder="내용을 작성해주세요. (500자 이내)" maxlength="500"
			style="resize: none;">${boardBean.content}</textarea>
		<br>
		<form:errors cssClass="err" path="content" />
		<br>
		<br>
		<input id="btn" type="submit" value="여정 공유하기">
	</form:form>
</div>

<div id="right" align="right">
	<nav id="nav" style="width: 100%; padding-bottom: 5px;">
		<ul>
		<li>
		<c:forEach var="date" items="${fn:split(date,',')}">
							<li><a id="date" href="#${date}" class="active">${date}일</a></li>
				</c:forEach>
		</li>
		</ul>
	</nav>
	<div align="right" id="up"><a href="#" id="btn2">위로↑</a></div>
</div>
	<div style="margin-top: 30px; margin-bottom: 30px;">
		<div id="date">${minDate}일~ ${maxDate}일</div>
	</div>
<c:set var="count" value="0"/>
				<c:forEach var="myj" items="${list}" varStatus="a">
				<c:if test="${myj.turn eq 1}">
				<c:set var="count" value="${count+1}"/>
				<h1 id="${myj.jdate }" style="padding-top: 50px; padding-bottom: 15px;">${count}Day</h1>
				</c:if>
					<div align="left" style="margin-bottom: 50px;">
					<div style="display: inline-block; margin-left: 660px;">
						<img alt="" src="<%=request.getContextPath()%>/resources/images/${myj.image}" 
						width="200px" height="200px">
					</div>
					<div style="display: inline-block; margin-left: 100px;">
						<h4>
							<a href="">${myj.name}</a>
						</h4>
						<br>
						<h5>${myj.address}</h5>
						<br><br><br>
					</div>
					</div>
				</c:forEach>
</center>
	
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
			
	
	
	
			