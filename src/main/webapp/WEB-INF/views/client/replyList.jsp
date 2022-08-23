<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<style>
			.over {
				width: 350px;
			}
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
				
				$(".pdReplyDelete").click(function() {
					let pd_review_no = $(this).parents("tr").attr("data-no");	
					$("#pd_review_no").val(pd_review_no);
					
					var choice = confirm("상품 리뷰를 삭제하시겠습니까?");
					if(choice){
						$("#pdReviewForm").attr({
							"method" :"post",
							"action" : "/reply/replyDelete"
						});
						$("#pdReviewForm").submit();
					} else {
						location.href = "/reply/replyList"
					}
					
				});
				
				$(".bReplyDelete").click(function() {
					let br_review_no = $(this).parents("tr").attr("data-no");	
					$("#br_review_no").val(br_review_no);
					
					var choice = confirm("양조장 체험 리뷰를 삭제하시겠습니까?");
					if(choice){
						$("#brReviewForm").attr({
							"method" :"post",
							"action" : "/reply/bReplyDelete"
						});
						$("#brReviewForm").submit();
					} else {
						location.href = "/reply/replyList"
					}
					
				});
				
			}); //메인 메서드 종료
				function replyUpdateForm(){
					$("#reviewForm").attr({
						"method" :"post",
						"action" : "/reply/replyUpdateForm"
					});
					$("#reviewForm").submit();
				}
			
				function bReplyUpdateForm(){
					$("#reviewForm").attr({
						"method" :"post",
						"action" : "/reply/bReplyUpdateForm"
					});
					$("#reviewForm").submit();
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
								<form id="brReviewForm">
									<input type="hidden" name="br_review_no" id="br_review_no" /> 
								</form>	
								
								<form id="pdReviewForm">
									<input type="hidden" name="pd_review_no" id="pd_review_no" /> 
								</form>	
									<div class="my-account-download account-wrapper">
										<div class="container">
											<ul class="tab_title">
												<li class="on account-table text-center mt-30 table-responsive">
													<a href="reply"> 리뷰 작성 </a>
												</li>
												<li class="on account-table text-center mt-30 table-responsive">
													<a href="replyList"> 작성한 리뷰 </a> 
												</li>
											</ul>
											
											<div id="viewReview" class="viewReview">
											<table class="table tab_cont">
											<c:choose>
												<c:when test="${not empty pdReplyList}">
												<thead class="head">
													<tr class="text-center" style=padding:40px;>
														<th class="col-md-2">사진</th>
														<th class="col-md-2">제품명</th>
														<th class="col-md-4">내용</th>
														<th class="col-md-2">날짜</th>
														<th class="col-md-2">수정/삭제</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="pdReply" items="${pdReplyList}" varStatus="status">
														<input type="hidden" name="pd_review_no" name="pd_review_no" value="${pdReply.pd_review_no}" />
														<tr class="text-center" data-no="${pdReply.pd_review_no}">
															<td>
																<c:if test="${not empty pdReply.pd_review_thumb}">
																	<img src="/uploadStorage/pdReview/thumbnail/${pdReply.pd_review_thumb}" />
																</c:if>
															</td>
															<td><a href="/product/productDetail?pd_id=${pdReply.pd_id}">${pdReply.pd_name}</a></td>
															<td class="over">${pdReply.pd_review_content}</td>
															<td>${pdReply.pd_review_date}</td>
															<td>
																<a href="replyUpdateForm?pd_review_no=${pdReply.pd_review_no}">수정</a> / 
																<a href="javascript:void(0);" class="pdReplyDelete">삭제</a>
															</td>
														</tr>
													</c:forEach>
												</c:when>
											<c:otherwise>
												<tr>
													<td colspan="6" class="tac text-center">등록된 상품 리뷰가 존재하지 않습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
												
							<hr />
												
														<table class="table tab_cont">
														<c:choose>
															<c:when test="${not empty brReplyList}">
															<thead class ="head">
																<tr class="text-center">
																	<th class="col-md-2">사진</th>
																	<th class="col-md-2">양조장</th>
																	<th class="col-md-4">내용</th>
																	<th class="col-md-2">날짜</th>
																	<th class="col-md-2">수정/삭제</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="brReply" items="${brReplyList}" varStatus="status">
																<input type="hidden" name="br_review_no" name="br_review_no" value="${brReply.br_review_no}" />
																	<tr class="text-center" data-no="${brReply.br_review_no}">
																		<td>
																			<c:if test="${not empty brReply.br_review_thumb}">
																				<img src="/uploadStorage/brReview/thumbnail/${brReply.br_review_thumb}" />
																			</c:if>
																		</td>
																		<td><a href="/brewery/breweryDetail?br_id=${brReply.br_id}">${brReply.br_name}</a></td>
																		<td class="over">${brReply.br_review_content}</td>
																		<td>${brReply.br_review_date}</td>
																		<td>
																			<a href="bReplyUpdateForm?br_review_no=${brReply.br_review_no}">수정</a> / 
																			<a href="javascript:void(0);" class="bReplyDelete">삭제</a>
																		</td>
																	</tr>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<tr>
																	<td colspan="6" class="tac text-center">등록된 체험장 리뷰가 존재하지 않습니다.</td>
																</tr>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
											</div>	
													
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