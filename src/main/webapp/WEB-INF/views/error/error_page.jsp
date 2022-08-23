<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
		<script type="text/javascript">
			$(function() {
				/* close 인스턴스 메소드가 호출되는 즉시 실행 */
				$("#errorAlert").on("closed.bs.alert", function() {
					location.href = "/";
				});
				
				$("#mainBtn").click(function() {
					location.href = "/";
				});
				
				$("#qnaListBtn").click(function() {
					location.href = "/qna/qnaList";
				});
			});
		</script>
		<style>
			#errorAlert {
				height:220px;
				margin-bottom: 50px;
				padding-left: 30px;
			}
			.errorContent {margin-top: 40px;}
			#mainBtn {margin-right: 30px;}
		</style>
	</head>
	<body>
		<%-- 개발 시 테스트용
		<h4><c:out value="${exception.getMessage()}"></c:out></h4>
		<ul>
			<c:forEach items="${exception.getStackTrace()}" var="stack">
			<li><c:out value="${stack}"></c:out></li>
			</c:forEach>
		</ul>
		--%>
		
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_1.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">전통주 플랫폼, 전통酒의</h1>
					</div>
				</div>
			</div>
		</div>
		
		<div class="section">
			<div class="container">
				<div class="row">
					<div id="errorAlert" class="alert alert-dismissible fade in" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<div class="col-12">
							<h2 class="font-weight-bold text-primary heading">
							<c:choose>
								<c:when test="${not empty error400}">
									죄송합니다. 요청이 잘못되었습니다.
								</c:when>
								<c:when test="${not empty error403}">
									죄송합니다. 접근 권한이 없습니다.
								</c:when>
								<c:when test="${not empty error404}">
									죄송합니다. 해당 페이지를 찾을 수 없습니다.
								</c:when>
								<c:when test="${not empty error405}">
									죄송합니다. 허용되지 않는 요청입니다.
								</c:when>
								<c:when test="${not empty error500}">
									죄송합니다. 서버 내부에 오류가 발생했습니다.
								</c:when>
								<c:otherwise>
									죄송합니다. 예상하지 못한 오류가 발생했습니다.
								</c:otherwise>
							</c:choose>
							</h2>
						</div>
						<div class="col-12 errorContent">
							<p class="text-black-50">
								일시적인 현상이거나 네트워크 문제일 수 있으니 잠시 후 다시 시도해 주세요.<br />
								계속 오류가 발생하는 경우, 전통주의 문의게시판을 통해 관리자에게 문의해 주세요.<br />
								감사합니다.<br />
							</p>
						</div>
					</div>
					<div class="form-group text-center">
						<button type="button" id="mainBtn" class="btn btn-primary">전통주의 홈으로 이동</button>
						<button type="button" id="qnaListBtn" class="btn btn-primary">1:1 문의로 이동</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>