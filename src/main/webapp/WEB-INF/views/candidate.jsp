<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:43:15 GMT -->
<head>
	<title>Careers - ${principal.firstName} ${principal.lastName}</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="description" content="">
	<meta name="keywords" content="admin, bootstrap,admin template, bootstrap admin, simple, awesome">
	<meta name="author" content="">

	<spring:url value="/resources/" var="resources" />
	<spring:url value="/WEB-INF/views/" var="views" />
	<spring:url value="192.168.8.12:8080/" var="root" />

	<!-- BOOTSTRAP -->
	<link href="${resources}assets/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- LANCENG CSS -->
	<link href="${resources}assets/css/style.css" rel="stylesheet">
	<link href="${resources}assets/css/style-responsive.css" rel="stylesheet">
	
	<!-- VENDOR -->
	<link href="${resources}assets/css/animate.css" rel="stylesheet">
	<link href="${resources}assets/third/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="${resources}assets/third/weather-icon/css/weather-icons.min.css" rel="stylesheet">
	<link href="${resources}assets/third/morris/morris.css" rel="stylesheet">
	<link href="${resources}assets/third/nifty-modal/css/component.css" rel="stylesheet">
	<link href="${resources}assets/third/sortable/sortable-theme-bootstrap.css" rel="stylesheet"> 
	<link href="${resources}assets/third/icheck/skins/minimal/grey.css" rel="stylesheet"> 
	<link href="${resources}assets/third/select/bootstrap-select.min.css" rel="stylesheet"> 
	<link href="${resources}assets/third/summernote/summernote.css" rel="stylesheet">
	<link href="${resources}assets/third/magnific-popup/magnific-popup.css" rel="stylesheet"> 
	<link href="${resources}assets/third/datepicker/css/datepicker.css" rel="stylesheet">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
	
	<!-- FAVICON -->
	<link rel="shortcut icon" href="${resources}assets/img/favicon.ico">
	</head>
	
	
	<!-- BODY -->
	<body class="tooltips">	
		<jsp:include page="${views}head.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- START YOUR CONTENT HERE -->
		<!-- ============================================================== -->
           <div class="scroll-y" id="body-container">
			
			<div class="body content rows scroll-y">
				
				<!-- Page header -->
				<div class="page-heading animated fadeInDownBig">
					<h1>AVAILABLE JOBS</h1>
				</div>
				<!-- End page header -->

				<div class="box-info full">
					<div class="box-info" style="padding-top:3%;">
							<form class="form-inline" role="form">
							  <div class="form-group">
								<input type="email" class="form-control" id="exampleInputEmail2" placeholder="I'm looking for.." style="width:315px;">
							  </div>
							  <div class="form-group">
							  <div class="checkbox">
								<label class=""> in
								</label>
							  </div>
							  <div class="form-group">
								<input type="email" class="form-control" id="exampleInputEmail2" placeholder="Location" style="width:315px;">
							  </div> 
							  <select class="form-control" style="width:320px;">
									<option>Select Category</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>
							  <a class="btn btn-primary md-trigger" data-modal="form-modal">Search</a>
							 </div>
						</form>
					</div>
					<hr>
				 <div class="box-info full">
					<div class="box-info"> 
						<li class="media">
							<a class="pull-left" href="#fakelink">
								<img class="media-object" src="assets/img/avatar/3.jpg" alt="Avatar">
							</a>
							<div class="media-body">
								 <h4 class="media-heading"><a href="#fakelink">Senior Developer</a><br> <small>Clark,Freeport Zone</small>
								 <a href="#" class="btn btn-gray fa fa-plus toggle"></a>
								 <a href="#" class="btn btn-gray fa fa-star"></a>
								 <a href="#" class="btn btn-gray fa fa-link"></a>
								 </h4>
									 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum accusantium deleniti neque architecto vitae.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum accusantium deleniti neque architecto vitae.
									 <a href="#"> Read More</a></p>
							</div>
						</li>
					</div>
				 </div>
				 
				 <div class="box-info full">
					<div class="box-info"> 
						<li class="media">
							<a class="pull-left" href="#fakelink">
								<img class="media-object" src="assets/img/avatar/1.jpg" alt="Avatar">
							</a>
							<div class="media-body">
								 <h4 class="media-heading"><a href="#fakelink">Front-End Developer</a><br> <small>Clark,Freeport Zone</small>
								 <a href="#" class="btn btn-gray fa fa-plus toggle"></a>
								 <a href="#" class="btn btn-gray fa fa-star"></a>
								 <a href="#" class="btn btn-gray fa fa-link"></a>
								 </h4>
									 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum accusantium deleniti neque architecto vitae.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum accusantium deleniti neque architecto vitae.
									 <a href="#"> Read More</a></p>
							</div>
						</li>
					</div>
					<div class="box-info"> 
						<li class="media">
							<a class="pull-left" href="#fakelink">
								<img class="media-object" src="assets/img/avatar/2.jpg" alt="Avatar">
							</a>
							<div class="media-body">
								 <h4 class="media-heading"><a href="#fakelink">Front-End Developer</a><br> <small>Clark,Freeport Zone</small>
								 <a href="#" class="btn btn-gray fa fa-plus toggle"></a>
								 <a href="#" class="btn btn-gray fa fa-star"></a>
								 <a href="#" class="btn btn-gray fa fa-link"></a>
								 </h4>
									 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum accusantium deleniti neque architecto vitae.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum accusantium deleniti neque architecto vitae.
									 <a href="#"> Read More</a></p>
							</div>
						</li>
					</div>
				 
				 </div>
				 
				</div>
				<!-- Footer -->
				<footer>
				© 2014 <a href="index.html">Lanceng Admin</a>. Design with love by <a href="http://isohdesign.com/" target="_blank">Isoh Design Studio</a> from <a href="#fakelink">Yogyakarta, ID</a>
				</footer>
				<!-- End Footer -->
			
            </div>
			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
			
        </div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<!-- END PAGE -->
	<!--
	================================================
	JAVASCRIPT
	================================================
	-->
	<!-- Basic Javascripts (Jquery and bootstrap) -->
	<script src="${resources}assets/js/jquery.js"></script>
	<script src="${resources}assets/js/bootstrap.min.js"></script>
	
	<!-- VENDOR -->
	
	<!-- Slimscroll js -->
	<script src="${resources}assets/third/slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- Morris js -->
	<script src="${resources}assets/js/raphael-min.js"></script>
	<script src="${resources}assets/third/morris/morris.js"></script>
	
	<!-- Nifty modals js -->
	<script src="${resources}assets/third/nifty-modal/js/classie.js"></script>
	<script src="${resources}assets/third/nifty-modal/js/modalEffects.js"></script>
	
	<!-- Sortable js -->
	<script src="${resources}assets/third/sortable/sortable.min.js"></script>
	
	<!-- Bootstrao selectpicker js -->
	<script src="${resources}assets/third/select/bootstrap-select.min.js"></script>
	
	<!-- Summernote js -->
	<script src="${resources}assets/third/summernote/summernote.js"></script>
	
	<!-- Magnific popup js -->
	<script src="${resources}assets/third/magnific-popup/jquery.magnific-popup.min.js"></script> 
	
	<!-- Bootstrap file input js -->
	<script src="${resources}assets/third/input/bootstrap.file-input.js"></script>
	
	<!-- Bootstrao datepicker js -->
	<script src="${resources}assets/third/datepicker/js/bootstrap-datepicker.js"></script>
	
	<!-- Icheck js -->
	<script src="${resources}assets/third/icheck/icheck.min.js"></script>
	
	<!-- Form wizard js -->
	<script src="${resources}assets/third/wizard/jquery.snippet.min.html"></script>
	<script src="${resources}assets/third/wizard/jquery.easyWizard.js"></script>
	<script src="${resources}assets/third/wizard/scripts.js"></script>
	
	<!-- LANCENG TEMPLATE JAVASCRIPT -->
	<script src="${resources}assets/js/candidate/candidate.js"></script>
	<script src="${resources}assets/js/lanceng.js"></script>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:44:24 GMT -->
</html>