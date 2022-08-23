/* 유효성 체크 함수
 * chkData(유효성 체크 대상의 선택자, 메시지 내용)
 * alert 경고창으로 사용자에게 알림
 */
 function chkData(item, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg + " 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}


/* 유효성 체크 함수
 * chkSelect(유효성 체크 대상의 선택자, 메시지 내용)
 * alert 경고창으로 사용자에게 알림
 */
 function chkSelect(item, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg + " 선택해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}


/* chkForm(유효성 체크 대상, 메시지 내용)
 * placeholder 속성으로 사용자에게 알림
 */
function chkForm(item, msg) {
	let message = "";
	if ($(item).val().replace(/\s/g, "") == "") {
		message = msg + " 입력해 주세요.";
		$(item).attr("placeholder", message);
		return false;
	} else {
		return true;
	}
}


/* dataCheck(유효성 체크 대상, 출력 영역, 메시지 내용)
 * 출력 영역에 출력하여 사용자에게 알림
 */
function dataCheck(item, out, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		$(out).html(msg + " 입력해 주세요.");
		$(item).val("");
		return false;
	} else {
		return true;
	}
}

/* formCheck(유효성 체크 대상, 출력 영역, 메시지 내용)
 * 출력 영역에 출력하여 사용자에게 알림
 */
function formCheck(main, item, msg) {
	if (main.val().replace(/\s/g, "") == "") {
		item.html(msg + " 입력해 주세요.");
		main.val("");
		return false;
	} else {
		return true;
	}
}

/* 첨부파일의 이미지 파일 여부를 확인하기 위한 확장자 확인 함수
 * chkFile(파일명)
 */
 function chkFile(item) {
	let ext = item.val().split('.').pop().toLowerCase();
	
	// jQuery.inArray(찾을 값, 검색 대상 배열) : 배열 내에서 값을 찾아 인덱스를 반환, 요소가 없을 경우 -1 반환
	if (jQuery.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
		alert("gif, png, jpg, jpeg 파일만 업로드할 수 있습니다.");
		item.val("");
		return false;
	} else {
		return true;
	}
}
