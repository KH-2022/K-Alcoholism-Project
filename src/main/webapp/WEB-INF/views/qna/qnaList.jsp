<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">1:1 문의</h1>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 페이지 인포 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6 text-center mx-auto">
						<h2 class="font-weight-bold text-primary heading">문의 게시판</h2>
					</div>
				</div>
			</div>
		</div>
	
		<div class="container">
			<%--============ 문의게시판 리스트 시작===================== --%>
			<div id="qnaList" class="table-height">
				<table summary="게시판 리스트" class="table table-striped">
					<thead>
						<tr>
							<th data-value="qna_no" class="order text-center col-md-1">글번호</th>
							<th class="text-center col-md-4">글제목</th>
							<th class="order col-md-1">작성자</th>
							<th data-value="qna_date" class="order col-md-1">작성일</th>
						</tr>
					</thead>
					<tbody id="qnalist" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty qnaList}">
								<c:forEach var="qna" items="${qnaList}" varStatus="status">
									<tr class="qna" data-num="${qna.qna_no}">
										<td>${qna.qna_no}</td>	
										<td>${qna.qna_title}</td>	
										<td></td>
										<td>${qna.qna_date}</td>	
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<ul>
									<li>등록된 상품이 존재하지 않습니다.</li>	
								</ul>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>