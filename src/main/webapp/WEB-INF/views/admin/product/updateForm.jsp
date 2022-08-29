<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				/* 초기값 설정 */
				$("#pd_sort").val("${updateData.pd_sort}").prop("selected", true);
				
				/* 수정 버튼 클릭시 처리 이벤트 */
				$("#pdUpdateBtn").click(function(){
					//유효성 체크 + 정규표현식 체크
					var numChk = RegExp(/[0-9]/g);
					
					if (!chkData("#br_id", "양조장 번호를")) return;
					else if (!chkData("#pd_name", "상품 이름을")) return;
					else if (!chkData("#pd_price", "상품 가격을")) return;
					else if (!(numChk.test($("#pd_price").val()))) {
						alert("상품 가격은 숫자만 입력해 주세요.");
						$("#pd_price").val("");
						return;
					}	
					else if (!chkData("#pd_sort", "분류를")) return;
					else if (!chkData("#pd_degree", "상품 도수를")) return;
					else if (!(numChk.test($("#pd_degree").val()))) {
						alert("상품 도수는 숫자만 입력해 주세요.");
						$("#pd_degree").val("");
						return;
					}
					else if (!chkData("#pd_volume", "상품 용량을")) return;
					else if (!(numChk.test($("#pd_volume").val()))) {
						alert("상품 용량은 숫자만 입력해 주세요.");
						$("#pd_volume").val("");
						return;
					}
					else if (!chkData("#pd_info", "정보를")) return;
					else {
						if ($("#file").val() != "") { //pd_image
							if (!chkFile($("#file"))) return;
						}
					
						$("#pdUpdateForm").attr({
							"method" : "post",
							"enctype" : "multipart/form-data",
							"accept-charset" : "UTF-8",
							"action" : "/admin/product/productUpdate"
						});
						$("#pdUpdateForm").submit();
					}
				});
				
				/* 취소 버튼 클릭시 처리 이벤트 */
				$("#pdCancelBtn").click(function(){
					$("#pdUpdateForm").each(function(){
						this.reset();
						$("#pd_sort").val("${updateData.pd_sort}").prop("selected", true);
					});
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#pdListBtn").click(function(){
					location.href="/admin/product/productList";
				});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header text-center">
				<h2>상품 관리</h2>
				<h4>상품 수정</h4>
			</div>
			
			<%-- 버튼 --%>
			<div class="btnGroup text-right">
				<button type="button" class="btn btn-primary" id="pdUpdateBtn">상품 수정</button>
				<button type="button" class="btn btn-primary" id="pdCancelBtn">초기화</button>
				<button type="button" class="btn btn-primary" id="pdListBtn">상품 목록</button>
			</div>
			
			<div class="contentTB text-center">
				<form id="pdUpdateForm" name="pdUpdateForm">
					<input type="hidden" id="pd_id" name="pd_id" value="${updateData.pd_id}" />
					<input type="hidden" id="pd_image" name="pd_image" value="${updateData.pd_image}" />
					<input type="hidden" id="pd_thumb" name="pd_thumb" value="${updateData.pd_thumb}" />
					
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="col-md-3">글번호</td>
								<td class="col-md-3 text-left">${updateData.pd_id}</td>
								<td class="col-md-3">작성일</td>
								<td class="col-md-3 text-left">${updateData.pd_date}</td>
							</tr>
							<tr>
								<td>양조장 번호</td>
								<td colspan="3" class="text-left ">
									<input type="text" name="br_id" id="br_id" value="${updateData.br_id}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>상품명</td>
								<td colspan="3" class="text-left ">
									<input type="text" name="pd_name" id="pd_name" value="${updateData.pd_name}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>상품 가격</td>
								<td colspan="3" class="text-left ">
									<input type="text" name="pd_price" id="pd_price" value="${updateData.pd_price}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>상품 분류</td>
								<td colspan="3" class="text-left">
									<select id="pd_sort" name="pd_sort" class="form-control">
										<option value="탁주">탁주</option>
										<option value="약주/청주">약주/청주</option>
										<option value="과실주">과실주</option>
										<option value="증류주">증류주</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>상품 도수(%)</td>
								<td colspan="3" class="text-left ">
									<input type="text" name="pd_degree" id="pd_degree" value="${updateData.pd_degree}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>상품 용량(ml)</td>
								<td colspan="3" class="text-left ">
									<input type="text" name="pd_volume" id="pd_volume" value="${updateData.pd_volume}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>상품 정보</td>
								<td colspan="3" class="text-left"><textarea name="pd_info" id="pd_info" class="form-control" rows="8">${updateData.pd_info}</textarea></td>
							</tr>
							<tr>
								<td>이미지 파일첨부</td>
								<td colspan="3" class="text-left"><input type="file" name="file" id="file" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</body>
</html>