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
  <style type="text/css">
  #nav {
		-moz-transition: background-color 0.2s ease, border-top-left-radius 0.2s ease, border-top-right-radius 0.2s ease, padding 0.2s ease;
		-webkit-transition: background-color 0.2s ease, border-top-left-radius 0.2s ease, border-top-right-radius 0.2s ease, padding 0.2s ease;
		-ms-transition: background-color 0.2s ease, border-top-left-radius 0.2s ease, border-top-right-radius 0.2s ease, padding 0.2s ease;
		transition: background-color 0.2s ease, border-top-left-radius 0.2s ease, border-top-right-radius 0.2s ease, padding 0.2s ease;
		background-color: #ffffff;
		color: #636363;
		
		padding: 1em;
		background-color: #f7f7f7;
		border-top-left-radius: 0.25em;
		border-top-right-radius: 0.25em;
		cursor: default;
		text-align: center;
	}

		#nav  #nav select, #nav  {
			color: #636363;
		}

		#nav a:hover {
			color: #636363;
		}

		#nav strong, #nav b {
			color: #636363;
		}

		#nav h1, #nav h2, #nav h3, #nav h4, #nav h5, #nav h6 {
			color: #636363;
		}

		#nav blockquote {
			border-left-color: #dddddd;
		}

		#nav code {
			background: rgba(222, 222, 222, 0.25);
			border-color: #dddddd;
		}

		#nav hr {
			border-bottom-color: #dddddd;
		}

		#nav + #main {
			padding-top: 4.25em;
		}

		#nav ul {
			margin: 0;
			padding: 0;
			list-style: none;
		}

			#nav ul li {
				-moz-transition: margin 0.2s ease;
				-webkit-transition: margin 0.2s ease;
				-ms-transition: margin 0.2s ease;
				transition: margin 0.2s ease;
				display: inline-block;
				margin: 0 0.35em;
				padding-bottom: 10px;
				vertical-align: middle;
			}

				#nav ul li a {
					-moz-transition: font-size 0.2s ease;
					-webkit-transition: font-size 0.2s ease;
					-ms-transition: font-size 0.2s ease;
					transition: font-size 0.2s ease;
					display: inline-block;
					height: 2.25em;
					line-height: 2.25em;
					padding: 0 1.25em;
					border: 0;
					border-radius: 8px;
					box-shadow: inset 0 0 0 1px transparent;
				}

					#nav ul li a.active {
						background-color: #ffffff;
						box-shadow: none;
					}

		#nav.alt {
			position: fixed;
			top: 0;
			padding: 0.5em 1em;
			background-color: rgba(247, 247, 247, 0.95);
			border-top-left-radius: 0;
			border-top-right-radius: 0;
			z-index: 10000;
		}

			#nav.alt ul li {
				margin: 0 0.175em;
			}

				#nav.alt ul li a {
					font-size: 0.9em;
				}

		@media screen and (max-: 736px) {

			#nav {
				display: none;
			}

				#nav + #main {
					padding-top: 0;
				}

		}
		
		.img {
   width: 200px;
   height: 200px;
   border-radius: 20%;
   box-shadow: 1px 1px 1px 1px gray;
}
  </style>
</head>

  <body onload="initTmap()">
    <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-lg-between">

      <h1 class="logo me-auto me-lg-0"><a href="mainScreen.m"><img alt="" src="<%=request.getContextPath()%>/resources/assets/img/logo.png"></a></h1>


	       <!-- 민희가 추가한 로그인 로그아웃입니다. -->
      <c:if test="${empty myname}">
         <a href="login.mb" class="get-started-btn scrollto">로그인</a>         
      </c:if>
      
      <c:if test="${not empty myname}">
         <a href="myPage.mb" class="get-started-btn scrollto">${myname}님 환영합니다</a>
	
         <a href="logout.mb" class="get-started-btn scrollto">로그아웃</a>         
      </c:if>

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
        <div>
            <c:set var="count" value="1"/>
               <nav id="nav" style="width: 100%;  padding-bottom: 5px;">
                  <ul>
            <c:forEach var="day" items="${daylist}">
                     <li><a href="mainJourney.m?myjNum=${myjNum}&jdate=${day.jdate}" class="active">Day${count}  ${day.jdate}</a></li>
            <c:set var="count" value="${count+1}"/>
            </c:forEach>
                  </ul>
               </nav>
        </div>
        
        <div class="container aos-init aos-animate" data-aos="fade-up">
        <div class="row justify-content-center aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
          <div class="col-lg-10">
            <div class="accordion accordion-flush" id="faqlist">
 		
 	<div>
               <div id="List">
       <c:set var="i" value="0"/>
               <c:forEach var="bd"  items="${list}" varStatus="bdStatus">
               <div align="left">
               <div style="display: inline-block; margin-left: 100px;">
                    <img class="img" src="<%=request.getContextPath()%>/resources/images/${bd.image}" width="300px" height="300px">
               </div>
                     <h5 style="display: inline-block; margin-left: 100px; margin-top: 30px;">${bd.name}
                     <br><br><h7>${bd.address}</h7>
                     </h5>
               </div>
               <c:if test="${not bdStatus.last}">
               <div style="padding-top: 50px; padding-bottom: 50px; margin-left: 180px;">
               <img src="<%=request.getContextPath()%>/resources/images/a.png" width="40px" height="50px">
               <span style="padding-left: 200px;"><p id="result${i}" style="display: inline-block;"></p>
                  <c:set var="i" value="${i+1}"/></span></div>
               </c:if>
                     </c:forEach> 
               </div>
    </div>
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
						});
			}
			
			function addComma(num) {
				  var regexp = /\B(?=(\d{3})+(?!\d))/g;
				   return num.toString().replace(regexp, ',');
			}
		</script> 
       </div>
        </div>
        </div> 
	 <div id="right-container">
		<div id="map_wrap" class="map_wrap">
			<div id="map_div"></div>
		</div>
	 </div>
    </section><!-- End Services Section -->
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
  