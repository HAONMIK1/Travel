<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../common/common.jsp"%>
<%@include file="adminHeader.jsp"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>FAT roomDetailPage</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/rooms-and-suites.css">
<link href="https://cdn.jsdelivr.net/npm/hover.css@2.3.1/css/hover-min.css" rel="stylesheet">
<style>
th{
 background-color : #FAED7D;
font-size: 20px;
}

tr{
	text-align: center;
}
td{
font-size: 17px;
}
.myButton {
	box-shadow:inset 0px 1px 0px 0px #a4e271;
	background:linear-gradient(to bottom, #89c403 5%, #77a809 100%);
	background-color:#89c403;
	border-radius:6px;
	border:1px solid #74b807;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528009;
}
.myButton:hover {
	background:linear-gradient(to bottom, #77a809 5%, #89c403 100%);
	background-color:#77a809;
}
.myButton:active {
	position:relative;
	top:1px;
}
p{
	text-align: center;
}
  
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".showModalBtn").click(
				function() {
					var cnum = $(this).data("cnum");

					window.open("cafeDetail.cf?cnum=" + cnum, "CafeDetails",
							"width=500, height=600");

				});
		$(function() {
			$(".showModalBtn2").click(
					function() {
						var rnum = $(this).data("rnum");

						window.open("restDetail.re?rnum=" + rnum, "레스토랑",
								"width=500, height=600");

					});

			$(".showModalBtn3").click(
					function() {
						var snum = $(this).data("snum");

						window.open("spotDetail.sp?snum=" + snum, "관광지",
								"width=500, height=600");

					});
			$(".showModalBtn4").click(
					function() {
						var hnum = $(this).data("hnum");

						window.open("hotelDetail.ht?hnum=" + hnum, "호텔",
								"width=800, height=600");

					});
		});
	});
</script>
</head>

<!--  호텔 리스트 -->

		<c:if test="${cate == 'hotel'}">
			&emsp;&nbsp;
	
		<table class="outline" width="80%" height="70%" style="table-layout: fixed;">
			<colgroup>
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 20%;">
            <col style="width: 20%;">
            <col style="width: 30%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
        </colgroup>
        
			<tr>
				<td colspan="8" align="left">
				<div>
				<br>
				</div>
						<a href="hotelInsert.ht?hnum=${hotel.hnum}&cate=hotel&pageNumber=${paging.pageNumber}" class="myButton">호텔 추가하기</a>
			<!-- 	<div>
				<br>
				</div> -->
			<br><br>
			
				<form action="hotelList.ht" method="get" >
					
				<select name="WhatColumn" style="font-size: 16px; height:30px;">
					<option value="all" style="font-size: 16px;">전체검색 
					<option value="name" style="font-size: 16px;">호텔검색
					<option value="facility" style="font-size: 16px;">부대시설
				</select>	
				<input type="text" name="keyword" style="width:300px; height:30px;font-size: 16px;">
				<input type="submit" value="search" style="width:80px; height:30px;font-size: 16px;">
				
				</form>
				</td>	
			</tr>
			<tr>
				<th>번호</th>
				<th>호텔사진</th>
				<th>호텔명</th>
				<th>주소</th>
				<th>부대시설</th>
				<th>가격</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="hotel" items="${lists}">
				<tr>
					<td>${hotel.hnum }</td>
					<td><a href="#" class="showModalBtn4" data-hnum="${hotel.hnum}">
							<img
							src="<%=request.getContextPath()%>/resources/images/${hotel.image}"
							width="50" height="50">
					</a></td>
					<td>${hotel.name }</td>
					<td>${hotel.address }</td>
					<td>${hotel.facility}</td>
					<td>￦${hotel.hprice}</td>

					<td>
						<div class="buttons-container">
							<a
								href="hotelUpdate.ht?hnum=${hotel.hnum}&cate=hotel&pageNumber=${paging.pageNumber}"
								class="btn btn-ghost">수정</a>
						</div>
					</td>

					<td><div class="buttons-container">
							<a
								href="hotelDelete.ht?hnum=${hotel.hnum}&pageNumber=${paging.pageNumber}&cate=hotel"
								class="btn btn-fill">삭제</a>
						</div></td>
				</tr>
			</c:forEach>
			
	<tr class="page">
		<td colspan="8" align="center">
		${paging.pagingHtml}
		</td>
		</tr>
		</table>
	</c:if>

