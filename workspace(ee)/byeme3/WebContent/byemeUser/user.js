function infoConfirm(){
	if(document.reg_frm.userId.value.length == 0){
		alert("아이디가 공백입니다.");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.userIdDuplication.value != "idCheck"){
        alert("아이디 중복체크를 해주세요.");
        return;
    }
	
	if(document.reg_frm.userId.value.length < 2){
		alert("아이디가 너무 짧습니다.");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.userPassword.value.length == 0){
		alert("비밀번호가 공백입니다.");
		reg_frm.userPassword.focus();
		return;
	}
	
	if(document.reg_frm.userPasswordCheck.value == 0){
		alert("비밀번호 확인란이 공백입니다.");
		reg_frm.userPasswordCheck.focus();
		return;
	}

	if(document.reg_frm.userPassword.value != document.reg_frm.userPasswordCheck.value){
		alert("비밀번호가 서로 일치하지 않습니다.");
		reg_frm.userPassword.focus();
		return;
	}
	
	if(document.reg_frm.userName.value.length == 0) {
		alert("이름이 공백입니다.");
		reg_frm.userName.focus();
		return;
	}
	
	
	if(document.reg_frm.userEmail.value.length == 0) {
		alert("이메일이 공백입니다.");
		reg_frm.userEmail.focus();
		return;
	}
	
	document.reg_frm.submit();
}

//아이디 중복체크 화면open
function openIdChk(){

    window.name = "parentForm";
    window.open("IdCheckForm.jsp",
            "chkForm", "width=500, height=300, resizable = no, scrollbars = no");
    document.reg_frm.userId.value.submit();
}

// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
// 다시 중복체크를 하도록 한다.
function inputIdChk(){
    document.reg_frm.userIdDuplication.value ="idUncheck";
}



function deleteConfirm(){
	
	if(document.reg_frm.userPassword.value.length == 0){
		alert("비밀번호를 입력해주세요.");
		reg_frm.userPassword.focus();
		return;
	}
	
	
	if(document.reg_frm.userPasswordCheck.value == 0){
		alert("비밀번호 확인란을 입력해주세요.");
		reg_frm.userPasswordCheck.focus();
		return;
	}
	
	if(document.reg_frm.userPassword.value != document.reg_frm.userPasswordCheck.value){
		alert("비밀번호가 서로 일치하지 않습니다.");
		reg_frm.userPassword.focus();
		return;
	}
	
		if(confirm("삭제하겠습니까?")){
			 return document.reg_frm.submit(); 
		}else{
			return false;
		};
	
}
