<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style type="text/css">
			#item-template { display: none; }
		</style>
		<script type="text/javascript">
			$(function() {
				/* 댓글 목록 보여주기 */
				let qna_no = ${detail.qna_no};
				listAll(qna_no);
				
				/* 글입력을 위한 Ajax 연동 처리 */
				$(document).on("click", "#replyInsertBtn", function() {
					let insertUrl = "/qnaReply/qnaReplyInsert";
					
					/* JSON.stringify() : Javascript 값이나 객체를 JSON 문자열로 반환 */
					let value = JSON.stringify({
						qna_no: qna_no,
						qna_re_content: $("#qna_re_content").val()
					});
					
					$.ajax({
						url : insertUrl, 	// 전송 url
						type : "post", 		// 전송 시 method 방식
						headers : {
							"Content-Type" : "application/json"
						},
						dataType : "text",
						data : value,
						error : function(xhr, textStatus, errorThrown) { // 실행 시 오류가 발생하였을 경우
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
						},
						beforeSend: function() {
							if(!chkData("#qna_re_content", "댓글 내용을")) return false;
						},
						success : function(result) {
							if(result == "SUCCESS") {
								alert("댓글 등록이 완료되었습니다.");
								dataReset();
								listAll(qna_no);
							}
						}
					});
				});
				
				/* 비밀번호 확인없이 수정버튼 제어 */
				$(document).on("click", "button[data-btn='upBtn']", function() {
					let panel = $(this).parents("div.panel");
					let qna_re_no = panel.attr("data-num");
					updateForm(qna_re_no, panel);
				}); 
				
				/* 비밀번호 확인없이 삭제버튼 제어 */
				$(document).on("click", "button[data-btn='delBtn']", function() {
					let qna_re_no = $(this).parents("div.panel").attr("data-num");
					deleteBtn(qna_no, qna_re_no);
				});
				
				/* 수정 폼 화면 구현 함수 */
				function updateForm(qna_re_no, panel) {
					let content = panel.find(".panel-body").html();
					content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
					$("#qna_re_content").val(content);
	
					$("#replyForm button[type='button']").attr("id", "replyUpdateBtn");
					$("#replyForm button[type='button']").attr("data-rnum", qna_re_no);
	 			}
				
				/* 수정을 위한  Ajax 연동 처리 */
				$(document).on("click", "#replyUpdateBtn", function(){
					
					let qna_re_no = $(this).attr("data-rnum");	
					$.ajax({
						url : '/qnaReply/' + qna_re_no,
						type : 'put',
						headers : { 
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "PUT" 
						},
						data:JSON.stringify({
							qna_re_content : $("#qna_re_content").val()
						}), 
						dataType : 'text', 
						error : function(xhr, textStatus, errorThrown) { 
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
						}, 
						beforeSend : function(){
							if (!chkForm("#qna_re_content","댓글 내용을"))	return false;
						},
						success : function(result){
							console.log("result: " + result);
							if(result == "SUCCESS"){
								alert("댓글 수정이 완료되었습니다.");
								dataReset();
								listAll(qna_no);
							}
						}
					}); 
				});
			}); // 최상위 $ 종료
						
			/* 댓글 목록 보여주는 함수 */
			function listAll(qna_no) {
				$(".reply").detach();
				
				let url = "/qnaReply/all/" + qna_no;
				
				$.getJSON(url, function(data) {
					$(data).each(function() {
						let qna_re_no = this.qna_re_no;
						let qna_re_content = this.qna_re_content;
						let qna_re_date = this.qna_re_date;
						qna_re_content = qna_re_content.replace(/(\r\n|\r|\n)/g, "<br />");
						template(qna_re_no, qna_re_content, qna_re_date);
					});
				}).fail(function() {
					alert("덧글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
				});
			}
			
			/* 새로운 글을 화면에 추가하기(보여주기) 위한 함수 */
			function template(qna_re_no, qna_re_content, qna_re_date) {
				let $div = $('#qnaReplyList');
				
				let $element = $('#item-template').clone().removeAttr('id');
				$element.attr("data-num", qna_re_no);
				$element.addClass("reply");
				$element.find('.panel-heading > .panel-title > .name').html("관리자");
				$element.find('.panel-heading > .panel-title > .date').html(" | " + qna_re_date);
				$element.find('.panel-body').html(qna_re_content);
				
				/* 로그인 사용자 처리
				let loginName = "${user_id}";
				if(loginName != user_id) {
					$element.find('.panel-heading > .panel-title > button').detach();
				} */
				
				$div.append($element);
			}
			
			/* 입력 폼 초기화 */
			function dataReset() {
				$("#replyForm").each(function() {
					this.reset();
				});
				$("#replyForm button[type='button']").removeAttr("data-rnum");
				$("#replyForm button[type='button']").attr("id", "replyInsertBtn");
			}
	
			/* 글 삭제를 위한 Ajax 연동 처리 */
			function deleteBtn(qna_no, qna_re_no) {
				if(confirm("선택하신 댓글을 삭제하시겠습니까?")) {
					$.ajax({
						url : '/replies/' + qna_re_no,
						type : 'delete',
						headers : {
							"X-HTTP-Method-Override" : "DELETE"
						},
						dataType : 'text',
						error : function(xhr, textStatus, errorThrown) {
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
						},
						success : function(result) {
							console.log("result : " + result);
							if(result == 'SUCCESS') {
								alert("댓글 삭제가 완료되었습니다.");
								listAll(qna_no);
							}
						}
					});
				}
			}
		</script>
	</head>
	<body>
		<div id="replyContainer">
			<%-- 댓글 입력 화면 --%>
			<form id="replyForm" name="replyForm">
				<div class="panel panel-default">
					<table class="table">
						<tbody>
							<tr>
								<td class="col-md-1">댓글 내용</td>
								<td colspan="4" class="col-md-10 text-left">
									<textarea name="qna_re_content" id="qna_re_content" class="form-control" rows="3"></textarea>
								</td>
								<td class="col-md-1">
									<button type="button" id="replyInsertBtn" class="btn btn-success">저장</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>

			<%-- 댓글 리스트 영역 --%>
			<div id="qnaReplyList">
				<div id="item-template" class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="name"></span>
							<span class="date"></span>
							<button type="button" data-btn="upBtn" class="btn btn-default gap">수정</button>
							<button type="button" data-btn="delBtn" class="btn btn-default gap">삭제</button>
						</h3>
					</div>
					<div class="panel-body"></div>
				</div>
			</div>
		</div>
	</body>
</html>