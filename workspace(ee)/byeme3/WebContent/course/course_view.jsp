<%@page import="java.io.PrintWriter"%>
<%@page import="com.byeme.boardDto.boardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.byeme.boardDao.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
 
<%
    // 줄바꿈 
    pageContext.setAttribute("br", "<br/>");
    pageContext.setAttribute("cn", "\n");
%> 
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Bye-me 자기 계발</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/landing-page.css" rel="stylesheet">

	<!-- Byeme CSS -->
    <link href="../css/byeme.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<script language="javascript" src="boardCmt.js"></script>

</head>


<body>

<%
	String userId = null;
	String id = null;
	if(session.getAttribute("userId")!= null){
		userId = (String)session.getAttribute("userId");
		id = (String)session.getAttribute("id");
	}else{
		response.sendRedirect("course_view2.jsp");
	}
%>

    <div id="wrapper">
	<nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="../main.jsp">Bye-me</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="../main.jsp">Home</a>
                    </li>
                    <li>
                        <a href="../main.jsp">About</a>
                    </li>
                    <li>
                        <a href="course.jsp">Course</a>
                    </li>
                    <li>
                        <a href="../board/board.jsp">Board</a>
                    </li>
                    <%
				if(userId == null){
					%>
					<li>
                        <a href="../byemeUser/login.jsp">Login</a>
                    </li>
                   	<% 
				}else{
                	%>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                            </a>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="../byemeUser/userModify.jsp"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="../byemeUser/logoutAction.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
				<%
					}
		        %>
           
		</nav>
		</div>
	
	<%
		String data = request.getParameter("data");
	%>

	<div class="container">
		<div class="row">
			<div class="write">
			<form method="post" action="list.do">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="8" style="background-color: #eeeeee; text-align: center;">게시판</th>
				</tr> 
			</thead>
			<tbody>
				<tr>	
					<td colspan="8" style="height: 450px; vertical-align: middle;" > 
					<iframe width="600" height="350" src="<%=data %>" frameborder="0" align="middle" allowfullscreen></iframe></td>
				</tr>
			</tbody>
			</table>
			</form>
			
			<!-- 댓글 부분 -->
	<div id="comment">
		<table border="1" bordercolor="lightgray">
	<!-- 댓글 목록 -->	
	<c:if test="${requestScope.commentList != null}">
		<c:forEach var="comment" items="${requestScope.commentList}">
			<tr>
				<!-- 아이디, 작성날짜 -->
				<td width="150">
					<div>
						<c:if test="${comment.comment_parent > 1}">
							&nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 아이디 앞에 공백을 준다. -->
							<img src="../img/reply_icon.png">
						</c:if>
					
						${comment.comment_id}<br>
						<font size="2" color="lightgray">${comment.comment_date}</font>
					</div>
				</td>
				<!-- 본문내용 -->
				<td width="550">
					<div class="text_wrapper">
						 ${fn:replace(comment.comment_content, cn, br)}
					</div>
				</td>
				<!-- 버튼 -->
				<td width="100">
					<div id="btn" style="text-align:center;">
						<a href="#" onclick="cmReplyOpen(${comment.comment_num})">[답변]</a><br>
					<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->	
					<c:if test="${comment.comment_id == sessionScope.userId}">
						<a href="#" onclick="cmUpdateOpen(${comment.comment_num})">[수정]</a><br>	
						<a href="#" onclick="cmDeleteOpen(${comment.comment_num})">[삭제]</a>
					</c:if>		
					</div>
				</td>
			</tr>
			
		</c:forEach>
	</c:if>
            <!-- 로그인 했을 경우만 댓글 작성가능 -->
            <c:if test="${sessionScope.userId !=null}">
            <tr bgcolor="#F5F5F5">
            <form id='writeCommentForm'>
                <input type="hidden" name="comment_id" value="${sessionScope.userId}">
                <!-- 아이디-->
                <td width="150">
                    <div>
                        ${sessionScope.userId}
                    </div>
                </td>
                <!-- 본문 작성-->
                <td width="550">
                    <div>
                        <textarea name="comment_content" rows="4" cols="116" ></textarea>
                    </div>
                </td>
                <!-- 댓글 등록 버튼 -->
                <td width="100">
                    <div id="btn" style="text-align:center;">
                        <p><a href="#" onclick="writeCmt()">[댓글등록]</a></p>    
                    </div>
                </td>
            </form>
            </tr>
            </c:if>
		</table>
		    </div>
		</div>    
	
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

</body>

</html>
