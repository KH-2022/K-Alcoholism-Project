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
		
		<!-- Custom CSS -->
		<link rel="stylesheet" href="/resources/include/css/common.css">
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
		
		<%-- body --%>
		<tiles:insertAttribute name="body" />
		
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