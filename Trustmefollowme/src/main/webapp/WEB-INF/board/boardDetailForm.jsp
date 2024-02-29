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

#chat {
   border: none;
   border-bottom: 1px solid;
}

#sub, #sub2 {
   border: none;
   height: 25px;
}

.cut {
   height: 500px;
   overflow: auto;
   white-space: normal;
}

.cut::-webkit-scrollbar {
   width: 10px;
}

.cut::-webkit-scrollbar-thumb {
   background-color: black;
}

.cut::-webkit-scrollbar-track {
   background-color: #D5D5D5;
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

table {
   white-space: nowrap;
   border-collapse: separate;
}

.img {
   width: 200px;
   height: 200px;
   border-radius: 20%;
   box-shadow: 1px 1px 1px 1px gray;
}

.updel {
   text-align: right;
   padding-right: 30px;
}

.total {
   display: inline-block;
   border-bottom: 1px solid #BDBDBD;
   padding-bottom: 10px;
}


.heart {
   text-align: right;
   margin-right: 20%;
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
   padding: 10px 18px 10px 10px;
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
#List{
  width: 55%;
  overflow: auto;
  margin-top: 80px;
  height : 1200px;
  display: inline-block;
  overflow: auto;
  
}
#right-container {
  width: 43%;
  margin-top: 80px;
  height : 1200px;
  display: inline-block;
}
#chatting{
   padding-top: 70px;
   margin-bottom: 80px;
   margin-top: 70px;
   border-top: 1px solid #EAEAEA;
}
.top{
 display: inline-block;
 width: 100%;
 padding-bottom: 20px;
 padding-top: 20px;
 margin-bottom: 15px;
}
#detailtext{
	color: black;
}
#detailtext:hover{
	color: orange;
	text-decoration: none;
}
</style>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/main.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=키넣어야함"></script>
<script type="text/javascript">
$(function(){
   var likes = ${likeInfo.likes} /* 좋아요 기능 시작 */
   var bnum = '${likeInfo.b_num}';
   var mnum = '${likeInfo.m_num}';
   var email = '${bb.mEmail}';
   
   
   if (likes > 0) {   
       $("#heart").attr("src", "<%=request.getContextPath()%>/resources/images/heart2.png");
   } else {
       $("#heart").attr("src", "<%=request.getContextPath()%>/resources/images/heart.png");
   }

    $("#heart").click(function(){   /* 하트 클릭했을 때 */
       if(mnum == 'customer'){
             alert("로그인이 필요합니다");
             return false;
       }
        $.ajax({            /* ajax로 값(회원,게시판 번호) 전송 */
            url: "likeCheck.bd",
            data: {
                m_num: mnum,
                b_num: bnum,
                mEmail: email
            },
            success: function(data){
                if (data == "YES") {
                    $("#heart").attr("src", "<%=request.getContextPath()%>/resources/images/heart2.png");
                    location.reload();
                } else {
                    $("#heart").attr("src", "<%=request.getContextPath()%>/resources/images/heart.png");
                    location.reload();
                                 }
                              }
                           });
                  }); /* 좋아요 기능 종료 */
                  
                  $(".reply").click(function() {      /* 댓글 클릭했을 때 시작 */
                     if(mnum == 'customer'){
                         alert("로그인이 필요합니다");
                         return false;
                   }
                      var ref = $(this).data("ref");
                      var reStep = $(this).data("re_step");
                      var reLevel = $(this).data("re_level");
                      var bNum = $(this).data("b_num");

                      $(".reply2").each(function() {
                          if (
                              $(this).data("ref") == ref &&
                              $(this).data("re_step") == reStep &&
                              $(this).data("re_level") == reLevel &&
                              $(this).data("b_num") == bNum
                          ) {
                              if ($(this).is(":visible")) {
                                  $(this).hide();
                              } else {
                                  $(this).show();
                              }
                          } else {
                              $(this).hide();
                          }
                      });
                  });      /* 댓글 클릭했을 때 종료 */
                  
   
   var mEmail = "${param.mEmail}";
   var jnum = "${param.jnum}";
   var minDate = "${param.minDate}";
      
    $(".replyDelete").click(function () {      /* 댓글 삭제 시작 */
        var ref = $(this).data("ref");
        var reStep = $(this).data("re_step");
        var reLevel = $(this).data("re_level");
        var bNum = $(this).data("b_num");
        $.ajax({
            url: "replyDelete.bd",
            data: {
                ref2: ref,
                reStep2: reStep,
                reLevel2: reLevel,
                bNum2: bNum
            },
            success: function (data) {
                if (data == "YES") {
                    alert("글이 삭제되었습니다.");
                    location.href = "boardDetail.bd?num=" + bNum + "&mEmail=" + mEmail + "&jnum=" + jnum + 
                          "&minDate=" + minDate;
                } else {
                    alert("삭제 실패했습니다.");
                    location.href = "boardDetail.bd?num=" + bNum + "&mEmail=" + mEmail + "&jnum=" + jnum + 
                  "&minDate=" + minDate;
                }
            }
        });
    });                                 /* 댓글 삭제 종료 */
    
    $(".replyUpdate").click(function() {               /* 댓글 클릭했을 때 시작 */ 
        var ref = $(this).data("ref");
        var reStep = $(this).data("re_step");
        var reLevel = $(this).data("re_level");
        var bNum = $(this).data("b_num");

        $(".replyUpdate2").each(function() {
            if (
                $(this).data("ref") == ref &&
                $(this).data("re_step") == reStep &&
                $(this).data("re_level") == reLevel &&
                $(this).data("b_num") == bNum
            )  {
               if ($(this).is(":visible")) {
                   $(this).hide();
               } else {
                   $(this).show();
               }
           } else {
               $(this).hide();
           }
        });
      
    });         
        var content = document.getElementsByName("content");
        $("#sub").click(function(){
            if($(content).val() == ""){
            alert("댓글을 입력해주세요.");               
            return false;
            }
        });


    $(".reply").click(function(){
       $(".replyUpdate2").css("display", "none");
    });
    $(".replyUpdate").click(function(){
       $(".reply2").css("display", "none");
    });
    $("#chat").click(function(){
       $(".reply2").css("display", "none"),
       $(".replyUpdate2").css("display", "none");
    });
    
   $("#sub2").click(function(){
      alert("로그인 후 작성가능합니다.");
      location.href="login.mb";
   });
   
   $(document.getElementsByName("noContent")).click(function(){
      alert("로그인 후 작성가능합니다.");
      location.href="login.mb";
   });
   
   /* 지도 */
   /* 거리 계산 */
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

         },
         error: function (request, status, error) {
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
         }
      });
   </c:forEach>
});
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
            url:"https://apis.openapi.sk.com/tmap/routes/routeSequential30?version=1&format=json",
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
                     var size = "";         //아이콘 크기 설정합니다.
                     
                     if(properties.pointType == "S"){   //출발지 마커
                        markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";   
                        size = new Tmapv2.Size(24, 38);
                     }else if(properties.pointType == "E"){   //도착지 마커
                        markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
                        size = new Tmapv2.Size(24, 38);
                     }else{   //각 포인트 마커
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

  <link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
 <body onload="initTmap()">


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

<div class="top" align="center">
      <img class="img" src="<%=request.getContextPath()%>/resources/images/${bb.image}" style="height: 270px; width: 270px;">
   <div style="display: inline-block; vertical-align: top; margin-left: 20px;">
      <h2 style="color: black;">
         ${bb.writer}님의 여행일지
      </h2>
          <h2 style="padding-top: 30px;">${bb.title}</h2>
         <h3>
         ${dateCount}일 | ${minDate}일 ~ ${maxDate}일
         </h3>
         <hr style="margin: 20px;" color="#EAEAEA">
      <div id="content" style="width: 600px; height: 80px;">
         ${bb.content}</div>
         <c:if test="${bb.writer eq sessionScope.myname || sessionScope.myname eq '어드민'}">
         <div align="right" style="padding-top: 20px; padding-bottom: 20px;">
         <a id="detailtext" href="boardUpdate.bd?num=${bb.num}&jnum=${bb.jnum}">수정</a>&nbsp;&nbsp;
         <a id="detailtext" href="boardDelete.bd?num=${bb.num}&jnum=${bb.jnum}">삭제</a>
         </div>
         </c:if>
   </div>
</div>
<div class="heart">
   조회수 ${bb.readcount}&nbsp;&nbsp; 좋아요 ${likecount} 
   <img id="heart" width="20px" height="20px">
</div>
<br><br>
 
   <c:set var="count" value="1"/>
               <nav id="nav" style="width: 100%; position: sticky; top: 0px; padding-bottom: 5px; z-index: 10000;">
                  <ul>
            <c:forEach var="date" items="${fn:split(date,',')}">
                     <li><a href="boardDetail.bd?num=${param.num}&jnum=${param.jnum}&mEmail=${param.mEmail}&minDate=${date}" class="active">${count}Day</a></li>
            <c:set var="count" value="${count+1}"/>
            </c:forEach>
                  </ul>
               </nav>
   <div align="right" style="position: sticky; top: 110px; z-index: 10000">
   <a href="#" id="btn2">위로</a>
   <a href="#chatting" id="btn2">댓글</a>
   </div>
               <div>
               <div id="List">
       <c:set var="i" value="0"/>
               <c:forEach var="bd"  items="${list}" varStatus="bdStatus">
               <div align="left">
               <div style="display: inline-block; margin-left: 100px;">
                    <img class="img" src="<%=request.getContextPath()%>/resources/images/${bd.image}" width="300px" height="300px">
               </div>
                     <h4 style="display: inline-block; margin-left: 100px; margin-top: 30px;">${bd.name}<br><br>
                     ${bd.address}<br><br><br><br>
                     </h4>
               </div>
               <c:if test="${not bdStatus.last}">
               <div style="padding-top: 50px; padding-bottom: 50px; margin-left: 180px;">
               <img src="<%=request.getContextPath()%>/resources/images/a.png" width="40px" height="50px">
               <span style="padding-left: 200px;"><p id="result${i}" style="display: inline-block;"></p>
                  <c:set var="i" value="${i+1}"/></span></div>
               </c:if>
                     </c:forEach> 
               </div>
            
                <div id="right-container">
      <div id="map_wrap" class="map_wrap">
         <div id="map_div">
         </div>
      </div>
    </div>
    </div>
    </body>
   <center>
   <div id="chatting">
   <c:if test="${likeInfo.m_num eq 'customer'}">
         <textarea id="chat" rows="1" cols="38" name="noContent"
            placeholder="글 남기기" style="resize: none;" maxlength="500"></textarea>
         <input id="sub2" type="button" value="확인">
   </c:if>
   <c:if test="${likeInfo.m_num != 'customer'}">
      <form action="chatInsert.bd">
         <input type="hidden" name="b_num" value="${bb.num}">
         <input type="hidden" name="mEmail" value="${param.mEmail}">
         <input type="hidden" name="jnum" value="${param.jnum}">
         <input type="hidden" name="minDate" value="${param.minDate}">
         <input type="hidden" name="writer" value="${sessionScope.myname}">
         <textarea id="chat" rows="1" cols="38" name="content"
            placeholder="글 남기기" style="resize: none;" maxlength="500"></textarea>
         <input id="sub" type="submit" value="확인">
      </form>
   </c:if>
   <br><br>
<div class="cut" style="width: 50%;">
      <table>
      <c:if test="${empty lists}">
         <tr>
            <td>댓글이 없습니다.
         </tr>
      </c:if>
         <c:forEach var="chat" items="${lists}">
            <tr>
               <td>
                  <div class="total">                  <!-- 댓글 리스트 -->
                  <div style="display: inline-block;">
                     <c:if test="${chat.re_level > 0}">
                        <img
                           src="<%=request.getContextPath()%>/resources/images/blank.png"
                           width="${chat.re_level * 20}" height="30px;">
                        <img src="<%=request.getContextPath()%>/resources/images/re.png"
                           width="30px">
                     </c:if>
                  </div>
                     <div style="display: inline-block;">
                        ${chat.writer}
                        <div class="content" style="padding-top: 20px; padding-bottom: 10px;">${chat.content}
                           <div style="padding-bottom: 5px; padding-top: 8px;">
                           <fmt:parseDate var="date" value="${chat.reg_date}"
                           pattern="yyyy-MM-dd" />
                        <font color="gray"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></font>
                           </div>
                        </div>
                        
                        <a class="reply" data-ref="${chat.ref}"
                           data-re_step="${chat.re_step}" data-re_level="${chat.re_level}"
                           data-b_num=${chat.b_num }>답글 </a>
                     </div>
                     <c:if test="${sessionScope.myname eq chat.writer}">
                     <div class="updel">
                        <span class="replyDelete" data-ref="${chat.ref}"
                           data-re_step="${chat.re_step}" data-re_level="${chat.re_level}"
                           data-b_num=${chat.b_num }> 삭제 </span> &nbsp;&nbsp; 
                           <span class="replyUpdate" data-ref="${chat.ref}"
                           data-re_step="${chat.re_step}" data-re_level="${chat.re_level}"
                           data-b_num=${chat.b_num }> 수정 </span>
                     </div>
                     </c:if>
                  </div> 
                  <span class="reply2" style="display: none;"
                  data-ref="${chat.ref}" data-re_step="${chat.re_step}"
                  data-re_level="${chat.re_level}" data-b_num=${chat.b_num }>      <!-- 답글 쓰기 -->
                     <form action="replyInsert.bd">
                        <input type="hidden" name="b_num" value="${bb.num}"> 
                        <input type="hidden" name="writer" value="${sessionScope.myname}"> 
                        <input type="hidden" name="ref" value="${chat.ref}"> 
                        <input type="hidden" name="re_level" value="${chat.re_level}">
                        <input type="hidden" name="re_step" value="${chat.re_step}">
                        <input type="hidden" name="mEmail" value="${param.mEmail}">
                        <input type="hidden" name="jnum" value="${param.jnum}">
                        <input type="hidden" name="minDate" value="${param.minDate}">
                        <br>
                        <textarea id="chat" rows="1" cols="38" name="content"
                           placeholder="답글쓰기" style="resize: none;" maxlength="500"></textarea>
                        <input id="sub" type="submit" value="확인">
                     </form>
               </span> 
               <span class="replyUpdate2" style="display: none;"
                  data-ref="${chat.ref}" data-re_step="${chat.re_step}"
                  data-re_level="${chat.re_level}" data-b_num=${chat.b_num }>      <!-- 답글 수정 -->
                     <form action="replyUpdate.bd">
                        <input type="hidden" name="b_num" value="${bb.num}"> 
                        <input type="hidden" name="writer" value="${sessionScope.myname}"> 
                        <input type="hidden" name="ref" value="${chat.ref}"> 
                        <input type="hidden" name="re_level" value="${chat.re_level}">
                        <input type="hidden" name="re_step" value="${chat.re_step}">
                        <input type="hidden" name="mEmail" value="${param.mEmail}">
                        <input type="hidden" name="jnum" value="${param.jnum}">
                        <input type="hidden" name="minDate" value="${param.minDate}">
                        <br>
                        <textarea id="chat" rows="1" cols="38" name="content"
                           placeholder="수정하기" style="resize: none;" maxlength="500"></textarea>
                        <input id="sub" type="submit" value="수정">
                     </form>
               </span>
               </td>
            </tr>
         </c:forEach>
      </table>
   </div>
   </div>
   <div style="margin-bottom: 50px;">
   <a href="boardList.bd">목록으로</a>
   </div>
</center>
         
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/aos/aos.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/vendor/php-email-form/validate.js"></script>

  <!— Template Main JS File —>
  <script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
         