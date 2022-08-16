<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
		<!-- CSS ============================================ -->
		<!--===== Vendor CSS(Bootstrap & Icon Font) =====-->
		<link rel="stylesheet"
			href="/resources/include/mypage/assets/css/plugins/ionicons.min.css">
		<link rel="stylesheet"
			href="/resources/include/mypage/assets/css/plugins/fontawesome.min.css">
		<!--===== Plugins CSS(All Plugins Files) =====-->
		<link rel="stylesheet"
			href="/resources/include/mypage/assets/css/plugins/animate.css">
		<link rel="stylesheet"
			href="/resources/include/mypage/assets/css/plugins/jquery-ui.min.css">
		<link rel="stylesheet"
			href="/resources/include/mypage/assets/css/plugins/default.css">
		<!--====== Main Style CSS ======-->
		<link rel="stylesheet"
			href="/resources/include/mypage/assets/css/style.css">
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<style>
			hr{
				width:1000px;
			}
			li:hover{
				background-color: #666362;
				transition: all 0.65s;
				font-weight: bold;
			}
			a:link{
				color:black;
			}
			a:visited{
				color:black;
			}
			.brReviewForm:hover{
				color:red;
			}
			.tab_title li {
				font-size: 35 px;
				list-style: none;
				float: left;
				width: 500px;
				padding: 10px 15px;
				cursor: pointer;
				text-align: center;
				border: 1px solid #bebebe;
			}
			.tab_cont {
				clear: both;
				border: 1px solid #dedede;
				width: 1000px;
				height: auto;
			}
			.head {
				text-align: center;
				padding: 10px 15px;
				background-color: #D3D3D3;
			}
			
			.tab_cont div {
				display: none;
				text-align: center;
			}
			
			.tab_cont div.on {
				display: block;
			}
		</style>
		<script>
			$(function() {
		
				let errorMsg = "${errorMsg}";
				if (errorMsg != "") {
					alert(errorMsg);
					errorMsg = "";
				}
		
				let updateMsg = "${updateMsg}";
				if (updateMsg != "") {
					alert(updateMsg);
					updateMsg = "";
				}
		
				let WithdrawalMsg = "${WithdrawalMsg}";
				if (WithdrawalMsg != "") {
					alert(WithdrawalMsg);
					WithdrawalMsg = "";
				}
		
				$("#pills-order-tab").click(function() {
					location.href = "/myPage/myPage";
				});
				$("#pills-rez-tab").click(function() {
					location.href = "/myPage/reserve";
				});
				$("#pills-qna-tab").click(function() {
					location.href = "/myPage/qna";
				});
				$("#pills-review-tab").click(function() {
					location.href = "/reply/reply";
				});
				$("#pills-account-tab").click(function() {
					location.href = "/myPage/accountCheck";
				});
				$("#pills-address-tab").click(function() {
					location.href = "/myPage/add";
				});
				$("#pills-withdrawal-tab").click(function() {
					location.href = "/myPage/withdrawal";
				});
				
				$(".brReplyForm").click(function() {
					let br_id = $(this).parents("tr").attr("data-no");	
					$("#br_id").val(br_id);
					let rsv_no = $(this).parents("tr").attr("data-rsv");	
					$("#rsv_no").val(rsv_no);
					
					$("#replyDetailForm").attr({
						"method" : "get",
						"action" : "/reply/brReplyForm"
					});
					$("#replyDetailForm").submit();
				});
				
				$(".pdReplyForm").click(function() {
					let pd_id = $(this).parents("tr").attr("data-no");	
					$("#pd_id").val(pd_id);
					let orderdetail_no = $(this).parents("tr").attr("data-orderdetailNo");	
					$("#orderdetail_no").val(orderdetail_no);
					
					$("#replyDetailForm").attr({
						"method" : "get",
						"action" : "/reply/pdReplyForm"
					});
					$("#replyDetailForm").submit();
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
				
					<form id="replyDetailForm">
						<input type="hidden" id="orderdetail_no" name="orderdetail_no" />
						<input type="hidden" id="rsv_no" name="rsv_no" />
						<input type="hidden" id="br_id" name="br_id" />
						<input type="hidden" id="pd_id" name="pd_id" />
					</form>
					
					<div class="col-xl-3 col-md-3">
						<div class="my-account-menu mt-30">
							<ul class="nav account-menu-list flex-column nav-pills" id="pills-tab" role="tablist">
								<li><a id="pills-order-tab" data-toggle="pill" href="#pills-order" role="tab" aria-controls="pills-order" aria-selected="false"><i class="far fa-shopping-cart"></i>배송 / 주문 상태 확인</a></li>
								<li><a id="pills-rez-tab" data-toggle="pill" href="#pills-rez" role="tab" aria-controls="pills-rez" aria-selected="true"><i class="far fa-map-marker-alt"></i>체험 예약 정보</a></li>
								<li><a id="pills-qna-tab" data-toggle="pill" href="#pills-qna" role="tab" aria-controls="pills-qna" aria-selected="false"><i class="far fa-question"></i>문의 목록</a></li>
								<li><a class="active"id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="false"><i class="far fa-comment-dots"></i>리뷰 목록</a></li>
								<li><a id="pills-account-tab" data-toggle="pill" href="#pills-account" role="tab" aria-controls="pills-account" aria-selected="false"><i class="far fa-user"></i>회원정보 수정</a></li>
								<li><a id="pills-address-tab" data-toggle="pill" href="#pills-address" role="tab" aria-controls="pills-address" aria-selected="false"><i class="far fa-map-marker-alt"></i>배송지 관리</a></li>
								<li><a id="pills-withdrawal-tab" data-toggle="pill" href="#pills-withdrawal" role="tab" aria-controls="pills-withdrawal" aria-selected="false"><i class="far fa-user"></i>회원탈퇴</a></li>
								<li><a href="/login/logout"><i class="far fa-sign-out-alt"></i>로그아웃</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-8 col-md-9">	
					<div class="tab-content my-account-tab mt-30" id="pills-tabContent">
					
							<div class="tab-pane fade show active" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
								<div class="my-account-order account-wrapper">
									<h4 class="account-title">리뷰  관리</h4>
									
										<div class="account-table text-center mt-30 table-responsive">
											<ul class="tab_title">
												<li class="text-center mt-30">
													<a href="reply"> 리뷰 작성 </a> 
												</li>
												<li class="text-center mt-30 ">
													<a href="replyList"> 작성한 리뷰 </a>
												</li>
											</ul>
											
												<table class="table tab_cont">
												 <c:choose>
													<c:when test="${not empty orderManage}">
														<thead class="head">
															<tr class="text-center">
																<th class="col-md-2">구매일</th>
																<th class="col-md-3">제품사진</th>
																<th class="col-md-3">제품명</th>
																<th class="col-md-2">가격</th>
																<th class="col-md-2">작성</th>
															</tr>
														</thead>
															<tbody>
																<c:forEach var="order" items="${orderManage}" varStatus="status"> 
																	<input type="hidden" class="pd_id2" value="${order.pd_id}"/>
																	<tr class="text-center" data-no="${order.pd_id}" data-orderdetailNo="${order.orderdetail_no}">
																		<c:if test="${order.order_state eq '배송 완료'}">
																		<td>${order.order_date}</td>
																		<td>
																			<c:if test="${not empty order.pd_thumb}">
																				<img src="/uploadStorage/product/thumbnail/${order.pd_thumb}" />
																			</c:if>
																		</td>
																		<td style=font-weight:bold;><a href="/product/productDetail?pd_id=${order.pd_id}">${order.pd_name}&nbsp;${order.cart_count}병</a></td>
																		<td>각 ${order.pd_price}원</td>
																		<td style=font-weight:bold; >
																			<!-- <a href="javascript:void(0);" onclick="brReplyForm();">리뷰 작성</a>  -->
																			<a href="javascript:void(0);" class="pdReplyForm">리뷰 작성</a> 
																		</td>
																		</c:if> 
																	</tr>
												 				</c:forEach>
															 </c:when> 
													</c:choose>  
														<c:if test="${order.order_state eq '주문 완료'}">
															<tr>
																<td colspan="6" class="tac text-center">구매 내역은 존재하지 않습니다.</td>
															</tr>
														</c:if>
												</tbody>
											</table>
											
											<hr />
											
												<table class="table tab_cont">
												 <c:choose>
													<c:when test="${not empty reserveManage}">
														<thead class="head">
															<tr class="text-center">
																<th class="col-md-2">체험일</th>
																<th class="col-md-2">체험시간</th>
																<th class="col-md-4">양조장</th>
																<th class="col-md-2">예약자명</th>
																<th class="col-md-2">작성</th>
															</tr>
														</thead>
															<tbody>
																<c:forEach var="reserve" items="${reserveManage}" varStatus="status"> 
																	<input type="hidden" class="br_id2" value="${reserve.br_id}"/>
																	<tr class="text-center" data-no="${reserve.br_id}" data-rsv="${reserve.rsv_no}">
																		<c:if test="${reserve.rsv_state eq '체험 완료'}">
																		<td>${reserve.rsv_day}</td>
																		<td>${reserve.rsv_time}</td>
																		<td style=font-weight:bold;><a href="/brewery/breweryDetail?br_id=${reserve.br_id}">${reserve.br_name}</a></td>
																		<td>${reserve.rsv_name }</td>
																		<td style=font-weight:bold; >
																			<!-- <a href="javascript:void(0);" onclick="brReplyForm();">리뷰 작성</a>  -->
																			<a href="javascript:void(0);" class="brReplyForm">리뷰 작성</a> 
																		</td>
																		</c:if> 
																	</tr>
												 				</c:forEach>
															 </c:when> 
													</c:choose>  
														<c:if test="${reserve.rsv_state eq '예약 완료'}">
															<tr>
																<td colspan="6" class="tac text-center">체험 내역은 존재하지 않습니다.</td>
															</tr>
														</c:if>
												</tbody>
											</table>
											
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