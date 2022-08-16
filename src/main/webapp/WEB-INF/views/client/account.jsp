<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<!-- CSS ============================================ -->
<!--===== Vendor CSS(Bootstrap & Icon Font) =====-->
<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/ionicons.min.css">
<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/fontawesome.min.css">
<!--===== Plugins CSS(All Plugins Files) =====-->
<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/animate.css">
<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/jquery-ui.min.css">
<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/default.css">
<!--====== Main Style CSS ======-->
<link rel="stylesheet" href="/resources/include/mypage/assets/css/style.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
		let errorMsg = "${errorMsg}";
		if(errorMsg != ""){
			alert(errorMsg);
			errorMsg = "";
		}
		
		let updateMsg = "${updateMsg}";
		if(updateMsg != ""){
			alert(updateMsg);
			updateMsg = "";
		}
		
		let WithdrawalMsg = "${WithdrawalMsg}";
		if(WithdrawalMsg != ""){
			alert(WithdrawalMsg);
			WithdrawalMsg = "";
		}
		
		
		$("#userUpdateForm").submit(function(){
			userUpdateForm.user_no.value="${login.user_no}";
			
			if($("#user_birth").val()==""){
				$("#birthMsg").text("생년월일을 입력하세요.").css("color","red");
			} else if(!(birthdayCheck.test($('#user_birth').val()))){
				$("#birthMsg").text("생년월일 규칙에 맞게 작성해주세요. ex)1994/02/05.").css("color","red");
				$("#user_id").val("");
				return false;
			} else {
				$("#birthMsg").text("");
			}
			
			if($("#user_email").val()==""){
				$("#emailMsg").text("이메일을 입력해주세요.").css("color","red");
			} else if(!(emailCheck.test($('#user_email').val()))){
				$("#emailMsg").text("이메일 규칙에 맞게 작성해주세요.").css("color","red");
				$("#user_email").val("");
				return false;
			} else if($("#emailCheck").val()=="Y"){
					if($("$user_email").val() == "${login.user_email}") return true;
				$("#user_email").val("");
				return false;
			} else {
				$("#emailMsg").text("");
			}
			
			if($("#user_oldPwd").val()==""){
				$("#oldPwdMsg").text("현재 비밀번호를 입력하세요.").css("color","red");
				return false;
			} else if($("#user_oldPwd").val() != ""){
				if($("#user_oldPwd").val() != "${login.user_pwd}") {
					$("#oldPwdMsg").text("현재 비밀번호와 일치하지 않습니다.").css("color","red");
					$("#user_oldPwd").val("");
					return false;
				}
			} else {
				$("#oldPwdMsg").text("");
			}
			
			if($("#user_pwd").val()==""){
				$("#pwdMsg").text("비밀번호를 입력하세요.").css("color","red");
				return false;
			} else if($("#user_pwd").val() != "" && $("#user_oldPwd").val() != "" && $("#pwdChk").val() != ""){
				if(!(passwdCheck.test($('#user_pwd').val()))) {
					$("#pwdMsg").text("대문자 포함 영문자 및 숫자로만 구성하여 8글자에서 16글자 이내로 입력해주세요.").css("color","red");
					$("#user_pwd").val("");
					return false;
				}
			} else if($("#user_pwd").val() == $("#user_oldPwd").val() || $("#pwdChk").val() == $("#user_oldPwd").val()){
				$("#pwdMsg").text("현재 비밀번호와 일치합니다. 다시 입력해주세요.").css("color","red");
				return false;
			} else if($("#user_pwd").val() == "" && $("#user_oldPwd").val() == "" && $("#pwdChk").val() == ""){
				$("#pwdMsg").text("");
				return false;
			}
			
			let pwd1 = $("#user_pwd").val();
			let pwd2 = $('#pwdChk').val();
			
			if($("#pwdChk").val()=="" && $("#user_pwd").val()!=""){
				$("#pwdChkMsg").text("비밀번호 확인을 입력하세요.").css("color","red");
				return false;
			} else if(pwd1 != "" && pwd2 != ""){
				if(!(pwd1 == pwd2)){
					$("#pwdChkMsg").text("비밀번호가 일치하지 않습니다.").css("color","red");
					$("#pwdChk").val("");
					return false;
				} else if(pwd1 == pwd2){
					if($("#user_pwd").val() == $("#user_oldPwd").val()) {
						$("#pwdMsg").text("현재 비밀번호와 일치합니다. 다시 입력해주세요.").css("color","red");
						return false;
					}
				$("#pwdChkMsg").text("비밀번호가 일치합니다.").css("color","green");
				}
			}
			
			$("#userUpdateForm").attr({
				"method" :"post",
				"action" : "/myPage/userUpdate"
			});
			
			
		}); // 회원정보 수정 종료
		
		var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,16}$/);
		var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var birthdayCheck = RegExp(/^((19|20)[0-9]{2})\/(0[1-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[0-1])$/);
		
		$("#user_birth").keyup(function(){
			if(!(birthdayCheck.test($('#user_birth').val()))){
				$("#birthMsg").text("생년월일 규칙에 맞게 작성해주세요. ex)1994/02/05").css("color","red");
			} else {
				$("#birthMsg").text("");
			}
		});
		
		$("#user_oldPwd").keyup(function(){
			if($("#user_oldPwd").val() != "${login.user_pwd}"){
				$("#oldPwdMsg").text("현재 비밀번호와 일치하지 않습니다").css("color","red");
			} else {
				$("#oldPwdMsg").text("");
			}
		});
		
		$("#user_pwd").keyup(function(){
			if(!(passwdCheck.test($('#user_pwd').val()))){
				console.log("user_pwd 체크"+$('#user_pwd').val());
				$("#pwdMsg").text("대문자 포함 영문자 및 숫자로만 구성하여 8글자에서 16글자 이내로 입력해주세요").css("color","red");
			} else {
				$("#pwdMsg").text("");
			}
		});
		
		$("#pwdChk").keyup(function(){
			let pwd1 = $("#user_pwd").val();
			let pwd2 = $('#pwdChk').val();
			
			if(pwd1 != "" || pwd2 != ""){
				if(pwd1 == pwd2){
					$("#pwdChkMsg").text("비밀번호가 일치합니다.").css("color","green");
				} else {
					$("#pwdChkMsg").text("비밀번호가 일치하지 않습니다.").css("color","red");
				}
			}
		});
		
		$("#user_email").focusout(function() {
    		var user_email = $("#user_email").val();
    		
    		$.ajax({
    			type : "post",
    			url : "/signUp/emailCheck",
    			contentType : "application/json",
    			data : JSON.stringify({"user_email" : user_email}),
    			success : function(data) {
					if(data == 0){ // 사용가능
						$("#emailMsg").text("");
						$("#emailCheck").val("");
					} else if("${login.user_email}" == user_email) {
						$("#emailMsg").text("기존 이메일 주소와 같습니다").css("color","green");
					} else {
						$("#emailMsg").text("중복된 이메일입니다").css("color","red");
						$("#emailCheck").val("Y");
					}
    				
    			},
    			error : function(status, error) {
    				alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");
    			}
    		});
    	});// 이메일 중복체크
		
		$("#pwdChk").keyup(function(){
			let pwd1 = $("#user_pwd").val();
			let pwd2 = $('#pwdChk').val();
			
			if(pwd1 != "" || pwd2 != ""){
				if(pwd1 == pwd2){
					$("#pwdChkMsg").text("비밀번호가 일치합니다.").css("color","green");
				} else {
					$("#pwdChkMsg").text("비밀번호가 일치하지 않습니다.").css("color","red");
				}
			}
		});
    	
		
		$("#user_email").keyup(function(){
			if(!(emailCheck.test($('#user_email').val()))){
				console.log("user_email 체크"+$('#user_email').val());
				$("#emailMsg").text("이메일 규칙에 맞게 작성해주세요.").css("color","red");
			} else {
				$("#emailMsg").text("");
			}
		});
		
		$("#pills-order-tab").click(function(){
			location.href = "/myPage/myPage";
		});
		$("#pills-rez-tab").click(function(){
			location.href = "/myPage/reserve";
		});
		$("#pills-qna-tab").click(function(){
			location.href = "/myPage/qna";
		});
		$("#pills-review-tab").click(function(){
			location.href = "/reply/reply";
		});
		$("#pills-account-tab").click(function(){
			location.href = "/myPage/accountCheck";
		});
		$("#pills-address-tab").click(function(){
			location.href = "/myPage/add";
		});
		$("#pills-withdrawal-tab").click(function(){
			location.href = "/myPage/withdrawal";
		});
		
	}); //메인 메서드 종료
	