<!-- 관광지 리스트 -->

		<c:if test="${cate == 'spot'}">
			&emsp;&nbsp;
		<table class="outline" width="80%" height="70%" style="table-layout: fixed;">
		<colgroup>
            <col style="width: 10%;">
            <col style="width: 20%;">
            <col style="width: 20%;">
            <col style="width: 30%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
        </colgroup>
			<tr>
				<td colspan="8" align="left">
				<div>
				<br>
				</div>
					<a href="spotInsert.sp?snum=${spot.snum }&cate=spot&pageNumber=${paging.pageNumber}" class="myButton">장소 추가하기</a>
				<br><br>
				<form action="spotList.sp" method="get">
	
				<select name="WhatColumn" style="font-size: 16px; height:30px;">
					<option value="all" style="font-size: 16px;">전체검색 
					<option value="name" style="font-size: 16px;">장소검색
					<option value="address" style="font-size: 16px;">주소검색
				</select>	
				<input type="text" name="keyword" style="width:300px; height:30px;font-size: 16px;">
				<input type="submit" value="search" style="width:80px; height:30px;font-size: 16px;">
				
				</form>
				<td>
			</tr>
			<tr>
				<th>번호</th>
				<th>관광지사진</th>
				<th>관광지 이름</th>
				<th>관광지 주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="spot" items="${lists}">
				<tr>
					<td>${spot.snum }</td>
					<td><a
						href="#" class="showModalBtn3" data-snum="${spot.snum}">
							<img
							src="<%=request.getContextPath()%>/resources/images/${spot.image}"
							width="50" height="50">
					</a></td>
					<td>${spot.name }</td>
					<td>${spot.address }</td>

					<td>
						<div class="buttons-container">
							<a href="spotUpdate.sp?snum=${spot.snum }&pageNumber=${paging.pageNumber}&cate=spot" class="btn btn-ghost">수정</a>
						</div>
					</td>

					<td>
							<div class="buttons-container">
							<a href="spotDelete.sp?snum=${spot.snum }&cate=spot&pageNumber=${paging.pageNumber}" class="btn btn-fill">삭제</a>
					</div>
					</td>
				</tr>
			</c:forEach>
			<tr>
			<td colspan="6" align="center">
			<div class="page">
				${paging.pagingHtml}
				</div>
			</td>
			</tr> 
			</table>
		</c:if>

<!-- 음식점 리스트 -->

		<c:if test="${cate == 'restaurant'}">
			&emsp;&nbsp;
		<table class="outline" width="80%" height="70%" style="table-layout: fixed;">
			<colgroup>
            <col style="width: 5%;">
            <col style="width: 10%;">
            <col style="width: 15%;">
            <col style="width: 20%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 5%;">
            <col style="width: 5%;">
        </colgroup>
			<tr>
				<td colspan="8" align="left">
				<div>
				<br>
				</div>
					<a href="restInsert.re?rnum=${rest.rnum }&cate=restaurant&pageNumber=${paging.pageNumber}" class="myButton">장소 추가하기</a>
				<br><br>
				<form action="mainRestaurantList.re" method="get">
	
				<select name="WhatColumn" style="font-size: 16px; height:30px;">
					<option value="all" style="font-size: 16px;">전체검색 
					<option value="name" style="font-size: 16px;">음식점명
					<option value="address" style="font-size: 16px;">주소
				</select>	
				<input type="text" name="keyword" style="width:300px; height:30px;font-size: 16px;">
				<input type="submit" value="search" style="width:80px; height:30px;font-size: 16px;">
				
				</form>
				</td>
			<tr>
				<th>번호</th>
				<th>음식점사진</th>
				<th>음식점 이름</th>
				<th>음식점 주소</th>
				<th>전화번호</th>
				<th>영업시간</th>
				<th>위도</th>
				<th>경도</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="rest" items="${lists}">
				<tr>
					<td>${rest.rnum }</td>
					<td><a
						 href="#" class="showModalBtn2" data-rnum="${rest.rnum}"">
							<img
							src="<%=request.getContextPath()%>/resources/images/${rest.image}"
							width="50" height="50">
					</a></td>
					<td>${rest.name }</td>
					<td>${rest.address }</td>
					<td>${rest.rtel1 }-${rest.rtel2 }-${rest.rtel3 }</td>
					<td>${rest.rtime1}  ~ ${rest.rtime2 }</td>
					<td>${rest.xpos}</td>
					<td>${rest.ypos}</td>

					<td>
						<div class="buttons-container">
							<a href="restUpdate.re?rnum=${rest.rnum}&cate=restaurant&pageNumber=${paging.pageNumber}" class="btn btn-ghost">수정</a>
						</div>
					</td>
					<td>
							<div class="buttons-container">
							<a href="restDelete.re?rnum=${rest.rnum}&cate=restaurant&pageNumber=${paging.pageNumber}" class="btn btn-fill">삭제</a>
					</div>
					</td>
				</tr>
			</c:forEach>
			<tr>
			<td colspan="10" align="center">
				${paging.pagingHtml}
			</td>
			</tr> 
		</table>
	</c:if>

