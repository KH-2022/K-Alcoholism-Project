<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	    <!-- Custom styles for this template -->
	    <link href="/resources/include/dist/css/signin.css" rel="stylesheet">
	    <link href="/resources/include/dist/assets/css/helper.css" rel="stylesheet">
	    <link href="/resources/include/dist/assets/css/main.css" rel="stylesheet">	
	    
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
		</div>
	</body>
</html>
