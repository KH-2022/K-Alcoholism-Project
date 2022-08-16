<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
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
<<<<<<< HEAD
		<link rel="stylesheet" href="/resources/include/css/star.css" />
=======
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
		<script type ="text/javascript">
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
			
<<<<<<< HEAD
			$("#pdReplyinsertBtn").click(function(){
				if(!chkData("#pd_review_content","리뷰 내용을")) return;
=======
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/client/brReplyForm.jsp
			$("#brReplyinsertBtn").click(function(){
				if(!chkData("#br_review_content","리뷰 내용을")) return;
========
			$("#pdReplyinsertBtn").click(function(){
				if(!chkData("#pd_review_content","리뷰 내용을")) return;
>>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93:src/main/webapp/WEB-INF/views/client/pdReplyForm.jsp
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
				else {
					if($("#file").val() != ""){
						if(!chkFile($("#file"))) return;
					}
					
					$("#replyForm").attr({
						"method" :"post",
						"enctype" : "multipart/form-data",
<<<<<<< HEAD
						"action" : "/reply/replyInsert"
=======
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/client/brReplyForm.jsp
						"action" : "/reply/bReplyInsert"
========
						"action" : "/reply/replyInsert"
>>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93:src/main/webapp/WEB-INF/views/client/pdReplyForm.jsp
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
					});
					$("#replyForm").submit();
				}
			});
			
			//취소 버튼 클릭시
			$("#cancelBtn").click(function(){
				$("#replyForm").each(function(){
					this.reset();
				});
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
<<<<<<< HEAD
				<div class="col-xl-3 col-md-4">
=======
				<div class="col-xl-3 col-md-3">
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
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
<<<<<<< HEAD
				<div class="col-xl-8 col-md-8">	
=======
				<div class="col-xl-8 col-md-9">	
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
				<div class="tab-content my-account-tab mt-30" id="pills-tabContent">
	
				<div class="tab-pane fade show active" id="pills-account" role="tabpanel" aria-labelledby="pills-account-tab">
								<form id="replyForm">
									<input type="hidden" name="user_no" id="user_no" value="${login.user_no}" /> 
										<div class="my-account-details account-wrapper">
											<h4 class="account-title">(주)전통酒의 서비스 리뷰</h4>
											<div class="account-details">
												<div class="row">
												
												<c:choose>
<<<<<<< HEAD
=======
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/client/brReplyForm.jsp
												<c:when test="${not empty brReplyForm}">
												<input type="hidden" name="br_id" id="br_id" value="${brReplyForm.br_id}" />
												<input type="hidden" name="rsv_no" id="rsv_no" value="${reserve.rsv_no}" />
													<div class="col-md-6">
														<div class="single-form">
															<div><h5 style=font-weight:bold;>${brReplyForm.br_name} 체험 서비스</h5></div>
															<c:if test="${not empty brReplyForm.br_thumb}">
																	<img src="/uploadStorage/brewery/thumbnail/${brReplyForm.br_thumb}" />
========
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
												<c:when test="${not empty pdReplyForm}">
												<input type="hidden" name="pd_id" id="pd_id" value="${pdReplyForm.pd_id}" />
												<input type="hidden" name="orderdetail_no" id="orderdetail_no" value="${pdReplyForm.orderdetail_no}" />
													<div class="col-md-6">
														<div class="single-form">
															<div><h5 style=font-weight:bold;>${pdReplyForm.pd_name} 구매 리뷰</h5></div>
															<c:if test="${not empty pdReplyForm.pd_thumb}">
																	<img src="/uploadStorage/product/thumbnail/${pdReplyForm.pd_thumb}" />
<<<<<<< HEAD
=======
>>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93:src/main/webapp/WEB-INF/views/client/pdReplyForm.jsp
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
															</c:if>
														</div>
													</div>
													
													<!-- <div class="col-md-12">
														<div class="single-form">
															<div>별찍기란</div>
														</div>
													</div> -->
													
													<div class="col-md-12">
														<div class="single-form">
															<div>상세 리뷰</div>
<<<<<<< HEAD
															<textarea name="pd_review_content" id="pd_review_content" class="form-control"  rows="8"></textarea>
=======
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/client/brReplyForm.jsp
															<textarea name="br_review_content" id="br_review_content" class="form-control"  rows="8"></textarea>
========
															<textarea name="pd_review_content" id="pd_review_content" class="form-control"  rows="8"></textarea>
>>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93:src/main/webapp/WEB-INF/views/client/pdReplyForm.jsp
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
															<span id="textMsg"></span>
														</div>
													</div>
													
													<div class="col-md-12">
														<div class="single-form mt-25">
															<div>사진 첨부</div>
															<input type="file" id="file" name="file" />
														</div>
													</div>
													
													<div class="col-md-6">
														<div class="single-form">
															<button class="main-btn main-btn-2" type="button" id="cancelBtn">취소하기</button>
<<<<<<< HEAD
=======
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/client/brReplyForm.jsp
															<button class="main-btn main-btn-2" type="button" id="brReplyinsertBtn">등록하기</button>
														</div>
													</div>
												 </c:when>
												</c:choose>
												
												
========
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
															<button class="main-btn main-btn-2" type="button" id="pdReplyinsertBtn">등록하기</button>
														</div>
													</div>
												</c:when>
												</c:choose>
												
<<<<<<< HEAD
=======
>>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93:src/main/webapp/WEB-INF/views/client/pdReplyForm.jsp
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
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
<<<<<<< HEAD
		<section class="features-banner-area pt-80 pb-100">
=======
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/client/brReplyForm.jsp
<section class="features-banner-area pt-80 pb-100">
========
		<section class="features-banner-area pt-80 pb-100">
>>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93:src/main/webapp/WEB-INF/views/client/pdReplyForm.jsp
>>>>>>> bdcf5c1c1737f68cee75da9874946215a732fc93
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
