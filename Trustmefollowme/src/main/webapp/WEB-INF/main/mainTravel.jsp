<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@ page session="false"%>
<style>
.pt-8 {
    padding-top: 2rem;
}
.pb-6 {
    padding-bottom: 1.5rem;
}
.bg-gray-800 {
    --tw-bg-opacity: 1;
    background-color: rgb(247 248 249/var(--tw-bg-opacity));
}
</style>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
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
<style>
body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#left-container {
	width: 50%;
	height: 100vh;
	background-color: #f0f0f0;
	float: left;
	overflow: auto; /* 세로 스크롤이 필요한 경우 스크롤 표시 */
}

#right-container {

	width: 50%;
	height: 100%;
	background-color: #f0f0f0;
	float: left;
	overflow: auto; /* 세로 스크롤이 필요한 경우 스크롤 표시 */
}

.search {
	width: 250px;
	height: 40px;
	font-size: 20px;
}

.search2 {
	width: 100px;
	height: 40px;
	font-size: 20px;
}

.page {
	padding-top: 30px;
	padding-left: 450px;
}

.filters_menu {
	font-size: 20px;
}
</style>
<html>

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/images/travel2.jpg"
	type="">

<title>나믿따</title>
<!-- Favicons -->
<link href="<%=request.getContextPath()%>/resources/assets/img/logo.png"
	rel="icon">
<link
	href="<%=request.getContextPath()%>/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

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

<!-- Template Main CSS File -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/css/style.scss"
	rel="stylesheet">
	
	
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

<!-- Template Main CSS File -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/style.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />

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

