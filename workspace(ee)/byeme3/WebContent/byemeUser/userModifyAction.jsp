<%@page import="com.byeme.userDto.userDto"%>
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
	dto.setUserId(userId);
	
	userDao dao = userDao.getInstance();
	int ri = dao.updateUser(dto);
			
	if(ri == 1) {
%>
	<script language="javascript">
		alert("정보수정을 완료하였습니다.");
		document.location.href="../main.jsp";
	</script>
<%
	} else{
%>
	<script language="javascript">
		alert("정보수정을 실패하였습니다.");
		history.go(-1);
	</script>
<%
	}
%>

</body>
</html>