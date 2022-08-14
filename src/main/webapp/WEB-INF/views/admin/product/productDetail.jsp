<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				/* 수정 버튼 클릭시 처리이벤트 */
				$("#updateFormBtn").click(function() {
					$("#f_data").attr("action","/admin/product/updateForm")
					$("#f_data").submit();
				});
				
				/* 삭제 버튼 클릭시 처리이벤트 */
				$("#productDeleteBtn").click(function() {
					if (confirm("정말 삭제하시겠습니까?")){
						$("#f_data").attr("action","/admin/product/productDelete")
						$("#f_data").submit();
					}
				});
				
				/* 등록 버튼 클릭 시 처리 이벤트 */
				$("#insertFormBtn").click(function() {
					location.href = "/admin/product/writeForm";
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#productListBtn").click(function() {
					location.href = "/admin/product/productList";
				});		
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header text-center">
				<h2>전통주 상세 정보</h2>
			</div>
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="pd_id" value="${detail.pd_id}">
				<input type="hidden" name="pd_image" value="${detail.pd_image}" />
				<input type="hidden" name="pd_thumb" value="${detail.pd_thumb}" />
			</form>
		
			<%-- 버튼 --%>
			<div class="btnGroup contentBtn text-right">
					<input type="button" value="상품 수정" id="updateFormBtn" class="btn btn-primary" />
					<input type="button" value="상품 삭제" id="productDeleteBtn" class="btn btn-primary" />
					<input type="button" value="상품 등록" id="insertFormBtn" class="btn btn-primary" />
					<input type="button" value="상품 목록" id="productListBtn" class="btn btn-primary" />
			</div>
			
			<%-- 전통주 상세 --%>
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tr>
						<td class="col-md-2">상품ID</td>
						<td class="col-md-2 text-left">${detail.pd_id}</td>
						<td class="col-md-2">양조장ID</td>
						<td class="col-md-2 text-left">${detail.br_id}</td>
						<td class="col-md-2">양조장명</td>
						<td class="col-md-2 text-left">${detail.br_name}</td>
					</tr>
					<tr>
						<td class="col-md-2">상품명</td>
						<td class="col-md-2 text-left">${detail.pd_name}</td>
						<td class="col-md-2">판매가</td>
						<td class="col-md-2 text-left">
							<fmt:formatNumber value="${detail.pd_price}" type="number" var="pd_price" />${pd_price}원
						</td>
						<td class="col-md-2">등록일</td>
						<td class="col-md-2 text-left">${detail.pd_date}</td>
					</tr>
					<tr>
						<td class="col-md-2">상품분류</td>
						<td class="col-md-2 text-left">${detail.pd_sort}</td>
						<td class="col-md-2">도수</td>
						<td class="col-md-2 text-left">${detail.pd_degree}%</td>
						<td class="col-md-2">용량</td>
						<td class="col-md-2 text-left">${detail.pd_volume}ml</td>
					</tr>
					<tr>
						<td class="col-md-2">이미지</td>
						<td colspan="5" class="col-md-10 text-left">
							<c:if test="${not empty detail.pd_image}">
									<img class="detail-img" src="/uploadStorage/product/${detail.pd_image}" />
							</c:if>
							<c:if test="${empty detail.pd_image}">
								<img src="/resources/images/common/noImage.jpg" />
							</c:if>
						</td>
					</tr>
					<tr class="table-tr-height">
						<td class="col-md-2">상품 소개</td>
						<td colspan="5" class="col-md-10 text-left">${detail.pd_info}</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>