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
				/* 수정버튼 클릭시 처리이벤트 */
				$("#updateFormBtn").click(function() {
					$("#f_data").attr("action","/admin/product/updateForm")
					$("#f_data").submit();
				});
				
				/* 삭제버튼 클릭시 처리이벤트 */
				$("#productDeleteBtn").click(function() {
					confirm("정말 삭제하시겠습니까?");
					$("#f_data").attr("action","/admin/product/productDelete")
					$("#f_data").submit();
				});
					
				/* 글쓰기 버튼 클릭 시 처리 이벤트 */
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
				<h2>상품 관리</h2>
				<h4>상품 상세 페이지</h4>
			</div>
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="pd_id" value="${detail.pd_id}">
				<input type="hidden" name="pd_image" value="${detail.pd_image}" />
				<input type="hidden" name="pd_thumb" value="${detail.pd_thumb}" />
			</form>
		
			<%-- ===================== 버튼 추가 ===================== --%>
			<div class="contentBtn text-right">
					<input type="button" value="글수정" id="updateFormBtn" class="btn btn-success" />
					<input type="button" value="글삭제" id="productDeleteBtn" class="btn btn-success" />
					<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success" />
					<input type="button" value="목록" id="productListBtn" class="btn btn-success" />
				</div>
			
			<%-- ===================== 상품 상세 리스트 시작 ===================== --%>
			<div id="product-image">
				<c:if test="${not empty pd.pd_thumb}">
					<img class="listImage" src="/uploadStorage/product/thumbnail/${pd.pd_thumb}" />
				</c:if>
				<c:if test="${empty pd.pd_thumb}">
					<img class="listImage" src="/resources/images/common/noImage.jpg" />
				</c:if>
			</div>
			
			<div id="detail-product">
				<table class="table">
					<tbody>
						<tr>
							<td>상품번호</td>
							<td>${detail.pd_id}</td>
						</tr>
						<tr>
							<td>양조장 번호</td>
							<td>${detail.br_id}</td>
						</tr>
						<tr>
							<td>상품명</td>
							<td>${detail.pd_name}</td>
						</tr>
						<tr>
							<td>상품 가격</td>
							<td><fmt:formatNumber value="${detail.pd_price}" type="number" var="pd_price" />${pd_price}원</td>
						</tr>
						<tr>
							<td>상품 분류</td>
							<td>${detail.pd_sort}</td>
						</tr>
						<tr>
							<td>상품 도수(%)</td>
							<td>${detail.pd_degree}%</td>
						</tr>
						<tr>
							<td>상품 용량(ml)</td>
							<td>${detail.pd_volume}ml</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>