</head>
<body>
	<div class="hero_area">
		<div class="bg-box">
			<img src="<%=request.getContextPath()%>/resources/images/travel2.jpg"
				id="mainimg">
		</div>
		<!-- header section strats -->
		<c:forEach var="i" items="${date}">
			<span>Day${i}</span>
			<c:set var="day" value="${day+1}"></c:set>
			<br>
		</c:forEach>
		</h1>
		<header id="header" class="fixed-top ">
			<div
				class="container d-flex align-items-center justify-content-lg-between">

				<h1 class="logo me-auto me-lg-0">
					<a href="mainScreen.m"><img alt=""
						src="<%=request.getContextPath()%>/resources/assets/img/logo.png"></a>
				</h1>

				<nav id="navbar" class="navbar order-last order-lg-0">
					<ul>
						<li><a class="nav-link scrollto active" href="#hero"></a></li>
						<li><a class="nav-link scrollto" href="#about"></a></li>
						<li><a class="nav-link scrollto" href="#services"></a></li>
						<li><a class="nav-link scrollto " href="#portfolio"></a></li>
						<li><a class="nav-link scrollto" href="#team"></a></li>

						<li><a class="nav-link scrollto" href="#contact"></a></li>
						<li class="dropdown"><a href="#"><span>여행날짜</span> <i
								class="bi bi-chevron-down"></i></a>
							<ul>
								<c:forEach var="i" items="${days}">
									<li><a>${i}</a></li>
								</c:forEach>
							</ul></li>
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

			</div>
		</header>
		<!-- end header section -->
	</div>
	<section class="food_section layout_padding-bottom" id="left-container">
		<div class="container">
			<ul class="filters_menu">
				<li class="active" data-filter="*">All</li>
				<li data-filter=".buger">호텔</li>
				<li data-filter=".pasta">음식점</li>
				<li data-filter=".fries">카페</li>
				<li data-filter=".pizza">관광지</li>
			</ul>
			<form action="mainJourney.mj">
				<input type="hidden" name="date" value="${date }"> <input
					class="btn btn-lg btn-success" type="submit" value="여정 생성">
				<div class="filters-content">
					<div class="row grid">
						<!-- 카테고리 페이지틀  -->
						<!-- 카테고리 페이지틀  -->
						<!-- 카페리스트 -->

						<c:forEach var="list" items="${cafeList}">
							<div class="col-sm-6 col-lg-4 all fries">
								<div class="box">
									<div>
										<div class="img-box">
											<a href="#" class="showModalBtn" data-cnum="${list.cnum}">
												<img width="400px" height="300px"
												src="<%=request.getContextPath()%>/resources/images/${list.image}"
												alt="이미지">
											</a>
										</div>
										<div class="detail-box">
											<h5>${list.name}</h5>
											<div class="options">
												<h6>${list.address}</h6>
												<input type="checkbox" id="spotcheck" name='restaurant'
													value="${list.cnum}/${list.xpos}/${list.ypos}"
													data-xpos="${list.xpos}" data-ypos="${list.ypos}">

											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

						<c:forEach var="list" items="${restaurantList}">
							<div class="col-sm-6 col-lg-4 all pasta">
								<div class="box">
									<div>
										<div class="img-box">
											<a href="#" class="showModalBtn2" data-rnum="${list.rnum}">
												<img width="400px"
												src="<%=request.getContextPath()%>/resources/images/${list.image}"
												alt="이미지">
											</a>
										</div>
										<div class="detail-box">
											<h5>${list.name}</h5>
											<div class="options">
												<h6>${list.address}</h6>
												<input type="checkbox" id="spotcheck" name='restaurant'
													value="${list.rnum}/${list.xpos}/${list.ypos}"
													data-xpos="${list.xpos}" data-ypos="${list.ypos}">

											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 관광지 리스트 -->
						</c:forEach>
						<c:forEach var="list" items="${spotList}">
							<div class="col-sm-6 col-lg-4 all pizza">
								<div class="box">
									<div>
										<div class="img-box">
											<a href="#" class="showModalBtn3" data-snum="${list.snum}">
												<img width="400px"
												src="<%=request.getContextPath()%>/resources/images/${list.image}"
												alt="이미지">
											</a>
										</div>
										<div class="detail-box">
											<h5>${list.name}</h5>
											<div class="options">
												<h6>${list.address}</h6>
												<input type="checkbox" id="spotcheck" name='spot'
													value="${list.snum}/${list.xpos}/${list.ypos}"
													data-xpos="${list.xpos}" data-ypos="${list.ypos}">

											</div>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>

						<c:forEach var="list" items="${hotelList}">
							<div class="col-sm-6 col-lg-4 all buger">
								<div class="box">
									<div>
										<div class="img-box">
											<a href="#" class="showModalBtn4" data-hnum="${list.hnum}">
												<img width="400px"
												src="<%=request.getContextPath()%>/resources/images/${list.image}"
												alt="이미지">
											</a>
										</div>
										<div class="detail-box">
											<h5>${list.name}</h5>
											<div class="options">
												<h6>${list.address}</h6>
												<input type="checkbox" id="spotcheck" name='hotel'
													value="${list.hnum}/${list.xpos}/${list.ypos}"
													data-xpos="${list.xpos}" data-ypos="${list.ypos}">

											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- 카테고리 페이지틀  -->
				</div>
				<!-- 카테고리 페이지틀  -->

			</form>
		</div>
		<!-- 카테고리 페이지틀  -->
	</section>
	<!-- 카테고리 페이지틀  -->
	<section id="right-container">

		<div id="map" style="width: 100%; height: 100%;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6406498ef47269fb1b4e04089576fe5"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(33.450701, 126.570667),
				level : 3
			};

			var map = new kakao.maps.Map(container, options);
		</script>

	</section>

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
	<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
		
	</script>
	<!-- End Google Map -->
	<script type="text/javascript">
		var markers = []; // Add a global variable to store markers

		$(document)
				.ready(
						function() {
							var mapContainer = document.getElementById('map');
							var mapOption = {
								center : new kakao.maps.LatLng(33.450701,
										126.570667),
								level : 10
							};
							var map = new kakao.maps.Map(mapContainer,
									mapOption);

							// Event listener for checkboxes with the name "spotcheck"
							$('input[id="spotcheck"]')
									.change(
											function() {
												var xpos = $(this).data('xpos');
												var ypos = $(this).data('ypos');

												if (this.checked) {
													// 위치 배열에 위치 추가합니다.
													var positions = [ {
														title : '카페',
														latlng : new kakao.maps.LatLng(
																xpos, ypos)
													} ];

													// 마커 이미지의 이미지 주소입니다
													var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

													for (var i = 0; i < positions.length; i++) {

														// 마커 이미지의 이미지 크기 입니다
														var imageSize = new kakao.maps.Size(
																24, 35);

														// 마커 이미지를 생성합니다    
														var markerImage = new kakao.maps.MarkerImage(
																imageSrc,
																imageSize);

														// 마커를 생성합니다
														var marker = new kakao.maps.Marker(
																{
																	map : map,
																	position : positions[i].latlng,
																	title : positions[i].title,
																	image : markerImage
																});

														// 마커 배열에 마커를 추가합니다
														markers.push(marker);
													}
												} else {
													// 선택하지 않은 경우 마커 제거합니다
													for (var i = 0; i < markers.length; i++) {
														var marker = markers[i];
														var markerPosition = marker
																.getPosition();
														// 비교를 위해 작은 임계값 사용합니다
														var threshold = 0.000001;

														if (Math
																.abs(markerPosition
																		.getLat()
																		- xpos) < threshold
																&& Math
																		.abs(markerPosition
																				.getLng()
																				- ypos) < threshold) {
															marker.setMap(null);
															// 마커 배열에서 마커 제거합니다
															markers
																	.splice(i,
																			1);
															break; // 마커를 찾아 제거한 후 루프를 종료합니다
														}
													}
												}
											});
						});
	</script>
</body>
</html>