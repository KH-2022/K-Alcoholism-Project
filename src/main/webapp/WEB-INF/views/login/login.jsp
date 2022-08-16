<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	    <!-- Custom styles for this template -->
	    <link href="/resources/include/dist/css/signin.css" rel="stylesheet">
	    <link href="/resources/include/dist/assets/css/helper.css" rel="stylesheet">
	    <link href="/resources/include/dist/assets/css/main.css" rel="stylesheet">	
	    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script type ="text/javascript">
			$(function(){
				let errorMsg = "${errorMsg}";
				if(errorMsg != ""){
					alert(errorMsg);
					errorMsg = "";
				}
				
				$("#loginBtn").click(function(){
					if(!chkData("#user_id","아이디를")) return;
					else if(!chkData("#user_pwd","비밀번호를")) return;
					else {
						$("#loginForm").attr({
							"method" :"post",
							"action" : "/login/login"
						});
						$("#loginForm").submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_2.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">로그인</h1>
					</div>
				</div>
			</div>
		</div>
	
		<div class="page-section ">
			<div class="container">
				<div class="row" style="float: none; margin:100 auto;">
					<div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mt-40 mb-40" style="float: none; margin:0 auto;">
						<!-- Login Form s-->
						<form id="loginForm">
							<div class="login-form">
								<h4 class="login-title">LOGIN</h4>
								<div class="row">
									<div class="col-md-12 col-12 mb-20">
										<label>ID*</label>
										<input type="text" id="user_id" name="user_id" class="mb-0" placeholder="아이디" required autofocus>
									</div>
									<div class="col-md-12 col-12 mb-20">
										<label>Password</label>
										<input type="password" id="user_pwd" name="user_pwd" class="mb-0" placeholder="비밀번호" >
									</div>
									<div class="col-md-4 mt-10 mb-20 text-left text-md-right">
										<a href="/findId/findIdForm">아이디/비밀번호 찾기</a>
									</div>
									<div class="col-md-12 pl">
										<button class="register-button mt-0" type="button" id="loginBtn">로그인</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			 <a id="kakao-login-btn"></a>
			    <a href="http://developers.kakao.com/logout">Logout</a>
			    <script type='text/javascript'>
			        //<![CDATA[
			        // 사용할 앱의 JavaScript 키를 설정해 주세요.
			        Kakao.init('a3e703bbf16637adf26471b31d45c63d');
			        // 카카오 로그인 버튼을 생성합니다.
			        Kakao.Auth.createLoginButton({
			            container: '#kakao-login-btn',
			            success: function (authObj) {
			                alert(JSON.stringify(authObj));
			            },
			            fail: function (err) {
			                alert(JSON.stringify(err));
			            }
			        });
			      //]]>
			    </script>
			<ul>
				<li onclick="kakaoLogin();">
			      <a href="javascript:void(0)">
			          <span>카카오 로그인</span>
			      </a>
				</li>
				<li onclick="kakaoLogout();">
			      <a href="javascript:void(0)">
			          <span>카카오 로그아웃</span>
			      </a>
				</li>
			</ul>
			<!-- 카카오 스크립트 -->
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
			Kakao.init('a3e703bbf16637adf26471b31d45c63d'); //발급받은 키 중 javascript키를 사용해준다.
			console.log(Kakao.isInitialized()); // sdk초기화여부판단
			//카카오로그인
			function kakaoLogin() {
			    Kakao.Auth.login({
			      success: function (response) {
			        Kakao.API.request({
			          url: '/v2/user/me',
			          success: function (response) {
			        	  console.log(response)
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
			//카카오로그아웃  
			function kakaoLogout() {
			    if (Kakao.Auth.getAccessToken()) {
			      Kakao.API.request({
			        url: '/v1/user/unlink',
			        success: function (response) {
			        	console.log(response)
			        },
			        fail: function (error) {
			          console.log(error)
			        },
			      })
			      Kakao.Auth.setAccessToken(undefined)
			    }
			  }  
			</script>
			
		</div>
	</body>
</html>
