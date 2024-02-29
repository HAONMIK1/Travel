<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('b146ce21a952f8b1ece8198d794201a4'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<!-- <script>

  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/ex/login.mb',
    });
  }

   function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function(res) {
        alert(JSON.stringify(res));
      })
      .catch(function(err) {
        alert(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }
  
  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }
 
  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
  
  $.ajax({
	    type : "POST"
	    , url : 'https://kauth.kakao.com/oauth/token'
	    , data : {
	        grant_type : 'authorization_code',
	        client_id : 'a7312a72eb52e0ad91f1fba159ec4eaa',
	        redirect_uri : 'http://localhost:8080/ex/login.mb',
	        code : kakaoCode
	    }
	    , contentType:'application/x-www-form-urlencoded;charset=utf-8'
	    , dataType: null
	    , success : function(response) {
	        Kakao.Auth.setAccessToken(response.access_token);
	        document.querySelector('button.api-btn').style.visibility = 'visible';
	    }
	    ,error : function(jqXHR, error) {

	    }
	});
  
 function requestUserInfo() {
	    Kakao.API.request({
	      url: '/v2/user/me',
	    })
	      .then(function(res) {
	        alert(JSON.stringify(res));
	      })
	      .catch(function(err) {
	        alert(
	          'failed to request user information: ' + JSON.stringify(err)
	        );
	      });
	  }
 function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response);
	        	  const id = response.id;
	        	  const nickname = response.properties.nickname;
	        	  const email = response.kakao_account.email;
	        	  $.ajax({
	        		  type : 'post',
	        		  url : 'user/kakaoLogin',
	        		  data : {"id" : id, "nickname" : nickname, "email" : email},
	        		  dataType : 'text',
	        		  success: function(result){
	        			  if(result=="ok"){
	        				  var newNickname = prompt('사용하실 닉네임을 입력해주세요');
	        				  if(newNickname != null){
	        					  $.ajax({
	        						  type : 'post',
	        						  url : 'kakaoSignUp',
	        						  data : {"id" : id, "nickname" : newNickname, "email": email}
	        					  });
	        					  alert(newNickname + "님 환영합니다.");
	        					  location.href = "/video/list";
	        				  }
	        				  else{
	        					  location.href = "/user/signin";
	        				  }
	        			  }
	        			  else{
	        				  $.ajax({
	        					  url : '/user/kakaoLogins',
	        					  data : {"id" : id},
	        					  dataType : 'text',
	        					  type : 'post',
	        					  success : function(data){
	        						  console.log(data);
	                				  alert(data + "님 반갑습니다.")
	                				  location.href = "/hotelList.mb";
	        					  }
	        				  })

	        			  }
	        		  }
	        		  
	        	  })
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }

 
</script> -->
    
<head>
<meta charset="UTF-8">
<style>
.login-page {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  background: #fff;
}
.login-page .login-content {
  width: 420px;
  padding: 40px;
  height: 500px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 1;
  position: absolute;
  background: #FFF;
  box-shadow: 0 0px 70px rgba(0, 0, 0, 0.1);
  border-top: 5px solid #7ac142;
  float: left;
  transition: all 0.2s ease-out;
  transition-delay: 0.2s;
}
.login-page .login-content.login-content-signin.ng-hide:not(.ng-hide-animate) {
  transition-delay: 0s;
  display: block!important;
  opacity: 0;
  z-index: -1;
  transform: translate(-45%, -50%);
}
.login-page .login-content.login-content-signup.ng-hide:not(.ng-hide-animate) {
  transition-delay: 0s;
  display: block!important;
  opacity: 0;
  z-index: -1;
  transform: translate(-55%, -50%);
}
.login-page .login-content h2 {
  text-align: left;
  color: #7ac142;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin: 0;
  font-size: 18px;
  font-weight: bold;
}
.login-page .login-content form.wrapper-box {
  margin-top: 40px;
}
.login-page .login-content form.wrapper-box input {
  margin-top: 20px;
  border: none;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 0;
  padding-left: 0;
  box-shadow: none;
  transition: all 0.1s ease-out;
}
.login-page .login-content form.wrapper-box input:valid {
  border-bottom: 1px solid #7ac142;
}
.login-page .login-content form.wrapper-box input:focus:invalid {
  border-bottom: 1px solid #EF6161;
}
.login-page .login-content form.wrapper-box ::-webkit-input-placeholder {
  color: rgba(0, 0, 0, 0.5);
}
.login-page .login-content form.wrapper-box :-moz-placeholder {
  color: rgba(0, 0, 0, 0.5);
}
.login-page .login-content form.wrapper-box ::-moz-placeholder {
  color: rgba(0, 0, 0, 0.5);
}
.login-page .login-content form.wrapper-box :-ms-input-placeholder {
  color: rgba(0, 0, 0, 0.5);
}
.login-page .login-content form.wrapper-box button {
  display: inline-block;
  margin-top: 50px;
  border: 2px solid #7ac142;
  background: #7ac142;
  border-radius: 25px;
  padding: 3px 12px 5px 12px;
  color: #fff;
  font-size: 14px;
  font-weight: bold;
  letter-spacing: 0px;
  transition: all 0.1s ease-out;
}
.login-page .login-content form.wrapper-box button:hover {
  color: #7ac142;
  background: #fff;
  border: 2px solid #7ac142;
}
.login-page .login-content form.wrapper-box button:active {
  box-shadow: none;
}
.login-page .login-content .outer-link {
  display: inline-block;
  margin-top: 50px;
  padding: 5px 0;
  display: block;
  color: rgba(0, 0, 0, 0.4);
  transition: all 0.1s ease-out;
}
.login-page .login-content .outer-link:hover {
  transition: all 0s ease-out;
  color: rgba(0, 0, 0, 0.8);
  text-decoration: none;
}
.login-page .login-content.login-content-signin > div,
.login-page .login-content.login-content-signup > div {
  overflow: hidden;
  top: 50%;
  position: relative;
  transform: translateY(-50%);
}
.login-page .login-content.login-content-signin {
  margin-left: -130px;
}
.login-page .login-content.login-content-signup {
  margin-left: 130px;
}
.login-page .login-switcher {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  width: 660px;
  height: 400px;
  box-shadow: 0 0px 20px rgba(0, 0, 0, 0.03);
}
.login-page .login-switcher > div {
  width: 40%;
  margin-top: 125px;
}
.login-page .login-switcher > div.login-switcher-signin {
  float: left;
}
.login-page .login-switcher > div.login-switcher-signup {
  float: right;
}
.login-page .login-switcher > div h3 {
  color: rgba(0, 0, 0, 0.4);
  text-align: center;
  font-size: 14px;
}
.login-page .login-switcher > div button {
  display: block;
  margin: 20px auto 0 auto;
  outline: 0;
  background: none;
  border: 2px solid rgba(0, 0, 0, 0.1);
  border-radius: 20px;
  color: rgba(0, 0, 0, 0.3);
  font-weight: bold;
  font-size: 14px;
  padding: 4px 12px 5px 12px;
  transition: all 0.1s ease-out;
}
.login-page .login-switcher > div button:hover {
  border: 2px solid #7ac142 !important;
  color: rgba(0, 0, 0, 0.8);
}
.login-page .login-switcher .login-switcher-signin,
.login-page .login-switcher .login-switcher-signup {
  transition: all 0.1s ease-out;
}
.login-page .login-switcher .login-switcher-signin.ng-hide:not(.ng-hide-animate),
.login-page .login-switcher .login-switcher-signup.ng-hide:not(.ng-hide-animate) {
  display: block!important;
  opacity: 0;
  transform: translateY(10px);
}

