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
		<form action=""></form>
		
		<!--====== My Account Part Start ======-->
		<section class="my-account-area pt-10">
			<div class="container-fluid custom-container">
				<div class="row">
					<div class="col-xl-3 col-md-3">
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
	
					<div class="col-xl-8 col-md-9">
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
													<th class="col-md-2 text-center">주문일</th>
													<th class="col-md-2 text-center">상품 사진</th>
													<th class="col-md-4 text-center">상품명</th>
													<th class="col-md-2 text-center">결제 금액</th>
													<th class="col-md-1 text-center">주문상태</th>
													<th class="col-md-1 text-center">기타</th>
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
																<td style=padding:0px;>
																<c:if test="${order.order_state eq '주문 완료'}">
																	<a href="/reply/reply">주문취소</a>
																</c:if>
																<c:if test="${order.order_state eq '배송 완료'}">
																	<a href="/reply/reply">리뷰작성</a>
																</c:if>
																</td>
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