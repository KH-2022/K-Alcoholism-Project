<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){	
				/* 목록 버튼 클릭 시 처리 이벤트*/
				$("#boardListBtn").click(function(){
					location.href="/admin/order/orderList";
				});
				
				/* 삭제버튼 클릭시 처리이벤트 */
				$(".deleteBtn").click(function(){
						if(confirm("정말 삭제하시겠습니까?")){
						
						let value = JSON.stringify({
							orderDetail_no:$(this).attr("data-delno")
	
						});
						
						$.ajax({
							url : "/admin/order/delete",
							type : "post",
							headers : {
								"Content-Type":"application/json"
							},
							dataType : "text",
							data : value,
							error:function(xhr, textStatus, errorThrown){ //실행시 오류가 발생하였을 경우
								alert(textStatus + " (HTTP-" + xhr.status + "/" + errorThrown + ")");
								//alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요")
							},
							success :function(result){
								if(result == "SUCCESS"){
									location.href="/admin/order/orderDetail";
								}
							}
						});
						}
					});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header"><h2 class="text-center">주문내역 상세</h2></div>
			
			<div>
				<input type="button" value="주문목록" id="boardListBtn" class="btn btn-primary" />
			</div>

			<%--=================리스트 시작======================== --%>
			<div id="orderDetailList" class="table-height">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="order text-center col-md-1">주문번호</th>
							<th class="text-center col-md-3">주문상품아이디</th>
							<th class="text-center col-md-4">주문상품이름</th>
							<th class="text-center col-md-1">수량</th>
							<th class="order col-md-3">상품가격</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty orderDetail}">
								<c:forEach var="detail" items="${orderDetail}" varStatus="status">
									<tr class="text-center"> 
										<td class="text-center">${detail.order_no}</td>
										<td class="text-center">${detail.pd_id}</td>
										<td class="text-center">${detail.pd_name}</td>
										<td class="text-center">${detail.cart_count}</td>
										<td class="text-center"><fmt:formatNumber value="${detail.pd_price}" type="number" var="pd_price" />${pd_price}원</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>		
	</body>
</html>