<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="author" content="Untree.co">
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
		
		<!-- Custom CSS -->
		<link rel="stylesheet" href="/resources/include/css/common.css">
		
		<script type="text/javascript">
			$(function() {
				/* 메인 페이지에서 메뉴바 active 설정 */
				$(".menu-bg-wrap .site-navigation .site-menu li:eq(0)").addClass("active");
			});
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
							<select id="search">
								<option value="pd_name">상품명</option>
								<option value="br_name">제조사</option>
							</select>
							<input type="text" id="keyword" class="form-control px-4" placeholder="무엇을 찾고 계신가요?">
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
						<p><a href="/product/productList" class="btn btn-primary text-white py-3 px-4">더보기</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="property-slider-wrap">
							<div class="property-slider">
								<%-- 자바스크립트로 clone 요소 동적으로 추가할 예정 --%>
								<!-- item -->
								<div class="property-item">
									<a href="property-single.html" class="img">
										<img src="" class="img-fluid">
									</a>
									<div class="property-content">
										<div class="price mb-2"><span>$1,291,000</span></div>
										<div>
											<span class="d-block mb-2 text-black-50">5232 California Fake, Ave. 21BC</span>
											<span class="city d-block mb-3">California, USA</span>
	
											<div class="specs d-flex mb-4">
												<span class="d-block d-flex align-items-center me-3">
													<span class="icon-bed me-2"></span>
													<span class="caption">2 beds</span>
												</span>
												<span class="d-block d-flex align-items-center">
													<span class="icon-bath me-2"></span>
													<span class="caption">2 baths</span>
												</span>
											</div>
	
											<a class="pdDetailBtn btn btn-primary py-2 px-3">See details</a>
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
							<span class="prev" data-controls="prev">이전</span>
							<span class="next" data-controls="next">다음</span>
						</div>
					</div>
				</div>
	
				<div class="row">
					<div class="col-lg-4">
						
					</div>
				</div>
				<div class="testimonial-slider-wrap">
					<div class="testimonial-slider">
						<%-- 자바스크립트로 clone 요소 동적으로 추가할 예정 --%>
						<div class="item">
							<div class="testimonial">
								<img src="" class="img-fluid rounded-circle w-25 mb-4">
								<div class="rate">
									<span class="icon-star text-warning"></span>
									<span class="icon-star text-warning"></span>
									<span class="icon-star text-warning"></span>
									<span class="icon-star text-warning"></span>
									<span class="icon-star text-warning"></span>
								</div>
								<h3 class="h5 text-primary mb-4">James Smith</h3>
								<blockquote>
									<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
								</blockquote>
								<p class="text-black-50">Designer, Co-founder</p>
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
							<span class="prev" data-controls="prev">이전</span>
							
							<span class="next" data-controls="next">다음</span>
						</div>
					</div>
				</div>
	
				<div class="row">
					<div class="col-lg-4">
						
					</div>
				</div>
				<div class="testimonial-slider-wrap">
					<div class="testimonial-slider">
						<%-- 자바스크립트로 clone 요소 동적으로 추가할 예정 --%>
						<div class="item">
							<div class="testimonial">
								<img src="" class="img-fluid rounded-circle w-25 mb-4">
								<div class="rate">
									<span class="icon-star text-warning"></span>
									<span class="icon-star text-warning"></span>
									<span class="icon-star text-warning"></span>
									<span class="icon-star text-warning"></span>
									<span class="icon-star text-warning"></span>
								</div>
								<h3 class="h5 text-primary mb-4">James Smith</h3>
								<blockquote>
									<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
								</blockquote>
								<p class="text-black-50">Designer, Co-founder</p>
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
								<span class="meta d-block mb-3">Back-end Developer</span>
								<p>안녕하세요. 저는 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ, ㅇㅇㅇㅇㅇㅇ 구현을 담당했습니다.</p>
								<ul class="social list-unstyled list-inline dark-hover">
									<li class="list-inline-item"><a href="https://github.com/saecomy90" target="_blank"><span class="glyphicon glyphicon-link"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-md-4 col-lg-3 mb-5 mb-lg-0">
						<div class="h-100 person">
							<img src="/resources/images/member1.png" class="img-fluid" />
							<div class="person-contents">
								<h2 class="mb-0"><a>유승협</a></h2>
								<span class="meta d-block mb-3">Back-end Developer</span>
								<p>안녕하세요. 저는 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ, ㅇㅇㅇㅇㅇㅇ 구현을 담당했습니다.</p>
								<ul class="social list-unstyled list-inline dark-hover">
									<li class="list-inline-item"><a href="https://github.com/SeungHyeopYoo" target="_blank"><span class="glyphicon glyphicon-link"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-md-4 col-lg-3 mb-5 mb-lg-0">
						<div class="h-100 person">
							<img src="/resources/images/member1.png" class="img-fluid" />
							<div class="person-contents">
								<h2 class="mb-0"><a>이민정</a></h2>
								<span class="meta d-block mb-3">Front-end Developer</span>
								<p>안녕하세요. ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ, ㅇㅇㅇㅇㅇㅇ 구현을 담당했습니다.</p>
								<ul class="social list-unstyled list-inline dark-hover">
									<li class="list-inline-item"><a href="https://github.com/lxxmnmn" target="_blank"><span class="glyphicon glyphicon-link"></span></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-md-4 col-lg-3 mb-5 mb-lg-0">
						<div class="h-100 person">
							<img src="/resources/images/member1.png" class="img-fluid" />
							<div class="person-contents">
								<h2 class="mb-0"><a>이석환</a></h2>
								<span class="meta d-block mb-3">Back-end Developer</span>
								<p>안녕하세요. 저는 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ, ㅇㅇㅇㅇㅇㅇ 구현을 담당했습니다.</p>
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