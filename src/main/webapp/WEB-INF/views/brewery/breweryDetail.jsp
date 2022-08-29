<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		$(function() {
			/* 탭 초기 설정 */
			$("#infoTab").parents("li").addClass("active");
			$("#tabContent").load("/tab/brInfo?br_id=${detail.br_id}");
			
			/* 예약하기 버튼 클릭 시 처리 이벤트 */
			$("#goReserveBtn").click(function() {
				$("#goReserveForm").attr({
					"method" : "post",
					"action" : "/brewery/reserveForm"
				});
				$("#goReserveForm").submit();
			});
			
			/* 상세정보 탭 클릭 시 처리 이벤트 */
			$("#infoTab").click(function() {
				$("#tabContent").load("/tab/brInfo?br_id=${detail.br_id}");
				$(this).parents("ul").find("li").each(function() {
					$(this).removeClass("active");
				});
				$("#infoTab").parents("li").addClass("active");
			});
			
			/* 배송안내 탭 클릭 시 처리 이벤트 */
			$("#deliveryTab").click(function() {
				$("#tabContent").load("/tab/brNotice");
				$(this).parents("ul").find("li").each(function() {
					$(this).removeClass("active");
				});
				$("#deliveryTab").parents("li").addClass("active");
			});
			
			/* 상품후기 탭 클릭시 처리 이벤트 */
			$("#reviewTab").click(function() {
				$("#tabContent").load("/tab/brReview?br_id=${detail.br_id}");
				$(this).parents("ul").find("li").each(function() {
					$(this).removeClass("active");
				});
				$("#reviewTab").parents("li").addClass("active");
			});
		}); //$함수 종료
	</script>
	<style>
		.specs .caption a {color: #00204A;}
	</style>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">양조장 상세</h1>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 양조장 상세 정보 --%>
		<div class="section">
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-lg-7">
						<div class="img-property-slide-wrap">
							<div class="img-property-slide">
								<c:if test="${not empty detail.br_image}">
									<img src="/uploadStorage/brewery/${detail.br_image}" class="img-fluid" />
								</c:if>
								<c:if test="${empty detail.br_image}">
									<img src="/resources/images/common/noImage.jpg" class="img-fluid" />
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<h2 class="heading text-primary mb-5">${detail.br_name}</h2>
						<p class="meta mb-5">${detail.br_addr} (${detail.br_region})</p>
						<div class="specs d-flex mb-4">
							<span class="d-block d-flex align-items-center me-3">
								<span class="glyphicon glyphicon-glass me-2" aria-hidden="true"></span>
								<span class="caption">${detail.br_type}</span>
							</span>
							<span class="d-block d-flex align-items-center me-3">
								<span class="glyphicon glyphicon-earphone me-2" aria-hidden="true"></span>
								<span class="caption">${detail.br_tel}</span>
							</span>
							<span class="d-block d-flex align-items-center">
								<span class="glyphicon glyphicon-link me-2" aria-hidden="true"></span>
								<c:if test="${not empty detail.br_site}">
									<span class="caption"><a href="${detail.br_site}" target="_blank">홈페이지</a></span>
								</c:if>
								<c:if test="${empty detail.br_site}">
									<span class="caption">홈페이지 없음</span>
								</c:if>
							</span>
						</div>
						<div class="d-block agent-box p-5">
							<div class="text">
								<h3 class="text-primary mb-4">체험 프로그램</h3>
								<div class="meta mb-3">${detail.br_program}</div>
								<div class="specs d-flex mb-5">
									<span class="d-block d-flex align-items-center me-3">
										<span class="glyphicon glyphicon-time me-2" aria-hidden="true"></span>
										<span class="caption">${detail.br_time}분</span>
									</span>
									<span class="d-block d-flex align-items-center">
										<span class="glyphicon glyphicon-usd me-2" aria-hidden="true"></span>
										<span class="caption">
											<fmt:formatNumber value="${detail.br_price}" type="number" var="br_price" />${br_price}원
										</span>
									</span>
								</div>
								<div class="form-group">
									<form id="goReserveForm">
										<input type="hidden" id="br_id" name="br_id" value="${detail.br_id}" />
										<input type="hidden" id="user_no" name="user_no" value="${login.user_no}" />
									</form>
									<button type="button" id="goReserveBtn" class="btn btn-primary">예약하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 상세페이지 탭 --%>
		<div class="section">
			<div class="container">
				<ul class="nav nav-tabs">
					<li role="presentation"><a id="infoTab">양조장 상세 정보</a></li>
					<li role="presentation"><a id="deliveryTab">체험 예약 안내</a></li>
					<li role="presentation"><a id="reviewTab">체험 후기</a></li>
				</ul>
				<div class="row" id="tabContent">
				</div>
			</div>
		</div>
	</body>
</html>