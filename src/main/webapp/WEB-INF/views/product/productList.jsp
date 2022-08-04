<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style type="text/css">
			ul{
				list-style:none;
				padding-left:0px;
			}
			#product-list{
			    margin-left: auto;
			    margin-right: auto;
			}
			#product{
			    display: block;
			    width: 225px;
			    text-align: center;
			    float:left;
			    margin-left: 10px;
			    margin-right: 10px;
			    margin-bottom: 30px;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				/* 제목 클릭시 상세페이지 이동을 위한 처리이벤트 */
				$(".goDetail").click(function(){
					let pd_id = $(this).parents("ul").attr("data-num");
					$("#pd_id").val(pd_id);
					console.log("상품아이디 : " + pd_id);
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/product/productDetail"
					});
					$("#detailForm").submit();
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
						<h1 class="heading" data-aos="fade-up">전통주 마켓</h1>
					</div>
				</div>
			</div>
		</div>
	
		<div class="contentContainer container">
			<div><h3>상품 리스트</h3></div>
			
			<form id="detailForm">
				<input type="hidden" id="pd_id" name="pd_id" />
			</form>
			
			<%--============================================= --%>
			
			
			<%--============삼품 리스트 시작===================== --%>
			<div id="products">
				<ul id="product-list">
					<c:choose>
						<c:when test="${not empty productList}">
							<c:forEach var="product" items="${productList}" varStatus="status">
								<ul id="product" data-num="${product.pd_id}">
									<li class="goDetail">
										<c:if test="${not empty product.pd_thumb}">
											<img src="/uploadStorage/product/thumbnail/${product.pd_thumb}" class="img-responsive" />
										</c:if>
										<c:if test="${empty product.pd_thumb}">
											<img src="/resources/images/common/noImage.jpg" />
										</c:if>
									</li>	
									<li class="goDetail">${product.pd_name}</li>	
									<li><fmt:formatNumber value="${product.pd_price}" type="number" var="pd_price" />${pd_price}원</li>	
								</ul>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<ul>
								<li>등록된 상품이 존재하지 않습니다.</li>	
							</ul>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			
		</div>
	</body>
</html>