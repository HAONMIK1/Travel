<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false"%>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
   <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript">
   function insert(cate, num, date) {
      var selectedDate = document.getElementById("jdate").value;
       alert(1);
       alert(selectedDate);
       location.href = "myjourneyInsert.mj?cate="+cate+"&num="+num+"&date="+date+"&jdate="+selectedDate;
   }
   
   function btnClick() {
      alert(1);
   } 
    
</script> -->
<script type="text/javascript">
    function insert(cate, num, date) {
        var selectedDate = document.getElementById("jdate").value;
        //alert(selectedDate);
          location.href = "myjourneyInsert.mj?cate=" + cate + "&num=" + num + "&date=" + date + "&jdate=" + selectedDate;
    }
    
    function save() {
        var check = confirm("선택한 여정을 저장하시겠습니까?");
        if(check){
           location.href="saveMyjourney.mj?date=${param.date}";
        }
        }
    function selDay(date,sTravel,day) {
        var selectedDate = document.getElementById("jdate").value;
        location.href="myjourneyList.mj?day="+day+"&date="+date+"&jdate="+selectedDate+"&sTravel="+sTravel;
    }
    
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
  height: 100vh;
  background-color:#f0f0f0;
  float: left;
}
.search{
   width:250px ; 
   height: 40px;
   font-size: 20px;
}.search{
   width:100px ; 
   height: 40px;
   font-size: 20px;
}
.page{
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
        <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-lg-between">

      <h1 class="logo me-auto me-lg-0"><a href="mainScreen.m"><img alt="" src="<%=request.getContextPath()%>/resources/assets/img/logo.png"></a></h1>

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero"></a></li>
          <li><a class="nav-link scrollto" href="#about"></a></li>
          <li><a class="nav-link scrollto" href="#services"></a></li>
          <li><a class="nav-link scrollto " href="#portfolio"></a></li>
          <li><a class="nav-link scrollto" href="#team"></a></li>
          
          <li><a class="nav-link scrollto" href="#contact"></a></li>
          
      </nav><!-- .navbar -->

          <!-- 민희가 추가한 로그인 로그아웃입니다. -->
      <c:if test="${empty myname}">
         <a href="login.mb" class="get-started-btn scrollto">로그인</a>         
      </c:if>
      
      <c:if test="${not empty myname}">
         <a href="myPage.mb" class="get-started-btn scrollto">${myname}님 환영합니다</a>
   
         <a href="logout.mb" class="get-started-btn scrollto">로그아웃</a>         
      </c:if>
     <!-- <!—민희가 주석처리 <a href="login.mb" class="get-started-btn scrollto">로그인</a>  —> -->

    </div>
  </header><!-- <!— End Header —> -->

   </div>
   
   <section class="food_section layout_padding-bottom" id="left-container">
    <select name="jdate" id="jdate" onchange="selDay('${date}', '${sessionScope.sTravel}',this.options[this.selectedIndex].text)">
             <c:forEach var="i" begin="0" end="${fn:length(days)-1}">
                 <option value="${days[i]}" <c:if test="${jdate eq days[i]}">selected</c:if>>
                     Day${i+1}
                 </option>
             </c:forEach>
            </select>
   
      <div class="container">
         <ul class="filters_menu">
            <li class="active" data-filter="*">All</li>
            <li data-filter=".buger" >호텔</li>
            <li data-filter=".pasta">음식점</li>
            <li data-filter=".fries" >카페</li>
            <li data-filter=".pizza" >관광지</li>
         </ul>
         <%-- <form  action="mainTravel.m">
         <input type="hidden" name="date" value="${date}">
         <input type="hidden" name="sTravel" value="manual">
         <input type="hidden" name="whatColumn" value="name">
         <input class="search" type="text" name="keyword" placeholder="이름">
         <button class="search2" type="submit">검색</button>
         </form> --%>
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
                                       <%-- <a href="cafeDetail.cf?cnum=${list.cnum}"> --%>
                                    <img src="<%=request.getContextPath()%>/resources/images/${list.image}" alt="이미지">
                                 </a>
                           </div>
                           <div class="detail-box">
                              <h5>${list.name}</h5>
                              <div class="options">
                                 <h6>${list.address}</h6>
                                 <input class="btn btn-primary" type="button" 
                                 value="추가" onclick="insert('cafe',${list.cnum },'${date }')"><br>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
<!-- 음식점 리스트 -->
               </c:forEach>
               <c:forEach var="list" items="${restaurantList}">
                  <div class="col-sm-6 col-lg-4 all pasta">
                     <div class="box">
                        <div>
                           <div class="img-box">
                                       <a href="#" class="showModalBtn2" data-rnum="${list.rnum}">
                                       <%-- <a href="restDetail.re?rnum=${list.rnum}"> --%>
                                    <img src="<%=request.getContextPath()%>/resources/images/${list.image}" alt="이미지">
                                 </a>
                           </div>
                           <div class="detail-box">
                              <h5>
                              ${list.name}
                              </h5>
                              <div class="options">
                                 <h6>${list.address}</h6>
                                 <input class="btn btn-primary" type="button" 
                                 value="추가" onclick="insert('restaurant',${list.rnum },'${date }')"><br>
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
                                       <%-- <a href="spotDetail.sp?snum=${list.snum}"> --%>
                                    <img src="<%=request.getContextPath()%>/resources/images/${list.image}" alt="이미지">
                                 </a>
                           </div>
                           <div class="detail-box">
                              <h5>${list.name}</h5>
                              <div class="options">
                                 <h6>${list.address}</h6>
                                 <input class="btn btn-primary" type="button" 
                                 value="추가" onclick="insert('spot',${list.snum },'${date }')"><br>
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
                                       <%-- <a href="hotelDetail.ht?hnum=${list.hnum}"> --%>
                                 <img src="<%=request.getContextPath()%>/resources/images/${list.image}" alt="이미지">
                                 </a>
                           </div>
                           <div class="detail-box">
                              <h5>${list.name}</h5>
                              <div class="options">
                                 <h6>${list.address}</h6>
                                 <input class="btn btn-primary" type="button" 
                                 value="추가" onclick="insert('hotel',${list.hnum },'${date }')"><br>
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
      </div>
      <!-- 카테고리 페이지틀  -->
   </section>
   
   <!-- 카테고리 페이지틀  -->
   <section id="right-container">
      <div>
         <table align="center" class="table">
            <thead>
            <tr align="center">
               <td colspan="5">Day${day }(${jdate })</td>
            </tr>
            <c:choose>
               <c:when test="${empty mlists }">
                  <tr align="center">
                     <td align="center" colspan="8">여행 계획이 없습니다</td>
                  </tr>
               </c:when>
               <c:otherwise>
                  <tr align="center">
                     <th>번호</th>
                     <th>카테고리</th>
                     <th>이름</th>
                     <th>주소</th>
                     <th>삭제</th>
                  </tr>
               </thead>
                  <c:set var="number" value="1" />
                  <c:forEach var="mj" items="${mlists }">
               <tbody>
                  <tr align="center">
                     <td>${number } <c:set var="number" value="${number+1 }" />
                     </td>
                     <td>${mj.cate }</td>
                     <td>
                        ${mj.name }
                     </td>
                     <td>
                        ${mj.address }
                     </td>
                     <td><a class="btn btn-sm btn-danger" 
                        href="myJourneyDelete.mj?turn=${mj.turn }&day=${param.day }&date=${param.date }&jdate=${param.jdate }">삭제</a>
                     </td>
                  </tr>
               </tbody>
                  </c:forEach>
               <tfoot>
                  <tr align="center">
                     <td colspan="5">
                        <input class="btn btn-lg btn-success" type="button" value="여정 생성" onclick="save()">
                     </td>
                  </tr>
               </tfoot>   
               </c:otherwise>
            </c:choose>
         </table>
      </div>
      
      <div id="map" style="width: 100%; height: 100%;"></div>
      <script type="text/javascript"
         src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6406498ef47269fb1b4e04089576fe5"></script>
      <!-- <script>
         var container = document.getElementById('map');
         var options = {
            center : new kakao.maps.LatLng(33.450701, 126.570667),
            level : 3
         };

         var map = new kakao.maps.Map(container, options);
      </script> -->

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
   
   <script type="text/javascript">
    var markers = [];

    $(document).ready(function () {
        var mapContainer = document.getElementById('map');
        var mapOption = {
            center: new kakao.maps.LatLng(33.361692, 126.529165),
            level: 11
        };
        var map = new kakao.maps.Map(mapContainer, mapOption);

        <c:set var="number" value="1" />
        // Loop through the mlists and add markers for each coordinate
        <c:forEach var="mj" items="${mlists}">
            var xpos = ${mj.xpos};
            var ypos = ${mj.ypos};

            // 위치 배열에 위치 추가합니다.
            var positions = [
                {
                    title: '${mj.name}',
                    latlng: new kakao.maps.LatLng(xpos, ypos)
                }
            ];

            // 마커 이미지의 이미지 주소입니다
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
            //var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png"; 

            for (var i = 0; i < positions.length; i++) {
                // 마커 이미지의 이미지 크기 입니다
                var imageSize = new kakao.maps.Size(24, 35);

                // 마커 이미지를 생성합니다    
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: positions[i].latlng,
                    title: positions[i].title,
                    image: markerImage
                });

                // 마커 배열에 마커를 추가합니다
                markers.push(marker);
                
                var iwContent = '<div style="padding:5px;">${number}.${mj.name} <br><a href="https://map.kakao.com/link/map/${mj.name},${mj.xpos},${mj.ypos}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${mj.name},${mj.xpos},${mj.ypos}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                iwPosition = new kakao.maps.LatLng(${mj.xpos}, ${mj.ypos}); //인포윈도우 표시 위치입니다

               // 인포윈도우를 생성합니다
               var infowindow = new kakao.maps.InfoWindow({
                   position : iwPosition, 
                   content : iwContent 
               });
                 
               // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
               infowindow.open(map, marker);
               <c:set var="number" value="${number+1}" />
            }
        </c:forEach>

        // Additional code for handling checkbox changes...
        
        
        
    });
</script>

<script type="text/javascript">
$(function() {
    $(".showModalBtn").click(function() {
        var cnum = $(this).data("cnum");

        window.open("cafeDetail.cf?cnum=" + cnum, "카페", "width=500, height=600");

    });
    $(function() {
        $(".showModalBtn2").click(function() {
            var rnum = $(this).data("rnum");

            window.open("restDetail.re?rnum=" + rnum, "레스토랑", "width=500, height=600");

        });

        $(".showModalBtn3").click(function() {
            var snum = $(this).data("snum");

            window.open("spotDetail.sp?snum=" + snum, "관광지", "width=500, height=600");

        });
        $(".showModalBtn4").click(function() {
            var hnum = $(this).data("hnum");

            window.open("hotelDetail.ht?hnum=" + hnum, "호텔", "width=800, height=600");

        });
    });
});
</script>
   
</body>
</html>