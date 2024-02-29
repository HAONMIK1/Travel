<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="resources/css/myPage.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
}
</style>
 <script>
 
 
	 $(document).ready(function() { 
		//alert('회원가입폼');ResponseEntity<String> response = rt
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
		 /*     else if (inputEmail.includes('.com') == false) {
		        // 이메일에 .com가 포함되어 있지 않은 경우
		          $('#emailMessage').html("<font style='font-size: 14px; color: #000081;'>* 이메일에는 .com로 끝나야합니다</font>");
		        $('#emailMessage').show();
		        return; 
		    } */
		     
		       

		    $.ajax({
		        url : "email_check_proc.mb", // 요청url
		        data : ({
		            inputemail : inputEmail
		        }),
		        success : function(data){
		            alert(data);

		            if(inputEmail == ""){
		                $('#emailMessage').html("<font color=#000081>* 이메일을 입력하세요</font>");
		                $('#emailMessage').show();
		            }
		            else if(jQuery.trim(data)=='YES'){
		                $('#emailMessage').html("<font style='font-size: 14px; color: #000081;'>* 사용가능합니다</font>");
		                use = "possible";
		                $('#emailMessage').show();
		            } else {
		                $('#emailMessage').html("<font color=red>* 이미 사용중인 이메일입니다.</font>")
		                use = "impossible";
		                $('#emailMessage').show(); 
		            }
		        }//success
		    });//ajax
		});//중복체크 click
		
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
			<form:form action="join.mb" method="post" class="form--container" commandName="memberBean" >
			<div>
				<input type="email" name="email" class="input--box" placeholder="이메일을 입력해 주세요" autocomplete="off" id="email--box" value="${memberBean.email }">
				<button type="button" id="email_check" >중복확인</button>
				
				<br>
				<span id="emailMessage" style="display: none;"></span>		
			</div>
			<div id="check--pattern"></div>
			<input type="password" name="password" class="input--box" placeholder="비밀번호를 입력해 주세요"   autocomplete="off" id="password--box" >
			<br>
			
			<input type="password" name="passwordCheck" class="input--box" placeholder="비밀번호 확인" autocomplete="off" id="password--check">
			<div id="key--check"></div>
			<input type="text" name="name" class="input--box" placeholder="이름을 입력해 주세요"  autocomplete="off" id="name--box" value="${memberBean.name }">
			<br>
			<div id="name--check"></div>
			<input type="date" name="birth" class="input--box" placeholder="출생년도" autocomplete="off" id="date--box">
			<br>
			<div>
				<div>
					<input type="text" class="input--box" id="address1" placeholder="주소" name="address1" readonly="readonly" style="width:300px;" autocomplete="off">
					<input type="button" class="sub--button" id="find--address--btn" onclick="postCode()" value="검색" style="width:50px; margin: 0; background-color: #BCE55C; border: 1px solid #BCE55C; color: #000;"><br>
				<br>
				</div>
				
				<input type="text" class="input--box" id="address2" name="address2"  placeholder="상세주소" autocomplete="off"><br>
				<br>
				<div id="detail--address--check"></div>
			</div>
			<input type="tel" name="mtel" id="tel--box" class="input--box" placeholder="전화번호를 입력해주세요" autocomplete="off">
			<div id="tel--check"></div>
			<br>
			<input type="submit" id="change--btn" class="sub--button" value="회원가입" >
			</form:form>
	</div>
</main>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	/* 우편번호 api 코드*/
    function postCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                let addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { 
                	// 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
	
   
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
/* 	function checkSubmit(checkEmail, checkPassword, checkName, 
			checkBirth, checkAddress, checkDetailAddress, checkTel) {
		if(checkEmail && checkPassword && checkName && checkBirth 
				&& checkAddress && checkDetailAddress && checkTel) {
			submitBtn.type = "submit";
		} else {
			submitBtn.type = "button";
		}
	}  */
	
	/* 비밀번호 확인란 검사 */
    passwordCheck.addEventListener("keyup", function() {
    	let passwordBoxValue = passwordBox.value;
    	let passwordCheckBoxValue = passwordCheck.value;
    	
    	if(passwordBoxValue.length < 6) {
			checkKey.textContent = "* 비밀번호는 6자리 이상이어야 합니다";
    		checkKey.style.color = "red";
    		checkKey.style.fontSize = "14px";
    		checkPassword = false;
    	} else {
	    	if(passwordBoxValue != passwordCheckBoxValue){
	    		checkKey.textContent = "* 비밀번호가 일치하지 않습니다";
	    		checkKey.style.color = "red";
	    		checkKey.style.fontSize = "14px";
	    		checkPassword = false;
	    	} else {
	    		checkKey.textContent = "* 비밀번호가 일치합니다";
	    		checkKey.style.color = "blue";
	    		checkKey.style.fontSize = "14px";
	    		checkPassword = true;
	    		checkSubmit(checkEmail, checkPassword, checkName, 
    					checkBirth, checkAddress, checkDetailAddress, checkTel)
	    	}
    	}
    });
    
	/* 비밀번호 확인칸 클릭했을 때 검사 */
    passwordCheck.addEventListener("click", function() {
    	let passwordBoxValue = passwordBox.value;
    	if(passwordBoxValue.length < 6) {
			checkKey.textContent = "* 비밀번호는 6자리 이상이어야 합니다";
    		checkKey.style.color = "red";
    		checkKey.style.fontSize = "14px";
    	}
    });
    
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
    
	/* 날짜칸 검사 */
    dateBox.addEventListener("change", function() {
    	checkBirth = true;
    });
    
	/* 주소 입력했는지 검사 */
    detailAddressBox.addEventListener("click", function() {
    	let addressBoxValue = addressBox.value;
    	if(addressBoxValue.length == 0) {
    		alert("주소 먼저 검색해주세요.");
    		let addressBtn = document.getElementById("find--address--btn");
    		addressBtn.focus();
    	}
    });
    
	/* 상세주소 검사 */
    detailAddressBox.addEventListener("keyup", function() {
    	let detailAddressBoxValue = detailAddressBox.value;
    	let addressBoxValue = addressBox.value;
    	if(detailAddressBoxValue.length == 0) {
    		address2Box.textContent = "* 상세주소를 입력해주세요";
    		address2Box.style.color = "red";
    		address2Box.style.fontSize = "14px";
    		checkDetailAddress = false;
    	} else {
    		address2Box.replaceChildren();
    		if(addressBoxValue.length != 0) {
    			checkAddress = true;
    		}
    		checkDetailAddress = true;
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