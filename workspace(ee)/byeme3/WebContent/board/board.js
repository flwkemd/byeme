function boardConfirm(){
	if(document.board_frm.bTitle.value.length == 0){
		alert("제목이 공백입니다.");
		board_frm.bTitle.focus();
		return;
	}

	if(document.board_frm.bTitle.value.length < 2){
		alert("제목이 너무 짧습니다.");
		board_frm.bTitle.focus();
		return;
	}
	
	if(document.board_frm.bContent.value.length == 0){
		alert("내용이 공백입니다.");
		board_frm.bContent.focus();
		return;
	}
	
	if(document.board_frm.bContent.value.length < 2){
		alert("내용이 너무 짧습니다.");
		board_frm.bContent.focus();
		return;
	}
	
	document.board_frm.submit();
}