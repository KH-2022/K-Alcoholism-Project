<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			/* 날짜 선택을 위한 달력 렌더링 함수
			 * 달력 렌더링 할 때 필요한 정보 목록: 현재 월(초기값: 현재 시간), 금월 마지막일 날짜와 요일, 전월 마지막일 날짜와 요일
			 * */
			function calendarInit() {
		
			    //날짜 정보 가져오기
			    var date = new Date(); //현재 날짜(로컬 기준) 가져오기
			    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); //uct 표준시 도출
			    var kstGap = 9 * 60 * 60 * 1000; //한국 kst 기준시간 더하기
			    var today = new Date(utc + kstGap); //한국 시간으로 date 객체 만들기(오늘)
			  
			    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate()); //달력에서 표기하는 날짜 객체
			  
			    
			    var currentYear = thisMonth.getFullYear(); //달력에서 표기하는 연
			    var currentMonth = thisMonth.getMonth(); //달력에서 표기하는 월
			    var currentDate = thisMonth.getDate(); //달력에서 표기하는 일
		
			    //kst 기준 현재시간
			    //console.log(thisMonth);
		
			    //캘린더 렌더링
			    renderCalender(thisMonth);
		
			    function renderCalender(thisMonth) {
			        //렌더링을 위한 데이터 정리
			        currentYear = thisMonth.getFullYear();
			        currentMonth = thisMonth.getMonth();
			        currentDate = thisMonth.getDate();
		
			        //이전 달의 마지막 날 날짜와 요일 구하기
			        var startDay = new Date(currentYear, currentMonth, 0);
			        var prevDate = startDay.getDate();
			        var prevDay = startDay.getDay();
		
			        //이번 달의 마지막날 날짜와 요일 구하기
			        var endDay = new Date(currentYear, currentMonth + 1, 0);
			        var nextDate = endDay.getDate();
			        var nextDay = endDay.getDay();
		
			        //console.log(prevDate, prevDay, nextDate, nextDay);
		
			        //현재 월 표기
			        var currentMonthString = currentMonth + 1;
			        if (currentMonth + 1 < 10) {
			        	currentMonthString = "0" + currentMonthString;
					}
			        $('.year-month').text(currentYear + '-' + currentMonthString);
		
			        //렌더링 html 요소 생성
			        calendar = document.querySelector('.dates')
			        calendar.innerHTML = '';
			        
			        //지난달
			        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
			            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
			        }
			        //이번달
			        for (var i = 1; i <= nextDate; i++) {
			            calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
			        }
			        //다음달
			        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
			            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
			        }
		
			        //오늘 날짜 표기
			        if (today.getMonth() == currentMonth) {
			            todayDate = today.getDate();
			            var currentMonthDate = document.querySelectorAll('.dates .current');
			            currentMonthDate[todayDate -1].classList.add('today');
			        }
			        
			        /* 날짜 클릭 시 선택 표시 */
				    $('.day').on('click', function() {
				    	if ($(this).hasClass('disable') === true) {
				    		alert("선택할 수 없습니다.");
				    	} else {
					    	if ($(this).hasClass('choice') === false) {
					    		$(this).parents('.dates').find('div').removeClass('choice');
					    		$(this).addClass('choice');
					    	} else {
					    		$(this).removeClass('choice');
					    	}
				    	}
				    });
			    }
		
			    //이전달로 이동
			    $('.go-prev').on('click', function() {
			        thisMonth = new Date(currentYear, currentMonth - 1, 1);
			        renderCalender(thisMonth);
			    });
		
			    //다음달로 이동
			    $('.go-next').on('click', function() {
			        thisMonth = new Date(currentYear, currentMonth + 1, 1);
			        renderCalender(thisMonth); 
			    });
			}
		
			$(function() {
			    calendarInit(); //캘린더 렌더링
			    let cntNum = 1;
			    $(".count").text(cntNum);  //인원 수 초기화
			    let price = ${breweryData.br_price};
			    $(".price").text(price); //가격 초기화
			    
			    /* 시간 클릭 시 선택 표시 */
			    $('.time').on('click', function() {
			    	if ($(this).hasClass('choice') === false) {
			    		$(this).parents('#time-list').find('div').removeClass('choice');
			    		$(this).addClass('choice');
			    	} else {
			    		$(this).removeClass('choice');
			    	}
			    });
			    
			    /* - 버튼 클릭 시 인원 수 감소 */
			   	$("#cntMinusBtn").click(function() {
			   		if (cntNum > 1) {
			   			cntNum--;
			   			$(".count").text(cntNum);
			   		}
			   	});
			    
			   	/* + 버튼 클릭 시 인원 수 증가 */
			   	$("#cntPlusBtn").click(function() {
			   		cntNum++;
			   		$(".count").text(cntNum);
			   	});
			   	
			    /* 인원 수 증감에 따른 총액 변화 */
			    $(".count").on("DOMSubtreeModified", function() {
			    	let intCount = parseInt($(".count").text());
			    	$(".price").text(intCount * price);
			    });
			    
			    /* 예약하기 버튼 클릭 시 처리 이벤트 */
			    $("#reserveBtn").click(function() {
			    	var rsvDate = $(".day.current.choice").text();
				    if (parseInt(rsvDate) < 10) {
				    	rsvDate = "0" + rsvDate;
					}
				    var rsvDayString = $('.year-month').text() + "-" + rsvDate;
				    
			    	$("#rsv_day").val(rsvDayString); //hidden타입 예약날짜 값 설정
			    	$("#rsv_time").val($(".time.choice").text()); //hidden타입 예약시간 값 설정
			    	$("#rsv_count").val($(".count").text()); //hidden타입 인원 값 설정
			    	$("#rsv_price").val($(".price").text()); //hidden타입 총액 값 설정
			    	
			    	$("#reserveForm").attr({
			    		"method" : "post",
			    		"action" : "/breweryReserve"
			    	});
			    });
			}); //$함수 종료
		</script>
		<style>
			/* 날짜 선택하기 위한 달력 */
			.sec_cal {
			    width: 480px;
			    margin: 0 auto;
			}
			.sec_cal .cal_nav {
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    font-weight: 700;
			    font-size: 40px;
			    line-height: 78px;
			}
			.sec_cal .cal_nav .year-month {
			    width: 420px;
			    text-align: center;
			    line-height: 1;
			}
			.sec_cal .cal_nav .nav {
			    display: flex;
			    border: 1px solid #333333;
			    border-radius: 5px;
			}
			.sec_cal .cal_nav .go-prev,
			.sec_cal .cal_nav .go-next {
			    display: block;
			    width: 50px;
			    height: 78px;
			    font-size: 0;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			}
			.sec_cal .cal_nav .go-prev::before,
			.sec_cal .cal_nav .go-next::before {
			    content: "";
			    display: block;
			    width: 20px;
			    height: 20px;
			    border: 3px solid #000;
			    border-width: 3px 3px 0 0;
			    transition: border 0.1s;
			}
			.sec_cal .cal_nav .go-prev:hover::before,
			.sec_cal .cal_nav .go-next:hover::before {
			    border-color: #ed2a61;
			}
			.sec_cal .cal_nav .go-prev::before {
			    transform: rotate(-135deg);
			}
			.sec_cal .cal_nav .go-next::before {
			    transform: rotate(45deg);
			}
			.sec_cal .cal_wrap {
			    padding-top: 40px;
			    position: relative;
			    margin: 0 auto;
			}
			.sec_cal .cal_wrap .days {
			    display: flex;
			    margin-bottom: 20px;
			    padding-bottom: 20px;
			    border-bottom: 1px solid #ddd;
			}
			.sec_cal .cal_wrap::after {
			    top: 368px;
			}
			.sec_cal .cal_wrap .day {
			    display:flex;
			    align-items: center;
			    justify-content: center;
			    width: calc(100% / 7);
			    text-align: left;
			    font-size: 20px;
			    text-align: center;
			    border-radius:5px
			}
			.current.today {background: rgb(242 242 242);}
			.sec_cal .cal_wrap .dates {
			    display: flex;
			    flex-flow: wrap;
			    height: 290px;
			}
			.sec_cal .cal_wrap .day:nth-child(7n -1) {
			    color: #3c6ffa;
			}
			.sec_cal .cal_wrap .day:nth-child(7n) {
			    color: #ed2a61;
			}
			.sec_cal .cal_wrap .day.disable {
			    color: #ddd;
			}
			.day.choice {
				background: #00204A;
				color: white;
			}
			
			/* 시간 선택하기 위한 시간표 */
			#time-list {
				width: 480px;
				margin: 0 auto;
			}
			#time-list .time {
				font-size: 20px;
				padding: 20px;
			}
			#time-list .time.choice {
				background-color: #00204A;
				color: white;
			}
			
			/* 인원 선택 및 총액 */
			.count {
				font-size: 30px;
				padding: 20px;
			}
			.price {
				font-size: 30px;
				padding: 10px;
			}
		</style>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">양조장 체험 예약</h1>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 날짜 선택 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-md-6">
						<h2 class="font-weight-bold text-primary heading">날짜 선택</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="sec_cal">
							<div class="cal_nav">
								<a href="javascript:;" class="nav-btn go-prev">prev</a>
								<div class="year-month"></div>
								<a href="javascript:;" class="nav-btn go-next">next</a>
							</div>
							<div class="cal_wrap">
								<div class="days">
									<div class="day">월</div>
									<div class="day">화</div>
									<div class="day">수</div>
									<div class="day">목</div>
									<div class="day">금</div>
									<div class="day">토</div>
									<div class="day">일</div>
								</div>
								<div class="dates"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 시간 선택 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-md-6">
						<h2 class="font-weight-bold text-primary heading">시간 선택</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div id="time-list" class="panel panel-default text-center">
							<div class="time panel-body">09:00</div>
							<div class="time panel-body">10:00</div>
							<div class="time panel-body">11:00</div>
							<div class="time panel-body">12:00</div>
							<div class="time panel-body">13:00</div>
							<div class="time panel-body">14:00</div>
							<div class="time panel-body">15:00</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 인원 선택 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-md-6">
						<h2 class="font-weight-bold text-primary heading">인원 선택</h2>
					</div>
					<div class="col-md-6">
						<h2 class="font-weight-bold text-primary heading">총 금액</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<button type="button" id="cntMinusBtn" class="btn btn-primary">
							<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
						</button>
						<span class="count"></span>
						<button type="button" id="cntPlusBtn" class="btn btn-primary">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						</button>
					</div>
					<div class="col-6">
						<h4><span class="price"></span>원</h4>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 양조장 정보 확인 및 예약자 정보 입력 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-md-6">
						<h2 class="font-weight-bold text-primary heading">예약 정보 확인</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="100">
						<div class="contact-info">
							<div class="mt-2">
								<i></i>
								<h4 class="mb-2">양조장명:</h4>
								<p>${breweryData.br_name}</p>
							</div>
							<div class="mt-4">
								<i></i>
								<h4 class="mb-2">주소:</h4>
								<p>${breweryData.br_addr}</p>
							</div>
							<div class="mt-4">
								<i></i>
								<h4 class="mb-2">전화번호:</h4>
								<p>${breweryData.br_tel}</p>
							</div>
							<div class="mt-4">
								<i></i>
								<h4 class="mb-2">체험 프로그램:</h4>
								<p>${breweryData.br_program}</p>
							</div>
						</div>
					</div>
					<div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
						<form id="reserveForm" name="reserveForm">
							<input type="hidden" id="user_no" name="user_no" value="${sessionScope.login.user_no}" />
							<input type="hidden" id="br_id" name="br_id" value="${breweryData.br_id}" />
							<input type="hidden" id="rsv_day" name="rsv_day" />
							<input type="hidden" id="rsv_time" name="rsv_time" />
							<input type="hidden" id="rsv_count" name="rsv_count" />
							<input type="hidden" id="rsv_price" name="rsv_price" />
							<div class="row">
								<div class="col-6 mb-3">
									<input type="text" id="rsv_name" name="rsv_name" class="form-control" value="${sessionScope.login.user_name}">
								</div>
								<div class="col-6 mb-3">
									<input type="text" id="rsv_tel" name="rsv_tel" class="form-control" value="${sessionScope.login.user_tel}">
								</div>
								<div class="col-12 mb-3">
									<textarea id="rsv_request" name="rsv_request" cols="30" rows="7" class="form-control" placeholder="요청사항이 있으실 경우에만 입력해 주세요"></textarea>
								</div>
								<%-- 예약 버튼 --%>
								<div class="col-12">
									<button type="button" id="reserveBtn" class="btn btn-primary">예약하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>