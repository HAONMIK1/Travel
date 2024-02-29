<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
#left-container {
  width: 50%;
  height: 100vh;
  float: left;
  overflow: auto; /* 세로 스크롤이 필요한 경우 스크롤 표시 */
}
#right-container {
  width: 50%;
  height: 100vh;
  float: left;
}
</style>

<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


 <head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Gp Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="<%=request.getContextPath()%>/resources/assets/img/logo.png" rel="icon">
  <link href="<%=request.getContextPath()%>/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
</head>

  <body onload="initTmap()">
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-lg-between">

      <h1 class="logo me-auto me-lg-0"><a href="mainScreen.m"><img alt="" src="<%=request.getContextPath()%>/resources/assets/img/logo.png"></a></h1>

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="mainScreen.m">Home</a></li>
          <!-- <li><a class="nav-link scrollto active" href="#hero">Home</a></li> -->
          <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li><a class="nav-link scrollto" href="#services">Services</a></li>
          <li><a class="nav-link scrollto " href="#portfolio">Portfolio</a></li>
          <li><a class="nav-link scrollto" href="#team">Team</a></li>
          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
      <a href="myPage.mb" class="get-started-btn scrollto">${myemail}</a>
    </div>
  </header><!-- End Header -->
    <section id="services" class="services">
    <div id="left-container">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>여정</h2>
          <p>나의여정</p>
          <!-- <button id="btn_select">경로보기</button> -->
          <div class="map_act_btn_wrap clear_box"></div>
			<div class="clear"></div>
          	<!-- <p id="result"></p> -->
        </div>
		<c:set var="day" value="1"/>
        <div class="column left-container" align="center" >
        <div><h3>
        <c:forEach var="i" begin="0" end="${fn:length(daylist)-1}" varStatus="a">
		    <a href="mjDetail.mj?jnum=${jnum}&jdate=${daylist[i].jdate}&daynum=${i+1 }">${daylist[i].jdate}</a>
		    <c:if test="${!a.last}">| </c:if>
		</c:forEach>


        <%-- <c:forEach var="day" items="${daylist}" varStatus="status">
        <a href="mjDetail.mj?jnum=${jnum}&jdate=${day.jdate}">${day.jdate}
        <c:if test="${not status.last }"> | </c:if></a>
        </c:forEach> --%>
        </h3></div>

        <div class="container aos-init aos-animate" data-aos="fade-up">
        <div class="row justify-content-center aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
          <div class="col-lg-10">
          	<div align="center">
			    <h5>${daynum }일차(${jdate})</h5>
          	</div>
            <div class="accordion accordion-flush" id="faqlist">
 		<c:set var="i" value="0"/>
       <c:forEach var="myj"  items="${myjlist}">
              <div class="accordion-item">
                <h3 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" >
                    <i class="bi bi-question-circle "></i>
                    <img alt="" src="<%=request.getContextPath()%>/resources/images/${myj.image}" width="150px">
               		<h4><a href="">${myj.name}</a></h4>
               		<br>
               		<h5>${myj.address}</h5>
                  </button>
                </h3>
