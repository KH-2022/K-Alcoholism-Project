<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style>
			.br-info {margin: 30px 0;}
			.img-about > img {width: 640px;}
			.wrap-icon > .glyphicon {
				font-size: 25px;
				line-height: 75px;
			}
			.feature-h > .feature-text {
				margin-left: 15px;
				margin-top: 0;
			}
		</style>
	</head>
	<body>
		<div class="section">
			<div class="container">
				<div class="row text-left mb-5">
					<div class="col-12">
						<h2 class="font-weight-bold heading text-primary mb-4">${detail.br_name}</h2>
					</div>
					<div class="col-lg-6">
						<p class="text-black-50 br-info">${detail.br_info}</p>
					</div>
				</div>
			</div>
		</div>
		<div class="section pt-0">
			<div class="container">
				<div class="row justify-content-between mb-5">
					<div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
						<div class="img-about dots">
							<c:if test="${not empty detail.br_image}">
								<img src="/uploadStorage/brewery/${detail.br_image}" class="img-fluid" />
							</c:if>
							<c:if test="${empty detail.br_image}">
								<img src="/resources/images/common/noImage.jpg" class="img-fluid" />
							</c:if>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="d-flex feature-h">
							<span class="wrap-icon me-3 text-center">
								<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
							</span>
							<div class="feature-text">
								<h3 class="heading text-primary">주소</h3>
								<p class="text-black-50">${detail.br_addr}</p>   
							</div>
						</div>
	
						<div class="d-flex feature-h">
							<span class="wrap-icon me-3 text-center align-middle">
								<span class="glyphicon glyphicon-glass" aria-hidden="true"></span>
							</span>
							<div class="feature-text">
								<h3 class="heading text-primary">취급주종</h3>
								<p class="text-black-50">${detail.br_type}</p>   
							</div>
						</div>
	
						<div class="d-flex feature-h">
							<span class="wrap-icon me-3 text-center">
								<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
							</span>
							<div class="feature-text">
								<h3 class="heading text-primary">체험 프로그램</h3>
								<p class="text-black-50">${detail.br_program}</p>   
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>