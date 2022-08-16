<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				let br_id = ${br_id};
				listAll(br_id);
			}); //$함수 종료
			
			/* 새로운 후기를 화면에 추가하기 위한 함수 */
			function template(br_review_no, user_id, br_review_content, br_review_file, br_review_date) {
				let $div = $("#reviewList");
				
				let $element = $("#item-template").clone().removeAttr("id"); //기존의 요소를 복제하여 동적으로 추가
				$element.attr("data-num", br_review_no);
				$element.addClass("brReview");
				$element.find(".panel-heading > .panel-title > .userid").html(user_id);
				$element.find(".panel-heading > .panel-title > .date").html(br_review_date);
				$element.find(".panel-body").html(br_review_content);
				if (br_review_file != "") {
					let imgPath = "/uploadStorage/brReview/" + br_review_file;
					$element.find(".panel-img > a > img").attr("src", imgPath);
				} else {
					$element.find(".panel-img > a > img").detach();
				}
				
				$div.append($element);
			}
		
			/* 후기 목록을 불러오는 함수 */
			function listAll(br_id) {
				$(".brReview").detach(); //detach(): 선택한 요소를 DOM 트리에서 삭제
				
				let url = "/brReview/" + br_id;
				
				$.getJSON(url, function(data) { //data -> 불러온 json 데이터
					$(data).each(function() {
						let br_review_no = this.br_review_no;
						let user_id = this.user_id;
						let br_review_content = this.br_review_content;
						let br_review_file = "";
						if (this.br_review_file != "") {
							br_review_file = this.br_review_file;
						}
						let br_review_date = this.br_review_date;
						
						br_review_content = br_review_content.replace(/(\r\n|\r|\n)/g, "<br/>");
						template(br_review_no, user_id, br_review_content, br_review_file, br_review_date);
					});
				}).fail(function() {
					alert("양조장 후기 목록을 불러오는 데 실패하였습니다. 잠시 후 다시 시도해 주세요.");
				});
			}
		</script>
		<style>
			#item-template {display: none;}
		</style>
	</head>
	<body>
		<div id="reviewList">
			<div id="item-template" class="panel">
				<div class="panel-heading">
					<h3 class="panel-title">
						<span class="userid text-primary"></span>&nbsp;
						<small class="date"></small>
					</h3>
				</div>
				<div class="panel-body"></div>
				<div class="panel-img">
					<a><img class="review-img" /></a>
				</div>
			</div>
		</div>
	</body>
</html>