<!-- 카페리스트 -->

	<c:if test="${cate == 'cafe'}">
			&emsp;&nbsp;
		<table class="outline" width="80%" height="70%" style="table-layout: fixed;">
			<colgroup>
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 20%;">
            <col style="width: 30%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
        </colgroup>
	
			<tr>
				<td colspan="8" align="left">
				<div>
				<br>
				</div>
						<a href="cafeInsert.cf?cnum=${cafe.cnum}&cate=cafe&pageNumber=${paging.pageNumber}" class="myButton">카페 추가하기</a>
					<br><br>
				<form action="mainCafeList.cf" method="get">
	
					<select name="WhatColumn" style="font-size: 16px; height:30px;">
					<option value="all" style="font-size: 16px;">전체검색 
					<option value="name" style="font-size: 16px;">카페명
					<option value="address" style="font-size: 16px;">주소
				</select>	
					<input type="text" name="keyword" style="width:300px; height:30px;font-size: 16px;">
				<input type="submit" value="search" style="width:80px; height:30px;font-size: 16px;">
				
				</form>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>카페사진</th>
				<th>카페명</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>영업시간</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="cafe" items="${lists}">
				<tr>
					<td>${cafe.cnum }</td>
					<td><a href="#" class="showModalBtn" data-cnum="${cafe.cnum}">
							<img
							src="<%=request.getContextPath()%>/resources/images/${cafe.image}"
							width="50" height="50">
					</a></td>
					<td>${cafe.name }</td>
					<td>${cafe.address }</td>
					<td>${cafe.ctel1}.${cafe.ctel2}.${cafe.ctel3}</td>
					<td>${cafe.ctime1}~${cafe.ctime2}</td>

					<td>
						<div class="buttons-container">
							<a
								href="cafeUpdate.cf?cnum=${cafe.cnum}&cate=cafe&pageNumber=${paging.pageNumber}"
								class="btn btn-ghost">수정</a>
						</div>
					</td>

					<td><div class="buttons-container">
							<a
								href="cafeDelete.cf?cnum=${cafe.cnum}&pageNumber=${paging.pageNumber}&cate=cafe"
								class="btn btn-fill">삭제</a>
						</div></td>
				</tr>
			</c:forEach>
			<tr>
			<td colspan="8" align="center">
				${paging.pagingHtml}
			</td>
			</tr>
		</table>
	</c:if>
	
	
<!-- 멤버리스트 -->

	<c:if test="${cate == 'member'}">
			&emsp;&nbsp;
		<table class="outline" width="80%" height="70%" style="table-layout: fixed;">
			<colgroup>
            <col style="width: 5%;">
            <col style="width: 20%;">
            <col style="width: 20%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 20%;">
            <col style="width: 15%;">
        </colgroup>
	
			<tr>
				<td colspan="8" align="left">
				<div>
				<br>
				</div>
				<div>
				<br>
				</div>
				<br><br>
				<form action="memberList.mb" method="get">
	
				<select name="WhatColumn" style="font-size: 16px; height:30px;">
					<option value="all" style="font-size: 16px;">전체검색 
					<option value="name" style="font-size: 16px;">이름
					<option value="email" style="font-size: 16px;">아이디
				</select>	
				<input type="text" name="keyword" style="width:300px; height:30px;font-size: 16px;">
				<input type="submit" value="search" style="width:80px; height:30px;font-size: 16px;">
				
				</form>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>생일</th>
				<th>주소</th>
				<th>전화번호</th>
		<!-- 		<th>위도</th>
				<th>경도</th> -->
			</tr>
			<c:forEach var="member" items="${lists}">
				<tr>
					<td>${member.num }</td>
					<td>${member.email }</td>
					<td>${member.password }</td>
					<td>${member.name}</td>
					<td>${member.birth}</td>
					<td>${member.address1} ${member.address2}</td>
					<td>${member.mtel}</td>
				</tr>
			</c:forEach>
					<tr>
			<td colspan="7" align="center">
				${paging.pagingHtml}
			</td>
			</tr>
		</table>
	</c:if>

</html>

