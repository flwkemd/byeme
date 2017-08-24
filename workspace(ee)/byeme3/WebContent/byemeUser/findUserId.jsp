<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="../js/jquery.js"></script>
	<title>아이디 찾기</title>
	
	<style type="text/css">
		#wrap {
			width: 490px;
			text-align :center;
			margin: 0 auto 0 auto;
		}
		
		#chk{
			text-align :center;
		}
		
		#cancelBtn{
			visibility:visible;
		}
		
		#useBtn{
			 visibility:hidden;
		}

	</style>
	
	<script type="text/javascript">
	
		// 아이디 찾기
		function findUser(){
			var userEmail = document.getElementById("userEmail").value;
			
			if(!userEmail){
				alert("이메일을 입력하지 않았습니다.");
				return false;
			}
			
			var userName = document.getElementById("userId").value;
			if (!userName) {
				alert("이름을 입력하지 않았습니다.");
				return false;
			} 
		
			$.post("findId.do",{
				userEmail : userEmail,
				userName : userName
			},function(data){
				document.getElementById("msg").innerHTML = data;
			});
		}

		
	</script>
	
</head>
<body>
<div id="wrap">
	<br>
	<b><font size="4" color="gray">아이디 찾기</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form id="checkForm">
			<input type="text" name="userEmail" id="userEmail"  placeholder="이메일을 입력하세요." style="margin-right: 42px; height: 30px;"> <br>
			<input type="text" name="userId" id="userId" placeholder="이름을 입력하세요." style="height: 30px;">
			<input type="button" value="찾기" onclick="findUser()">
		</form>
		<div id="msg"></div>
		<br>
		<input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
		<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
	</div>
</div>	
</body>
</html>