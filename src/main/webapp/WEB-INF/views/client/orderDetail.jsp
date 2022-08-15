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
				let sendMsg = "${sendMsg}";
				if(sendMsg != ""){
					alert(sendMsg);
					sendMsg = "";
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
					location.href = "/myPage/accountCheck";
				});
				$("#pills-address-tab").click(function(){
					location.href = "/myPage/add";
				});
				$("#pills-withdrawal-tab").click(function(){
					location.href = "/myPage/withdrawal";
				});
				
			}); //함수 종료
			
		</script>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_2.jpg');">
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
		<form action=""></form>
		
		<!--====== My Account Part Start ======-->
		<section class="my-account-area pt-10">
			<div class="container-fluid custom-container">
				<div class="row">
					<div class="col-xl-3 col-md-4">
						<div class="my-account-menu mt-30">
							<ul class="nav account-menu-list flex-column nav-pills" id="pills-tab" role="tablist">
								<li><a class="active" id="pills-order-tab" data-toggle="pill" href="#pills-order" role="tab" aria-controls="pills-order" aria-selected="false"><i class="far fa-shopping-cart"></i>배송 / 주문 상태 확인</a></li>
								<li><a id="pills-rez-tab" data-toggle="pill" href="#pills-rez" role="tab" aria-controls="pills-rez" aria-selected="true"><i class="far fa-map-marker-alt"></i>체험 예약 정보</a></li>
								<li><a id="pills-qna-tab" data-toggle="pill" href="#pills-qna" role="tab" aria-controls="pills-qna" aria-selected="false"><i class="far fa-question"></i>문의 목록</a></li>
								<li><a id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="false"><i class="far fa-comment-dots"></i>리뷰 목록</a></li>
								<li><a id="pills-account-tab" data-toggle="pill" href="#pills-account" role="tab" aria-controls="pills-account" aria-selected="false"><i class="far fa-user"></i>회원정보 수정</a></li>
								<li><a id="pills-address-tab" data-toggle="pill" href="#pills-address" role="tab" aria-controls="pills-address" aria-selected="false"><i class="far fa-map-marker-alt"></i>배송지 관리</a></li>
								<li><a id="pills-withdrawal-tab" data-toggle="pill" href="#pills-withdrawal" role="tab" aria-controls="pills-withdrawal" aria-selected="false"><i class="far fa-user"></i>회원탈퇴</a></li>
								<li><a href="/login/logout"><i class="far fa-sign-out-alt"></i>로그아웃</a></li>
							</ul>
						</div>
					</div> 
	
					<div class="col-xl-8 col-md-8">
					<div class="tab-content my-account-tab mt-30" id="pills-tabContent">
					
					<div class="tab-pane fade show active" id="pills-order" role="tabpanel" aria-labelledby="pills-order-tab">
								<div class="my-account-order account-wrapper">
									<h4 class="account-title">주문 내역 상세</h4>
									<div class="account-table text-center mt-30 table-responsive">
									<c:choose>
										<c:when test="${not empty orderDetail}">
										
										<c:forEach var="order" items="${orderDetail}" begin="1" end="1">
											<div class="text-left"><h5>주문번호 ${order.order_no}</h5></div>
										</c:forEach>
										
										<hr />
										
										<table class="table">
											<thead>
												<tr>
													<th class="col-md-2">주문일</th>
													<th class="col-md-2">상품 사진</th>
													<th class="col-md-4">상품명</th>
													<th class="col-md-1">결제 금액</th>
													<th class="col-md-1">주문상태</th>
													<th class="col-md-1">기타</th>
												</tr>
											</thead>
													<tbody>
														<c:forEach var="order" items="${orderDetail}" varStatus="status">
															<tr class="text-center" data-num="${order.order_no}">
																<td>${order.order_date}</td>
																<td>
																	<c:if test="${not empty order.pd_thumb}">
																		<img src="/uploadStorage/product/thumbnail/${order.pd_thumb}" />
																	</c:if>
																</td>
																<td><a href="/product/productDetail?pd_id=${order.pd_id}">${order.pd_name}&nbsp;${order.cart_count}병</a></td>
																<td>${order.pd_price}원</td>
																<td>${order.order_state}</td>
																<c:if test="${order.order_state eq '주문 완료'}">
																	<td style=padding:0px;>
																		<a href="/reply/reply">주문취소</a>  
																	</td>
																</c:if>
																<c:if test="${order.order_state eq '배송 완료'}">
																	<td style=padding:0px;>
																		<a href="/reply/reply">리뷰작성</a> 
																	</td>
																</c:if>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											
											<hr />
											
											<div class="text-left"><h5>주문정보</h5></div>
											
											<hr />
											
											<table class="table">
											<thead>
												<tr>
													<th class="col-md-2">받는 분</th>
													<th class="col-md-2">핸드폰</th>
													<th class="col-md-4">주소</th>
												</tr>
											</thead>
													<tbody>
														<c:forEach var="order" items="${orderDetail}" begin="1" end="1">
															<tr class="text-center" data-num="${order.order_no}">
																<td>${order.user_name}</td>
																<td>${order.user_tel}</td>
																<td>(${order.user_postcode})&nbsp;${order.user_add}&nbsp;${order.user_detailadd}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											
											
											</c:when>
										</c:choose>
										
										
										
									</div>
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