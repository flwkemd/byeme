<%@page import="java.net.URLEncoder"%>
<%@page import="com.byeme.userDto.userDto"%>
<%@page import="com.byeme.userDao.userDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="com.byeme.userDto.userDto" scope="page"/>
<jsp:setProperty name="user" property="userId"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String) session.getAttribute("userId");
		}
		if(userId != null){
	%>
		<script type="javascript">
			alert("이미 로그인이 되어있습니다.");
			history.go(-1);
		</script>	
	<%
		}
		
		userDao userDao = new userDao();
		int checkNum = userDao.login(user.getUserId(),user.getUserPassword());
	
		if(checkNum == -1){
	%>
		<script language="javascript">
			alert("아이디가 존재하지 않습니다.");
			history.go(-1);
		</script>
	<%		
		}else if (checkNum == 0){
	%>
		<script language = "javascript">
			alert("로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.");
			history.go(-1);
		</script>
<%		
		
	}else if(checkNum == 1){
			session.setAttribute("userId", user.getUserId());
			
			String remember = request.getParameter("remember");
			String id = request.getParameter("userId");
	
			if(remember != null && remember.trim().equals("Remember Me")){
				session.setAttribute("id", id);
			}else{
				session.removeAttribute("id");
			}
			response.sendRedirect("../main.jsp");
	}
%>



</body>
</html>