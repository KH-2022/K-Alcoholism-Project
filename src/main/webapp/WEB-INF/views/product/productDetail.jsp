<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				/* 탭 초기 설정 */
				$("#infoTab").parents("li").addClass("active");
				$("#tabContent").load("/tab/pdInfo?pd_id=${detail.pd_id}");
				
				/* 장바구니 버튼 클릭 시 처리 이벤트 */
				$("#insertCartBtn").click(function(){
					let value = JSON.stringify({
						pd_id:$("#pd_id").val(),
						cart_count:$("#cart_count").val()
					});
					
					$.ajax({
						url : "/cart/insert",
						type : "post",
						headers : {
							"Content-Type":"application/json"
						},
						dataType : "text",
						data : value,
						error:function(xhr, textStatus, errorThrown){ //실행시 오류가 발생하였을 경우
							//alert(textStatus + " (HTTP-" + xhr.status + "/" + errorThrown + ")");
							alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요")
						},
						success :function(result){
							if(result =="5"){
								alert("로그인이 필요합니다.");
							}else if(result =="FAILURE"){
								alert("장바구니에 이미 추가되어있습니다.");
							} else if(result == "SUCCESS"){
								alert("장바구니에 상품이 등록되었습니다.");
								location.href="/cart/cartList";
							}
						}
					});
				});

				/* 구매하기 버튼 클릭 시 처리 이벤트 */
				$("#orderListBtn").click(function(){
					if(confirm("로그인이 필요합니다.")){
						let checkArr = new Array();
						
						checkArr.push({
							"pd_id": $("#pd_id").val(),
							"cart_count": $("#cart_count").val(),
							"pd_price": $("#pd_price").val(),
							"pd_name": $("#pd_name").val()
						});
						
						$.ajax({
							url : "/order/order",
							type : "post",
							contentType: "application/json; charset=UTF-8",
							data : JSON.stringify(checkArr),
							success : function(result){
								if(result =="SUCCESS"){
									location.href="/order/orderList"
								}
							}
						});	
					}
				});
				
				/* 상세정보 탭 클릭 시 처리 이벤트 */
				$("#infoTab").click(function() {
					$("#tabContent").load("/tab/pdInfo?pd_id=${detail.pd_id}");
					$(this).parents("ul").find("li").each(function() {
						$(this).removeClass("active");
					});
					$("#infoTab").parents("li").addClass("active");
				});
				
				/* 배송안내 탭 클릭 시 처리 이벤트 */
				$("#deliveryTab").click(function() {
					$("#tabContent").load("/tab/pdNotice");
					$(this).parents("ul").find("li").each(function() {
						$(this).removeClass("active");
					});
					$("#deliveryTab").parents("li").addClass("active");
				});
				
				/* 상품후기 탭 클릭시 처리 이벤트 */
				$("#reviewTab").click(function() {
					$("#tabContent").load("/tab/pdReview?pd_id=${detail.pd_id}");
					$(this).parents("ul").find("li").each(function() {
						$(this).removeClass("active");
					});
					$("#reviewTab").parents("li").addClass("active");
				});
			}); //$함수 종료 
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
								<c:if test="${not empty detail.pd_image}">
									<img src="/uploadStorage/product/${detail.pd_image}" class="img-fluid" />
								</c:if>
								<c:if test="${empty detail.pd_image}">
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
									<div class="mb-5"><input type="number" id="cart_count" name="cart_count" min="1" max="100" value="1" /></div>
									<div class="specs d-flex mb-5">
										<span class="d-block d-flex align-items-center">
											<span class="caption">배송비 3,000원</span>
										</span>
									</div>
									<div>
										<input type="hidden" id="pd_id" name="pd_id" value="${detail.pd_id}" />
										<button type="button" id="insertCartBtn" class="btn btn-primary">장바구니 담기</button>
										<button type="button" id="orderListBtn" class="btn btn-primary">구매하기</button>
									
									</div>
								</form>
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
					<li role="presentation"><a id="infoTab">상품 상세 정보</a></li>
					<li role="presentation"><a id="deliveryTab">배송 안내</a></li>
					<li role="presentation"><a id="reviewTab">상품 후기</a></li>
				</ul>
				<div class="row" id="tabContent">
				</div>
			</div>
		</div>
	</body>
</html>