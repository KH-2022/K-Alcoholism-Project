<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" href="/resources/images/common/icon.png">
		
		<title>전통주 플랫폼, 전통酒의</title>
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		
		<!-- Bootstrap core CSS -->
		<link type="text/css" rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		
		<!-- JS -->
		<script type="text/javascript" src="/resources/include/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
	
		<meta name="description" content="" />
		<meta name="keywords" content="bootstrap, bootstrap5" />
		
		<!-- Google Fonts -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
		<!-- Template CSS -->
		<link rel="stylesheet" href="/resources/include/dist/css/icomoon_style.css">
		<link rel="stylesheet" href="/resources/include/dist/css/flaticon.css">
		<link rel="stylesheet" href="/resources/include/dist/css/tiny-slider.css">
		<link rel="stylesheet" href="/resources/include/dist/css/aos.css">
		<link rel="stylesheet" href="/resources/include/dist/css/style.css">
		
		<!-- Custom -->
		<link rel="stylesheet" href="/resources/include/css/common.css">
		<style type="text/css">
			#pd-template {display: none;}
			#pd-re-template {display: none;}
			#br-re-template {display: none;}
			.brReList {margin-bottom: 30px;}
		</style>
		<script type="text/javascript">
			$(function() {
				/* 메인 페이지에서 메뉴바 active 설정 */
				$(".menu-bg-wrap .site-navigation .site-menu li:eq(0)").addClass("active");
				
				/* 상품목록, 상품후기목록, 체험후기목록 불러오기 */
				pdListAll();
				pdReviewAll();
				brReviewAll();
				
				/* 검색 입력 양식 enter 제거 */
				$("#keyword").bind("keydown", function(event) {
					if (event.keyCode == 13) {
						event.preventDefault();
					}
				});
				
				/* 검색 조건 변경 시마다 처리할 이벤트 */
				$("#search").change(function() {
					$("#keyword").val("");
					$("#keyword").focus();
				});
				
				/* 검색 버튼 클릭 시 */
				$("#searchBtn").click(function() {
					if (!chkData("#keyword", "검색어를")) return;
					goPage();
				});
				
				/* 상품사진 클릭 시 상세페이지 이동을 위한 처리이벤트 */
				$(document).on("click", "#productList .goDetail", function(){
					let pd_id = $(this).parents(".property-item").attr("data-num");
					location.href = "/product/productDetail?pd_id=" + pd_id;
				});
			}); //$함수 종료
			
			/* 페이지 이동을 위한 함수 */
			function goPage() {
				let url = "";
				if ($("#search").val() == "pd_name") {
					url = "/product/productList";
				} else if ($("#search").val() == "br_name") {
					url = "/brewery/breweryList";
				}
				
				$("#searchForm").attr({
					"method" : "get",
					"action" : url
				});
				$("#searchForm").submit();
			}
			
			/* 상품목록을 화면에 추가하기 위한 함수 */
			function pdTemplate(pd_id, pd_name, pd_price, pd_sort, pd_image, pd_degree, pd_volume) {
				let $div = $("#productList");
				
				let $element = $("#pd-template").clone().removeAttr("id"); //기존의 요소를 복제하여 동적으로 추가
				$element.attr("data-num", pd_id);
				$element.addClass("pdList");
				$element.find(".property-content > .price").html(pd_price + "원");
				$element.find(".property-content > div > .sort").html(pd_sort);
				$element.find(".property-content > div > .city").html(pd_name);
				if (pd_image != "") {
					let imgPath = "/uploadStorage/product/" + pd_image;
					$element.find(".img > img").attr("src", imgPath);
				} else {
					$element.find(".img > img").attr("src", "/resources/images/common/noImage.jpg");
				}
				$element.find(".property-content > div > .specs .degree").html(pd_degree + "%");
				$element.find(".property-content > div > .specs .volume").html(pd_volume + "ml");
				$div.append($element);
			}
			
			/* 상품목록을 불러오는 함수 */
			function pdListAll() {
				$(".pdList").detach();
				let url = "/product/mainList";
				
				$.getJSON(url, function(data) {
					$(data).each(function() {
						let pd_id = this.pd_id;
						let pd_name = this.pd_name;
						let pd_price = this.pd_price;
						let pd_sort = this.pd_sort;
						let pd_image = this.pd_image;
						let pd_degree = this.pd_degree;
						let pd_volume = this.pd_volume;
						
						pdTemplate(pd_id, pd_name, pd_price, pd_sort, pd_image, pd_degree, pd_volume);
					});
				}).fail(function() {
					alert("상품 목록을 불러오는 데 실패하였습니다. 잠시 후 다시 시도해 주세요.");
				});
			}
			
			/* 상품후기를 화면에 추가하기 위한 함수 */
			function pdReTemplate(pd_review_no, user_id, pd_review_content, pd_name) {
				let $div = $("#pdReviewList");
				
				let $element = $("#pd-re-template").clone().removeAttr("id"); //기존의 요소를 복제하여 동적으로 추가
				$element.attr("data-num", pd_review_no);
				$element.addClass("pdReList");
				$element.find(".testimonial > .userid").html(user_id);
				$element.find(".testimonial > blockquote > p").html("&ldquo;"+ pd_review_content + "&rdquo;");
				$element.find(".testimonial > .pdname").html(pd_name);
				$div.append($element);
			}
			
			/* 상품후기를 불러오는 함수 */
			function pdReviewAll() {
				$(".pdReList").detach();
				let url = "/pdReview/main";
				
				$.getJSON(url, function(data) {
					$(data).each(function() {
						let pd_review_no = this.pd_review_no;
						let user_id = this.user_id;
						let pd_review_content = this.pd_review_content;
						let pd_name = this.pd_name;
						
						pdReTemplate(pd_review_no, user_id, pd_review_content, pd_name);
					});
				}).fail(function() {
					alert("상품후기 목록을 불러오는 데 실패하였습니다. 잠시 후 다시 시도해 주세요.");
				});
			}
			
			/* 양조장후기를 화면에 추가하기 위한 함수 */
			function brReTemplate(br_review_no, user_id, br_review_content, br_name) {
				let $div = $("#brReviewList");
				
				let $element = $("#br-re-template").clone().removeAttr("id"); //기존의 요소를 복제하여 동적으로 추가
				$element.attr("data-num", br_review_no);
				$element.addClass("brReList");
				$element.find(".testimonial > .userid").html(user_id);
				$element.find(".testimonial > blockquote > p").html("&ldquo;"+ br_review_content + "&rdquo;");
				$element.find(".testimonial > .brname").html(br_name);
				$div.append($element);
			}
			
			/* 양조장후기를 불러오는 함수 */
			function brReviewAll() {
				$(".brReList").detach();
				let url = "/brReview/main";
				
				$.getJSON(url, function(data) {
					$(data).each(function() {
						let br_review_no = this.br_review_no;
						let user_id = this.user_id;
						let br_review_content = this.br_review_content;
						let br_name = this.br_name;
						
						brReTemplate(br_review_no, user_id, br_review_content, br_name);
					});
				}).fail(function() {
					alert("양조장후기 목록을 불러오는 데 실패하였습니다. 잠시 후 다시 시도해 주세요.");
				});
			}
		</script>
	</head>
	<body>
		<%-- Header --%>
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close">
					<span class="icofont-close js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		
		<nav class="site-nav">
			<div class="container">
				<tiles:insertAttribute name="header" />
			</div>
		</nav>
		
		<div class="hero">
			<%-- 배경사진 --%>
			<div class="hero-slide">
				<div class="img overlay" style="background-image: url('/resources/images/main_bg_1.jpg')"></div>
				<div class="img overlay" style="background-image: url('/resources/images/main_bg_2.jpg')"></div>
				<div class="img overlay" style="background-image: url('/resources/images/main_bg_3.jpg')"></div>
				<div class="img overlay" style="background-image: url('/resources/images/main_bg_4.jpg')"></div>
			</div>
			
			<%-- 상품 검색 --%>
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center">
						<h1 class="font-weight-bold heading" data-aos="fade-up">전통주는 전통주의에서</h1>
						<form id="searchForm" class="narrow-w form-search d-flex align-items-stretch mb-3" data-aos="fade-up" data-aos-delay="200">
							<select id="search" name="search">
								<option value="pd_name">상품명</option>
								<option value="br_name">제조사</option>
							</select>
							<input type="text" id="keyword" name="keyword" class="form-control px-4" placeholder="무엇을 찾고 계신가요?">
							<button type="button" id="searchBtn" class="btn btn-primary">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	
		<%-- 상품 추천 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6">
						<h2 class="font-weight-bold text-primary heading">이 상품 어때요?</h2>
					</div>
					<div class="col-lg-6 text-lg-end">
						<p><a href="/product/productList" class="btn btn-primary text-white py-3 px-4">상품 더보기</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="property-slider-wrap">
							<div id="productList" class="property-slider">
								<!-- item -->
								<div id="pd-template" class="property-item">
									<a class="img">
										<img class="img-fluid goDetail" />
									</a>
									<div class="property-content">
										<div class="price mb-2"><span></span></div>
										<div>
											<span class="sort d-block mb-2 text-black-50"></span>
											<span class="city d-block mb-3"></span>
	
											<div class="specs d-flex mb-4">
												<span class="d-block d-flex align-items-center me-3">
													<span class="glyphicon glyphicon-tint me-2" aria-hidden="true"></span>
													<span class="degree caption"></span>
												</span>
												<span class="d-block d-flex align-items-center">
													<span class="glyphicon glyphicon-glass me-2" aria-hidden="true"></span>
													<span class="volume caption"></span>
												</span>
											</div>
											<a class="goDetail btn btn-primary py-2 px-3">더보기</a>
										</div>
									</div>
								</div> <!-- .item -->
							</div>
							<div id="property-nav" class="controls" tabindex="0" aria-label="Carousel Navigation">
								<span class="prev" data-controls="prev" aria-controls="property" tabindex="-1">이전</span>
								<span class="next" data-controls="next" aria-controls="property" tabindex="-1">다음</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%-- 상품 후기 --%>
		<div class="section sec-testimonials bg-light">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-md-6">
						<h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">상품 후기</h2>
					</div>
					<div class="col-md-6 text-md-end">
						<div id="testimonial-nav">
							<!-- <span class="prev" data-controls="prev">이전</span>
							<span class="next" data-controls="next">다음</span> -->
						</div>
					</div>
				</div>
	
				<div class="row">
					<div class="col-lg-4">
						
					</div>
				</div>
				<div class="testimonial-slider-wrap">
					<div id="pdReviewList" class="testimonial-slider">
						<%-- 자바스크립트로 clone 요소 동적으로 추가할 예정 --%>
						<div id="pd-re-template" class="item">
							<div class="testimonial">
								<h3 class="userid h5 text-primary mb-4"></h3>
								<blockquote>
									<p></p>
								</blockquote>
								<p class="pdname text-black-50"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%-- 체험 후기 --%>
		<div class="section section-5 sec-testimonials">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-md-6">
						<h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">체험 후기</h2>
					</div>
					<div class="col-md-6 text-md-end">
						<div id="testimonial-nav">
							<!-- <span class="prev" data-controls="prev">이전</span>
							<span class="next" data-controls="next">다음</span> -->
						</div>
					</div>
				</div>
	
				<div class="row">
					<div class="col-lg-4">
						
					</div>
				</div>
				<div class="testimonial-slider-wrap">
					<div id="brReviewList" class="testimonial-slider">
						<%-- 자바스크립트로 clone 요소 동적으로 추가할 예정 --%>
						<div id="br-re-template" class="item">
							<div class="testimonial">
								<h3 class="userid h5 text-primary mb-4"></h3>
								<blockquote>
									<p></p>
								</blockquote>
								<p class="brname text-black-50"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 팀원 소개 --%>
		<div class="section section-5 bg-light">
			<div class="container">
				<div class="row justify-content-center  text-center mb-5">
					<div class="col-lg-6 mb-5">
						<h2 class="font-weight-bold heading text-primary mb-4">3조 팀원 소개</h2>
						<p class="text-black-50">2022 KH정보교육원 자바(JAVA)기반 공공데이터 융합 개발자 양성과정 파이널 프로젝트</p>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 col-md-4 col-lg-3 mb-5 mb-lg-0">
						<div class="h-100 person">
							<img src="/resources/images/member1.png" class="img-fluid" />
							<div class="person-contents">
								<h2 class="mb-0"><a>안새롬</a></h2>
								<span class="meta d-block mb-3">Full-stack Developer</span>
								<p>저는 전통주 목록, 장바구니, 주문 관리, 주문 기능 구현을 담당했습니다.</p>
								<ul class="social list-unstyled list-inline dark-hover">
									<li class="list-inline-item"><a href="https://github.com/saecomy90" target="_blank"><span class="glyphicon glyphicon-link"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-md-4 col-lg-3 mb-5 mb-lg-0">
						<div class="h-100 person">
							<img src="/resources/images/member2.png" class="img-fluid" />
							<div class="person-contents">
								<h2 class="mb-0"><a>유승협</a></h2>
								<span class="meta d-block mb-3">Full-stack Developer</span>
								<p>저는 양조장 목록, 상품 관리, 양조장 관리, 문의게시판 구현을 담당했습니다.</p>
								<ul class="social list-unstyled list-inline dark-hover">
									<li class="list-inline-item"><a href="https://github.com/SeungHyeopYoo" target="_blank"><span class="glyphicon glyphicon-link"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-md-4 col-lg-3 mb-5 mb-lg-0">
						<div class="h-100 person">
							<img src="/resources/images/member3.png" class="img-fluid" />
							<div class="person-contents">
								<h2 class="mb-0"><a>이민정</a></h2>
								<span class="meta d-block mb-3">Full-stack Developer</span>
								<p>저는 메인페이지, 전통주 및 양조장 상세, 예약 관리, 예약 기능 구현을 담당했습니다.</p>
								<ul class="social list-unstyled list-inline dark-hover">
									<li class="list-inline-item"><a href="https://github.com/lxxmnmn" target="_blank"><span class="glyphicon glyphicon-link"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-md-4 col-lg-3 mb-5 mb-lg-0">
						<div class="h-100 person">
							<img src="/resources/images/member4.png" class="img-fluid" />
							<div class="person-contents">
								<h2 class="mb-0"><a>이석환</a></h2>
								<span class="meta d-block mb-3">Full-stack Developer</span>
								<p>저는 회원가입, 로그인, 회원정보 관리, 리뷰 관리, 마이페이지 구현을 담당했습니다.</p>
								<ul class="social list-unstyled list-inline dark-hover">
									<li class="list-inline-item"><a href="https://github.com/dra-Lee" target="_blank"><span class="glyphicon glyphicon-link"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- Footer --%>
		<div class="site-footer">
			<div class="container">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
		
		<!-- Preloader -->
	    <div id="overlayer"></div>
	    <div class="loader">
	    	<div class="spinner-border" role="status">
	    		<span class="visually-hidden">Loading...</span>
	    	</div>
	    </div>
	
	    <!-- <script src="js/bootstrap.bundle.min.js"></script> -->
	    <script src="/resources/include/dist/js/tiny-slider.js"></script>
	    <script src="/resources/include/dist/js/aos.js"></script>
	    <script src="/resources/include/dist/js/navbar.js"></script>
	    <script src="/resources/include/dist/js/counter.js"></script>
	    <script src="/resources/include/dist/js/custom.js"></script>
	</body>
</html>