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

		.err{
		color: #002D93;
		font-size: 9pt;
		font-weight: bold;
	}
   
</style>
	<main class="main--container">

	<div class="content--container">
		<div class="info--container">
			<div class="myinfo--box">
			<p style="font-size: 30px;">호텔 수정 페이지</p>
			</div>
				<div id="myInfoDiv">
					<form:form class="form--container" action="hotelUpdate.ht" method="post" enctype="multipart/form-data" commandName="hotel">
						<input type="hidden" name="hnum" value="${hotel.hnum }">
						<input type="hidden" name="pageNumber" value="${pageNumber }">
						<div>
							<span>호텔이름</span>
							<input class="input--box" name="name" type="text" value="${hotel.name}">
							<br>
							<form:errors cssClass="err" path="name" />
						</div>
						<div>
							<span>호텔가격</span>
							<input class="input--box" name="hprice" type="text" value="${hotel.hprice}" >
							<br>
							<form:errors cssClass="err" path="hprice" />
						</div>
						<c:set var="path" value="<%=request.getContextPath() %>"/>
						<div>
							<span>호텔이미지1</span>
							<img src="${path }/resources/images/${hotel.image}" width="100" height="100"><br>
							
							<input type="file" name="upload" value="${hotel.image }"> 
							<input type="hidden" name="d_image" value="${hotel.image }"> 
							<br>
							<form:errors cssClass="err" path="image" />
						</div>
						<br><br>
						<div>
							<span>룸이미지2</span>
							<img src="${path }/resources/images/${hotel.image2}" width="100" height="100"><br>
							<br>
							<input type="file" name="upload2" value="${hotel.image2 }"> 
							<input type="hidden" name="d_image2" value="${hotel.image2 }"> 
							<br>
							<form:errors cssClass="err" path="image2" />
						</div>
						<br><br>
						<div>
							<span>룸이미지3</span>
							<img src="${path }/resources/images/${hotel.image3}" width="100" height="100"><br>
							<br>
							<input type="file" name="upload3" value="${hotel.image3 }"> 
							<input type="hidden" name="d_image3" value="${hotel.image3 }"> 
							<br>
							<form:errors cssClass="err" path="image3" />
						</div>
						<br><br>
						<div>
							<span>룸이미지4</span>
							<img src="${path }/resources/images/${hotel.image4}" width="100" height="100"><br>
							<br>
							<input type="file" name="upload4" value="${hotel.image4 }"> 
							<input type="hidden" name="d_image4" value="${hotel.image4 }"> 
							<br>
							<form:errors cssClass="err" path="image4" />
						</div>
						<br><br>
						<div>
							<span>룸이미지5</span>
							<img src="${path }/resources/images/${hotel.image5}" width="100" height="100"><br>
							<br>
							<input type="file" name="upload5" value="${hotel.image5 }"> 
							<input type="hidden" name="d_image5" value="${hotel.image5 }"> 
							<br>
							<form:errors cssClass="err" path="image5" />
						</div>
						<br><br>
						<div>
							<span>시설이미지6</span>
							<img src="${path }/resources/images/${hotel.image6}" width="100" height="100"><br>
							<br>
							<input type="file" name="upload6" value="${hotel.image6 }"> 
							<input type="hidden" name="d_image6" value="${hotel.image6 }"> 
							<br>
							<form:errors cssClass="err" path="image6" />
						</div>
						<br><br>
						<div>
							<span>주소</span>
							<input class="input--box" name="address" type="text" id="text" value="${hotel.address}">
							<br>
							<form:errors cssClass="err" path="address" />
						</div>
						<div>
							<span>전화번호</span>
							<input class="input--box" name="htel" type="text" value="${hotel.htel}">
							<br>
							<form:errors cssClass="err" path="htel" />
						</div>
						<br><br>
						<div>
							<span>상세내용</span>
							<textarea name="hcontent" type="text" rows="10" cols="40">${hotel.hcontent}</textarea>
							<br>
							<form:errors cssClass="err" path="hcontent" />
							<br>
						</div>
						<div>
							<span>룸이름1</span>
							<input class="input--box" name="rname1" type="text" value="${hotel.rname1}">
							<br>
							<form:errors cssClass="err" path="rname1" />
						</div>
						<div>
							<span>룸이름2</span>
							<input class="input--box" name="rname2" type="text" value="${hotel.rname2}">
							<br>
							<form:errors cssClass="err" path="rname2" />
						</div>
						<div>
							<span>룸이름3</span>
							<input class="input--box" name="rname3" type="text" value="${hotel.rname3}">
							<br>
							<form:errors cssClass="err" path="rname3" />
						</div>
						<div>
							<span>룸이름4</span>
							<input class="input--box" name="rname4" type="text" value="${hotel.rname4}">
							<br>
							<form:errors cssClass="err" path="rname4" />
						</div>
						<div>
							<span>룸1가격</span>
							<input class="input--box" name="rprice1" type="text" value="${hotel.rprice1}">
							<br>
							<form:errors cssClass="err" path="rprice1" />
						</div>
						<div>
							<span>룸2가격</span>
							<input class="input--box" name="rprice2" type="text" value="${hotel.rprice2}">
							<br>
							<form:errors cssClass="err" path="rprice2" />
						</div>
						<div>
							<span>룸3가격</span>
							<input class="input--box" name="rprice3" type="text" value="${hotel.rprice3}">
							<br>
							<form:errors cssClass="err" path="rprice2" />
						</div>
						<div>
							<span>룸4가격</span>
							<input class="input--box" name="rprice4" type="text" value="${hotel.rprice4}">
							<br>
							<form:errors cssClass="err" path="rprice4" />
						</div>
						<div>
							<span>위도</span>
							<input class="input--box" name="xpos" type="text" value="${hotel.xpos}">
							<br>
							<form:errors cssClass="err" path="xpos" />
						</div>
						<div>
							<span>경도</span>
							<input class="input--box" name="ypos" type="text" value="${hotel.ypos}">
							<br>
							<form:errors cssClass="err" path="ypos" />
						</div>
						<br>
						<div>
							<span>부대시설</span><br><br>
							<c:set var="facility">무료 Wi-Fi,야외 수영장,실내 수영장,사우나,무료 주차,조식 포함,24시간 프런트 데스크,레스토랑,룸서비스,스파,피트니스 센터</c:set>

							<c:forEach var="i" items="${facility}">
								<input class="input--box" type="checkbox" style="width: 15px; height: 15px;" name="facility" value="${i}" 
								<c:if test="${fn:contains(hotel.facility, i)}">checked</c:if>>${i}
								<br>
							</c:forEach>
							<br>
							<form:errors cssClass="err" path="facility" />
						</div>
						
						<input class="sub--button" id="update--btn" type="submit" value="호텔 수정">
					</form:form>
				</div>
			</div>
		</div>
	</main>
	
