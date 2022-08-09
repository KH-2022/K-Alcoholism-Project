<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style type="text/css">
			.page-setting {clear: both;}
		</style>
		<script type="text/javascript">
			$(function() {
				/* 지역 변경 시마다 처리할 이벤트 */
				$("#search").change(function() {
					$("#pageNum").val(1);
					goPage();
				});
				
				/* 지역 변경 후 초기화 방지 */
				$("#search").val("<c:out value='${data.search}' />");
				
				/* 양조장 클릭 시 상세 페이지 이동을 위한 처리 이벤트 */
				$(".goDetail").click(function() {
					let br_id = $(this).parents(".property-item").attr("data-num");
					$("#br_id").val(br_id);
					
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/brewery/breweryDetail"
					});
					$("#detailForm").submit();
				});
				
				/* 다음 페이지 클릭 시 */
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#sortForm").find("input[name='pageNum']").val($(this).attr("href")); //클릭한 <a>의 href 속성값을 가져와 form의 pageNum 파라미터값을 갱신
					goPage();
				});
			}); //$함수 종료
			
			/* 페이지 이동을 위한 함수 */
			function goPage() {
				$("#sortForm").attr({
					"method" : "get",
					"action" : "/brewery/breweryList"
				});
				$("#sortForm").submit();
			}
		</script>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">양조장 체험</h1>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 페이지 인포 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6 text-center mx-auto">
						<h2 class="font-weight-bold text-primary heading">양조장 목록</h2>
					</div>
				</div>
				
				<form id="detailForm">
					<input type="hidden" id="br_id" name="br_id" />
				</form>
				
				<%-- 카테고리 기능 --%>
				<div class="row text-left">
					<form id="sortForm" name="sortForm" class="form-inline">
						<%-- 페이징 처리를 위한 파라미터 --%>
						<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cvo.pageNum}">
						<input type="hidden" name="amount" name="amount" value="${pageMaker.cvo.amount}">
						<div class="form-group">
							<label>지역</label>
							<select id="search" name="search">
								<option value="">전체</option>
								<option value="seoul">서울</option>
								<option value="gyeonggi">경기</option>
								<option value="gangwon">강원</option>
								<option value="chungcheong">충청</option>
								<option value="gyeonsang">경상</option>
								<option value="jeolla">전라</option>
								<option value="jeju">제주</option>
							</select>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<%-- 양조장 리스트 --%>
		<div class="section section-properties">
			<div class="container">
				<div class="row">
					<c:choose>
					<c:when test="${not empty breweryList}">
						<c:forEach var="brewery" items="${breweryList}" varStatus="status">
							<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
								<div class="property-item mb-30" data-num="${brewery.br_id}">
									<a class="img goDetail">
										<c:if test="${not empty brewery.br_thumb}">
											<img src="/uploadStorage/brewery/thumbnail/${brewery.br_thumb}" class="img-fluid" />
										</c:if>
										<c:if test="${empty brewery.br_thumb}">
											<img src="/resources/images/common/noImage.jpg" class="img-fluid" />
										</c:if>
									</a>
									<div class="property-content">
										<div class="price mb-2"><span>${brewery.br_name}</span></div>
										<div>
											<span class="d-block mb-2 text-black-50">${brewery.br_addr}</span>
											<span class="city d-block mb-3">${brewery.br_program}</span>
			
											<div class="specs d-flex mb-4">
												<span class="d-block d-flex align-items-center me-3">
													<span class="glyphicon glyphicon-time me-2" aria-hidden="true"></span>
													<span class="caption">${brewery.br_time}분</span>
												</span>
												<span class="d-block d-flex align-items-center">
													<span class="glyphicon glyphicon-usd me-2" aria-hidden="true"></span>
													<span class="caption">
														<fmt:formatNumber value="${brewery.br_price}" type="number" var="br_price" />${br_price}원
													</span>
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
							<div>등록된 양조장이 존재하지 않습니다.</div>
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