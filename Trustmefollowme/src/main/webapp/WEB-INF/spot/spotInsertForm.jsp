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
</style>
<main class="main--container">
	<div class="content--container">
		<div class="info--container">
			<div class="myinfo--box">
				<p style="font-size: 30px;">관광지 등록 페이지</p>
			</div>
				<br><br>
			<div id="myInfoDiv">
				<form action="spotInsert.sp" method="post"
					enctype="multipart/form-data">
					<div>
						<span>관광지이름</span> <input class="input--box" name="name"
							type="text" value="${sb.name }">
					</div>
					<div>
						<span>위도</span> <input class="input--box" name="xpos" type="text"
							value="${sb.xpos }" placeholder="위도를 입력하세요">
					</div>
					<div>
						<span>경도</span> <input class="input--box" name="ypos" type="text"
							value="${sb.xpos }" placeholder="경도를 입력하세요">
					</div>

					<div>
						<span>주소</span> <input class="input--box" name="address"
							type="text" value="${sb.address }">
					</div>
					<div>
						<span>영업시간</span> <input class="input--box" name="stime"
							type="text" value="${sb.stime }">
					</div>

					<div>
						<span>상세내용</span> <input class="input--box" name="content"
							type="text" value="${sb.content }">
					</div>

					<div>
						<span>사진1</span> <input class="input--box" name="upload"
							type="file" value="${sb.image }">
					</div>
					<div>
						<span>사진2</span> <input class="input--box" name="upload2"
							type="file" value="${sb.image2 }">
					</div>
					<div>
						<span>사진3</span> <input class="input--box" name="upload3"
							type="file" value="${sb.image3 }">
					</div>
					<div>
						<span>사진4</span> <input class="input--box" name="upload4"
							type="file" value="${sb.image4 }">
					</div>
					<div>
						<span>사진5</span> <input class="input--box" name="upload5"
							type="file" value="${sb.image5 }">
					</div>



					<input class="sub--button" id="update--btn" type="submit"
						value="등록">
				</form>
								</div>
			</div>
		</div>
	</main>
	