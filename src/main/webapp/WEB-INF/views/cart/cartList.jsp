<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style type="text/css">
			.sum{
				width:45%; 
				font-size:30px;
				text-align: right;
				padding : 15px;
				background:#eee;
				margin-bottom: 30px;
			}
			.clear{clear:both;}
			#orderListBtn{float:right;}
			#cart_count{
				width:60px;
				height:30px;
			}
			#orderListBtn{margin-bottom: 30px;}
		</style>
		<script type="text/javascript">
			$(function(){
				/* 전체체크-선택체크 처리 */
				$("#allCheck").click(function(){
					let chk = $("#allCheck").prop("checked");
					if(chk){
						$(".cartBox").prop("checked", true);
					}else{
						$(".cartBox").prop("checked",false);
					}
				});
				
				$(".cartBox").click(function(){
					$("#allCheck").prop("checked", false);
				});
				
				/* 수정버튼 클릭시 처리이벤트 */
				$(".updateBtn").click(function(){
					if(confirm("수량을 수정하시겠습니까?")){
						
						let value = JSON.stringify({
							cart_no:$(this).attr("data-upno"),
							cart_count:$("#cart_count").val()
						});
						
						$.ajax({
							url : "/cart/update",
							type : "post",
							headers : {
								"Content-Type":"application/json"
							},
							dataType : "text",
							data : value,
							error:function(xhr, textStatus, errorThrown){ 
								//alert(textStatus + " (HTTP-" + xhr.status + "/" + errorThrown + ")");
								alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요")
							},
							success :function(result){
								if(result == "SUCCESS"){
									location.href="/cart/cartList";
									
								}
							}
						});
					}
				});
				
				/* 삭제버튼 클릭시 처리이벤트 */
				$(".deleteBtn").click(function(){
					if(confirm("정말 삭제하시겠습니까?")) {
						let value = JSON.stringify({
							cart_no:$(this).attr("data-delno")
						});
						
						$.ajax({
							url : "/cart/delete",
							type : "post",
							headers : {
								"Content-Type":"application/json"
							},
							dataType : "text",
							data : value,
							error:function(xhr, textStatus, errorThrown){ 
								//alert(textStatus + " (HTTP-" + xhr.status + "/" + errorThrown + ")");
								alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요")
							},
							success :function(result){
								if(result == "SUCCESS"){
									location.href="/cart/cartList";
								}
							}
						});
					}
				});
				
				// 주문하기 버튼 클릭 시 처리 이벤트 
				$("#orderListBtn").click(function(){
					if(confirm("정말 주문하시겠습니까?")){
						let checkArr = new Array();
						
						$("input[class='cartBox']:checked").each(function(){
							checkArr.push({
								"pd_id": $(this).closest("tr").find("input[id='pd_id']").val(),
								"cart_count": $(this).closest("tr").find("input[id='cart_count']").val(),
								"pd_price": $(this).closest("tr").find("input[id='pd_price']").val(),
								"pd_name": $(this).closest("tr").find("input[id='pd_name']").val()
							});
						});
						
						$.ajax({
							url : "/order/order",
							type : "post",
							contentType: "application/json; charset=UTF-8",
							data : JSON.stringify(checkArr),
							success : function(result){
								if(result == "SUCCESS"){
									location.href="/order/orderList"
								}
							}
						});	
					}
				});
			});//최상위
		</script>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">장바구니</h1>
					</div>
				</div>
			</div>
		</div>
		
		<div class="section">
			<div class="container">
				<%--============장바구니 리스트 시작===================== --%>
				<div id="cartProduct">
					<table class="table table-striped text-center">
						<thead>
							<tr>
								<th class="allCheck"><input type="checkBox" name="allCheck" id="allCheck" /><label for="allCheck">모두선택</label></th>
								<th class="text-center">상품명</th>
								<th class="text-center">가격</th>
								<th class="text-center">수량</th>
								<th class="text-center">금액</th>
								<th class="text-center">취소</th>
								<th class="text-center">삭제</th>
							</tr>
						</thead>
						<tbody>	
							<c:choose>
								<c:when test="${not empty cartList}">	
									<c:set var="total" value="0"/>
										<c:forEach items="${cartList}" var="cart" varStatus="status">
												<tr data-num="${cart.cart_no}">
													
													
													<td class="checkBox"><input type="checkBox" name="cartBox" class="cartBox" data-cartNum="${cart.cart_no}" checked="checked" />
													<td class="col-md-1">${cart.pd_name}
													<input type="hidden" id="pd_id" name="pd_id" value="${cart.pd_id}"/>
													<input type="hidden" id="pd_price" name="pd_price" value="${cart.pd_price}"/>
													<input type="hidden" id="cart_count" name="cart_count" value="${cart.cart_count}"/>
													<input type="hidden" id="pd_name" name="pd_name" value="${cart.pd_name}"/>
													</td>
													<td class="col-md-1"><fmt:formatNumber value="${cart.pd_price}" pattern="####,###,###" />원</td>
													<td>
														<input type="number" name="cart_count"  min="1" max="100" id="cart_count" value="${cart.cart_count}"/> 개												
													</td>
													
													<td class="col-md-1"><fmt:formatNumber value="${cart.pd_price * cart.cart_count}" pattern="####,###,###" />원</td>
													<td><button type="button" class="btn btn-default updateBtn" data-upno="${cart.cart_no}">수량수정</button></td>
													<td><button type="button" class="btn btn-default deleteBtn" data-delno="${cart.cart_no}">삭제</button></td>
												</tr>
											<c:set var="total" value="${total + (cart.pd_price * cart.cart_count)}" />	
										</c:forEach>
										<tr>
											<td colspan="7" class="sum">총합계 : <fmt:formatNumber value="${total}" pattern="####,###,###" /> 원</td>
										</tr>	
										
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7" class="tac text-center">장바구니에 상품이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				
				<div class="form-group text-right">
					<button type="button" id="orderListBtn" class="btn btn-primary">주문하기</button>
				</div>
			</div>
		</div>
	</body>
</html>