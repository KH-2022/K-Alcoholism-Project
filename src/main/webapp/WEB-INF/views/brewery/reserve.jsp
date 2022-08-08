<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			let nowDate = new Date();
	
			let year = nowDate.getFullYear();
			let lastDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			let month = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
	
			//윤달 계산
			if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0) {
			    lastDay[1] = 29;
			} else {
			    lastDay[1] = 28;
			}
	
			//이번달 계산
			let thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth()).getMonth();
			//지난달의 마지막 요일 인덱스를 변수로 지정
			let prevMonthDay = new Date(nowDate.getFullYear(), thisMonth).getDay();
	
			let thisDate = month[thisMonth];
			let date = lastDay[thisMonth];
			
			/*$(function() {
				let tag = "<tr>";

				if(nextData===this.$proA.innerHTML){
				    let count = 0;
				    
				    //지난달의 마지막 요일 인덱스까지 빈배열로 반복문 시작
				    for (let j = 0; j < thisMonthDay; j++) {
				        tag += "<td></td>";
				        count++;
				    }
				    
				    //지난달의 마지막 요일 이후부터 이번달의 마지막일까지 반복
				    for (let i = 1; i <= date; i++) {
				    	//7일씩 tr로 묶기
				        if (count % 7 === 0) {
				            tag += "<tr>";

				        }
				    	
				        //조건은 쉬는 날을 지정. 따로 classname을 부여. count시작
				        if(((thisDate==="Jan"&& i===1)||(thisDate==="Feb"&& (i===11||i===12||i===13))||(thisDate==="Mar"&& i===1)||(thisDate==="May"&& (i===5||i===19))||(thisDate==="Aug"&& (i===20||i===21||i===22)))||(count % 7 === 0||count % 7 === 6)){
				            tag += "<td class='xday'><p>${i}</p></td>";
				            count++;
				        }else if(count%7===2||count%7===4){
				            tag += "<td class='Ahalf'><p>${i}</p></td>";
				            count++;
				        }
				        else{
				            tag += "<td class='pickday'><p>${i}</p></td>";
				            count++;
				        }
				        
				        //7일이 끝나면 tr태그 닫기
				        if (count % 7 === 0) {
				            tag += "</tr>";
						}
				    }
				}
			});*/
		</script>
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
						<div class="monthBtn">
							<div id="mPrevBtn">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							</div>
							<h3 class="month"></h3>
							<div id="mNextBtn">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							</div>
						</div>
						<div class="calendar">
							
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
						
					</div>
				</div>
			</div>
		</div>
		
		<%-- 예약정보 확인 페이지로 넘어가는 버튼 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-md-6">
						<button type="button" id="rsvDetailBtn" class="btn btn-primary text-white">다음</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>