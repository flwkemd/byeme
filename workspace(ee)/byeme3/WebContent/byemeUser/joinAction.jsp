<%@page import="com.byeme.userDao.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="com.byeme.userDto.userDto"/>
<jsp:setProperty property="*" name="dto"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	userDao dao = userDao.getInstance();
	if(dao.confirmId(dto.getUserId()) == userDao.MEMBER_EXISTENT){
%>
	<script language="javascript">
		alert("아이디가 존재합니다.")
		history.back();
	</script>
<%
	}else {
		int ri = dao.insertUser(dto);
		if(ri == userDao.MEMBER_JOIN_SUCCESS){
			session.setAttribute("userId", dto.getUserId());
%>
	
	<script language="javascript">
		alert("회원가입이 완료되었습니다..");
		document.location.href="login.jsp";
	</script>
<%			
		}else{
%>
	<script language="javascript">
		alert("회원가입이 실패하였습니다.");
		document.location.href="login.jsp";
	</script>
<%			
		}
	}
%>

</body>
</html>