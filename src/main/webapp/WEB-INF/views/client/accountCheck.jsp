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
				
				let sendMsg = "${sendMsg}";
				if(sendMsg != ""){
					alert(sendMsg);
					sendMsg = "";
				}
				
				$("#accountCheckBtn").click(function(){
						if($("#user_pwd").val() == ""){
							alert("비밀번호를 입력하세요.");
							$("#user_pwd").val("");
							$("#user_pwd").focus();
							return false;
						} else if($("#user_pwd").val() != "${login.user_pwd}"){
							alert("비밀번호가 틀렸습니다. 다시 입력해주세요.");
							$("#user_pwd").val("");
							$("#user_pwd").focus();
							return false;
						} else {
							$("#accountCheckForm").attr({
								"method" :"post",
								"action" : "/myPage/account"
							});
							$("#accountCheckForm").submit();
						}
				}); //AccountCheck 버튼 종료
				
				
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
							<div class="tab-pane fade show active" id="pills-withdrawal" role="tabpanel" aria-labelledby="pills-withdrawal-tab">
									<form id="accountCheckForm">
										<input type="hidden" name="user_no" id="user_no" value="${login.user_no}" />
										<div class="my-account-details account-wrapper">
											<h4 class="account-title">회원 정보 확인</h4>
											<div class="account-details">
												<div class="row">
													<div class="col-md-12">
														<div class="single-form">
															<h5 class="title">
																<c:if test="${not empty login}"> ${login.user_name}님의 회원 정보 보호를 위해 비밀번호를 입력하세요.
																</c:if>
													    	</h5>
														</div>
													</div>
													<div class="col-md-3">
														<div class="single-form">
															<input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호">
														</div>
													</div>
													<div class="col-md-12">
														<div class="single-form">
															<button class="main-btn main-btn-2" type="button" id="accountCheckBtn"><i class="far fa-edit"></i> 확인</button>
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