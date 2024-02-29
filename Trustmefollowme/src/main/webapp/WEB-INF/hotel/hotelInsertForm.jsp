<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />
<link rel="stylesheet" href="resources/css/myPage.css" />
<%@include file="../common/common.jsp"%>
<style>
	#update--btn[type=button] {
		background-color: #ccc;
		border: none;
	}
	#update--btn[type=submit] {
		background-color: #000;
	}
	#withdraw--btn {
		background-color: #000;
		color: #fff;
		margin-left: 42px;
	}
		.err{
		color: #002D93;
		font-size: 9pt;
		font-weight: bold;
	}
   
</style>
	<main class="main--container">
		<!-- <div class="title--container">
		<div class="title--logo">
			<span class="material-symbols-outlined back--icon" onclick="history.back()">arrow_back</span>
			<img alt="" src="" height="40"onclick="location.href='/'">	
		</div> 
		<div class="title--text">
			<p>내 정보를</p>
			<p>확인해보세요</p>
		</div>
	</div>-->
	<div class="content--container">
		<div class="info--container">
			<div class="myinfo--box">
			<p style="font-size: 30px;">호텔 등록 페이지</p>
			</div>
				<div id="myInfoDiv">
					<form:form class="form--container" action="hotelInsert.ht?pageNumber=${pageNumber }" method="post" enctype="multipart/form-data" commandName="HotelBean">
						<div>
							<span>호텔이름</span>
							<input class="input--box" name="name" type="text" value="${HotelBean.name}">
							<form:errors cssClass="err" path="name" />
						</div>
						<div>
							<span>호텔가격</span>
							<input class="input--box" name="hprice" type="text" value="${HotelBean.hprice}" >
							<form:errors cssClass="err" path="hprice" />
						</div>
						<div>
							<span>호텔이미지1</span>
							<input class="input--box" name="upload" type="file" value="${HotelBean.image}" >
							<form:errors cssClass="err" path="image" />
						</div>
						<div>
							<span>룸이미지2</span>
							<input class="input--box" name="upload2" type="file" value="${HotelBean.image2}" >
							<form:errors cssClass="err" path="image2" />
						</div>
						<div>
							<span>룸이미지3</span>
							<input class="input--box" name="upload3" type="file" value="${HotelBean.image3}" >
							<form:errors cssClass="err" path="image3" />
						</div>
						<div>
							<span>룸이미지4</span>
							<input class="input--box" name="upload4" type="file" value="${HotelBean.image4}">
							<form:errors cssClass="err" path="image4" />
						</div>
						<div>
							<span>룸이미지5</span>
							<input class="input--box" name="upload5" type="file" value="${HotelBean.image5}">
							<form:errors cssClass="err" path="image5" />
						</div>
						<div>
							<span>시설이미지6</span>
							<input class="input--box" name="upload6" type="file" value="${HotelBean.image6}">
							<form:errors cssClass="err" path="image6" />
						</div>
						<div>
							<span>주소</span>
							<input class="input--box" name="address" type="text" id="text" value="${HotelBean.address}">
							<form:errors cssClass="err" path="address" />
						</div>
						<div>
							<span>전화번호</span>
							<input class="input--box" name="htel" type="text" value="${HotelBean.htel}">
							<form:errors cssClass="err" path="htel" />
						</div>
						
							<div>
							<span>상세내용</span>
							<textarea name="hcontent" type="text" rows="10" cols="40" placeholder="상세내용을 입력하세요">${hotel.hcontent}</textarea>
							<br>
							<form:errors cssClass="err" path="hcontent" />
							<br>
						</div>
						
						<div>
							<span>룸이름1</span>
							<input class="input--box" name="rname1" type="text" value="${HotelBean.rname1}">
							<form:errors cssClass="err" path="rname1" />
						</div>
						<div>
							<span>룸이름2</span>
							<input class="input--box" name="rname2" type="text" value="${HotelBean.rname2}">
							<form:errors cssClass="err" path="rname2" />
						</div>
						<div>
							<span>룸이름3</span>
							<input class="input--box" name="rname3" type="text" value="${HotelBean.rname3}">
							<form:errors cssClass="err" path="rname3" />
						</div>
						<div>
							<span>룸이름4</span>
							<input class="input--box" name="rname4" type="text" value="${HotelBean.rname4}">
							<form:errors cssClass="err" path="rname4" />
						</div>
						<div>
							<span>룸1가격</span>
							<input class="input--box" name="rprice1" type="text" value="${HotelBean.rprice1}">
							<form:errors cssClass="err" path="rprice1" />
						</div>
						<div>
							<span>룸2가격</span>
							<input class="input--box" name="rprice2" type="text" value="${HotelBean.rprice2}">
							<form:errors cssClass="err" path="rprice2" />
						</div>
						<div>
							<span>룸3가격</span>
							<input class="input--box" name="rprice3" type="text" value="${HotelBean.rprice3}">
							<form:errors cssClass="err" path="rprice2" />
						</div>
						<div>
							<span>룸4가격</span>
							<input class="input--box" name="rprice4" type="text" value="${HotelBean.rprice4}">
							<form:errors cssClass="err" path="rprice4" />
						</div>
						<div>
							<span>위도</span>
							<input class="input--box" name="xpos" type="text" value="${HotelBean.xpos}">
							<form:errors cssClass="err" path="xpos" />
						</div>
						<div>
							<span>경도</span>
							<input class="input--box" name="ypos" type="text" value="${HotelBean.ypos}">
							<form:errors cssClass="err" path="ypos" />
						</div>
						<br>
						<div>
							<span>부대시설</span><br><br>
							<c:set var="facility">무료 Wi-Fi,야외 수영장,실내 수영장,사우나,무료 주차,조식 포함,24시간 프런트 데스크,레스토랑,룸서비스,스파,피트니스 센터</c:set>

							<c:forEach var="i" items="${facility}">
								<input class="input--box" type="checkbox" style="width: 15px; height: 15px;" name="facility" value="${i}" >${i}
								<br>
							</c:forEach>
							<form:errors cssClass="err" path="facility" />
						</div>
						
						<input class="sub--button" id="update--btn" type="submit" value="호텔 등록">
					</form:form>
				</div>
			</div>
		</div>
	</main>
	