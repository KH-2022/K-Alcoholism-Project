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
			
			$(".paginate_button a").click(function(e) {
				e.preventDefault(); //원래 가진 이벤트 처리 배제
				$("#searchForm").find("input[name='pageNum']").val($(this).attr("href")); //클릭한 <a>의 href 속성값을 가져와 form의 pageNum 파라미터값을 갱신
				goPage();
			});
			
			$(".orderDetail").click(function() {
				let order_no = $(this).parents("tr").attr("data-no");	
				$("#order_no").val(order_no);
				
				$("#orderDetailForm").attr({
					"method" : "get",
					"action" : "/myPage/orderDetail"
				});
				$("#orderDetailForm").submit();
			});
			
			
		}); //함수 종료
		
		function goPage() {
			$("#searchForm").attr({
				"method" : "get",
				"action" : "/myPage/myPage"
			});
			$("#searchForm").submit();
		}
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
				<form id="orderDetailForm">
					<input type="hidden" id="order_no" name="order_no" />
				</form>
			
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
						<form id="searchForm" name="searchForm" class="form-inline">
							<%-- 페이징 처리를 위한 파라미터 --%>
							<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
						</form>
							<div class="my-account-order account-wrapper">
								<h4 class="account-title">배송 / 주문 상태 확인</h4>
								<div class="account-table text-center mt-30 table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th class="col-md-1">주문번호</th>
												<th class="col-md-2">주문일</th>
												<th class="col-md-2">상품 사진</th>
												<th class="col-md-4">상품명</th>
												<th class="col-md-1">결제 금액</th>
												<th class="col-md-1">주문상태</th>
												<th class="col-md-1">기타</th>
											</tr>
										</thead>
										<c:choose>
											<c:when test="${not empty orderList}">
												<tbody>
													<c:forEach var="order" items="${orderList}" varStatus="status">
													
														<tr class="text-center" data-no="${order.order_no}">
															<td>${order.order_no}</td>
															<td>${order.order_date}</td>
															<td>
																<c:if test="${not empty order.pd_thumb}">
																	<img src="/uploadStorage/product/thumbnail/${order.pd_thumb}" />
																</c:if>
															</td>
															<td><a href="/product/productDetail?pd_id=${order.pd_id}">${order.pd_name}&nbsp; 
															<c:set var ="order_count" value="${orderCount[status.index].order_count-1}"/>
																 <c:if test="${order_count ne 0}">
																	외&nbsp;<c:out value="${order_count}" />건
																</c:if>
															</a></td>
															<td>${order.order_amount}</td>
															<td>${order.order_state}</td>
															<td style=padding:0px;>
																<a href="javascript:void(0);" class="orderDetail">상세 보기</a> 
															</td>
														</tr>
														
													</c:forEach>
														
													</c:when>
												<c:otherwise>
													<tr>
														<td colspan="6" class="tac text-center">구매한 상품이 존재하지 않습니다.</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
								<tag:pagination pageNum="${pageMaker.cvo.pageNum}" amount="${pageMaker.cvo.amount}"
								startPage="${pageMaker.startPage}" endPage="${pageMaker.endPage}"
								prev="${pageMaker.prev}" next="${pageMaker.next}" />
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