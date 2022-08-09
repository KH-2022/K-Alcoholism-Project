<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				/* 장바구니 버튼 클릭 시 처리 이벤트 */
				$("#addCartBtn").click(function(){
					
				});
				
				/* 구매하기 버튼 클릭 시 처리 이벤트 */
				$("#orderListBtn").click(function(){
					
				});
			}); // 함수 종료 
		</script>
		
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">전통주 상품 상세</h1>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 전통주 상세 정보 --%>
		<div class="section">
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-lg-7">
						<div class="img-property-slide-wrap">
							<div class="img-property-slide">
								<c:if test="${not empty detail.pd_thumb}">
									<img src="/uploadStorage/product/thumbnail/${detail.pd_thumb}" class="img-fluid" />
								</c:if>
								<c:if test="${empty detail.pd_thumb}">
									<img src="/resources/images/common/noImage.jpg" class="img-fluid" />
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<h2 class="heading text-primary mb-5">${detail.pd_name}</h2>
						<p class="meta mb-2">판매가</p>
						<h2 class="heading text-primary mb-5">
							<fmt:formatNumber value="${detail.pd_price}" type="number" var="pd_price" />${pd_price}원
						</h2>
						<div class="specs d-flex mb-4">
							<span class="d-block d-flex align-items-center me-3">
								<span class="caption">${detail.pd_sort}</span>
							</span>
							<span class="d-block d-flex align-items-center me-3">
								<span class="glyphicon glyphicon-tint me-2" aria-hidden="true"></span>
								<span class="caption">${detail.pd_degree}%</span>
							</span>
							<span class="d-block d-flex align-items-center">
								<span class="glyphicon glyphicon-glass me-2" aria-hidden="true"></span>
								<span class="caption">${detail.pd_volume}ml</span>
							</span>
						</div>
						<div class="d-block agent-box p-5">
							<div class="text">
								<form id="productBuyForm">
									<h3 class="text-primary mb-3">구매수량</h3>
									<div class="mb-5"><input type="number" name="productCount" min="1" max="100" value="1" /></div>
									<div class="specs d-flex mb-5">
										<span class="d-block d-flex align-items-center">
											<span class="caption">배송비 3,000원<br/>3만원 이상 결제 시 무료배송</span>
										</span>
									</div>
									<div>
										<input type="hidden" id="pd_id" name="pd_id" value="${detail.pd_id}" />
										<button type="button" id="addCartBtn" class="btn btn-primary">장바구니 담기</button>
										<button type="button" id="orderListBtn" class="btn btn-primary">구매하기</button>
									
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>