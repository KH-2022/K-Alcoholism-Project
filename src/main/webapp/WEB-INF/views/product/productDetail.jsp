<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style type="text/css">
			#product-image{
				display: block;
  				width: 500px;
				float:left;
				margin-left: 10px;
				margin-right: 10px;
				margin-bottom: 30px;
			}
	    
			#detail-product{
				float:left;
				width:500px;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				/* 좋아요 버튼 클릭시 처리 이벤트 */
				$("#wishListBtn").click(function(){
					
				});
				
				/* 장바구니 버튼 클릭 시 처리 이벤트 */
				$("#addCartBtn").click(function(){
					
				});
				
				/* 구매하기 버튼 클릭 시 처리 이벤트 */
				$("#orderListBtn").click(function(){
					
				});
				
				
			});
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
		
		<div class="contentContainer container">
			<div><h3>상품 상세리스트</h3></div>
			
			<%--============삼품 상세 리스트 시작===================== --%>
			<div id="product-image">
				<img src="/resources/images/product/pd1.jpg"  class="img-responsive" alt="Responsive image"/>
			</div>
			
			<div id="detail-product">
				<table class="table">
					<tbody>
						<tr>
							<td>상품명</td>
							<td>${detail.pd_name}</td>
						</tr>
						<tr>
							<td>판매가</td>
							<td><fmt:formatNumber value="${detail.pd_price}" type="number" var="pd_price" />${pd_price}원</td>
						</tr>
						<tr>
							<td>배송비</td>
							<td>3,000원(3만원이상 결제시 무료배송)</td>
						</tr>
						<tr>
							<td>구매수량</td>
							<td>
								<select id="orders_count">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<%--============버튼 출력 시작===================== --%>
				<div class="contentBtn text-right">
					<input type="button" value="좋아요" id="wishListBtn" class="btn btn-success"/>
					<input type="button" value="장바구니" id="addCartBtn" class="btn btn-success"/>
					<input type="button" value="구매하기" id="orderListBtn" class="btn btn-success"/>
				</div>
			</div>
	
			
		</div>
	
	</body>
</html>