</script>
</head>
<body>
	<!--====== Breadcrumb Part Start ======-->
	<div class="breadcrumb-area">
		<div class="container-fluid custom-container">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/">홈</a></li>
					<li class="breadcrumb-item active">마이페이지</li>
				</ol>
			</nav>
		</div>
		<!-- container -->
	</div>
	<!--====== Breadcrumb Part Ends ======-->
	<!--====== My Account Part Start ======-->
	
	<section class="my-account-area pt-10">
		<div class="container-fluid custom-container">
			<div class="row">
				<div class="col-xl-3 col-md-3">
					<div class="my-account-menu mt-30">
						<ul class="nav account-menu-list flex-column nav-pills" id="pills-tab" role="tablist">
							<li><a id="pills-order-tab" data-toggle="pill" href="#pills-order" role="tab" aria-controls="pills-order" aria-selected="false"><i class="far fa-shopping-cart"></i>배송 / 주문 상태 확인</a></li>
							<li><a id="pills-rez-tab" data-toggle="pill" href="#pills-rez" role="tab" aria-controls="pills-rez" aria-selected="true"><i class="far fa-map-marker-alt"></i>체험 예약 정보</a></li>
							<li><a id="pills-qna-tab" data-toggle="pill" href="#pills-qna" role="tab" aria-controls="pills-qna" aria-selected="false"><i class="far fa-question"></i>문의 목록</a></li>
							<li><a id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="false"><i class="far fa-comment-dots"></i>리뷰 목록</a></li>
							<li><a class="active" id="pills-account-tab" data-toggle="pill" href="#pills-account" role="tab" aria-controls="pills-account" aria-selected="false"><i class="far fa-user"></i>회원정보 수정</a></li>
							<li><a id="pills-address-tab" data-toggle="pill" href="#pills-address" role="tab" aria-controls="pills-address" aria-selected="false"><i class="far fa-map-marker-alt"></i>배송지 관리</a></li>
							<li><a id="pills-withdrawal-tab" data-toggle="pill" href="#pills-withdrawal" role="tab" aria-controls="pills-withdrawal" aria-selected="false"><i class="far fa-user"></i>회원탈퇴</a></li>
							<li><a href="/login/logout"><i class="far fa-sign-out-alt"></i>로그아웃</a></li>
						</ul>
					</div>
				</div>
				
					<div class="col-xl-8 col-md-9">	
					<div class="tab-content my-account-tab mt-30" id="pills-tabContent">
				
							<div class="tab-pane fade show active" id="pills-account" role="tabpanel" aria-labelledby="pills-account-tab">
							<form action="/myPage/myPage" id="userUpdateForm">
								<input type="hidden" name="user_no" id="user_no" value="${login.user_no}" /> 
									<div class="my-account-details account-wrapper">
										<h4 class="account-title">회원정보 상세 페이지</h4>
										<div class="account-details">
											<div class="row">
												<div class="col-md-6">
													<div class="single-form">
														<div>이름</div>
														<input type="text" id="user_name" name="user_name" value="${login.user_name}" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<div class="single-form">
														<div>생일</div>
														<input type="text" id="user_birth" name="user_birth" value="${login.user_birth}">
														<span id="birthMsg"></span>
													</div>
												</div>
												<div class="col-md-6">
													<div class="single-form">
														<div>연락처</div>
														<input type="text" id="user_tel" name="user_tel" value="${login.user_tel}" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<div class="single-form">
														<div>이메일</div>
														<input type="text" id="user_email" name="user_email" value="${login.user_email}" >
														<input type="hidden" id="emailCheck" name="emailCheck" value="" />
														<span id="emailMsg"></span>
													</div>
												</div>
												<div class="col-md-12">
													<div class="single-form">
														<h5 class="title">Password change</h5>
													</div>
												</div>
												<div class="col-md-12">
													<div class="single-form">
														<input type="password" id="user_oldPwd" name="user_Oldpwd" placeholder="현재 비밀번호">
														<span id="oldPwdMsg"></span>
													</div>
												</div>
												<div class="col-md-6">
													<div class="single-form">
														<input type="password" id="user_pwd" name="user_pwd" placeholder="새 비밀번호">
														<span id="pwdMsg"></span>
													</div>
												</div>
												<div class="col-md-6">
													<div class="single-form">
														<input type="password" id="pwdChk" name="pwdChk" placeholder="비밀번호 다시 입력">
														<span id="pwdChkMsg"></span>
													</div>
												</div>
												<div class="col-md-6">
													<div class="single-form">
														<button class="main-btn main-btn-2" type="submit" id="changeBtn">회원정보 수정</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>	
	</section>
	<!--====== My Account Part Ends ======-->
	<!--====== Features Banner Part Start ======-->
	<section class="features-banner-area pt-80 pb-100">
		<div class="container-fluid custom-container">
			<div class="features-banner-wrapper d-flex flex-wrap">
				<div class="single-features-banner d-flex">
					<div class="banner-icon">
						<img src="/resources/include/mypage/assets/images/icon1.png" alt="Icon">
					</div>
					<div class="banner-content media-body">
						<h3 class="banner-title">무료배송</h3>
						<p>전통주의는 대한민국 어디라도 무료배송입니다.</p>
					</div>
				</div>
				<!-- single features banner -->
				<div class="single-features-banner d-flex">
					<div class="banner-icon">
						<img src="/resources/include/mypage/assets/images/icon2.png" alt="Icon">
					</div>
					<div class="banner-content media-body">
						<h3 class="banner-title">24시간 운영</h3>
						<p>전통주의는 24시간 언제라도 열려있습니다.</p>
					</div>
				</div>
				<!-- single features banner -->
				<div class="single-features-banner d-flex">
					<div class="banner-icon">
						<img src="/resources/include/mypage/assets/images/icon3.png" alt="Icon">
					</div>
					<div class="banner-content media-body">
						<h3 class="banner-title">100% 환불</h3>
						<p>환불 요청 시 10일 이내에 반드시 환불해드립니다.</p>
					</div>
				</div>
				<!-- single features banner -->
				<div class="single-features-banner d-flex">
					<div class="banner-icon">
						<img src="/resources/include/mypage/assets/images/icon4.png" alt="Icon">
					</div>
					<div class="banner-content media-body">
						<h3 class="banner-title">교환 가능</h3>
						<p>제품에 문제가 발생했을 경우 반드시 교환해드립니다.</p>
					</div>
				</div>
				<!-- single features banner -->
				<div class="single-features-banner d-flex">
					<div class="banner-icon">
						<img src="/resources/include/mypage/assets/images/icon5.png" alt="Icon">
					</div>
					<div class="banner-content media-body">
						<h3 class="banner-title">안전 결제</h3>
						<p>전통주의는 안전 결제 서비스를 제공하고 있습니다.</p>
					</div>
				</div>
				<!-- single features banner -->
			</div>
			<!-- features banner wrapper -->
		</div>
		<!-- container -->
	</section>
</body>
</html>