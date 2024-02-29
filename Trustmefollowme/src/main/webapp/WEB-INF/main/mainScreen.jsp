<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Gp Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">
<link href="<%=request.getContextPath()%>/resources/assets/img/logo.png"
	rel="icon">
<link
	href="<%=request.getContextPath()%>/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
	integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ=="
	crossorigin="anonymous" />
<link
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet" />
<!-- responsive style -->
<link href="<%=request.getContextPath()%>/resources/css/responsive.css"
	rel="stylesheet" />

<!-- Favicons -->
<link href="<%=request.getContextPath()%>/resources/assets/img/logo.png"
	rel="icon">
<link
	href="<%=request.getContextPath()%>/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">
<!-- Template Main CSS File -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/style.css"
	rel="stylesheet">
<style>
/* 12 */
.btn-12 {
	position: relative;
	right: 20px;
	bottom: 20px;
	border: none;
	box-shadow: none;
	width: 130px;
	height: auto;
	line-height: 42px;
	-webkit-perspective: 230px;
	perspective: 230px;
}

.btn-12 span {
	background: rgb(0, 172, 238);
	background: linear-gradient(0deg, rgba(0, 172, 238, 1) 0%,
		rgba(2, 126, 251, 1) 100%);
	display: block;
	position: absolute;
	width: 130px;
	height: 40px;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	border-radius: 5px;
	margin: 0;
	text-align: center;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all .3s;
	transition: all .3s;
}

.btn-12 span:nth-child(1) {
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
	-webkit-transform: rotateX(90deg);
	-moz-transform: rotateX(90deg);
	transform: rotateX(90deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-12 span:nth-child(2) {
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-12:hover span:nth-child(1) {
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
}

.btn-12:hover span:nth-child(2) {
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	color: transparent;
	-webkit-transform: rotateX(-90deg);
	-moz-transform: rotateX(-90deg);
	transform: rotateX(-90deg);
}

aside {
	flex-grow: 5;
}

article {
	flex-grow: 5;
}

#content {
	text-align: center;
	height: 100px;
	width: 100%;
	overflow: auto;
	margin: auto;
}

#im {
	width: 300px;
	height: 200px;
	border-radius: 10%;
	box-shadow: 1px 1px 1px 1px gray;
}

.content {
	text-align: center;
	height: 60px;
	width: 100%;
	overflow: hidden;
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
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".showModalBtn").click(
				function() {
					var cnum = $(this).data("cnum");

					window.open("cafeDetail.cf?cnum=" + cnum, "카페",
							"width=500, height=600");

				});
		$(function() {
			$(".showModalBtn2").click(
					function() {
						var rnum = $(this).data("rnum");

						window.open("restDetail.re?rnum=" + rnum, "레스토랑",
								"width=500, height=600");

					});

			$(".showModalBtn3").click(
					function() {
						var snum = $(this).data("snum");

						window.open("spotDetail.sp?snum=" + snum, "관광지",
								"width=500, height=600");

					});
			$(".showModalBtn4").click(
					function() {
						var hnum = $(this).data("hnum");

						window.open("hotelDetail.ht?hnum=" + hnum, "호텔",
								"width=800, height=600");

					});
		});
	});
</script>
<script>
   var displayedItems = 6; // 초기값을 표시된 아이템의 개수로 설정

   $('#load-more-btn').click(function () {
      var itemsToLoad = 3; // 원하는 개수로 설정

      $('.portfolio-item').slice(displayedItems, displayedItems + itemsToLoad).fadeIn();

      displayedItems += itemsToLoad;

      if (displayedItems >= $('.portfolio-item').length) {
         $('#load-more-btn').hide();
      }
   });
   </script>

</head>

