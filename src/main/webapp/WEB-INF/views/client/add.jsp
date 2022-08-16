<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<!-- CSS ============================================ -->
		<!--===== Vendor CSS(Bootstrap & Icon Font) =====-->
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/ionicons.min.css">
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/fontawesome.min.css">
		<!--===== Plugins CSS(All Plugins Files) =====-->
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/animate.css">
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/jquery-ui.min.css">
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/default.css">
		<!--====== Main Style CSS ======-->
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/style.css">
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			$(function(){
				
				let errorMsg = "${errorMsg}";
				if(errorMsg != ""){
					alert(errorMsg);
					errorMsg = "";
				}
				
				let updateMsg = "${updateMsg}";
				if(updateMsg != ""){
					alert(updateMsg);
					updateMsg = "";
				}
				
				let WithdrawalMsg = "${WithdrawalMsg}";
				if(WithdrawalMsg != ""){
					alert(WithdrawalMsg);
					WithdrawalMsg = "";
				}
				
				$("#editAddBtn").click(function(){
					
					if($("#user_add").val() == "${login.user_add}" && $("#user_detailAdd").val() == "${login.user_detailAdd}"){
						$("#editAddMsg").text("주소를 변경 후 등록해주세요.").css("color","red");
						return false;
					} else {
						$("#editAddMsg").text("");
					}
					$("#editAddForm").attr({
						"method" :"post",
						"action" : "/myPage/editAdd"
					});
					$("#editAddForm").submit();
				}); // 배송지 수정 종료
				
				$("#pills-order-tab").click(function(){
					location.href = "/myPage/myPage";
				});
				$("#pills-rez-tab").click(function(){
					location.href = "/myPage/reserve";
				});
				$("#pills-qna-tab").click(function(){
					location.href = "/myPage/qna";
				});
				$("#pills-review-tab").click(function(){
					location.href = "/reply/reply";
				});
				$("#pills-account-tab").click(function(){
					location.href = "/myPage/accountCheck";
				});
				$("#pills-address-tab").click(function(){
					location.href = "/myPage/add";
				});
				$("#pills-withdrawal-tab").click(function(){
					location.href = "/myPage/withdrawal";
				});
				
			}); //메인 메서드 종료
			
			function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("user_extraAdd").value = extraAddr;
		                
		                } else {
		                    document.getElementById("user_extraAdd").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("user_postcode").value = data.zonecode;
		                document.getElementById("user_add").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("user_detailAdd").focus();
		            }
		        }).open();
		    }
		
		</script>
	</head>
	<body>
		<!--====== Breadcrumb Part Start ======-->
		<div class="breadcrumb-area">
			<div class="container-fluid custom-container">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/">홈</a></li>
						<li class="breadcrumb-item active">마이페이지</li>
					</ol>
				</nav>
			</div>
			<!-- container -->
		</div>
		<!--====== Breadcrumb Part Ends ======-->
		<!--====== My Account Part Start ======-->
		
		<section class="my-account-area pt-10">
			<div class="container-fluid custom-container">
				<div class="row">
					<div class="col-xl-3 col-md-3">
						<div class="my-account-menu mt-30">
							<ul class="nav account-menu-list flex-column nav-pills" id="pills-tab" role="tablist">
								<li><a id="pills-order-tab" data-toggle="pill" href="#pills-order" role="tab" aria-controls="pills-order" aria-selected="false"><i class="far fa-shopping-cart"></i>배송 / 주문 상태 확인</a></li>
								<li><a id="pills-rez-tab" data-toggle="pill" href="#pills-rez" role="tab" aria-controls="pills-rez" aria-selected="true"><i class="far fa-map-marker-alt"></i>체험 예약 정보</a></li>
								<li><a id="pills-qna-tab" data-toggle="pill" href="#pills-qna" role="tab" aria-controls="pills-qna" aria-selected="false"><i class="far fa-question"></i>문의 목록</a></li>
								<li><a id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="false"><i class="far fa-comment-dots"></i>리뷰 목록</a></li>
								<li><a id="pills-account-tab" data-toggle="pill" href="#pills-account" role="tab" aria-controls="pills-account" aria-selected="false"><i class="far fa-user"></i>회원정보 수정</a></li>
								<li><a class="active" id="pills-address-tab" data-toggle="pill" href="#pills-address" role="tab" aria-controls="pills-address" aria-selected="false"><i class="far fa-map-marker-alt"></i>배송지 관리</a></li>
								<li><a id="pills-withdrawal-tab" data-toggle="pill" href="#pills-withdrawal" role="tab" aria-controls="pills-withdrawal" aria-selected="false"><i class="far fa-user"></i>회원탈퇴</a></li>
								<li><a href="/login/logout"><i class="far fa-sign-out-alt"></i>로그아웃</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-8 col-md-9">	
					<div class="tab-content my-account-tab mt-30" id="pills-tabContent">
					
							<div class="tab-pane fade show active" id="pills-address" role="tabpanel" aria-labelledby="pills-address-tab">
									<form id="editAddForm">
									<input type="hidden" name="user_no" id="user_no" value="${login.user_no}" /> 
									<div class="my-account-address account-wrapper">
										<h4 class="account-title">배송지 관리</h4>
										<div class="account-address mt-30">
											<h6 class="name">기본 배송지</h6>
											
											<div class="col-md-6">
												<div class="single-form">
													<label for="user_postcode">우편번호</label>
													<input type="text" class="mb-0" id="user_postcode" name="user_postcode" placeholder="우편번호" value="${login.user_postcode}" readonly>
												</div>
											</div>
											<div class="col-md-6 mt-10">
												<div class="single-form">
													<button class="main-btn main-btn-2" type="button" onclick="execDaumPostcode()">우편번호 찾기</button>
												</div>
											</div>
											<div class="col-md-12">
												<div class="single-form">
													<label for="user_postcode">주소</label>
													<input type="text" class="mb-0" id="user_add" name="user_add" placeholder="주소" value="${login.user_add}" readonly>
									           		<span id="editAddMsg"></span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="single-form">
													<label for="user_postcode">상세주소</label>
													<input type="text" class="mb-0" id="user_detailAdd" name="user_detailAdd" placeholder="상세주소" value="${login.user_detailAdd}">
												</div>
											</div>
											<div class="col-md-6 col-12">
												<div class="single-form">
													<label for="user_postcode">참고항목</label>
													<input type="text" class="mb-0" id="user_extraAdd" name="user_extraAdd" placeholder="참고항목" value="${login.user_extraAdd}">
												</div>
											</div>
											
											<button class="main-btn main-btn-2 mt-20" type="button" id="editAddBtn"><i class="far fa-edit"></i>Edit Address</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--====== My Account Part Ends ======-->
		<!--====== Features Banner Part Start ======-->
		<section class="features-banner-area pt-80 pb-100">
			<div class="container-fluid custom-container">
				<div class="features-banner-wrapper d-flex flex-wrap">
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon1.png" alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">무료배송</h3>
							<p>전통주의는 대한민국 어디라도 무료배송입니다.</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon2.png" alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">24시간 운영</h3>
							<p>전통주의는 24시간 언제라도 열려있습니다.</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon3.png" alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">100% 환불</h3>
							<p>환불 요청 시 10일 이내에 반드시 환불해드립니다.</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon4.png" alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">교환 가능</h3>
							<p>제품에 문제가 발생했을 경우 반드시 교환해드립니다.</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon5.png" alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">안전 결제</h3>
							<p>전통주의는 안전 결제 서비스를 제공하고 있습니다.</p>
						</div>
					</div>
					<!-- single features banner -->
				</div>
				<!-- features banner wrapper -->
			</div>
			<!-- container -->
		</section>
	</body>
</html>