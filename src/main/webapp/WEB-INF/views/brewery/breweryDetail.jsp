<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		$(function() {
			$("#goReserveBtn").click(function() {
				$("#goReserveForm").attr({
					"method" : "get",
					"action" : "/brewery/reserveForm"
				});
				$("#goReserveForm").submit();
			});
		});
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
						<h1 class="heading" data-aos="fade-up">양조장 체험</h1>
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
								<c:if test="${not empty detail.br_thumb}">
									<img src="/uploadStorage/brewery/thumbnail/${detail.br_thumb}" class="img-fluid" />
								</c:if>
								<c:if test="${empty detail.br_thumb}">
									<img src="/resources/images/common/noImage.jpg" class="img-fluid" />
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<h2 class="heading text-primary mb-5">${detail.br_name}</h2>
						<p class="meta mb-5">${detail.br_addr}</p>
						<p class="text-black-50 mb-5">${detail.br_info}</p>
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
										<span class="caption">${detail.br_price}원</span>
									</span>
								</div>
								<div>
									<form id="goReserveForm">
										<input type="hidden" id="br_id" name="br_id" value="${detail.br_id}" />
										<input type="hidden" id="user_no" name="user_no" value="1" />
										<button type="button" id="goReserveBtn" class="btn btn-primary">예약하기</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>