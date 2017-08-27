<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Bye me</title>

    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/landing-page.css" rel="stylesheet">

	<!-- Byeme CSS -->
    <link href="../css/byeme.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

	<script language="javaScript" src="findUser.js" ></script>
    <script src="../js/jquery.js"></script>
	

</head>

<body>
<%
	String userId = "";
	if(session.getAttribute("id")!= null){
			userId = (String)session.getAttribute("id");
		}

%>    
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
                <a class="navbar-brand topnav" href="../index.html">Bye-me</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="../index.html">Home</a>
                    </li>
                    <li>
                        <a href="../main.jsp">About</a>
                    </li>
                    <li>
                        <a href="../course/course2.jsp">Course</a>
                    </li>
                    <li>
                        <a href="../board/board.jsp">Board</a>
                    </li>
                    <li>
                        <a href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">로그인</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="loginAction.jsp" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="ID" name="userId" type="text" value="<%=userId %>" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="userPassword" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me"
                                        <% 
                                        	if(userId.length()>1)
                                        		out.println("checked");
                                        %>
                                        > 아이디 기억하기
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="로그인">
                                <div class="login">
                              	<ul class="loginFieldset">
                              		<li><a href="" id="btnFindUserId" onclick="btnFindUserId()">아이디 찾기</a></li>
                              		<li><a href="" id="btnFindUserPw" onclick="btnFindUserPw()">비밀번호 찾기</a></li>
                              		<li><a href="join.jsp" class="join"> 회원가입 </a></li>
                              	</ul>
                              	</div>
                            </fieldset>
                        </form>
                    </div>
                    <div class="panel-footer">
                    	<label>
                    		소셜 계정으로 로그인하기
                    	</label>
                    	<ul class="list-inline intro-social-buttons">
                            <li>
                                <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Google</span></a>
                            </li>
                            <li>
                                <a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Facebook</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
