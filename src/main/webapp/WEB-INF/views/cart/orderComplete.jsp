<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				/* 홈 버튼 클릭 시 처리 이벤트 */
				$("#homeBtn").click(function(){
					location.href = "/";
				});
				
				/* 상품 목록 버튼 클릭 시 처리 이벤트 */
				$("#productListBtn").click(function() {
					location.href = "/product/productList";
				});
				
				/* 주문내역 확인 버튼 클릭 시 처리 이벤트 */
				$("#orderListBtn").click(function() {
					location.href = "/myPage/myPage";
				});
			});
		</script>
		<style>
			.form-group > button {margin-right: 10px;}
		</style>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">전통주 마켓</h1>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 예약정보 확인 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6 text-center mx-auto">
						<h2 class="font-weight-bold text-primary heading">상품 주문이 완료되었습니다.</h2>
					</div>
				</div>
				<div class="row text-center">
					
				</div>
				
				<%-- 페이지 이동을 위한 버튼 --%>
				<div class="section">
					<div class="container">
						<div class="row align-items-center">
							<div class="form-group col-md-12 text-center">
								<button type="button" id="orderListBtn" class="btn btn-primary">주문내역 확인</button>
								<button type="button" id="productListBtn" class="btn btn-primary">전통주 목록으로</button>
								<button type="button" id="homeBtn" class="btn btn-primary">홈으로</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>