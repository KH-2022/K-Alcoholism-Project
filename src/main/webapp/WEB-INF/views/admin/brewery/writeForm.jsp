<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		$(function(){
			/* 양조장 등록 버튼 클릭시 처리 이벤트 */
			$("#brInsertBtn").click(function(){
				//유효성 체크 + 정규표현식 체크
				var phonCheck = RegExp(/^([0-9]{2,3})\-([0-9]{3,4})\-[0-9]{4}$/); //전화번호
				var numCheck = RegExp(/[0-9]/g); //소요시간, 체험비용
				
				if (!chkData("#br_name", "양조장 이름을")) return;
				else if (!chkData("#br_region", "지역을")) return;
				else if (!chkData("#br_addr", "주소를")) return;
				else if (!chkData("#br_tel", "전화번호를")) return;
				else if(!(phonCheck.test($("#br_tel").val()))){
					alert("전화번호 규칙에 맞게 입력해 주세요. 예시) ##-###-####");
					$("#br_tel").val("");
					return;
				}	
				else if (!chkData("#br_info", "양조장 정보를")) return;
				else if (!chkData("#br_type", "취급주종을")) return;
				else if (!chkData("#br_program", "체험 프로그램을")) return;
				else if (!chkData("#br_time", "소요시간을")) return;
				else if(!(numCheck.test($("#br_time").val()))){
					alert("소요시간은 분 단위로 숫자만 입력해 주세요.");
					$("#br_time").val("");
					return;
				}
				else if (!chkData("#br_price", "인당 체험비용을")) return;
				else if(!(numCheck.test($("#br_price").val()))){
					alert("인당 체험비용은 숫자만 입력해 주세요.");
					$("#br_price").val("");
					return;
				}
				else {
					if ($("#file").val() != "") { //br_image
						if (!chkFile($("#file"))) return;
					}
					
					$("#brWriteForm").attr({
						"method" : "post",
						"enctype" : "multipart/form-data",
						"accept-charset" : "UTF-8",
						"action" : "/admin/brewery/breweryInsert"
					});
					$("#brWriteForm").submit();
				}
			});
			
			/*취소 버튼 클릭 시 처리 이벤트 */
			$("#brCancelBtn").click(function(){
				$("#brWriteForm").each(function(){
					this.reset();
				});
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트*/
			$("#brListBtn").click(function(){
				location.href="/admin/brewery/breweryList";
			});
		});
	</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header text-center">
				<h2>양조장 관리</h2>
				<h4>양조장 등록</h4>
			</div>
			 
			<%-- 버튼 --%>
			<div class="btnGroup text-right">
				<button type="button" class="btn btn-primary" id="brInsertBtn">양조장 등록</button>
				<button type="button" class="btn btn-primary" id="brCancelBtn">초기화</button>
				<button type="button" class="btn btn-primary" id="brListBtn">양조장 목록</button>
			</div>
			 
			 <%--==============상품등록 양식보여주기 시작=================== --%>
			 <div class="contentTB text-center">
			 	<form id="brWriteForm" name="brWriteForm" class="form-horizontal">
			 		<table class="table table-bordered">
			 			<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>양조장 이름</td>
								<td class="text-left"><input type="text" class="form-control" id="br_name" name="br_name" /></td>
							</tr>
							<tr>
								<td>양조장 지역(도)</td>
								<td>
									<select id="br_region" name="br_region" class="form-control">
							            <option value="강원">강원</option>
							            <option value="경기">경기</option>
							            <option value="경상">경상</option>
							            <option value="광주">광주</option>
							            <option value="대구">대구</option>
							            <option value="대전">대전</option>
							            <option value="부산">부산</option>
							            <option value="서울">서울</option>
							            <option value="울산">울산</option>
							            <option value="인천">인천</option>
							            <option value="전라">전라</option>
							            <option value="제주">제주</option>
							            <option value="충청">충청</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>양조장 주소</td>
								<td class="text-left"><input type="text" class="form-control" id="br_addr" name="br_addr" /></td>
							</tr>
							<tr>
								<td>양조장 전화번호</td>
								<td class="text-left"><input type="text" class="form-control" id="br_tel" name="br_tel" /></td>
							</tr>
							<tr>
								<td>양조장 홈페이지</td>
								<td class="text-left"><input type="text" class="form-control" id="br_site" name="br_site" /></td><%-- 필수 요소 아님 --%>
							</tr>
							<tr>
								<td>양조장 소개</td>
								<td class="text-left"><textarea name="br_info" id="br_info" class="form-control" rows="8"></textarea></td>
							</tr>
							<tr>
								<td>양조장 취급주종</td>
								<td class="text-left"><input type="text" class="form-control" id="br_type" name="br_type" /></td>
							</tr>
							<tr>
								<td>체험 프로그램명</td>
								<td class="text-left"><input type="text" class="form-control" id="br_program" name="br_program" /></td>
							</tr>
							<tr>
								<td>소요시간(분) </td>
								<td class="text-left"><input type="text"  class="form-control" id="br_time" name="br_time" /></td>
							</tr>
							<tr>
								<td>인당 체험비용</td>
								<td class="text-left"><input type="text" class="form-control" id="br_price" name="br_price"/></td>
							</tr>
							<tr>
								<td>이미지 파일 첨부</td>
								<td class="text-left"><input type="file" id="file" name="file" /></td>
							</tr>
						</tbody>
			 		</table>
			 	</form>
			 </div>
		</div>	
	</body>
</html>