.login-content-signin .form-control-email,
.login-content-signin .form-control-password {
  width: 100%;
  max-width: 300px;
}

.login-content-signup .form-control-email,
.login-content-signup .form-control-password {
  width: 100%;
  max-width: 300px;
}
.login-content-signin .form-control-email,
.login-content-signin .form-control-password {
  height: 40px; 

}


</style>
<title>Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
</head>
<div class="login-page" ng-app="">

  <div class="login-content login-content-signin" ng-hide="showSignIn">
    <div>
      <h2>로그인</h2>
      <form class="wrapper-box" role="form"  ng-submit="login()" action="login.mb" method="post">
        <input type="email"
         name="email"
          ng-model="email"
          class="form-control form-control-email"
          placeholder="이메일을 입력하세요"
          required>
        <input type="password"
          ng-model="password"
           name="password"
          class="form-control form-control-password"
          placeholder="비밀번호를 입력하세요"
          required >
        <!-- <div class="checkbox pull-left">
          <label>
            <input type="checkbox"> Remember me.
          </label>
        </div> -->
        <a class="outer-link pull-left" href="findPassword.mb"><font size="2px">비밀번호를 잊으셨나요?</font></a>
        <button type="submit" class="btn btn-submit btn-default pull-right" style="width: 400px; height: 40px;">로그인</button>
        <br>
        <br>
    <%-- <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=20543122589b138f374315f3bbd94eb6&redirect_uri=http://localhost:8080/auth/kakaoLogin" id="kakao--button"><img alt="" src=" <%=request.getContextPath()%>/resources/images/카카오로그인.png" width="350px;"></a> --%>
        <a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=3ebf8bbbb7b91d2e8e34c1ae7d68f0db&redirect_uri=http://localhost:8080/ex/kakao-login.mb"> <%--id=rest api 키 넣 --%>
 		 <img src="<%=request.getContextPath() %>/resources/images/kakao_login_large_wide.png" width="400" height="50"
   			 alt="카카오 로그인 버튼" />
		</a>
			<p id="token-result"></p>
      </form>
    </div>
  </div>

  <div class="login-content login-content-signup ng-hide" ng-show="showSignIn">
    <div>
      <h2>나믿따와 함께 여정을 펼쳐보아요!</h2>
      <form class="wrapper-box" role="form" ng-submit="register()" action="join.mb" method="get">
        <button type="submit" class="btn btn-submit btn-default pull-right">가입하기</button>
      </form>
    </div>
  </div>



  <div class="login-switcher">
    <div class="login-switcher-signin" ng-show="showSignIn">
      <h3>이미 회원이신가요?</h3>
      <button ng-click="showSignIn=false">로그인하기</button>
    </div>
    <div class="login-switcher-signup" ng-hide="showSignIn">
      <h3>나믿따가 처음이신가요?</h3>
      <br>
      <button ng-click="showSignIn=true">가입하기</button>
    </div>
  </div>
</div>
<script>
        var app = angular.module('myApp', []);
        app.controller('myCtrl', function($scope) {
            $scope.showSignIn = true;
        });
    </script>
</body>
</html>