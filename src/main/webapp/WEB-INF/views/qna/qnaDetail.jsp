<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style type="text/css">
			.contentHieght {height: 300px;}
			.detail-img {max-width: 800px;}
			.table>tbody>tr>td {vertical-align: middle;}
			.td-content {
				min-height: 200px;
				margin-top: 15px;
				margin-bottom: 40px;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				/* 수정 버튼 클릭시 처리이벤트 */
				$("#updateFormBtn").click(function() {
					$("#f_data").attr("action","/qna/updateForm")
					$("#f_data").submit();
				});
				
				/* 삭제 버튼 클릭시 처리이벤트 */
				$("#qnaDeleteBtn").click(function() {
					if (confirm("정말 삭제하시겠습니까?")) {
						$("#f_data").attr("action","/qna/qnaDelete")
						$("#f_data").submit();
					}
				});
				
				/* 문의하기 버튼 클릭 시 처리 이벤트 */
				$("#insertFormBtn").click(function() {
					location.href = "/qna/writeForm";
				});
				
				/* 문의목록 버튼 클릭 시 처리 이벤트 */
				$("#qnaListBtn").click(function() {
					location.href = "/qna/qnaList";
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
						<h1 class="heading" data-aos="fade-up">1:1 문의</h1>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 버튼 --%>
		<div class="section">
			<div class="container">
				<div class="text-left form-group">
					<form name="f_data" id="f_data" method="post">
						<input type="hidden" name="qna_no" value="${detail.qna_no}">
						<input type="hidden" name="qna_file" value="${detail.qna_file}" />
						<input type="hidden" name="qna_thumb" value="${detail.qna_thumb}" />
					</form>
					<c:if test="${login.user_id eq detail.user_id}">
						<button type="button" id="updateFormBtn" class="btn btn-primary">수정</button>
						<button type="button" id="qnaDeleteBtn" class="btn btn-primary">삭제</button>
					</c:if>
					<button type="button" id="insertFormBtn" class="btn btn-primary">새 문의하기</button>
					<button type="button" id="qnaListBtn" class="btn btn-primary">문의 목록</button>
				</div>
			</div>
		</div>
		
		<div class="contentContainer container">
			<%-- 문의 글 상세 --%>
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="col-md-3">제목</td>
							<td class="col-md-3 text-left">${detail.qna_title}</td>
							<td class="col-md-3">등록일</td>
							<td class="col-md-3 text-left">${detail.qna_date}</td>
						</tr>
						<tr>
							<td class="col-md-3">작성자</td>
							<td class="col-md-3 text-left">${detail.user_id}</td>
							<td class="col-md-3">조회수</td>
							<td class="col-md-3 text-left">${detail.qna_readcnt}</td>
						</tr>
						<c:if test="${not empty detail.qna_file}">
							<tr>
								<td class="col-md-3">첨부 이미지</td>
								<td colspan="3" class="col-md-9 text-left">
									<img class="detail-img" src="/uploadStorage/qna/${detail.qna_file}" />
								</td>
							</tr>
						</c:if>
						<tr>
							<td class="col-md-3">내용</td>
							<td colspan="3" class="col-md-9 text-left">
								<div class="td-content">
									${detail.qna_content}
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<%-- ================= 댓글 ================= --%>
			<jsp:include page="qnaReply.jsp" />
		</div>
	</body>
</html>