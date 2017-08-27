<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/landing-page.css" rel="stylesheet">

	<!-- Byeme CSS -->
    <link href="css/byeme.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
	String id = null;
	if(session.getAttribute("userId")!= null){
		userId = (String)session.getAttribute("userId");
		id = (String)session.getAttribute("id");
	}else{
		response.sendRedirect("index.html");
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
                <a class="navbar-brand topnav" href="#">Bye-me</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li>
                        <a href="main.jsp">About</a>
                    </li>
                    <li>
                        <a href="course/course.jsp">Course</a>
                    </li>
                    <li>
                        <a href="board/board.jsp">Board</a>
                    </li>
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
                        <li><a href="byemeUser/userModify.jsp"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="byemeUser/logoutAction.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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

           
		</nav>
		</div>
	


    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Bye-me</h1>
                        <h3>자기 계발</h3>
                        <form role="search" method="get" class="left" action="http://localhost:8183/byeme3/index.html#about">
                        	<input type="hidden" name="post_type" value="course">
                        	<input type="search" name="s" id="s" placeholder="배우고 싶은 강의를 검색하세요.">
                        	<input type="submit" class="searchsubmit" value="검색">
                        </form>
                        <hr class="intro-divider">
                        <label>
                        	
                        </label>
                        <ul class="list-inline intro-social-buttons">
                            <li></li><li></li>
                        </ul>
                    </div>
				     <section id="services" class="services bg-primary">
				        <div class="container">
				            <div class="row text-center">
				                <div class="col-lg-10 col-lg-offset-1">
				                    <div class="row">
				                        <div class="col-md-3 col-sm-6">
				                            <div class="service-item">
				                                <span class="fa-stack fa-4x">
				                                <i class="fa fa-circle fa-stack-2x"></i>
				                                <i class="fa fa-cloud fa-stack-1x text-primary"></i>
				                            </span>
				                                <h4>
				                                    <strong>자기 계발1</strong>
				                                </h4>
				                                <p>자기 계발 1입니다.</p>
				                                <a href="#" class="btn btn-default">Learn More</a>
				                            </div>
				                        </div>
				                        <div class="col-md-3 col-sm-6">
				                            <div class="service-item">
				                                <span class="fa-stack fa-4x">
				                                <i class="fa fa-circle fa-stack-2x"></i>
				                                <i class="fa fa-compass fa-stack-1x text-primary"></i>
				                            </span>
				                                <h4>
				                                    <strong>자기 계발2</strong>
				                                </h4>
				                                <p>자기 계발 2입니다.</p>
				                                <a href="#" class="btn btn-default">Learn More</a>
				                            </div>
				                        </div>
				                        <div class="col-md-3 col-sm-6">
				                            <div class="service-item">
				                                <span class="fa-stack fa-4x">
				                                <i class="fa fa-circle fa-stack-2x"></i>
				                                <i class="fa fa-flask fa-stack-1x text-primary"></i>
				                            </span>
				                                <h4>
				                                    <strong>자기 계발3</strong>
				                                </h4>
				                                <p>자기 계발 3입니다.</p>
				                                <a href="#" class="btn btn-default">Learn More</a>
				                            </div>
				                        </div>
				                        <div class="col-md-3 col-sm-6">
				                            <div class="service-item">
				                                <span class="fa-stack fa-4x">
				                                <i class="fa fa-circle fa-stack-2x"></i>
				                                <i class="fa fa-shield fa-stack-1x text-primary"></i>
				                            </span>
				                                <h4>
				                                    <strong>자기 계발4</strong>
				                                </h4>
				                                <p>자기 계발 4입니다.</p>
				                                <a href="#" class="btn btn-default">Learn More</a>
				                            </div>
				                        </div>
				                    </div>
				                    <!-- /.row (nested) -->
				                </div>
				                <!-- /.col-lg-10 -->
				            </div>
				            <!-- /.row -->
				        </div>
				        <!-- /.container -->
				    </section>
                 
                </div>
            </div>
        </div>
        <!-- /.container -->



    </div>
    
    
    <!-- /.intro-header -->

    <!-- Page Content -->

	<a  name="services"></a>
    <div class="content-section-a">

        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">Death to the Stock Photo:<br>Special Thanks</h2>
                    <p class="lead">A special thanks to <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a> for providing the photographs that you see in this template. Visit their website to become a member.</p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="img/ipad.png" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->

    <div class="content-section-b">

        <div class="container">

            <div class="row">
                <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">3D Device Mockups<br>by PSDCovers</h2>
                    <p class="lead">Turn your 2D designs into high quality, 3D product shots in seconds using free Photoshop actions by <a target="_blank" href="http://www.psdcovers.com/">PSDCovers</a>! Visit their website to download some of their awesome, free photoshop actions!</p>
                </div>
                <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                    <img class="img-responsive" src="img/dog.png" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-b -->

    <div class="content-section-a">

        <div class="container">

            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">Google Web Fonts and<br>Font Awesome Icons</h2>
                    <p class="lead">This template features the 'Lato' font, part of the <a target="_blank" href="http://www.google.com/fonts">Google Web Font library</a>, as well as <a target="_blank" href="http://fontawesome.io">icons from Font Awesome</a>.</p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="img/phones.png" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->

	<a  name="contact"></a>
    <div class="banner">

        <div class="container">

            <div class="row">
                <div class="col-lg-6">
                    <h2>Bye-me Connection:</h2>
                </div>
                <div class="col-lg-6">
                    <ul class="list-inline banner-social-buttons">
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
        <!-- /.container -->

    </div>
    <!-- /.banner -->

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#about">About</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="board/board.jsp">Board</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="byemeUser/logoutAction.jsp">Logout</a>
                        </li>
                    </ul>
	                 	    <div id="footer" style=""> 
								<jsp:include page="Footer.jsp" />
							</div>
                    <p class="copyright text-muted small">Copyright &copy; Bye-me 2017. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
		
</body>

</html>
