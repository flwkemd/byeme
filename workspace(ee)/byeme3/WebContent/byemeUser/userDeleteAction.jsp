<%@page import="com.byeme.userDao.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="com.byeme.userDto.userDto" scope="page"/>
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");

	String userId = (String)session.getAttribute("userId");
	String userPassword = request.getParameter("userPassword");
	
	userDao dao = userDao.getInstance();
	
	int rn = dao.login(userId, userPassword);
	
	if(rn == 1){
	dao.delete(userId);
%>
	<script language="javascript">
		alert("탈퇴를 완료하였습니다.");
		document.location.href="../index.html";
	</script>
<%
	}else{
%>
	<script language="javascript">
		alert("사용자 비밀번호가 틀립니다.");
		document.location.href="userModify.jsp";
	</script>
<%
	}
%>

</body>
</html>