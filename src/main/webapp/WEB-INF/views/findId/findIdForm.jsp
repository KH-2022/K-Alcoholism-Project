<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<link href="/resources/include/dist/assets/css/helper.css" rel="stylesheet">
	    <link href="/resources/include/dist/assets/css/main.css" rel="stylesheet">
		<style>
			#modal.modal-overlay {
				margin: 300px;
				padding: 300px;
				z-index: 10000;
	            width: 1500px;
	            height: 1000px;
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
	            color: #FFFEF4;
	            text-align: center;
	        }
	        #modal .title h2 {
	            display: inline;
	        }
	        #modal .close-area {
	            display: inline;
	            float: right;
	            padding-right: 10px;
	            cursor: pointer;
	            color: white;
	        }
	        
	        #modal .content {
	            margin-top: 20px;
	            padding: 0px 10px;
	            color: white;
	            font-size: 30px;
	            line-height: normal;
	        }
		</style>
		<script type ="text/javascript">
			$(function(){
				$(".loginFormBtn").click(function(){
					location.href= "/login/login";
				})
				
				$("#findIdBtn").click(function(){
					
				var user_name=$('#user_name').val()
				var user_email=$('#user_email').val()
				
				$.ajax({
					type:"POST",
					url:"/findId/findId",
					data:{"user_name":user_name, "user_email":user_email} ,
					success:function(data){
						if(data == 0){
							if($("#user_name").val()==""){
								$("#id_value").text("이름을 입력하세요.").css("color","red");
							} else if($("#user_email").val()==""){
								$("#id_value").text("이메일을 입력하세요.").css("color","red");
							} else {
								$('#id_value').text("회원 정보를 바르게 입력 해주세요");
							}
							$('#user_name').val("");
							$('#user_email').val('');
						} else {
							$('#id_value').text(data).css("color","red");
							$('#user_name').val('');
							$('#user_email').val('');
							
						}
					},
					 error:function(){
			                alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");
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
					
				}) // 아이디 찾기
				
				$("#findPwdBtn").click(function(){
					
					$.ajax({
						type : "POST",
						url : "/findId/findPw",
						data : {
							"user_id" : $('#user_id').val(), 
							"user_email" : $('#user_email2').val()
						},
						success : function(data) {
								alert(data);
						},
						error:function(){
			                alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");
			            }
					})
				}); //비밀번호 찾기
			}); //메인 끝
		</script>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">아이디/비밀번호 찾기</h1>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modal" class="modal-overlay">
       		 <div class="modal-window">
           		 <div class="title">
               		 <h2 style="color:#FFFEF4;">아이디 조회 결과</h2>
           		 </div>
           	 <div class="close-area">X</div>
            <div class="content" id="id_value"></div>
  	      </div>
    	</div>
        
		<div class="page-section">
			 <div class="container">
				<div style="float: none; margin:100 auto;">
					<div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mt-100 mb-100" style="margin:0 auto; width:1200px; ">
						<!-- <form id="loginForm"> -->
							<h4 class="login-title">아이디 / 비밀번호 찾기</h4>
							<div class="login-form mt-30" style="display:flex; justify-content: space-between; padding:30px; width:1200px;">
								<div>
									<div class="col-md-12 col-12 mb-20 mt-30 mr-30">
										<label>이름</label>
										<input type="text" id="user_name" name="user_name" class="mb-0" placeholder="이름" required autofocus>
									</div>
									<div class="col-md-12 col-12 mb-20">
										<label>이메일</label>
										<input type="email" id="user_email" name="user_email" class="mb-0" placeholder="이메일" >
									</div>
									<div class="col-md-12 pl">
										<button class="register-button mt-0" type="button" id="findIdBtn">아이디 찾기</button>
										<button class="register-button mt-0 loginFormBtn" type="button">로그인</button>
									</div>
								</div>
								
								<div>
									<div class="col-md-12 col-12 mb-20 mt-30">
										<label>아이디</label>
										<input type="text" id="user_id" name="user_id" class="mb-0" placeholder="아이디" required autofocus>
									</div>
									<div class="col-md-12 col-12 mb-20">
										<label>이메일</label>
										<input type="email" id="user_email2" name="user_email2" class="mb-0" placeholder="이메일" >
									</div>
									<div class="col-md-12 pl">
										<button class="register-button mt-0" type="button" id="findPwdBtn">비밀번호 찾기</button>
										<button class="register-button mt-0 loginFormBtn" type="button">로그인</button>
									</div>
								</div>
								
							</div>
						<!-- </form> -->
					</div>
				</div>
			</div>  
		</div>
	</body>
</html>