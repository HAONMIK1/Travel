<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<!-- <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> 
<!--<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" /> -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@300;400&display=swap');
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', monospace;
}

main {
	display: flex;
	height: 100vh;
}

nav {
	width: 300px; 
	background-color: #CEF279;
	height: 150vh;
	display: flex;
}

.content {
	display: flex;
	flex-direction: column;
	padding: 10px;
}

.main--content {
	width: 1200px;
	height: 600px;
	padding: 10px;
	
}
#small{

	list-style: none;
	margin-bottom: 15px;
	padding-left: 20px;
	cursor: pointer;
	font-size: 15px;
	font-weight: 400;
	color: #000093;

}

li {
	list-style: none;
	margin-bottom: 15px;
	padding-left: 20px;
	cursor: pointer;
	font-size: 20px;
	font-weight: 500;
	color: #000093;
}
li:hover {
	color: #6E2FC7;/* #103B93 */
}

.main--headers {
	margin-bottom: 10px;
}

#hotel--list,#spot--list,#food--list,#cafe--list,#member--list,#board--list {
	display: none;
	font-size: 15px;
}

#search--user--wrap {
	display: flex;
	justify-content: space-between;
}
#logo--li {
	margin: 20px 20px 100px 20px;
	display: flex;
	justify-content: flex-end;
}

#chat--li {
	display: flex;
}

#li--icon--span {
	color: red;
	font-size: 30px;
	margin-left: 10px;
	display: flex;
	align-items: center;
}

</style>
<body>
	<main>
		<nav>
			<ul>
				 <li id="logo--li" onclick="location.href='admin.mb'"><img alt="" src="<%=request.getContextPath()%>/resources/assets/img/logo.png" width="120" height="60"></li>
				<li id="room--li">
					<div>
						<span id="search--hotel--wrap">Hotel</span>
					</div>
				<br>
					<ul id="hotel--list">
						<li id="small" onclick="location.href='admin.mb?cate=hotel'">호텔관리</li>
			
					</ul>	
				</li>
				
				<li id="room--li">
					<div>
						<span id="search--spot--wrap">Spot</span>
					</div>
					<br>
					<ul id="spot--list">
						<li id="small"onclick="location.href='admin.mb?cate=spot'">관광지 관리</li>
						<!-- <li id="small"onclick="location.href='/manager/roomStatus'">관광지 수정</li>
						<li id="small" onclick="location.href='/manager/facilities'">관광지 삭제</li> -->
					</ul>	
				</li>
				
				<li id="room--li">
					<div>
						<span id="search--food--wrap">restaurant</span>
					</div>
					<br>
					<ul id="food--list">
						<li id="small" onclick="location.href='admin.mb?cate=restaurant'">음식점 관리</li>
					<!-- 	<li id="small" onclick="location.href='/manager/roomStatus'">음식점 수정</li>
						<li id="small" onclick="location.href='/manager/facilities'">음식점 삭제</li> -->
					</ul>	
				</li>
				
				<li id="room--li">
					<div>
						<span id="search--cafe--wrap">cafe</span>
					</div>
					<br>
					<ul id="cafe--list">
						<li id="small"onclick="location.href='admin.mb?cate=cafe'">카페 관리</li>
				<!-- 		<li id="small" onclick="location.href='/manager/roomStatus'">카페 수정</li>
						<li id="small" onclick="location.href='/manager/facilities'">카페 삭제</li> -->
					</ul>	
				</li>
				
				<li id="userList--li">
					<div>
						<span id="search--member--wrap">Member</span>
					</div>
					<br>
					<ul id="member--list">
						<li id="small" onclick="location.href='admin.mb?cate=member'">전체 회원 조회</li>
				
					</ul>	
				</li>
				
				<li id="userList--li">
					<div>
						<span id="search--member--wrap" onClick="location.href='mainScreen.m'">Main</span>
					</div>
			
			</ul>
		</nav>
	<script type="text/javascript">
	$("#search--hotel--wrap").on("click", function() {
		$("#hotel--list").slideToggle()
	});
	$("#search--spot--wrap").on("click", function() {
		$("#spot--list").slideToggle()
	});
	$("#search--food--wrap").on("click", function() {
		$("#food--list").slideToggle()
	});
	$("#search--cafe--wrap").on("click", function() {
		$("#cafe--list").slideToggle()
	});
	$("#search--member--wrap").on("click", function() {
		$("#member--list").slideToggle()
	});
	$("#search--board--wrap").on("click", function() {
		$("#board--list").slideToggle()
	});
		
		
	</script>
	