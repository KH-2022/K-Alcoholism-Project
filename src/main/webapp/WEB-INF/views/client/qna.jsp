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
		<link rel="stylesheet" href="/resources/include/css/star.css"/>
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
					location.href = "/myPage/account";
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
		<%-- 상단 디자인 영역 --%>
				<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
					<div class="container">
						<div class="row justify-content-center align-items-center">
							<div class="col-lg-9 text-center mt-5">
								<h1 class="heading" data-aos="fade-up">마이페이지</h1>
							</div>
						</div>
					</div>
				</div>
				
				
		<!--====== Breadcrumb Part Start ======-->
		<div class="breadcrumb-area">
			<div class="container-fluid custom-container">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">My Account</li>
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
					<div class="col-xl-3 col-md-4">
						<div class="my-account-menu mt-30">
							<ul class="nav account-menu-list flex-column nav-pills" id="pills-tab" role="tablist">
								<li><a id="pills-order-tab" data-toggle="pill" href="#pills-order" role="tab" aria-controls="pills-order" aria-selected="false"><i class="far fa-shopping-cart"></i>배송 / 주문 상태 확인</a></li>
								<li><a id="pills-rez-tab" data-toggle="pill" href="#pills-rez" role="tab" aria-controls="pills-rez" aria-selected="true"><i class="far fa-map-marker-alt"></i>체험 예약 정보</a></li>
								<li><a class="active" id="pills-qna-tab" data-toggle="pill" href="#pills-qna" role="tab" aria-controls="pills-qna" aria-selected="false"><i class="far fa-question"></i>문의 목록</a></li>
								<li><a id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="false"><i class="far fa-comment-dots"></i>댓글 목록</a></li>
								<li><a id="pills-account-tab" data-toggle="pill" href="#pills-account" role="tab" aria-controls="pills-account" aria-selected="false"><i class="far fa-user"></i>회원정보 수정</a></li>
								<li><a id="pills-address-tab" data-toggle="pill" href="#pills-address" role="tab" aria-controls="pills-address" aria-selected="false"><i class="far fa-map-marker-alt"></i>배송지 관리</a></li>
								<li><a id="pills-withdrawal-tab" data-toggle="pill" href="#pills-withdrawal" role="tab" aria-controls="pills-withdrawal" aria-selected="false"><i class="far fa-user"></i>회원탈퇴</a></li>
								<li><a href="/login/logout"><i class="far fa-sign-out-alt"></i>로그아웃</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-8 col-md-8">	
					<div class="tab-content my-account-tab mt-30" id="pills-tabContent">
						
							<div class="tab-pane fade show active" id="pills-qna" role="tabpanel" aria-labelledby="pills-qna-tab">
								<div class="my-account-download account-wrapper">
									<form id="editAddForm">
										<input type="hidden" name="user_no" id="user_no" value="${login.user_no}" /> 
											<h4 class="account-title">문의 목록</h4>
												<div class="account-table text-center mt-30 table-responsive">
													<table class="table">
														<thead>
															<tr>
																<th class="name">Product</th>
																<th class="date">Date</th>
																<th class="status">Expire</th>
																<th class="action">Download</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>Mostarizing Oil</td>
																<td>Aug 22,2020</td>
																<td>Yes</td>
																<td><a href="#">Download File</a></td>
															</tr>
															<tr>
																<td>Katopeno Altuni</td>
																<td>July 22,2020</td>
																<td>Never</td>
																<td><a href="#">Download File</a></td>
															</tr>
														</tbody>
													</table>
												</div>
										</form>
									</div>
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
							<h3 class="banner-title">Free Shipping</h3>
							<p>Free shipping on all Korea order</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon2.png" alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">Support 24/7</h3>
							<p>Contact us 24 hours a day</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon3.png" alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">100% Money Back</h3>
							<p>You have 30 days to Return</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon4.png" alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">90 Days Return</h3>
							<p>If goods have problems</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon5.png" alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">Payment Secure</h3>
							<p>We ensure secure payment</p>
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