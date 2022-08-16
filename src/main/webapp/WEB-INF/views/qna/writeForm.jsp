<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				/* 저장 버튼 클릭 시 처리 이벤트 */
				$("#qnaInsertBtn").click(function() {
					// 입력값 체크
					if (!chkData("#qna_title", "제목을")) return;
					else if (!chkData("#qna_content", "내용을")) return;
					else {
						if($("#file").val() != "") {
							if (!chkFile($("#file"))) return;
						}
					
						$("#f_writeForm").attr({
							"method": "post",
							"enctype": "multipart/form-data",
							"action": "/qna/qnaInsert"
						});
						$("#f_writeForm").submit();
					}
				});
				
				/* 취소 버튼 클릭 시 처리 이벤트 */
				$("#qnaCancelBtn").click(function() {
					$("#f_writeForm").each(function() {
						this.reset();
					});
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
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
		
		<%-- 페이지 인포 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6 text-center mx-auto">
						<h2 class="font-weight-bold text-primary heading">글쓰기</h2>
					</div>
				</div>
			</div>
		</div>
	
		<div class="contentContainer container">

			<div class="contentTB text-center">
				<form id="f_writeForm" name="f_writeForm" class="form-horizontal">
					
					<%-- ===================== 버튼 추가 ===================== --%>
					<div class="form-group text-right">
						<input type="button" value="등록" id="qnaInsertBtn" class="btn btn-primary" />
						<input type="button" value="취소" id="qnaCancelBtn" class="btn btn-primary" />
						<input type="button" value="목록" id="qnaListBtn" class="btn btn-primary" />
					</div>
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>글제목</td>
								<td class="text-left"><input type="text" name="qna_title" id="qna_title" class="form-control" /></td>
							</tr>
							<tr>
								<td>글내용</td>
								<td class="text-left"><textarea name="qna_content" id="qna_content" class="form-control" rows="8"></textarea></td>
							</tr>
							<tr>
								<td>파일첨부</td>
								<td class="text-left"><input type="file" name="file" id="file" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</body>
</html>