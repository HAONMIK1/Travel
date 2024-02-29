<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>

$(function() {
	  $("#btn_open_modal").click(function() {
	        $("#modal").modal("show");
	    });
	    $("#modal").modal("show");
});
</script>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
<style>
body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
/* 왼쪽 영역 스타일 */
#left-container {
	width: 50%;
	height: 100vh; /* 화면 전체 높이로 설정 */
	background-color: #f0f0f0;
	float: left; /* 왼쪽으로 플로팅 */
}

/* 오른쪽 영역 스타일 */
#right-container {
	width: 50%;
	height: 100vh;
	background-color: #e0e0e0;
	float: left;
}

.page{
	padding-top: 30px;
	padding-left: 450px;
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
	<div class="hero_area" >
		<div class="bg-box">
			<img src="<%=request.getContextPath()%>/resources/images/travel2.jpg" id="mainimg">
		</div>
		<!-- header section strats -->
		<header class="header_section">
			<div class="container">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="index.html"> <span> Feane
					</span>
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class=""> </span>
					</button>
				</nav>
			</div>
		</header>
		<!-- end header section -->
	</div>
	<section class="food_section layout_padding-bottom" id="left-container">
		<div class="container">
			<ul class="filters_menu">
				<li data-filter=".hotel" onclick="location.href='mainHotelList.ht'">호텔</li>
				<li data-filter=".pizza"
					onclick="location.href='mainRestaurantList.re'">음식점</li>
				<li data-filter=".cafe" onclick="location.href='mainCafeList.cf'">카페</li>
				<li data-filter=".fries" onclick="location.href='mainSpotList.sp'">관광지</li>
			</ul>

			<div class="filters-content">
				<div class="row grid">
	<!-- 카테고리 페이지틀  -->
		<!-- 카테고리 페이지틀  -->		
		<c:if test="${cate=='cafe'}">
					<c:forEach var="list" items="${list}">
						<div class="col-sm-6 col-lg-4">
							<div class="box">
								<div>
									<div class="img-box">
              								 <a href="${detail}?cnum=${list.cnum}">
												<img src="<%=request.getContextPath()%>/resources/images/${list.image}" alt="이미지">
											</a>
									</div>
									<div class="detail-box">
										<h5>이름(${list.name})</h5>
										<div class="options">
											<h6>주소(${list.address})</h6>

										</div>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</c:if>
		<c:if test="${cate=='restaurant'}">
					<c:forEach var="list" items="${list}">
						<div class="col-sm-6 col-lg-4">
							<div class="box">
								<div>
									<div class="img-box">
              								 <a href="${detail}?rnum=${list.rnum}">
												<img src="<%=request.getContextPath()%>/resources/images/${list.image}" alt="이미지">
											</a>
									</div>
									<div class="detail-box">
										<h5><button id="btn_open_modal">
										${list.name}
										</button>
										</h5>
										<div class="options">
											<h6>주소(${list.address})</h6>

										</div>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</c:if>
		<c:if test="${cate=='spot'}">
					<c:forEach var="list" items="${list}">
						<div class="col-sm-6 col-lg-4">
							<div class="box">
								<div>
									<div class="img-box">
              								 <a href="${detail}?snum=${list.snum}">
												<img src="<%=request.getContextPath()%>/resources/images/${list.image}" alt="이미지">
											</a>
									</div>
									<div class="detail-box">
										<h5>이름(${list.name})</h5>
										<div class="options">
											<h6>주소(${list.address})</h6>

										</div>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</c:if>
		<c:if test="${cate=='spot'}">
					<c:forEach var="list" items="${list}">
						<div class="col-sm-6 col-lg-4">
							<div class="box">
								<div>
									<div class="img-box">
              								 <a href="${detail}?snum=${list.snum}">
											<img src="<%=request.getContextPath()%>/resources/images/${list.image}" alt="이미지">
											</a>
									</div>
									<div class="detail-box">
										<h5>${list.name}</h5>
										<div class="options">
											<h6>${list.address}</h6>

										</div>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</c:if>
					<div class="page">
					${paging.pagingHtml}
					</div>

				</div>
				<!-- 카테고리 페이지틀  -->
			</div>
			<!-- 카테고리 페이지틀  -->
		</div>
		<!-- 카테고리 페이지틀  -->
	</section>
	<!-- 카테고리 페이지틀  -->
	<section id="right-container">

		<div id="map" style="width: 900px; height: 800px;"></div>
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

	<!-- footer section -->
	<footer class="footer_section" id=>
		<div class="container">
			<div class="row">
				<div class="col-md-4 footer-col">
					<div class="footer_contact">
						<h4>Contact Us</h4>
						<div class="contact_link_box">
							<a href=""> <i class="fa fa-map-marker" aria-hidden="true"></i>
								<span> Location </span>
							</a> <a href=""> <i class="fa fa-phone" aria-hidden="true"></i> <span>
									Call +01 1234567890 </span>
							</a> <a href=""> <i class="fa fa-envelope" aria-hidden="true"></i>
								<span> demo@gmail.com </span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 footer-col">
					<div class="footer_detail">
						<a href="" class="footer-logo"> Feane </a>
						<p>Necessary, making this the first true generator on the
							Internet. It uses a dictionary of over 200 Latin words, combined
							with</p>
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
				<div class="col-md-4 footer-col">
					<h4>Opening Hours</h4>
					<p>Everyday</p>
					<p>10.00 Am -10.00 Pm</p>
				</div>
			</div>
			<div class="footer-info">
				<p>
					&copy; <span id="displayYear"></span> All Rights Reserved By <a
						href="https://html.design/">Free Html Templates</a><br> <br>
					&copy; <span id="displayYear"></span> Distributed By <a
						href="https://themewagon.com/" target="_blank">ThemeWagon</a>
				</p>
			</div>
		</div>

	</footer>
	<!-- footer section -->


	<!-- jQery -->
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
		
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

</body>
<div class="modal" id="modal"  role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="width:850px;">
		<div class="modal-content" >
			<%@ include file="mainCal.jsp" %>
			<form>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="submit" class="btn btn-primary" id="btn_save">확인</button>
			</div>
			</form>
		</div>
	</div>
</div>
</html>