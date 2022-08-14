<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				/* 제목 클릭시 상세페이지 이동을 위한 처리이벤트 */
				$(".goDetail").click(function(){
					let order_no = $(this).parents("tr").attr("data-num");
					$("#order_no").val(order_no);
	
					$("#detailForm").attr({
						"method":"get",
						"action":"/admin/order/orderDetail"
					});
					$("#detailForm").submit();
				});
			});//최상위
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header"><h2 class="text-center">상품 주문 관리 목록</h2></div>
			
			<form id="detailForm">
				<input type="hidden" id="order_no" name="order_no"/>
			</form>
		
			<%-- ================= 주문 리스트 ================= --%>
			<div id="orderList" class="table-height">
				<table class="table table-striped">
					<thead>
						<tr>
							<th data-value="order_no" class="order text-center col-md-1">주문번호</th>
							<th class="text-center col-md-1">회원번호</th>
							<th class="text-center col-md-3">주문상태</th>
							<th class="text-center col-md-4">결제금액</th>
							<th data-value="rsv_fin_date" class="order text-center col-md-2">주문일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty orderList}">
								<c:forEach var="order" items="${orderList}" varStatus="status">
									<tr class="text-center" data-num="${order.order_no}">
										<td class="goDetail">${order.order_no}</td>
										<td class="goDetail">${order.user_no}</td>
										<td class="goDetail">${order.order_state}</td>
										<td class="goDetail"><fmt:formatNumber value="${order.order_amount}" type="number" var="order_price" />${order_price}원</td>
										<td>${order.order_date}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>		
	</body>
</html>