<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				/* 제목 클릭시 상세페이지 이동을 위한 처리이벤트 */
				$(".goDetail").click(function(){
					let pd_id = $(this).parents(".property-item").attr("data-num");
					$("#pd_id").val(pd_id);
					
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/product/productDetail"
					});
					$("#detailForm").submit();
				});
				
				/* 페이징 처리 */
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				})
			}); // 함수 종료
			
			/* 게시물 검색을 위한 함수 */
			function goPage() {
				if($("#search").val() == "all") {
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method" : "get",
					"action" : "/product/productList"
				});
				$("#f_search").submit();
			}

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
	
		<%-- 페이지 인포 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6 text-center mx-auto">
						<h2 class="font-weight-bold text-primary heading">상품 목록</h2>
					</div>
				</div>
				
				<form id="detailForm">
					<input type="hidden" id="pd_id" name="pd_id" />
				</form>
			
				<%--============검색기능 시작===================== --%>
				<div class="row text-right">
					<form id="f_search" name="f_search" class="form-inline">
						<%-- 페이징 처리를 위한 파라미터 --%>
						<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
						<div class="form-group">
							<label>검색조건 </label>
							<select id="search" name="search">
								<option value="all">전체</option>
								<option value="pd_degree">도수</option>
								<option value="pd_price">가격</option>
								<option value="pd_sort">종류</option>
							</select>
							<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control" />
							<button type="button" id="searchData" class="btn btn-primary">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<%-- 전통주 리스트 --%>
		<div class="section section-properties">
			<div class="container">
				<div class="row">
					<c:choose>
					<c:when test="${not empty productList}">
						<c:forEach var="product" items="${productList}" varStatus="status">
							<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
								<div class="property-item mb-30" data-num="${product.pd_id}">
									<a class="img goDetail">
										<c:if test="${not empty product.pd_thumb}">
											<img src="/uploadStorage/product/thumbnail/${product.pd_thumb}" class="img-fluid" />
										</c:if>
										<c:if test="${empty product.pd_thumb}">
											<img src="/resources/images/common/noImage.jpg" class="img-fluid" />
										</c:if>
									</a>
									<div class="property-content">
										<div class="price mb-2">
											<span><fmt:formatNumber value="${product.pd_price}" type="number" var="pd_price" />${pd_price}원</span>
										</div>
										<div>
											<span class="d-block mb-2 text-black-50">${product.pd_sort}</span>
											<span class="city d-block mb-3">${product.pd_name}</span>
			
											<div class="specs d-flex mb-4">
												<span class="d-block d-flex align-items-center me-3">
													<span class="glyphicon glyphicon-tint me-2" aria-hidden="true"></span>
													<span class="caption">${product.pd_degree}%</span>
												</span>
												<span class="d-block d-flex align-items-center">
													<span class="glyphicon glyphicon-glass me-2" aria-hidden="true"></span>
													<span class="caption">${product.pd_volume}ml</span>
												</span>
											</div>
											<a class="btn btn-primary py-2 px-3 goDetail">더보기</a>
										</div>
									</div>
								</div> <!-- .item -->
							</div>
						</c:forEach>
					</c:when>
						<c:otherwise>
							<div>등록된 상품이 존재하지 않습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<%-- 페이징 처리 커스텀태그(pagination)를 정의 --%>
			<tag:pagination pageNum="${pageMaker.cvo.pageNum}" amount="${pageMaker.cvo.amount}"
							startPage="${pageMaker.startPage}" endPage="${pageMaker.endPage}"
							prev="${pageMaker.prev}" next="${pageMaker.next}" />
		</div>
	</body>
</html>