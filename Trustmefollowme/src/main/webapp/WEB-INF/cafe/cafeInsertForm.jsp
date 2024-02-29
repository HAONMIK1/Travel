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
				<p style="font-size: 30px;">카페 등록 페이지</p>
			</div>
	<br><br>
			<div id="myInfoDiv">		
<form:form action="cafeInsert.cf" commandName="cafeBean" method="post" enctype="multipart/form-data">
	<div>
		<span>이름</span> <input type="text" class="input--box" name="name" value="${cafeBean.name }">
		<form:errors cssClass="err" path="name" />
	</div>

	<div>
		<span>좌표 </span> <input type="text" name="xpos"  class="input--box1" value="${cafeBean.xpos }" placeholder="위도를 입력하세요">,
		<input type="text" name="ypos" class="input--box1" value="${cafeBean.ypos }" placeholder="경도를 입력하세요">
		<form:errors cssClass="err" path="xpos" />
		<form:errors cssClass="err" path="ypos" />
	</div>

	<div>
		<span>주소 </span> <input type="text" class="input--box" name="address" value="${cafeBean.address }" size="50px">
		<form:errors cssClass="err" path="address" />
	</div>

	<div>
		<span>전화번호 </span> <input type="text" class="input--box1" name="ctel1" value="${cafeBean.ctel1 }" maxlength="4">-
		<input type="text" name="ctel2" class="input--box1" value="${cafeBean.ctel2 }" maxlength="4">- 
		<input type="text" name="ctel3" class="input--box1" value="${cafeBean.ctel3 }" maxlength="4">
		<form:errors cssClass="err" path="ctel1" /> 
		<form:errors cssClass="err" path="ctel2" /> 
		<form:errors cssClass="err" path="ctel3" /> 
	</div>

	<div>
		<span>개업 일자</span> <input type="date" class="input--box" name="c_date" value="${cafeBean.c_date }">
		<form:errors cssClass="err" path="c_date" />
	</div>

	<div>
		<span>영업 시간</span><input type="time" class="input--box1" name="ctime1" value="${cafeBean.ctime1 }">~
		<input type="time" name="ctime2"  class="input--box1" value="${cafeBean.ctime2 }">
		<form:errors cssClass="err" path="ctime1" />
		<form:errors cssClass="err" path="ctime2" />
	</div>

	<div>
		<span>메인 사진</span> <input type="file" class="input--box" name="upload" value="${cafeBean.image }"> 
		<form:errors cssClass="err" path="image" />
	</div>

	<div>
		<span>사진2 </span> <input type="file" class="input--box" name="upload2" value="${cafeBean.image2 }"> 
		<form:errors cssClass="err" path="image2" />
	</div>
 
	<div>
		<span>사진3</span> <input type="file" class="input--box" name="upload3" value="${cafeBean.image3 }"> 
		<form:errors cssClass="err" path="image3" />
	</div>

	<div>
		<span>사진4 </span> <input type="file" class="input--box" name="upload4" value="${cafeBean.image4 }"> 
		<form:errors cssClass="err" path="image4" />
	</div>

	<div>
		<span>사진5 </span> <input type="file" class="input--box" name="upload5" value="${cafeBean.image5 }"> 
		<form:errors cssClass="err" path="image5" />
	</div>

	<input type="submit" class="sub--button" id="update--btn" value="등록하기">
</form:form>
</div>
			</div>
		</div>
	</main>
	