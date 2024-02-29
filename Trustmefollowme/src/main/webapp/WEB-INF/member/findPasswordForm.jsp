<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="resources/css/myPage.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
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
		width: 100%;
		padding-left: 35px;
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
 <script>
 
	 $(document).ready(function() { 
		alert('비밀번호 찾기');
		var isCheck = false;

	 	$('#email_check').click(function(){ // 중복체크버튼
		    isCheck = true;
		    
		    let emailPattern = /[@]/; //이메일에 @ 있는지 확인

		    // 입력된 이메일 값
		    let inputEmail = $('input[name="email"]').val();

		     if(inputEmail.length == 0){
	                $('#emailMessage').html("<font style='font-size: 14px; color: #000081;'>* 이메일을 입력하세요</font>");
	                $('#emailMessage').show();
	                return; 
	            }
		     else if (emailPattern.test(inputEmail) == false) {
		        // 이메일에 @가 포함되어 있지 않은 경우
		        $('#emailMessage').html("<font style='font-size: 14px; color: #000081;'>* 이메일에는 @가 포함되어야 합니다</font>");
		        $('#emailMessage').show();
		        return; 
		    }
		     else if (inputEmail.includes('.com') == false) {
		        // 이메일에 .com가 포함되어 있지 않은 경우
		          $('#emailMessage').html("<font style='font-size: 14px; color: #000081;'>* 이메일에는 .com로 끝나야합니다</font>");
		        $('#emailMessage').show();
		        return; 
		    }
		      

		
		//이메일 알림 메세지가 뜨고 이메일칸에 키보드 입력할때 사라짐
		$("input[name='email']").keydown(function(){

			isCheck = false;
			use="";
			$('#emailMessage').css('display','none');
		}); // keydown
		
	}); // ready 
 </script>  
<main class="main--container">

	<div class="content--container">
		<form action="findPassword.mb" method="post" class="form--container">
		<div>
			<input type="email" name="email" class="input--box" placeholder="이메일을 입력해 주세요" autocomplete="off" id="name--box">
			<br>
		</div>
		<input type="text" name="name" class="input--box" placeholder="이름을 입력해 주세요" autocomplete="off" id="name--box">
		<div id="name--check"></div>
	<!-- 	<input type="date" name="birth" class="input--box" placeholder="출생년도" autocomplete="off" id="date--box"> -->
	<!-- 	<div>
			<div>
				<input type="text" class="input--box" id="address1" placeholder="주소" name="address1" readonly="readonly" style="width:300px;" autocomplete="off">
				<input type="button" class="sub--button" id="find--address--btn" onclick="postCode()" value="검색" style="width:50px; margin: 0; background-color: #BCE55C; border: 1px solid #BCE55C; color: #000;"><br>
			</div>
			<input type="text" class="input--box" id="address2" name="address2" placeholder="상세주소" autocomplete="off"><br>
			<div id="detail--address--check"></div>
		</div> -->
		<input type="tel" name="mtel" id="tel--box" class="input--box" placeholder="전화번호를 입력해주세요" autocomplete="off">
		<div id="tel--check"></div>
		<input type="submit" id="change--btn" class="sub--button" value="비밀번호 찾기">
		</form>
	</div>
</main>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


    
    /* 유효성 검사 */
    let passwordCheck = document.getElementById("password--check");
    let passwordBox = document.getElementById("password--box");
   	let checkKey = document.getElementById("key--check");
	let submitBtn = document.getElementById("change--btn");
	let emailBox = document.getElementById("email--box");
	let dateBox = document.getElementById("date--box");
	let addressBox = document.getElementById("address1");
	let detailAddressBox = document.getElementById("address2");
	let checkPatternDiv = document.getElementById("check--pattern");
	let address2Box = document.getElementById("detail--address--check");
	let nameBox = document.getElementById("name--box");
	let telBox = document.getElementById("tel--box");
	let telCheckDiv = document.getElementById("tel--check");
	let inputPattern =  /[@]/;
	let reg = /\s/g;
	
	let checkEmail = false;
	let checkPassword = false;
	let checkName = false;
	let checkBirth = false;
	let checkAddress = false;
	let checkDetailAddress = false;
	let checkTel = false;
	
	// 전부 null이 아닌 경우
	function checkSubmit(checkEmail, checkPassword, checkName, 
			checkBirth, checkAddress, checkDetailAddress, checkTel) {
		if(checkEmail && checkPassword && checkName && checkBirth 
				&& checkAddress && checkDetailAddress && checkTel) {
			submitBtn.type = "submit";
		} else {
			submitBtn.type = "button";
		}
	}

    
	/* 이름칸 검사 */
    nameBox.addEventListener("keyup", function() {
    	let nameBoxValue = nameBox.value;
    	let nameCheckDiv = document.getElementById("name--check");
    	if(nameBoxValue.match(reg)) {
    		nameCheckDiv.textContent = "* 공백이 포함되어 있습니다";
    		nameCheckDiv.style.color = "red";
    		nameCheckDiv.style.fontSize = "14px";
    		checkName = false;
    	} else {
    		nameCheckDiv.replaceChildren();
    		checkName = true;
    	}
    });

	/* 전화번호 입력란 검사 */
    telBox.addEventListener("keyup", function() {
    	let telPattern = /\d{3}-\d{4}-\d{4}/;
    	let telBoxValue = telBox.value;
    	if(telPattern.test(telBoxValue) == false) {
    		telCheckDiv.textContent = "* 전화번호는 010-0000-0000 형식이어야 합니다";
    		telCheckDiv.style.color = "red";
    		telCheckDiv.style.fontSize = "14px";
    		checkTel = false;
    	} else {
    		telCheckDiv.replaceChildren();
    		checkTel = true;
    	}
    });
	
	
</script>	