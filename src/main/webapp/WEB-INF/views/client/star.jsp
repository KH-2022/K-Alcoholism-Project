<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<link rel="stylesheet" href="/resources/include/css/star.css"/>
	</head>
	<body>
		<h2>리뷰 작성</h2>
		<form class="mb-3" name="myform" id="myform" method="post">
			<fieldset>
				<span class="text-bold">별점을 선택해주세요</span>
				<input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
				<input type="radio" name="reviewStar" value="4" id="rate2"><label for="rate2">★</label>
				<input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
				<input type="radio" name="reviewStar" value="2" id="rate4"><label for="rate4">★</label>
				<input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
			</fieldset>
			<div>
				<textarea class="col-auto form-control" id="reviewContents" name="reviewContents" placeholder="리뷰를 달아주세요!"></textarea>
			</div>
			<hr />
			<button type="button" id="imgInsertBtn" class="col-md-12">사진 첨부하기</button>
			<button type="button" id="cancelBtn" class="col-md-6"> 취소하기</button>
			<button type="button" id="insertBtn" class="col-md-6">등록하기</button>
		</form>
	</body>
</html>
