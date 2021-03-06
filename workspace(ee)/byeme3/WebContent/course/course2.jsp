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
    
    
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../vendor1/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/shop-homepage.css" rel="stylesheet">

    <!-- Temporary navbar container fix -->
    <style>
    /* Temporary fix for img-fluid sizing within the carousel */
    
    .carousel-item.active,
    .carousel-item-next,
    .carousel-item-prev {
        display: block;
    }
    </style>

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
    <div id="wrapper">
	<nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation" style="padding:0px;">
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
                <ul class="nav navbar-nav navbar-right" style="display: block;">
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
              		<li>
                        <a href="../byemeUser/login.jsp">Login</a>
                    </li>
                    </ul>
            </div>
		</nav>
		</div>
	
	    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-lg-3">

                <h1 class="my-4">자기 개발</h1>
                <div class="list-group">
                    <a href="#" class="list-group-item">Category 1</a>
                    <a href="#" class="list-group-item">Category 2</a>
                    <a href="#" class="list-group-item">Category 3</a>
                    <a href="#" class="list-group-item">Category 4</a>
                </div>

            </div>
            <!-- /.col-lg-3 -->

            <div class="col-lg-9">

                <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                       		<iframe width="900" height="350" src="https://www.youtube.com/embed/wozQbgJdZoI" frameborder="0" allowfullscreen></iframe>
                        </div>
                        <div class="carousel-item">
                            <iframe width="900" height="350" src="https://www.youtube.com/embed/m6P66ppnnqw" frameborder="0" allowfullscreen></iframe>
                        </div>
                        <div class="carousel-item">
                            <iframe width="900" height="350" src="https://www.youtube.com/embed/YoHv_4AVB_4" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">이전</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">다음</span>
                    </a>
                </div>

                <div class="row">

                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                        <form name="frm" action="course_view.jsp">
                            <a href="#" onclick="data();">
                            <input type="hidden" name="data" value="https://www.youtube.com/embed/wozQbgJdZoI">
                            <img class="card-img-top img-fluid" src="https://i.ytimg.com/vi/wozQbgJdZoI/0.jpg" alt=""></a>
                            <div class="card-block">
                                <h4 class="card-title"><a href="#">자기 계발 시작 가이드</h4>
                                <p class="card-text">자기 계발 시작 가이드 6 스텝</p>
                            </div>
                        	</form>
                            <div class="card-footer">
                                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                        <form name="frm1" action="course_view.jsp">
                            <a href="#" onclick="data1();">
                            <input type="hidden" name="data" value="https://www.youtube.com/embed/m6P66ppnnqw">
                            <img class="card-img-top img-fluid" src="https://i.ytimg.com/vi/m6P66ppnnqw/0.jpg" alt=""></a>
                            <div class="card-block">
                                <h4 class="card-title"><a href="#">TED</h4>
                                <p class="card-text">나는 왜 내편이 아닌가?</p>
                            </div>
                        	</form>
                            <div class="card-footer">
                                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9733;</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                        <form name="frm2" action="course_view.jsp">
                            <a href="#" onclick="data2();">
                            <input type="hidden" name="data" value="https://www.youtube.com/embed/YoHv_4AVB_4">
                            <img class="card-img-top img-fluid" src="https://i.ytimg.com/vi/YoHv_4AVB_4/0.jpg" alt=""></a>
                            <div class="card-block">
                                <h4 class="card-title"><a href="#">책 그림</h4>
                                <p class="card-text">습관을 바꾸는 방법</p>
                            </div>
                        	</form>
                            <div class="card-footer">
                                <small class="text-muted">&#9733; &#9733; &#9733; &#9734; &#9734;</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                        <form name="frm3" action="course_view.jsp">
                            <a href="#" onclick="data3();">
                            <input type="hidden" name="data" value="https://www.youtube.com/embed/xybrVYunO8w">
                            <img class="card-img-top img-fluid" src="https://i.ytimg.com/vi/xybrVYunO8w/0.jpg" alt=""></a>
                            <div class="card-block">
                                <h4 class="card-title"><a href="#">그릿</h4>
                                <p class="card-text">당신은 열정적이지 않다.</p>
                            </div>
                        	</form>
                            <div class="card-footer">
                                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9733;</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                        <form name="frm4" action="course_view.jsp">
                            <a href="#" onclick="data4();">
                            <input type="hidden" name="data" value="https://www.youtube.com/embed/wPU_P6I3ASg">
                            <img class="card-img-top img-fluid" src="https://i.ytimg.com/vi/wPU_P6I3ASg/0.jpg" alt=""></a>
                            <div class="card-block">
                                <h4 class="card-title"><a href="#">책 리뷰</h4>
                                <p class="card-text">결정적인 순간에 해내는 방법</p>
                            </div>
                        	</form>
                            <div class="card-footer">
                                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                        <form name="frm5" action="course_view.jsp">
                            <a href="#" onclick="data5();">
                            <input type="hidden" name="data" value="https://www.youtube.com/embed/1L3T9UcFxiA">
                            <img class="card-img-top img-fluid" src="https://i.ytimg.com/vi/1L3T9UcFxiA/0.jpg" alt=""></a>
                            <div class="card-block">
                                <h4 class="card-title"><a href="#">김미경의 파란새</h4>
                                <p class="card-text">자기 계발 5대 키워드</p>
                            </div>
                        	</form>
                            <div class="card-footer">
                                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9733;</small>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <!-- /.row -->

            </div>
            <!-- /.col-lg-9 -->

        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
	
	 <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="../main.jsp">Home</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="../main.jsp">About</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="course.jsp">Course</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="../board/board.jsp">Board</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="../byemeUser/login.jsp">Login</a>
                        </li>
                    </ul>
	                 	    <div id="footer" style=""> 
								<jsp:include page="../Footer.jsp" />
							</div>
                    <p class="copyright text-muted small">Copyright &copy; Bye-me 2017. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

<!-- 
    jQuery
    <script src="../js/jquery.js"></script>

    Bootstrap Core JavaScript
    <script src="../js/bootstrap.min.js"></script> -->
    
        <!-- Bootstrap core JavaScript -->
    <script src="../vendor1/jquery/jquery.min.js"></script>
    <script src="../vendor1/tether/tether.min.js"></script>
    <script src="../vendor1/bootstrap/js/bootstrap.min.js"></script>
    
		
</body>

</html>
