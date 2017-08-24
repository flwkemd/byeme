<%@page import="com.byeme.boardDto.boardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.byeme.boardDao.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</head>


<body>

<%
	String userId = null;
	if(session.getAttribute("userId")!= null){
		userId = (String)session.getAttribute("userId");
	}
	int pageNumber =  1;
	if(request.getParameter("pageNumber") !=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	boardDto dto = new boardDto();
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
                        <a href="board.jsp">Board</a>
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
	

	<div class="container">
			<div class="row">
				<div class="table-board">
				<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					boardDao boardDao = new boardDao();
            		ArrayList<boardDto> list = boardDao.list(pageNumber);
            		for(int i=0; i<list.size(); i++){
				%>
				<tr>
					<td><%= list.get(i).getbId() %></td>
					<td><%= list.get(i).getuserId() %></td>
					<td>
					&nbsp;&nbsp;
					
						<%
							if(list.get(i).getbIndent()>0){
						%>			
								<img src="../img/reply_icon.png">
								<a href="content_view.do?bId=<%=list.get(i).getbId()%>"><%= list.get(i).getbTitle() %></a>
						<%	
							}else{
						%>
						<a href="content_view.do?bId=<%=list.get(i).getbId()%>"><%= list.get(i).getbTitle() %></a>
						<%
							}
						%>
					</td>
					<td><%= list.get(i).getbDate()%></td>
					<td><%= list.get(i).getbHit()%></td>
				</tr>
				<%
					}
				%>
				</tbody>
				</table>
				</div>
				<%
					if(pageNumber != 1){
				%>
					<a href="board.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>
				<% 		
					} if(boardDao.nextPage(pageNumber+1)){
				%>
					<a href="board.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-success btn-arraw-left">다음</a>
				<% 		
					}
				%>
				
					 <form name='frm' style="margin-left:400px;" method='GET' action='search.do'>
				      <select name='col' style="height:24px;"> <!-- 검색 컬럼 -->
				        <OPTION value='none'>전체 목록</OPTION>
				        <OPTION value='userId'>작성자</OPTION>
				        <OPTION value='bTitle'>제목</OPTION>
				        <OPTION value='bContent'>내용</OPTION>
				        <OPTION value='title_content'>제목+내용</OPTION>
				      </select>
				      <input type='text' name='word' style="width:210px;" placeholder="특수문자는 사용할수 없습니다.">
					<input type="submit" value="검색" style="margin-left:3px; height:35px; width:60px;" id="searchbtn" class="btn btn-lg btn-success">
					 </form>
				<%	
						if(userId != null){
				%>		
								
				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
				
				<%
					}
				%> 
 

			</div>
		</div>

    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

</body>

</html>