<%--                 <div id="faq-content-${i}" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                  <div class="accordion-body">
                    Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
                  </div>
                </div> --%>
        <p id="result${i}"></p>
              </div><!-- # Faq item-->
            <c:set var="i" value="${i+1}"/>
	</c:forEach> 
            </div>
          </div>
        </div>

      </div>
		 
		<script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=키넣어야함"></script>
	 	<script type="text/javascript">
				
			var map;
			
			var marker_s, marekr_e, waypoint;
			var resultMarkerArr = [];
			//경로그림정보
			var drawInfoArr = [];
			var resultInfoArr = [];
			
			var markerInfo;
			var chktraffic = [];
			var resultdrawArr = [];
			var resultMarkerArr = []
			var searchOption = "2";
			var trafficInfochk = "N";
			var headers = {};
			
			
				headers["appKey"] = "키넣어야함";
				<c:forEach var="i" begin="0" end="${fn:length(myjXpos)-1}">
				$.ajax({
					type: "POST",
					headers: headers,
					url: "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result&appKey=키넣어야함",
					async: false,
					data: {
						"startX": "${myjYpos.get(i)}",
						"startY": "${myjXpos.get(i)}",
						"endX": "${myjYpos.get(i+1)}",
						"endY": "${myjXpos.get(i+1)}",
						"reqCoordType": "WGS84GEO",
						"resCoordType": "EPSG3857",
						"searchOption": searchOption,
						"trafficInfo": trafficInfochk,
					},
					success: function (response) {
						var resultData = response.features;
						var tDistance = "거리 : " + (resultData[0].properties.totalDistance / 1000).toFixed(1) + "km ";
						var tTime = " 시간 : " + (resultData[0].properties.totalTime / 60).toFixed(0) + "분";
						$("#result${i}").text(tDistance + tTime);
						// You can also access other information such as route points, etc., if needed.
						// var routePoints = resultData[0].geometry.coordinates;
					},
					error: function (request, status, error) {
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
			</c:forEach> 
			 
			function initTmap(){
				resultMarkerArr = [];
				
			 	// 1. 지도 띄우기
				map = new Tmapv2.Map("map_div", {
					center: new Tmapv2.LatLng(33.450701, 126.570667),
					width : "100%",
					height : "100%",
					zoom : 10,
					zoomControl : true,
					scrollwheel : true
					
				});
				/* 
				// 2. 시작, 도착 심볼찍기
				// 시작
				marker_s = new Tmapv2.Marker({
					position : new Tmapv2.LatLng(${myjXpos.get(0)}, ${myjYpos.get(0)}),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
					iconSize : new Tmapv2.Size(24, 38),
					map:map
				});
				resultMarkerArr.push(marker_s);
				// 도착
				marker_e = new Tmapv2.Marker({
					position : new Tmapv2.LatLng(${lastXpos}, ${lastYpos}),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
					iconSize : new Tmapv2.Size(24, 38),
					map:map
				});
				resultMarkerArr.push(marker_e);
				
				    <c:forEach var="i" begin="1" end="${fn:length(myjXpos)-1}">
				    marker = new Tmapv2.Marker({
						position : new Tmapv2.LatLng(${myjXpos.get(i)}, ${myjYpos.get(i)}),
						icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_${i+1}.png",
						iconSize : new Tmapv2.Size(24, 38),
						map:map
					});
					resultMarkerArr.push(marker);
					</c:forEach> 
				
					// 4. 경로탐색 API 사용요청
				var routeLayer; 
			
					var searchOption = $("#selectLevel").val();
					
					var headers = {}; 
					headers["appKey"]="키넣어야함";
					headers["Content-Type"]="application/json";
					
					var param = JSON.stringify({
						"startName" : "출발지",
						"startX" : "${myjYpos.get(0)}",
						"startY" : "${myjXpos.get(0)}",
						"startTime" : "202312240624",
						"endName" : "도착지",
						"endX" : "${lastYpos}",
						"endY" : "${lastXpos}",
						"viaPoints" : 
							[
							 <c:forEach var="i" begin="1" end="${fn:length(myjXpos)-2}">
							 {
								 "viaPointId" : "test01",
								 "viaPointName" : "name01",
								 "viaX" : "${myjYpos.get(i)}" ,
								 "viaY" : "${myjXpos.get(i)}" 
							 } <c:if test="${i ne fn:length(myjXpos)-1}">,</c:if>
							 </c:forEach> 
					
							],
						"reqCoordType" : "WGS84GEO",
						"resCoordType" : "EPSG3857",
						"searchOption": searchOption
					});
					
					
					$.ajax({
							method:"POST",
							url:"https://apis.openapi.sk.com/tmap/routes/routeSequential30?version=1&format=json",//
							headers : headers,
							async:false,
							data:param,
							success:function(response){
			
								var resultData = response.properties;
								var resultFeatures = response.features;
								
								// 결과 출력
								var tDistance = "총 거리 : " + (resultData.totalDistance/1000).toFixed(1) + "km,  ";
								var tTime = "총 시간 : " + (resultData.totalTime/60).toFixed(0) + "분  ";
								
								$("#result").text(tDistance+tTime);
								
								//기존  라인 초기화
								
								if(resultInfoArr.length>0){
									for(var i in resultInfoArr){
										resultInfoArr[i].setMap(null);
									}
									resultInfoArr=[];
								}
								
								for(var i in resultFeatures) {
									var geometry = resultFeatures[i].geometry;
									var properties = resultFeatures[i].properties;
									var polyline_;
									
									drawInfoArr = [];
									
									if(geometry.type == "LineString") {
										for(var j in geometry.coordinates){
											// 경로들의 결과값(구간)들을 포인트 객체로 변환 
											var latlng = new Tmapv2.Point(geometry.coordinates[j][0], geometry.coordinates[j][1]);
											// 포인트 객체를 받아 좌표값으로 변환
											var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
											// 포인트객체의 정보로 좌표값 변환 객체로 저장
											var convertChange = new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng);
											
											drawInfoArr.push(convertChange);
										}
			
										polyline_ = new Tmapv2.Polyline({
											path : drawInfoArr,
											strokeColor : "#FF0000",
											strokeWeight: 6,
											map : map
										});
										resultInfoArr.push(polyline_);
										
									}else{
										var markerImg = "";
										var size = "";			//아이콘 크기 설정합니다.
										
										if(properties.pointType == "S"){	//출발지 마커
											markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";	
											size = new Tmapv2.Size(24, 38);
										}else if(properties.pointType == "E"){	//도착지 마커
											markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
											size = new Tmapv2.Size(24, 38);
										}else{	//각 포인트 마커
											markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
											size = new Tmapv2.Size(8, 8);
										}
										
										// 경로들의 결과값들을 포인트 객체로 변환 
										var latlon = new Tmapv2.Point(geometry.coordinates[0], geometry.coordinates[1]);
										// 포인트 객체를 받아 좌표값으로 다시 변환
										var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlon);
									  	
									  	marker_p = new Tmapv2.Marker({
									  		position: new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng),
									  		icon : markerImg,
									  		iconSize : size,
									  		map:map
									  	});
									  	
									  	resultMarkerArr.push(marker_p);
									}
								}
							},
							error:function(request,status,error){
								console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							} 
						});*/
			}
			
			function addComma(num) {
				  var regexp = /\B(?=(\d{3})+(?!\d))/g;
				   return num.toString().replace(regexp, ',');
			}
		</script> 
<!-- <script type="text/javascript">
	var map;
	var markerInfo;
	// 출발지, 도착지 마커
	var marker_s, marker_e, marker_p;
	// 경로그림정보
	var drawInfoArr = [];
	var drawInfoArr2 = [];
	var chktraffic = [];
	var resultdrawArr = [];
	var resultMarkerArr = [];
	function initTmap() {
		// 1. 지도 띄우기
		map = new Tmapv2.Map("map_div", {
			center: new Tmapv2.LatLng(33.450701, 126.570667),
			width: "100%",
			height: "100%",
			zoom: 11,
			zoomControl: true,
			scrollwheel: true
		});
	/* 	// 3. 경로탐색 API 사용요청
		$("#btn_select").click(function () {
			// 기존 맵에 있던 정보들 초기화
			resettingMap(); */
			var searchOption = "2";
			var trafficInfochk = "N";
			var headers = {};
			headers["appKey"] = "키넣어야함";
			<c:forEach var="i" begin="0" end="${fn:length(myjXpos)-2}">
				$.ajax({
					type: "POST",
					headers: headers,
					url: "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result&appKey=키넣어야함",
					async: false,
					data: {
						"startX": "${myjYpos.get(i)}",
						"startY": "${myjXpos.get(i)}",
						"endX": "${myjYpos.get(i+1)}",
						"endY": "${myjXpos.get(i+1)}",
						"reqCoordType": "WGS84GEO",
						"resCoordType": "EPSG3857",
						"searchOption": searchOption,
						"trafficInfo": trafficInfochk,
					},
					success: function (response) {
						var resultData = response.features;
						var tDistance = "거리 : " + (resultData[0].properties.totalDistance / 1000).toFixed(1) + "km ";
						var tTime = " 시간 : " + (resultData[0].properties.totalTime / 60).toFixed(0) + "분";
						$("#result${i}").text(tDistance + tTime);
						// You can also access other information such as route points, etc., if needed.
						// var routePoints = resultData[0].geometry.coordinates;
					},
					error: function (request, status, error) {
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
			</c:forEach>
		/* }); */
	}
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
</script> -->
       </div>
        </div>
        </div> 
	 <div id="right-container">
		<div id="map_wrap" class="map_wrap">
			<div id="map_div"></div>
		</div>
	 </div>
    </section><!-- End Services Section -->
   <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>Gp<span>.</span></h3>
              <p>
                A108 Adam Street <br>
                NY 535022, USA<br><br>
                <strong>Phone:</strong> +1 5589 55488 55<br>
                <strong>Email:</strong> info@example.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>
          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Gp</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->
  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <!-- Vendor JS Files -->
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/php-email-form/validate.js"></script>
  <!-- Template Main JS File -->
  <script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
</body>
  