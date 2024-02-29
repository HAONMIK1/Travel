<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/images/favicon.png"
	type="">

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

<style type="text/css">
.noList {
	margin: auto;
}

.page {
	padding-top: 50px;
	text-align: center;
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
.container{
	padding-top: 50px;
}
</style>
<body>
	<section class="food_section layout_padding-bottom">
		<div class="container">
			<div class="heading_container heading_center">
				<h2><a href="#"><font color="black">나믿따</font></a></h2>	<ul class="filters_menu">
				<li onclick="location.href='restInsert.re'">추가</li>
				<li data-filter=".all">all</li>
				<li data-filter=".hotel" onclick="location.href='mainHotelList.ht'">호텔</li>
				<li data-filter=".pizza"
					onclick="location.href='mainRestaurantList.re'">음식점</li>
				<li data-filter=".cafe" onclick="location.href='mainCafeList.cf'">카페</li>
				<li data-filter=".fries" onclick="location.href='mainSpotList.sp'">관광지</li>
			</ul>
			</div>
		</div>
		<div class="container">
		
			<form action="mainRestaurantList.re" method="get" align="center">
				<select name="WhatColumn" class="column">
						<option value="all">전체 
						<option value="name">이름
						<option value="address">주소
					<input type="text" name="keyword" class="keyword" placeholder="검색">
					<input type="submit" value="검색">
					</select>
			</form>
			<br>
			<div class="filters-content">
				<div class="row grid">
					<c:choose>
						<c:when test="${empty lists}">
							<div class="noList">
								<h3><b>검색된 음식점이 없습니다.</b></h3>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${lists}">
								<div class="col-sm-6 col-lg-4">
									<div class="box">
										<div>
											<div class="img-box">
												<a href="restDetail.re?rnum=${list.rnum}"> 
												<img src="<%=request.getContextPath()%>/resources/images/${list.image}" alt="이미지">
												</a>
											</div>
											<div class="detail-box">
												<h5>이름: ${list.name}</h5>
												<div class="options">
													<h6>주소: ${list.address}</h6>
												</div>
												<div class="options">
													<h6>연락처: ${list.rtel1} - ${list.rtel2} - ${list.rtel3}</h6>
												</div>
												<div class="options">
													<h6>${list.rtime1}시~${list.rtime2}시</h6>
												</div>
												<div align="right">
													<a href="restUpdate.re?rnum=${list.rnum}"><font
														color="white">수정</font></a>&nbsp;&nbsp; 
														<a href="restDelete.re?rnum=${list.rnum}">
														<font color="white">삭제</font>
														</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="page">${pageInfo.pagingHtml}</div>