<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<p style="font-size: 30px;">관광지 수정 페이지</p>
			</div>
				<br><br>
			<div id="myInfoDiv">
		<form:form action="spotUpdate.sp" commandName="spotBean" method="post" enctype="multipart/form-data">
		<input type="hidden" name="snum" value="${spotBean.snum }">
		<input type="hidden" name="pageNumber" value="${pageNumber }">
				<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${spotBean.image}" width="100px" height="100px">
                 메인이미지 : <input type="file" class="input--box" name="upload" value="${sb.image }"> 
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${spotBean.image2}" width="100px" height="100px">
                 이미지2 : <input type="file" class="input--box" name="upload2" value="${sb.image2 }">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${spotBean.image3}" width="100px" height="100px">
                 이미지3 : <input type="file" class="input--box" name="upload3" value="${sb.image3 }">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${spotBean.image4}" width="100px" height="100px">
                 이미지4 : <input type="file" class="input--box" name="upload4" value="${sb.image4 }">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${spotBean.image5}"width="100px" height="100px">
				이미지5 : <input type="file" class="input--box" name="upload2" value="${sb.image5 }">
						</div>
			<br>
		        			<div>
		        			이름: <input type="text" class="input--box" name="name" value="${spotBean.name }">
		        			</div>
		        			<br>
		        			<div >
		        			주소 : <input type="text" class="input--box" name="address" value="${spotBean.address }" size="50px">
		        			</div>
		        			<br>
		        			<div>
		        			좌표 : <input type="text" class="input--box" name="xpos" value="${spotBean.xpos }" placeholder="위도를 입력하세요">,
									<input type="text" class="input--box" name="ypos" value="${spotBean.ypos }" placeholder="경도를 입력하세요">
		        		</div>
		        		<br>
		        		<div>
		        			영업시간: <input type="text" class="input--box" name="stime" value="${spotBean.stime }" size="50px"></p>
		        		</div>
		        		<br>
	        			<div>
	        			내용 : <br>
						<textarea name="content" class="input--box" rows="10" cols="40">${spotBean.content }</textarea>
	        			</div>
	     
		<input type="submit" class="sub--button" id="update--btn" value="수정하기">
	</form:form>
	</div>
			</div>
		</div>
	</main>
	