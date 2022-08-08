<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
	
		<link href="/resources/include/dist/assets/css/helper.css" rel="stylesheet">
		<link href="/resources/include/dist/assets/css/main.css" rel="stylesheet">
		<style>
			/* .page-section{
				max-width: 680px;
				margin-top: 80px;
				padding: 32px;
				background: #fff;
			 	-webkit-border-radius: 10px;
	     	 	-moz-border-radius: 10px;
    			border-radius: 10px;
		     	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		      	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		      	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
			}
			.page-section h4 {
				text-align:center;
			} */
			.page-section{
			
			}
		</style>
		
		<!-- 다음 api -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<script type ="text/javascript">
			$(function(){
				$("#signUpForm").submit(function(){
					
					if($("#user_id").val()==""){
						$("#idMsg").text("아이디를 입력하세요.").css("color","red");
					} else if(!(userIdCheck.test($('#user_id').val()))){
						$("#idMsg").text("영문자 및 숫자로만 구성하여 5글자에서 15글자 이내로 입력해주세요.").css("color","red");
						$("#user_id").val("");
						return false;
					} else {
						$("#idMsg").text("");
					}
					
					if($("#user_pwd").val()==""){
						$("#pwdMsg").text("비밀번호를 입력하세요.").css("color","red");
					} else if(!(passwdCheck.test($('#user_pwd').val()))){
						$("#pwdMsg").text("대문자 포함 영문자 및 숫자로만 구성하여 8글자에서 16글자 이내로 입력해주세요.").css("color","red");
						$("#user_pwd").val("");
						return false;
					} else {
						$("#pwdMsg").text("");
					}
					
					let pwd1 = $("#user_pwd").val();
					let pwd2 = $('#pwdChk').val();
					
					if($("#pwdChk").val()==""){
						$("#pwdChkMsg").text("비밀번호 확인을 입력하세요.").css("color","red");
					} else if(pwd1 != "" || pwd2 != ""){
						if(!(pwd1 == pwd2)){
							$("#pwdChkMsg").text("비밀번호가 일치하지 않습니다.").css("color","red");
							$("#pwdChk").val("");
							return false;
						} else {
						$("#pwdChkMsg").text("비밀번호가 일치합니다.").css("color","green");
						}
					}
					
					if($("#user_name").val()==""){
						$("#nameMsg").text("이름을 입력해주세요.").css("color","red");
					} else if(!(nameCheck.test($('#user_name').val()))){
						$("#nameMsg").text("한글이름으로 2글자에서 10글자 이내로 입력해주세요.").css("color","red");
						$("#user_name").val("");
						return false;
					} else {
						$("#nameMsg").text("");
					}
					
					if($("#user_email").val()==""){
						$("#emailMsg").text("이메일을 입력해주세요.").css("color","red");
					} else if(!(emailCheck.test($('#user_email').val()))){
						$("#emailMsg").text("이메일 규칙에 맞게 작성해주세요.").css("color","red");
						$("#user_email").val("");
						return false;
					} else if($("#emailCheck").val()=="Y"){
						$("#user_email").val("");
						return false;
					} else {
						$("#emailMsg").text("");
					}
					
					if($("#user_birth").val()==""){
						$("#birthMsg").text("생년월일을 입력해주세요.").css("color","red");
					} else if(!(birthdayCheck.test($('#user_birth').val()))){
						$("#birthMsg").text("생년월일 규칙에 맞게 작성해주세요. ex)1994/02/05").css("color","red");
						$("#user_birth").val("");
						return false;
					} else {
						$("#birthMsg").text("");
					}
					
					if($("#user_tel").val()==""){
						$("#telMsg").text("휴대전화 번호를 입력해주세요.").css("color","red");
					} else if(!(phonCheck.test($('#user_tel').val()))){
						$("#telMsg").text("휴대전화 규칙에 맞게 작성해주세요. ex)010-1234-5678").css("color","red");
						$("#user_tel").val("");
						return false;
					} else {
						$("#telMsg").text("");
					}
					
					if($("#user_tel").val()==""){
						$("#telMsg").text("휴대전화 번호를 입력해주세요.").css("color","red");
					} else if(!(phonCheck.test($('#user_tel').val()))){
						$("#telMsg").text("휴대전화 규칙에 맞게 작성해주세요. ex)010-1234-5678").css("color","red");
						$("#user_tel").val("");
						return false;
					} else {
						$("#telMsg").text("");
					}
					
					if($("#user_postcode").val()==""){
						$("#addMsg").text("주소를 입력해주세요.").css("color","red");
						return false;
					} else {
						$("#addMsg").text("");
					}
					
					if($("#idCheck").val() == ''){
						$("#idCheckMsg").text("아이디 중복 확인을 해주세요.").css("color", "red");
						return false;
					} else {
						$("#idCheckMsg").text("");
					}
					
					$("#signUpForm").attr({
						"method" :"post",
						"action" : "/signUp/signUpInsert"
					});
				}); //submit종료
				
				$("#idCheckBtn").click(function() {
					$("#idCheck").val('Y');
					$("#idCheckMsg").text("");
		    		var user_id = $("#user_id").val();
		    		
		    		if(user_id == '') {
		    			$("#userId").focus();
		    			$("#idMsg").text("아이디를 입력하세요").css("color","red");
		    			return; 
		    		};
		    		
		    		$.ajax({
		    			type : "post",
		    			url : "/signUp/idCheck",
		    			contentType : "application/json",
		    			data : JSON.stringify({"user_id" : user_id}),
		    			success : function(data) {
							if(data == 0){ // 사용가능
								if(userIdCheck.test($('#user_id').val()))
								$("#idMsg").text("사용가능한 아이디입니다").css("color","green");
							} else {
								$("#idMsg").text("중복된 아이디입니다").css("color","red");
							}
		    				
		    			},
		    			error : function(status, error) {
		    				alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");
		    			}
		    		});
		    	});// 아이디 중복체크
		    	
				$("#user_email").focusout(function() {
		    		var user_email = $("#user_email").val();
		    		
		    		$.ajax({
		    			type : "post",
		    			url : "/signUp/emailCheck",
		    			contentType : "application/json",
		    			data : JSON.stringify({"user_email" : user_email}),
		    			success : function(data) {
							if(data == 0){ // 사용가능
								$("#emailMsg").text("");
								$("#emailCheck").val("");
							} else {
								$("#emailMsg").text("중복된 이메일입니다").css("color","red");
								$("#emailCheck").val("Y");
							}
		    				
		    			},
		    			error : function(status, error) {
		    				alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");
		    			}
		    		});
		    	});// 이메일 중복체크
		    	
		    	//정규식 체크
				var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,15}$/);
				var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,16}$/);
				var nameCheck = RegExp(/^[가-힣]{2,10}$/);
				var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
				var birthdayCheck = RegExp(/^((19|20)[0-9]{2})\/(0[1-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[0-1])$/);
				var phonCheck = RegExp(/^010\-([0-9]{4})\-[0-9]{4}$/);
				
				$("#user_id").keyup(function(){
					if(!(userIdCheck.test($('#user_id').val()))){
						console.log("user_id 체크"+$('#user_id').val());
						$("#idMsg").text("영문자 및 숫자로만 구성하여 5글자에서 15글자 이내로 입력해주세요").css("color","red");
					} else {
						$("#idMsg").text("");
					}
				});
				
				$("#user_pwd").keyup(function(){
					if(!(passwdCheck.test($('#user_pwd').val()))){
						console.log("user_pwd 체크"+$('#user_pwd').val());
						$("#pwdMsg").text("대문자 포함 영문자 및 숫자로만 구성하여 8글자에서 16글자 이내로 입력해주세요").css("color","red");
					} else {
						$("#pwdMsg").text("");
					}
				});
				
				$("#pwdChk").keyup(function(){
					let pwd1 = $("#user_pwd").val();
					let pwd2 = $('#pwdChk').val();
					
					if(pwd1 != "" || pwd2 != ""){
						if(pwd1 == pwd2){
							$("#pwdChkMsg").text("비밀번호가 일치합니다.").css("color","green");
						} else {
							$("#pwdChkMsg").text("비밀번호가 일치하지 않습니다.").css("color","red");
						}
					}
				});
				
				$("#user_name").keyup(function(){
					if(!(nameCheck.test($('#user_name').val()))){
						console.log("user_name 체크"+$('#user_name').val());
						$("#nameMsg").text("한글이름으로 2글자에서 10글자 이내로 입력해주세요.").css("color","red");
					} else {
						$("#nameMsg").text("");
					}
				});
				
				$("#user_email").keyup(function(){
					if(!(emailCheck.test($('#user_email').val()))){
						console.log("user_email 체크"+$('#user_email').val());
						$("#emailMsg").text("이메일 규칙에 맞게 작성해주세요.").css("color","red");
					} else {
						$("#emailMsg").text("");
					}
				});
				
				$("#user_birth").keyup(function(){
					if(!(birthdayCheck.test($('#user_birth').val()))){
						console.log("user_birth 체크"+$('#user_birth').val());
						$("#birthMsg").text("생년월일 규칙에 맞게 작성해주세요. ex)1994/02/05").css("color","red");
					} else {
						$("#birthMsg").text("");
					}
				});
			
				$("#user_tel").keyup(function(){
					if(!(phonCheck.test($('#user_tel').val()))){
						console.log("user_tel 체크"+$('#user_tel').val());
						$("#telMsg").text("휴대전화 규칙에 맞게 작성해주세요. ex)010-1234-5678").css("color","red");
					} else {
						$("#telMsg").text("");
					}
				});
				
			});//메인메서드 종료
			
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
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">회원가입</h1>
					</div>
				</div>
			</div>
		</div>
	
		  <div class="page-section">
			<div class="container">
				<div class="row" style="float: none; margin:100 auto;">
					<div class="col-sm-12 col-md-12 col-lg-6 col-xs-12 mt-30 mb-30" style="float: none; margin:0 auto;">
						<form action="#" id="signUpForm">
							<div class="login-form">
								<h4 class="login-title">회원가입</h4>
								<div class="row">
									<div class="col-md-6 col-12 mb-20">
										<label>아이디</label>
										<input class="mb-0" type="text" id="user_id" name="user_id" required>
										<span id="idMsg"></span>
									</div>
									
									<div class="col-md-6 col-12 mb-20">
										<button class="idChk-button mt-30" id="idCheckBtn" name="idCheckBtn">중복확인</button>
					              		<!-- <input type="button" value="중복확인" id="idCheckBtn" name="idCheckBtn"/> -->
						             	<input type="hidden" id="idCheck" name="idCheck" value="" />  
						              	<span id="idCheckMsg"></span>
						            </div>
									
									<div class="col-md-6 col-12 mb-20">
										<label>비밀번호</label>
										<input class="mb-0" type="password" id="user_pwd" name="user_pwd" required>
										<span id="pwdMsg"></span>
									</div>
									
									<div class="col-md-6 col-12 mb-20">
										<label>비밀번호 확인</label>
										<input class="mb-0" type="password" id="pwdChk" name="pwdChk" required>
										<span id="pwdChkMsg"></span>
									</div>
									
									<div class="col-md-12 mb-20">
										<label>이름</label>
										<input class="mb-0" type="text" id="user_name" name="user_name" required>
										<span id="nameMsg"></span>
									</div>
									
									<div class="col-md-12 mb-20">
										<label>생년월일</label>
										<input type="text" class="mb-0" id="user_birth" name="user_birth" placeholder="1994/02/05" required>
										<span id="birthMsg"></span>
									</div>
									
									<div class="col-md-12 mb-20">
										<label>휴대전화</label>
							            <input type="text" class="mb-0" id="user_tel" name="user_tel" placeholder="010-2994-7827" required>
										<span id="telMsg"></span>
									</div>
									
									<div class="col-md-12 mb-20">
										<label>이메일</label>
										<input type="email" class="mb-0" id="user_email" name="user_email" placeholder="yourEmail@example.com" required>
										<input type="hidden" id="emailCheck" name="emailCheck" value="" />
										<span id="emailMsg"></span>
									</div>
									
									<div class="col-md-6 mb-5">
										<label>주소</label>
										<input type="text" class="mb-0" id="user_postcode" name="user_postcode" placeholder="우편번호" readonly>
									</div>
									<div class="col-md-6 mt-20">
										<button class="post-button mt-10" onclick="execDaumPostcode()">우편번호 찾기</button>
									</div>
									
									<div class="col-md-12 mb-5 juso">
										<input type="text" class="mb-0" id="user_add" name="user_add" placeholder="주소" readonly>
							            <span id="addMsg"></span>
									</div>
									<div class="col-md-6 mb-5">
										<input type="text" class="mb-0" id="user_detailAdd" name="user_detailAdd" placeholder="상세주소">
									</div>
									
									<div class="col-md-6 col-12 mb-20">
										<input type="text" class="mb-0" id="user_extraAdd" name="user_extraAdd" placeholder="참고항목">
									</div>
									
									 <hr class="mb-4">
							         <div class="col-md-12 mb-20 custom-control custom-checkbox">
							         	<input type="checkbox" class="custom-control-input" id="aggrement" required>
							         	<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
							         </div>
									
									<div class="col-12 pl">
										<button id="signUpBtn" class="register-button mt-0" type="submit">가입하기</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
