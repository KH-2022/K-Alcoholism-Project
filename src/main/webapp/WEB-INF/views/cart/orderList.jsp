<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<style type="text/css">
			.listResult .sum {
				float:right;
				width:45%; 
				font-size:22px;
				text-align: right;
				padding : 15px;
				background:#eee;
				margin-bottom: 30px;
			}
			.clear{clear:both;}
			#userDetails{margin-bottom: 30px;}
			#delivery{
				float:left;
				margin-bottom: 10px;
			}
			#updateBtn{
				float:right;
				margin-bottom: 10px;
			}
			#payBtn{margin-bottom: 30px;}
		</style>
		<script type="text/javascript">
			$(function(){
				/* 주문하기버튼 클릭시 처리이벤트 */
				$("#payBtn").click(function(){
					if(confirm("정말 주문하시겠습니까?")){
						let checkArr = new Array();
						
						$("#orderTable > tbody > tr").each(function(){
							checkArr.push({
								"pd_id": $(this).find("input[id='pd_id']").val(),
								"cart_count": $(this).find("input[id='cart_count']").val(),
								"pd_price": $(this).find("input[id='pd_price']").val(),
							});
						});
						
						$.ajax({
							url : "/order/save",
							type : "post",
							contentType: "application/json; charset=UTF-8",
							data : JSON.stringify(checkArr),
							success : function(result){
								if(result =="SUCCESS"){
									location.href="/order/complete"
								}
							}
						});	
					}
				});
				
				/*  회원정보수정 버튼 클릭시 처리이벤트 */
				$("#updateBtn").click(function(){
					location.href = "/myPage/add";
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
						<h1 class="heading" data-aos="fade-up">주문 내역 확인</h1>
					</div>
				</div>
			</div>
		</div>
		
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6 text-center mx-auto">
						<h2 class="complete font-weight-bold text-primary heading">주문서 작성</h2>
					</div>
				</div>
			</div>
			<div class="container">
				<%--============주문상세내역 시작===================== --%>
				<div><h4 class="font-weight-bold text-primary heading">1.주문상세내역</h4></div>
				
				<div id="orderDetails">
					<form name="orderDetailsForm" id="orderDetailsForm">
						<table class="table table-striped" id="orderTable">
							<thead>
							<tr>
								<th>주문상품명</th>
								<th>가격</th>
								<th>수량</th>
								<th>합계금액</th>
							</tr>
							</thead>
							<c:set var="sum" value="0"/>
							
							<tbody>
							<c:forEach items="${orderList}" var="order">
							<tr>
								<td>
									${order.pd_name}
									<input type="hidden" id="pd_id" value="${order.pd_id}"/>
									<input type="hidden" id="pd_price" value="${order.pd_price}"/>
									<input type="hidden" id="cart_count" value="${order.cart_count}"/>	
								</td>
								<td><fmt:formatNumber value="${order.pd_price}" pattern="####,###,###" />원</td>
								<td>${order.cart_count}개</td>
								<td><fmt:formatNumber value="${order.pd_price * order.cart_count}" pattern="####,###,###" />원</td>
							</tr>
							
							<c:set var="sum" value="${sum + (order.pd_price * order.cart_count)}" />
							</c:forEach>
							</tbody>
						</table>
						
						<div class="listResult">
							<div class="sum">
								 결제예정금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
							</div>
						</div>
					</form>
				</div>
				
				<div class="clear"></div>
				<%--============주문자 정보===================== --%>
				<div><h4 class="font-weight-bold text-primary heading">2.주문자 정보</h4></div>
					
				<div id="userDetails">
					<form name="userDetailsForm" id="userDetailsForm">
						<table class="table table-striped">
							<tr>
								<td>주문하시는분</td>
								<td><c:out value="${sessionScope.login.user_name}" /></td>
							</tr>
							<tr>
								<td>휴대폰번호</td>
								<td><c:out value="${sessionScope.login.user_tel}" /></td>
							</tr>
							<tr>
								<td>이메일주소</td>
								<td><c:out value="${sessionScope.login.user_email}" /></td>
							</tr>
						</table>
					</form>
				</div>
				
				<%--============배송 정보===================== --%>
				<div>
					<h4 id="delivery" class="font-weight-bold text-primary heading">3.배송정보</h4>
					<button type="button" class="btn btn-default" id="updateBtn">배송정보수정</button>
				</div>
				<div id="deliveryDetails">
					<form name="deliveryDetailsForm" id="deliveryDetailsForm">
						<table class="table table-striped">
							<tr>
								<td>받으실분</td>
								<td><c:out value="${sessionScope.login.user_name}" /></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><c:out value="${sessionScope.login.user_add}" /><c:out value="${sessionScope.login.user_detailAdd}" /></td>
							</tr>
							<tr>
								<td>휴대폰번호</td>
								<td><c:out value="${sessionScope.login.user_tel}" /></td>
							</tr>
						</table>
					</form>
				</div>
				
				<%--============주문하기===================== --%>
				<div class="contentBtn text-center">
					<button type="button" id="payBtn" class="btn btn-primary btn-lg">주문하기</button>
				</div>
			</div>
		</div>
	</body>
</html>