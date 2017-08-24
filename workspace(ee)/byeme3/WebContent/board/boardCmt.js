
var httpRequest = null;

function getXMLHttpRequest(){
	var httpRequest = null;
	
	if(window.ActiveXOBject){
		try{
			httpRequest = new ActiveXOBject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				httpRequest = new ActiveXOBject("Microsoft.XMLHTTP");
			}catch(e2){
				httpReuqest = null;
			}
		}
		
	}else if(window.XMLHttpRequest){
		httpRequest = new window.XMLHttpRequest();
	}
	return httpRequest; 
}

function writeCmt(){
	var form = document.getElementById("writeCommentForm");
	
	var board = form.comment_board.value
	var id = form.comment_id.value
	var content = form.comment_content.value;
	
	if(!content)
	{
		alert("내용을 입력하세요.");
		return false;
	}
	else
	{	
		var param="comment_board="+board+"&comment_id="+id+"&comment_content="+content;
			
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = checkFunc;
		httpRequest.open("POST", "CommentWriteAction.co", true);	
		httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8'); 
		httpRequest.send(param);
	}
}

function checkFunc(){
	if(httpRequest.readyState == 4){
		var resultText = httpRequest.responseText;
		if(resultText == 1){
			document.location.reload();
		}
	}
}

// 댓글 답변창
function cmReplyOpen(comment_num){
	var userId = '${sessionScope.userId}';
	
	if(userId == "" || userId == null){
		alert("로그인후 사용가능합니다.");
		return false;
	}
	else{
		// 댓글 답변창 open
		window.name = "parentForm";
		window.open("CommentReplyFormAction.co?num="+comment_num,
					"replyForm", "width=570, height=350, resizable = no, scrollbars = no");
	}
}

// 댓글 삭제창
function cmDeleteOpen(comment_num){
	var msg = confirm("댓글을 삭제하시겠습니까?");	
	if(msg == true){ // 확인을 누를경우
		deleteCmt(comment_num);
	}
	else{
		return false; // 삭제취소
	}
}

// 댓글 삭제
function deleteCmt(comment_num)
{
	var param="comment_num="+comment_num;
	
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = checkFunc;
	httpRequest.open("POST", "CommentDeleteAction.co", true);	
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8'); 
	httpRequest.send(param);
}

// 댓글 수정창
function cmUpdateOpen(comment_num){
	window.name = "parentForm";
	window.open("CommentUpdateFormAction.co?num="+comment_num,
				"updateForm", "width=570, height=350, resizable = no, scrollbars = no");
}

