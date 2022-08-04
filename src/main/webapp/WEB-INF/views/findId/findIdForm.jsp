<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<link href="/resources/include/dist/assets/css/helper.css" rel="stylesheet">
	    <link href="/resources/include/dist/assets/css/main.css" rel="stylesheet">
		<style>
			#modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
	        }
	        #modal .modal-window {
	            background: rgba( 0, 0, 0, 0.70 ); // 69, 139, 197
	            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
	            backdrop-filter: blur( 13.5px );
	            -webkit-backdrop-filter: blur( 13.5px );
	            border-radius: 10px;
	            border: 1px solid rgba( 255, 255, 255, 0.18 );
	            width: 400px;
	            height: 300px;
	            position: relative;
	            top: -100px;
	            padding: 10px;
	        }
	        #modal .title {
	            padding-left: 10px;
	            display: inline;
	            text-shadow: 1px 1px 2px gray;
	            color: white;
	            
	        }
	        #modal .title h2 {
	            display: inline;
	        }
	        #modal .close-area {
	            display: inline;
	            float: right;
	            padding-right: 10px;
	            cursor: pointer;
	            text-shadow: 1px 1px 2px gray;
	            color: white;
	        }
	        
	        #modal .content {
	            margin-top: 20px;
	            padding: 0px 10px;
	            text-shadow: 1px 1px 2px gray;
	            color: white;
	        }
		</style>
		<script type ="text/javascript">
			$(function(){
				$("#loginForm.btn").click(function(){
					location.href= "/client/login";
				})
				
				$("#findIdBtn").click(function(){
					
				var user_name=$('#user_name').val()
				var user_email=$('#user_email').val()
				
				$.ajax({
					url:"/findId/findId",
					type:"POST",
					data:{"user_name":user_name, "user_email":user_email} ,
					success:function(data){
						if(data == 0){
							$('#id_value').text("회원 정보를 확인해주세요!");
							$('#user_name').val('');
							$('#user_email').val('');
						} else {
							$('#id_value').text(data).css("color","green");
							$('#user_name').val('');
							$('#user_email').val('');
							
						}
					},
					 error:function(){
			                alert("에러입니다");
			            }
				});

					const modal = document.getElementById("modal")
					const btnModal = document.getElementById("findIdBtn")
			
					btnModal.addEventListener("click", e => {
					    modal.style.display = "flex"
					})
			
					    
					const closeBtn = modal.querySelector(".close-area")
					closeBtn.addEventListener("click", e => {
					    modal.style.display = "none"
					})
			
					modal.addEventListener("click", e => {
					    const evTarget = e.target
					    if(evTarget.classList.contains("modal-overlay")) {
					        modal.style.display = "none"
					    }
					})
				})
			});
		</script>
	</head>
	<body>
		<div class="page-section ">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb-30">
							<!-- Login Form s-->
							<form id="findId">
								<div class="findId-form">
									<h4 class="login-title">아이디 찾기</h4>
									<div class="row">
										<div class="col-md-12 col-12 mb-20">
											<label>이름</label>
											<input type="text" id="user_name" name="user_name" class="mb-0" placeholder="이름" required autofocus>
										</div>
										<div class="col-md-12 col-12 mb-20">
											<label>이메일</label>
											<input type="email" id="user_email" name="user_email" class="mb-0" placeholder="이메일" >
										</div>
										<div class="col-md-12 pl">
											<button class="register-button mt-0" type="button" id="findIdBtn">아이디 찾기</button>
											<button class="register-button mt-0" type="button" id="loginFormBtn" onclick="location.href='login.jsp'">로그인</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<div class="container">
					<div class="row">
						<div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb-30">
							<!-- Login Form s-->
							<form id="loginForm">
								<div class="login-form">
									<h4 class="login-title">비밀번호 찾기</h4>
									<div class="row">
										<div class="col-md-12 col-12 mb-20">
											<label>아이디</label>
											<input type="text" id="user_id" name="user_id" class="mb-0" placeholder="아이디" required autofocus>
										</div>
										<div class="col-md-12 col-12 mb-20">
											<label>이메일</label>
											<input type="email" id="user_email" name="user_email" class="mb-0" placeholder="이메일" >
										</div>
										<div class="col-md-12 pl">
											<button class="register-button mt-0" type="button" id="findIdBtn">비밀번호 찾기</button>
											<button class="register-button mt-0" type="button" id="loginFormBtn" >로그인</button>
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
