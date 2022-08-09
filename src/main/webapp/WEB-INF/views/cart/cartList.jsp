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
			.clear{
				clear:both;
			}
			#orderListBtn{
				float:right;
			}
			#cart_count{
				width:60px;
				height:30px;
			}
		</style>
		<script type="text/javascript">
			
			$(function(){
				
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
							error:function(xhr, textStatus, errorThrown){ //실행시 오류가 발생하였을 경우
								alert(textStatus + " (HTTP-" + xhr.status + "/" + errorThrown + ")");
								//alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요")
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
						if(confirm("정말 삭제하시겠습니까?")){
						
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
							error:function(xhr, textStatus, errorThrown){ //실행시 오류가 발생하였을 경우
								alert(textStatus + " (HTTP-" + xhr.status + "/" + errorThrown + ")");
								//alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요")
							},
							success :function(result){
								if(result == "SUCCESS"){
									location.href="/cart/cartList";
								}
							}
						});
						}
					});
				
				/*구매하기 버튼 클릭 시 처리 이벤트 
				$("#orderListBtn").click(function(){
					let pd_id = $("#pd_id").val();
					let cart_count = $("#cart_count").val();
					let pd_price = $("#pd_price").val();
					
					let details = [
						{
				            "pd_id": 1,
				            "pd_price": 1000,
				            "cart_count": 3
				        },
				        {
				            "pd_id": 2,
				            "pd_price": 1000,
				            "cart_count": 3
				        },
				        {
				            "pd_id": 3,
				            "pd_price": 1000,
				            "cart_count": 3
				        }
					];
					let data = {
						    "order" : {
						    	 "user_no": 1
						    },
						    "details": details
						};
						
						$.ajax({
							url : "/order/insert",
							type : "post",
							data : data,
							success : function(){
								alert("성공적으로 주문하였습니다.");
							},
							error : function(request,status,error){
								//alert("카드에 상품을 담는데 실패하였습니다.");
								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						});
					});
				});*/
			});//최상위
		</script>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_2.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">장바구니</h1>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 페이지 인포 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6 text-center mx-auto">
						<h2 class="font-weight-bold text-primary heading">장바구니 목록</h2>
					</div>
				</div>
			</div>
		</div>
	
		<div class="contentContainer container">
			<%--============장바구니 리스트 시작===================== --%>
			<div id="cartProduct">
				<table class="table table-striped text-center">
					<thead>
						<tr>
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
											<input type="hidden" id="pd_id" name="pd_id" value="${cart.pd_id}"/>
											<tr data-num="${cart.cart_no}">
												<td class="col-md-1">${cart.pd_name}</td>
												<td class="col-md-1"><fmt:formatNumber value="${cart.pd_price}" pattern="####,###,###" />원</td>
												<td>
													<input type="number" name="cart_count" min=0 id="cart_count" value="${cart.cart_count}" style="text-align:center;"/> 개												
												</td>
												
												<td class="col-md-1"><fmt:formatNumber value="${cart.pd_price * cart.cart_count}" pattern="####,###,###" />원</td>
												<td><button type="button" class="btn btn-default updateBtn" data-upno="${cart.cart_no}">수량수정</button></td>
												<td><button type="button" class="btn btn-default deleteBtn" data-delno="${cart.cart_no}">삭제</button></td>
											</tr>
										<c:set var="total" value="${total + (cart.pd_price * cart.cart_count)}" />	
									</c:forEach>
									<tr>
										<td colspan="6" class="sum">총합계 : <fmt:formatNumber value="${total}" pattern="####,###,###" /> 원</td>
									</tr>	
									<%-- <tr>
										<td colspan="6" class="sum"><input type="button" value="구매하기" id="orderListBtn" class="btn btn-default btn-lg"/></td>
									</tr> --%>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<div class="text-right">
				<input type="button" value="구매하기" id="orderListBtn" class="btn btn-default btn-lg"/>
			</div>
		</div>
	</body>
</html>