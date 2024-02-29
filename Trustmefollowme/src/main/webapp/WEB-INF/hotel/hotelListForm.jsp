<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../common/common.jsp"%>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FAT roomDetailPage</title>
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@400;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/global-header.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/global-footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/rooms-and-suites.css">
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/favicon.webp" type="image/x-icon">
</head>
<body>
    <header>
        <div class="header-container">
            <nav class="header-nav-bar">
                <div class="header-nav-logo">
					<a href="javascript:history.go(-1)">
						FAT LOGO
					</a>
				</div>
                  
                <div class="header-hamburger-icon">
                    <div class="header-hamburger-line-1"></div>
                    <div class="header-hamburger-line-2"></div>
                    <div class="header-hamburger-line-3"></div>
                </div>
            </nav>
	</div>
    </header>
    	
    <main>
        <div class="container">

            <!-- Top Text -->
            <div class="page-header-container">
                <h2 class="page-header">여정의 시작은 호텔!</h2>
                <hr />
                <p class="page-sub-header" style="font-size: 15px;">
                    나.믿.따에서 여러 호텔을 한눈에 담아보세요!
                </p>
            <br>
		
            <!-- Rooms -->
            <section class="rooms-section" >
                <div class="row center-lg">
            <c:forEach var="hb" items="${list}">
                    <div class="rooms col col-6" >
                    	<a href="hotelDetail.ht?hnum=${hb.hnum}&pageNumber=${paging.pageNumber}">
                        <img src="<%=request.getContextPath()%>/resources/images/${hb.image}"
                            alt="" class="rooms-img" width="400" height="350">
                            </a>
                        <h3 class="room-title">${hb.name }</h3>
                        <div>
                            <div class="details-container">
                                <p class="list-text">${hb.address }</p>
                            </div>
                            <br>
                            <br>
                            <div class="details-container">
                                <img src="<%=request.getContextPath()%>/resources/images/check-square.svg" alt="tick" class="list-icon">
                                <p class="list-text">${hb.facility}</p>
                            </div>
                        </div>
                        <p class="amount-text">￦${hb.hprice} ~</p>
                       <%--  <div class="buttons-container">
                            <a href="hotelUpdate.ht?hnum=${hb.hnum}&pageNumber=${pageInfo.pageNumber}" class="btn btn-ghost">수정</a>
                            <a href="hotelDelete.ht?hnum=${hb.hnum}&pageNumber=${pageInfo.pageNumber}" class="btn btn-fill">삭제</a>
                            <br>
                        </div> --%>
                    <br>
                    </div>
                    <br>
                    </c:forEach>
                    </div>
            </section>
 
        </div>
        </div>
        
    </main>

    <footer class="footer">
		<div class="footer-container">
			<nav class="footer-nav">
				<div class="footer-description">
					<h3 class="footer-description-title">Star Hotels</h3>
					<p>Hospitality and Comfort are our watchwords</p>
				</div>
				<div class="footer-contact-us">
					<h3 class="footer-description-title">Contact Us</h3>
					<p class="footer-description-detail"> 
						<img src="<%=request.getContextPath()%>/resources/img/map-pin.svg" class="footer-description-icon" alt="star hotel location">

						<span>23, Fola Osibo, Lekki Phase 1</span></p>
					<p class="footer-description-detail">
						<img src="<%=request.getContextPath()%>/resources/img/phone.svg" class="footer-description-icon" alt="star hotels phone number"> 
						<span>
					 08185956620</span></p>
					<p class="footer-description-detail">
						<img src="<%=request.getContextPath()%>/resources/img/mail.svg" class="footer-description-icon" alt="star hotels email">
						<span>support@starhotels.com</span> </p>
				</div>
				<div class="footer-follow-us">
					<h3 class="footer-description-title">Follow Us</h3>
					<ul class="footer-follow-us-lists">
						<li class="follow-us-list">
							<a href="">
								<img src="<%=request.getContextPath()%>/resources/img/facebook.svg" alt="star hotels facebook page">
							</a>
						</li>
						<li class="follow-us-list">
							<a href="">
								<img src="<%=request.getContextPath()%>/resources/img/twitter.svg" alt="star hotels twitter page">
							</a>
						</li>
						<li class="follow-us-list">
							<a href="">
								<img src="<%=request.getContextPath()%>/resources/img/instagram.svg" alt="star hotels instagram page">
							</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</footer>
    <script src="<%=request.getContextPath()%>/resources/js/switchRooms.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/toggleHamburger.js"></script>
<div class="page">
${paging.pagingHtml}
</div>
</body>
</html>