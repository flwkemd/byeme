<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

	<script language="JavaScript" src="user.js" ></script>
</head>

<body>

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
                <a class="navbar-brand topnav" href="#">Bye-me</a>
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
                        <h3 class="panel-title">회원가입</h3>
                    </div>
                    <div class="panel-body">
                        <form action="joinAction.jsp" method="post" name="reg_frm">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" id="joinId" placeholder="아이디" name="userId" type="text" maxlength="20" autofocus >
                                    <input class="form-control" id="joinIdBtn" type="button" value="중복 확인" onclick="openIdChk()">
                                    <input class="form-control" name="userIdDuplication" type="hidden" value="idUncheck">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호" name="userPassword" type="password" maxlength="20">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호 확인" name="userPasswordCheck" type="password" maxlength="20">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="닉네임" name="userName" type="text" maxlength="50">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="이메일" name="userEmail" type="email" maxlength="20">
                                </div>
                                
								<input type="button" onclick="infoConfirm()" value="회원가입" id="joinbtn" class="btn btn-lg btn-success btn-block">
                                
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
