<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />
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

.err {
	color: #002D93;
	font-size: 9pt;
	font-weight: bold;
}
.input--box1 {
	width: 100px;
	height: 40px;
	border: none;
	border-bottom: 2px solid black;
	margin: 10px;
}
</style>
<main class="main--container">
	<div class="content--container">
		<div class="info--container">
			<div class="myinfo--box">
				<p style="font-size: 30px;">음식점 등록 페이지</p>
			</div>
				<br><br>
			<div id="myInfoDiv">

							<form:form action="restInsert.re" method="post"
								commandName="restaurantBean" enctype="multipart/form-data">

								<div class=" ">
									<input type="text" class="input--box" name="name"
										placeholder="이름" value="${restaurantBean.name}">
				<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />
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

.err {
	color: #002D93;
	font-size: 9pt;
	font-weight: bold;
}
.input--box1 {
	width: 100px;
	height: 40px;
	border: none;
	border-bottom: 2px solid black;
	margin: 10px;
}
</style>
<main class="main--container">
	<div class="content--container">
		<div class="info--container">
			<div class="myinfo--box">
				<p style="font-size: 30px;">음식점 등록 페이지</p>
			</div>
				<br><br>
			<div id="myInfoDiv">

							<form:form action="restInsert.re" method="post"
								commandName="restaurantBean" enctype="multipart/form-data">

								<div class=" ">
									<input type="text" class="input--box" name="name"
										placeholder="이름" value="${restaurantBean.name}">
									<form:errors cssClass="err" path="name" />
								</div>
								
								<div>
									<input type="text" class="input--box" name="rcontent"
										placeholder="내용" value="${restaurantBean.rcontent}">
									<form:errors cssClass="err" path="rcontent" />
								</div>

								

								<div class=" ">
									<input type="text" class="input--box" name="xpos"
										placeholder="위도" value="${restaurantBean.xpos}">
									<form:errors cssClass="err" path="xpos" />
								</div>

								<div class=" ">
									<input type="text" class="input--box" name="ypos"
										placeholder="경도" value="${restaurantBean.ypos}">
									<form:errors cssClass="err" path="ypos" />
								</div>

								<div class=" ">
									<input type="text" class="input--box" name="address"
										placeholder="장소" value="${restaurantBean.address}">
									<form:errors cssClass="err" path="address" />
								</div>

								<div class=" ">
									<span>이미지</span> 
									<input type="file"   class="input--box"name="imgUpload">
									<form:errors cssClass="err" path="image" />
								</div>
								<br>
								<div class=" ">
									<span>이미지2</span> 
									<input type="file"  class="input--box" name="imgUpload2">
									<form:errors cssClass="err" path="image2" />
								</div>
								<br>
								<div class=" ">
									<span>이미지3</span> 
									<input type="file"   class="input--box"name="imgUpload3">
									<form:errors cssClass="err" path="image3" />
								</div>
								<br>
								<div class=" ">
									<span>이미지4</span> 
									<input type="file"  class="input--box" name="imgUpload4">
									<form:errors cssClass="err" path="image4" />
								</div>
								<br>
								<div class=" ">
									<span>이미지5</span> 
									<input type="file"  class="input--box" name="imgUpload5">
									<form:errors cssClass="err" path="image5" />
								</div>
								<br>
								<div class=" ">
								<span>연락처 </span> 
									<select name="rtel1">
										<c:set var="rtel">02,031,064</c:set>
										<c:forEach var="rtel" items="${rtel}"> 
											<option value="${rtel}"  class="input--box"
												<c:if test="${rtel eq restaurantBean.rtel1}">selected</c:if>>${rtel}
										</c:forEach>
									</select> -
									<form:errors cssClass="err" path="rtel1" />

									<input type="text"  class="input--box1" name="rtel2" size="12" placeholder="1234"
										maxlength="4" value="${restaurantBean.rtel2}"> -
									<form:errors cssClass="err" path="rtel2" />
									<input type="tel"  class="input--box1" name="rtel3" size="12" placeholder="5678"
										maxlength="4" value="${restaurantBean.rtel3}">
									<form:errors cssClass="err" path="rtel3" />
								</div>

								<div class=" ">
									<span>영업 시작 시간</span> <input type="time" class="input--box" name="rtime1" value="${restaurantBean.rtime1}">
									<form:errors cssClass="err" path="rtime1" />
								</div>

								<div class=" ">
									<span>영업 종료 시간</span> <input type="time" class="input--box" name="rtime2" value="${restaurantBean.rtime2}">
									<form:errors cssClass="err" path="rtime2" />
								</div>

								<div class=" ">
									<span>개업일자</span> <input type="date" class="input--box" name="rdate" value="${restaurantBean.rdate}">
									<form:errors cssClass="err" path="rdate" />
								</div>

							<input class="sub--button" id="update--btn" type="submit" value="등록">
							</form:form>
								</div>
			</div>
		</div>
	</main>
						<form:errors cssClass="err" path="name" />
								</div>

								<div class=" ">
									<input type="text" class="input--box" name="xpos"
										placeholder="위도" value="${restaurantBean.xpos}">
									<form:errors cssClass="err" path="xpos" />
								</div>

								<div class=" ">
									<input type="text" class="input--box" name="ypos"
										placeholder="경도" value="${restaurantBean.ypos}">
									<form:errors cssClass="err" path="ypos" />
								</div>

								<div class=" ">
									<input type="text" class="input--box" name="address"
										placeholder="장소" value="${restaurantBean.address}">
									<form:errors cssClass="err" path="address" />
								</div>

								<div class=" ">
									<span>이미지</span> 
									<input type="file"   class="input--box"name="imgUpload">
									<form:errors cssClass="err" path="image" />
								</div>
								<br>
								<div class=" ">
									<span>이미지2</span> 
									<input type="file"  class="input--box" name="imgUpload2">
									<form:errors cssClass="err" path="image2" />
								</div>
								<br>
								<div class=" ">
									<span>이미지3</span> 
									<input type="file"   class="input--box"name="imgUpload3">
									<form:errors cssClass="err" path="image3" />
								</div>
								<br>
								<div class=" ">
									<span>이미지4</span> 
									<input type="file"  class="input--box" name="imgUpload4">
									<form:errors cssClass="err" path="image4" />
								</div>
								<br>
								<div class=" ">
									<span>이미지5</span> 
									<input type="file"  class="input--box" name="imgUpload5">
									<form:errors cssClass="err" path="image5" />
								</div>
								<br>
								<div class=" ">
								<span>연락처 </span> 
									<select name="rtel1">
										<c:set var="rtel">02,031,064</c:set>
										<c:forEach var="rtel" items="${rtel}"> 
											<option value="${rtel}"  class="input--box"
												<c:if test="${rtel eq restaurantBean.rtel1}">selected</c:if>>${rtel}
										</c:forEach>
									</select> -
									<form:errors cssClass="err" path="rtel1" />

									<input type="text"  class="input--box1" name="rtel2" size="12" placeholder="1234"
										maxlength="4" value="${restaurantBean.rtel2}"> -
									<form:errors cssClass="err" path="rtel2" />
									<input type="tel"  class="input--box1" name="rtel3" size="12" placeholder="5678"
										maxlength="4" value="${restaurantBean.rtel3}">
									<form:errors cssClass="err" path="rtel3" />
								</div>

								<div class=" ">
									<span>영업 시작 시간</span> <input type="time" class="input--box" name="rtime1" value="${restaurantBean.rtime1}">
									<form:errors cssClass="err" path="rtime1" />
								</div>

								<div class=" ">
									<span>영업 종료 시간</span> <input type="time" class="input--box" name="rtime2" value="${restaurantBean.rtime2}">
									<form:errors cssClass="err" path="rtime2" />
								</div>

								<div class=" ">
									<span>개업일자</span> <input type="date" class="input--box" name="rdate" value="${restaurantBean.rdate}">
									<form:errors cssClass="err" path="rdate" />
								</div>

							<input class="sub--button" id="update--btn" type="submit" value="등록">
							</form:form>
								</div>
			</div>
		</div>
	</main>
	