<body>

	<!-- ======= Header ======= -->
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
				<c:if test="${myname=='어드민' }">
				
				<a href="admin.mb" class="get-started-btn scrollto">관리자</a>
				</c:if>
				<a href="logout.mb" class="get-started-btn scrollto">로그아웃</a>
			</c:if>
			<!--민희가 주석처리 <a href="login.mb" class="get-started-btn scrollto">로그인</a>  -->

		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero"
		class="d-flex align-items-center justify-content-center">
		<div class="container" data-aos="fade-up">

			<div class="row justify-content-center aside" data-aos="fade-up"
				data-aos-delay="150">
				<h1>나만 믿고 따라와</h1>
				<h3>기존에 경험하지 못한 여행 플래너</h3>
				<h4>고민만 하던 여행 나만 믿고 따라와</h4>
			</div>

		</div>
		<div class="article">
			<%@ include file="mainCalender.jsp"%>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">
		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>여정 둘러보기</h2>
					<p>
						<a href="boardList.bd">여정 게시판</a>
					</p>
				</div>
				<div class="row">
					<c:forEach var="list" items="${boardlists}">
						<div class="col-lg-4 col-md-6 align-items-stretch"
							data-aos="zoom-in" data-aos-delay="100"
							style="border-bottom: 1px solid #EAEAEA;">
							<h3>
								<a
									href="boardDetail.bd?num=${list.num}&jnum=${list.jnum}&mEmail=${list.mEmail}&minDate=${list.minDate}">
									<font color="black">${list.title}</font>
								</a>
							</h3>
							<div>
								<a
									href="boardDetail.bd?num=${list.num}&jnum=${list.jnum}&mEmail=${list.mEmail}&minDate=${list.minDate}">
									<img id="im"
									src="<%=request.getContextPath()%>/resources/images/${list.image}"
									width="200">
								</a>
							</div>
							<div align="right" style="margin-right: 50px; padding-top: 20px;">
								<h6>
									<font color="gray">${list.writer}님의 여행일지</font>
								</h6>
								<br>
								<div class="content">${list.content}</div>
								<c:if
									test="${sessionScope.myemail eq list.mEmail || sessionScope.myname eq '어드민'}">
									<div style="padding-bottom: 50px;">
										<input id="btn" type="button" value="수정"
											onclick="boardUpdate(${list.num},'${list.jnum}')">
										&nbsp;&nbsp;<input id="btn" type="button" value="삭제"
											onclick="boardDelete(${list.num})">
									</div>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!-- End Services Section -->

		<!-- ======= Cta Section ======= -->
		<section id="cta" class="cta">
			<div class="container" data-aos="zoom-in">

				<div class="text-center">
					<h3>나만의 여정 계획하기</h3>
					<p></p>
					<a class="cta-btn" href="#">여정 만들기</a>
				</div>

			</div>
		</section>
		<!-- End Cta Section -->

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>카테고리</h2>
					<p>여정 카테고리</p>
				</div>

				<div class="row" data-aos="fade-up" data-aos-delay="100">
					<div class="col-lg-12 d-flex justify-content-center">
						<ul id="portfolio-flters">
						 <li data-filter="*" class="filter-active">All</li>
							<li data-filter=".filter-web">호텔</li>
							<li data-filter=".filter-card">음식점</li>
							<li data-filter=".filter-cafe">카페</li>
							<li data-filter=".filter-app">관광지</li>
						</ul>
					</div>
				</div>
				<div id="additional-items-container" class="row portfolio-container"
					data-aos="fade-up" data-aos-delay="200">
					<c:forEach var="list" varStatus="a" items="${cafeList}">
						<div class="col-lg-4 col-md-6 portfolio-item filter-cafe">
							<div class="portfolio-wrap">
								<img src="<%=request.getContextPath()%>/resources/images/${list.image}" class="img-fluid" alt="">
							</div>
							<div class="portfolio-info">
								<a class="showModalBtn" data-cnum="${list.cnum}">
								<h4>${list.name}</h4>
						</a>
								<p>${list.address}</p>
							</div>
						</div>
					</c:forEach>
					<c:forEach var="list" items="${restaurantList}">
						<div class="col-lg-4 col-md-6 portfolio-item filter-card">
							<div class="portfolio-wrap">
									<img
									src="<%=request.getContextPath()%>/resources/images/${list.image}"
									class="img-fluid" alt="">
							</div>
							<div class="portfolio-info">
								<a  class="showModalBtn2" data-rnum="${list.rnum}">
								<h4>${list.name}</h4>
								</a>
								<p>${list.address}</p>
							</div>
						</div>
					</c:forEach>

					<c:forEach var="list" items="${spotList}">
						<div class="col-lg-4 col-md-6 portfolio-item filter-app">
							<div class="portfolio-wrap">
									<img
									src="<%=request.getContextPath()%>/resources/images/${list.image}"
									class="img-fluid" alt="">
							</div>
							<div class="portfolio-info">
								<a  class="showModalBtn3" data-snum="${list.snum}">
								<h4>${list.name}</h4>
								</a>
								<p>${list.address}</p>
							</div>
						</div>
					</c:forEach>

					<c:forEach var="list" items="${hotelList}">
						<div class="col-lg-4 col-md-6 portfolio-item filter-web">
							<div class="portfolio-wrap">
									<img
									src="<%=request.getContextPath()%>/resources/images/${list.image}"
									class="img-fluid" alt="">
							</div>
							<div class="portfolio-info">
								<a  class="showModalBtn4" data-hnum="${list.hnum}">
								<h4>${list.name}</h4>
								</a>
								<p>${list.address}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!-- End Portfolio Section -->

		<!-- ======= Testimonials Section ======= -->
		<section id="testimonials" class="testimonials">
			<div class="container" data-aos="zoom-in">

				<div class="testimonials-slider swiper" data-aos="fade-up"
					data-aos-delay="100">
					<div class="swiper-wrapper">

						<c:forEach var="list" items="${boardlists}">
							<div class="swiper-slide">
								<div class="testimonial-item">
									<a
									href="boardDetail.bd?num=${list.num}&jnum=${list.jnum}&mEmail=${list.mEmail}&minDate=${list.minDate}">
									<img
										src="<%=request.getContextPath()%>/resources/images/${list.image}"
										class="testimonial-img" alt="" width="100">
									<h3>${list.writer}님의여행일지</h3>
									<h4>${list.title}</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i>
										${list.content} <i
											class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p></a>
								</div>
							</div>
							<!-- End testimonial item -->
						</c:forEach>

					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</section>
		<!-- End Testimonials Section -->
		<!-- ======= Contact Section ======= -->
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	 <footer class="footer_section" id=>
      <div class="container">
         <div class="row" style="padding-top: 30px;">
            <div class="col-md-4 footer-col">
               
            </div>
            <div class="col-md-4 footer-col">
               <div class="footer_detail">
                  <a href="" class="footer-logo"> trust me and follow me </a>
                  <p>나만 믿고 따라와</p>
                  <div class="footer_social">
                     <a href=""> <i class="fa fa-facebook" aria-hidden="true"></i>
                     </a> <a href=""> <i class="fa fa-twitter" aria-hidden="true"></i>
                     </a> <a href=""> <i class="fa fa-linkedin" aria-hidden="true"></i>
                     </a> <a href=""> <i class="fa fa-instagram" aria-hidden="true"></i>
                     </a> <a href=""> <i class="fa fa-pinterest" aria-hidden="true"></i>
                     </a>
                  </div>
               </div>
            </div>
          
         </div>
         <div class="footer-info">
            <p>
               &copy; <span id="displayYear"></span> All Rights Reserved By <a
                  href="https://html.design/">NAK</a><br> <br>
               &copy; <span id="displayYear"></span> Distributed By <a
                  href="https://themewagon.com/" target="_blank">나믿지</a>
            </p>
         </div>
      </div>

   </footer>
	<!-- End Footer -->

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
	<!-- jQery -->
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>


	<!-- popper js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous">
		
	</script>
	<!-- bootstrap js -->
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
	<!-- owl slider -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
		
	</script>
	<!-- isotope js -->
	<script
		src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
	<!-- nice select -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
	<!-- custom js -->
	<%-- 	<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script> --%>
</body>
<div class="modal" id="modal" role="dialog"
	aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 850px;">
		<div class="modal-content">
			<%@ include file="mainCalender.jsp"%>
			<form>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary" id="btn_save">확인</button>
				</div>
			</form>
		</div>
	</div>
</div>
