<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="resources/css/myPage.css" />
<%@include file="../common/common.jsp"%>
memberListForm.jsp
<style>
	#change--btn[type=button] {
		background-color: #BCE55C;
		border: 1px solid #BCE55C;
	}
	#change--btn[type=submit] {
		background-color: #BCE55C;
		border: 1px solid #BCE55C;
		color: #000000;
		font-style: bold;
	}
	#key--check {
		width: 100%;
		padding-left: 35px;
	}
	#check--pattern {
		width: 100%;
		padding-left: 35px;
	}
	#name--check{
		width: 100%;
		padding-left: 35px;
	}
	#email--box{
		width: 280px;
	}
	#detail--address--check {
		width: 100%;
		padding-left: 35px;
	}
	#email_check {
		width: 70px;
		height: 40px;
		color: #000000;
		background-color: #BCE55C;
		border: 1px solid #BCE55C;
	}
	#tel--check{
		width: 100%;
		padding-left: 35px;
	1}
	input[type=text] {
		outline: none;
	}
	input[type=password] {
		outline: none;
	}
	input[type=email] {
		outline: none;
	}
	input[type=tel] {
		outline: none;
	}
	input[type=date] {
		outline: none;
	}
</style>
<form action="memberList.mb" method="post">
<table border="1">
<tr>
<th>번호</th>
<th>이메일</th>
<th>비밀번호</th>
<th>이름</th>
<th>생년월일</th>
<th>주소1</th>
<th>주소2</th>
<th>휴대폰 번호</th>
</tr>
<c:forEach var="mb" items="${list}">
<tr>
<td>${mb.num }</td>
<td>${mb.email }</td>
<td>${mb.password }</td>
<td>${mb.name }</td>
<td>${mb.birth }</td>
<td>${mb.address1}</td>
<td>${mb.address2 }</td>
<td>${mb.mtel }</td>
</tr>
</c:forEach>
</table>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="page">${pageInfo.pagingHtml}</div>
</form>
</html>