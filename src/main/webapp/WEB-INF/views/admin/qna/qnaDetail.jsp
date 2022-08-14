<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style type="text/css">
			.contentHeight {height: 300px;}
		</style>
		<script type="text/javascript">
			$(function(){
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#qnaListBtn").click(function() {
					location.href = "/admin/qna/qnaList";
				});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header text-center">
				<h2>문의 글 상세</h2>
			</div>
			
			<%-- 버튼 --%>
			<div class="btnGroup contentBtn text-right">
				<input type="button" value="삭제" id="qnaDeleteBtn" class="btn btn-primary" />
				<input type="button" value="목록" id="qnaListBtn" class="btn btn-primary" />
			</div>
			
			<%-- 문의 글 상세 --%>
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tr>
						<td class="col-md-3">제목</td>
						<td class="col-md-3">${detail.qna_title}</td>
						<td class="col-md-3">등록일</td>
						<td class="col-md-3">${detail.qna_date}</td>
					</tr>
					<tr>
						<td class="col-md-3">작성자</td>
						<td class="col-md-3">${detail.user_id}</td>
						<td class="col-md-3">조회수</td>
						<td class="col-md-3">${detail.qna_readcnt}</td>
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
						<td colspan="3" class="col-md-9 text-left contentHeight">${detail.qna_content}</td>
					</tr>
				</table>
			</div>
			
			<%-- ================= 댓글 ================= --%>
			<jsp:include page="qnaReply.jsp" />
		</div>
	</body>
</html>