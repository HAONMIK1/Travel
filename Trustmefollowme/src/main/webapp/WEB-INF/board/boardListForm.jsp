<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<style>
.image {
	border-radius: 30px;
	width: 200px;
	height: 150px;
}
.page{
	display: inline-block;
	width: 400px;
	height: 500px;
	text-align: center;
	margin-top: 50px;
    box-shadow: 1px 1px 1px rgba(231,231,231,0.4);
    border: 1px solid;
    
}
.deco{
	color: black;
	text-decoration: none;
}
 .content {
	text-align:center;
    height: 70px;
    width: 100%;
    overflow: auto;
    margin-bottom: 20px;
    margin-left: 25px;
}
.content::-webkit-scrollbar {
    width: 10px;
  }
  .content::-webkit-scrollbar-thumb {
    background-color: black;
  }
  .content::-webkit-scrollbar-track {
    background-color: #D5D5D5;
  }
.ptext{
	text-align: center;
	margin-top: 80px;
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
	
#arr{
	text-decoration: none;
	color: black;
}
#allarr{
	text-align: right;
	margin-right: 150px;
}
.column {
  width: 80px;
  height: 30px;
  border-radius: 4px;
  padding-left: 10px;
}
.keyword{
	border-color: #EDEDED;
}
.login{
	text-align: right;
	margin-right: 150px;
}
.col-lg-4{
	text-align: center;
}
#topTitle{
}
#title{
	width: 40%;
	display: inline-block;
	padding-left: 120px;
}
#title2{
	width: 50%;
	display: inline-block;
}
#logo{
	width: 70px;
	height: 50px;
}
#List{
	background: white;
	width: 80%;
	margin: auto;
	margin-top: 60px;
	border-radius: 2%;
	padding-top: 50px;
}
#item{
	margin-top: 30px;
}
</style>
<script>
	function boardDelete(num){
		location.href="boardDelete.bd?num="+num;
	}
	
	function boardUpdate(num,jnum){
		location.href="boardUpdate.bd?num="+num+"&jnum="+jnum;
	}
</script>
<body style="background: #F8F9FD;">

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/main.css" />

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
  
	<div class="ptext">
	<div>
		<span> <font color="#6D6CFF"> 여행 일지 </font>
		</span>
	</div>
		<span>
		<h2>
		<div id="title2">
			나의 여행을 소개합니다.
		</div>
		</h2>
		</span>
	</div>
	<br>
		<form action="boardList.bd" method="get" align="center">
				<select name="WhatColumn" class="">
						<option value="all" style="color: black">전체 
						<option value="title" style="color: black">제목
						<option value="content" style="color: black">내용
					</select>
					<input type="text" name="keyword" class="keyword" placeholder="검색" maxlength="2--"
					height="50px">
					<input id="btn" type="submit" value="검색">
					<c:choose>
						<c:when test="${empty myname}">
					<div class="login">
						<a href="login.mb" id="btn">로그인</a>
					</div>
						</c:when>
						<c:otherwise>
					<div class="login">
							<a href="myPage.mb" style="text-decoration: none;"><font color="blue">${myname}</font></a>님
					</div>
						</c:otherwise>
					</c:choose>
			</form>
			
	<div id="allarr">
	<button id="btn">
		<a href="numList.bd" id="arr">등록순</a>
	</button>
	<button id="btn">
		<a href="likesList.bd" id="arr">좋아요⬆</a>
	</button>
	<button id="btn">
		<a href="readCount.bd" id="arr">조회수⬆</a>
	</button>&nbsp;&nbsp;
	<button id="btn">
		<a href="boardInsert.bd" id="arr">여정 공유</a>
	</button>
	</div>
	

  <link href="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
  
    <div id="List">
      <div class="container" data-aos="fade-up">
        <div class="row">
        <c:if test="${empty lists}">
        <center><h1>게시물이 없습니다.</h1></center></c:if>
<c:forEach var="list" items="${lists}">
          <div id="item" class="col-lg-4 col-md-6 align-items-stretch" data-aos="zoom-in" data-aos-delay="100" style="border-bottom: 1px solid #EAEAEA;">
          	<h3>
          	<a href="boardDetail.bd?num=${list.num}&jnum=${list.jnum}&mEmail=${list.mEmail}&minDate=${list.minDate}">
          	<font color="black">${list.title}</font>
			</a>
          	</h3>
            <div>
            <a href="boardDetail.bd?num=${list.num}&jnum=${list.jnum}&mEmail=${list.mEmail}&minDate=${list.minDate}">
            	<img class="image" alt="이미지" src="<%=request.getContextPath()%>/resources/images/${list.image}">
            </a>
            </div>
              <div align="right" style="margin-right: 50px; padding-top: 20px;">
              <h6><font color="gray">${list.writer}님의 여행일지</font></h6><br>
              <div class="content">
             	${list.content} 
              </div>
              <c:if test="${sessionScope.myemail eq list.mEmail || sessionScope.myname eq '어드민'}">
              <div style="padding-bottom: 50px;">
              <input id="btn" type="button" value="수정" onclick="boardUpdate(${list.num},'${list.jnum}')">
              &nbsp;&nbsp;<input id="btn" type="button" value="삭제" onclick="boardDelete(${list.num})">
              </div>
              </c:if>
              </div>
            </div>
</c:forEach>
          </div>
          </div>
    </div>
</body>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/php-email-form/validate.js"></script>

  <script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
	