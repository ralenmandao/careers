<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<spring:url value="/" var="root" />
	<script>
		var principal = "${principal.user.username}"
	</script>
	
	<link href="${resources}assets/css/resume/style.css" rel="stylesheet">

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

	<!-- CHOSEN -->
	<link href="${resources}assets/css/chosen.min.css" rel="stylesheet">

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
	<!-- BEGIN PAGE -->
			<jsp:include page="${views}head.jsp"></jsp:include>
			<!-- ============================================================== -->
			<!-- START YOUR CONTENT HERE -->
			<!-- ============================================================== -->
            <div class="body content rows scroll-y" id="body-container">
							
				<!-- Page header -->
				<div class="page-heading animated fadeInDownBig">
					<h1>Blank Page <small>lorem ipsum dolor</small></h1>
				</div>
				<!-- End page header -->
			<section class="container">	
			<!-- Header -->
			<header class="row-fluid">
				<div class="title span7">
					<img src="assets/img/profile.jpg" title="That`s me!" alt="My Profile"/>
					<h1>John Smith</h1>
					<h2>front-end web developer</h2>
				</div>
				<div class="social offset1 span4">
					<ul>
						<li><i class="icon-home"></i> Stationsplein, 1012 AB</li>
						<li>Amsterdam, The Netherlands</li>
						<li><i class="icon-envelope-alt"></i> info@email.com</li>
						<li><i class="icon-phone"></i> +4 8 15 16 23 42</li>
						<li><a href="#" ><i class="icon-twitter" ></i></a>
						<a href="#" ><i class="icon-facebook" ></i></a>
						<a href="#" ><i class="icon-google-plus" ></i></a>
						<a href="#" ><i class="icon-github" ></i></a></li>
					</ul>
				</div>	
			</header>

			<!-- Welcome Text -->
			<article class="row-fluid">
				<header class="span3">
					<h3>Hello!</h3>
				</header>
				<div class="span9 ">
					<p class="welcome">"Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away." <br>
					<p class="auth"> <i>Antoine de Saint-Exupery</i>  </p>
				</div>
			</article>

			<!-- Skills -->
			<article class="row-fluid">
				<header class="span3">
					<h3>Skills</h3>
				</header>
				<div class="span9">
					<div class="row-fluid skills">
						<ul class="span6">
							<li><h4>Programming</h4></li>
							<li><strong>css</strong> - 3 years experience</li>
							<li><strong>html</strong> - Lorem ipsum dolor sit amet</li>
							<li><strong>php</strong> - Lorem ipsum dolor sit amet</li>
							<li><strong>javascript</strong> - Lorem ipsum dolor sit amet</li>
						</ul>
						<ul class="span6">
							<li><h4>Languages</h4></li>
							<li><strong>English</strong> - Fluent </li>
							<li><strong>Russian</strong> - Fluent in writing</li>
							<li><strong>Spanish</strong> - Lorem ipsum dolor sit amet</li>
							<li><strong>Esperanto</strong> - Lorem ipsum dolor sit amet</li>
						</ul>
					</div>
				</div>
			</article>

			<!-- Education -->
			<article class="row-fluid">
				<header class="span3">
					<h3>Education</h3>
				</header>
				<div class="span9">
					<h4>High School</h4>
					<h5>1943-2008</h5>
						<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvoluptua.</p>
					<h4>University</h4>
					<h5>2008-2008</h5>
					<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvoluptua.</p>
					<h4>Second University</h4>
					<h5>2008-2010</h5>
					<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvoluptua.</p>
				</div>
			</article>

			<!-- Work -->
			<article class="row-fluid">
				<header class="span3">
					<h3>Work Experience</h3>
				</header>
				<div class="span9">
					<h4>My First Job </h4>
					<h5>1960-2008</h5>
					<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvoluptua.</p>
					<h4>Second Job</h4>
					<h5>2008-2013</h5>
					<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvoluptua.</p>
				</div>
			</article>

			<!-- Interests -->
			<article class="row-fluid">
				<header class="span3">
					<h3>Interests</h3>
				</header>
				<div class="span9">
					<h4>Traveling</h4>
					<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvoluptua</p>
					<h4>Reading</h4>
					<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvoluptua</p>
					<h4>Books</h4>
					<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumyeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diamvoluptua</p>
				</div>
			</article>
			<!-- Footer -->
			<footer>
				&copy; 2013 John Smith 
				<a href="#">Download as PDF</a> | <a href="#" onclick="javascript:window.print();">Print</a> | <a href="#top">To top <i class="icon-arrow-up"></i></a>
			
			</footer>
			</section>
            </div>

			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
			
        </div>
		<!-- END CONTENT -->
		
		
		
		
		
		<!--
		============================================================================
		MODAL DIALOG EXAMPLE
		You can change transition style, just view element page
		============================================================================
		-->
		<!-- Modal Upload Picture -->
		<div class="md-modal md-fade-in-scale-up" id="md-fade-in-scale-up">
			<div class="md-content">
				<h3>Upload Photo</h3>
				<div>
					<spring:url value="/candidate/uploadPicture" var="uploadPicture" />
					<form method="POST" action="${uploadPicture}" enctype="multipart/form-data">
					 	Picture : <input class="btn btn-default btn-xs" type="file" name="file" />
					</form>
					<br>
					<p>
						<button class="btn btn-danger md-close">Close</button>
						<button class="btn btn-success md-close">Save</button>
					</p>
				</div>
			</div><!-- End div .md-content -->
		</div>
		<!-- Modal Logout Primary -->
		<div class="md-modal md-fall" id="logout-modal">
			<div class="md-content">
				<h3><strong>Logout</strong> Confirmation</h3>
				<div>
					<p class="text-center">Are you sure want to logout from this awesome system?</p>
					<p class="text-center">
					<a href="#" class="btn btn-success md-close">Yeah, I'm sure</a>
					</p>
				</div>
			</div>
		</div><!-- End .md-modal -->
		
		<!-- Modal Logout Alternatif -->
		<div class="md-modal md-just-me" id="logout-modal-alt">
			<div class="md-content">
				<h3><strong>Logout</strong> Confirmation</h3>
				<div>
					<p class="text-center">Are you sure want to logout from this awesome system?</p>
					<spring:url value="/logout" var="logoutUrl"/>
					<form:form action="${logoutUrl}" method="post" class="text-center">
					<button type="submit" class="btn btn-success md-close">Yeah, I'm sure</button>
					</form:form>
				</div>
			</div>
		</div><!-- End .md-modal -->
		
		<!-- Modal Task Progress -->	
		<div class="md-modal md-slide-stick-top" id="task-progress">
			<div class="md-content">
				<h3><strong>Task Progress</strong> Information</h3>
				<div>
					<p>CLEANING BUGS</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
						<span class="sr-only">80&#37; Complete</span>
					  </div>
					</div>
					<p>POSTING SOME STUFF</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 65%">
						<span class="sr-only">65&#37; Complete</span>
					  </div>
					</div>
					<p>BACKUP DATA FROM SERVER</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 95%">
						<span class="sr-only">95&#37; Complete</span>
					  </div>
					</div>
					<p>RE-DESIGNING WEB APPLICATION</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
						<span class="sr-only">100&#37; Complete</span>
					  </div>
					</div>
					<p class="text-center">
					<button class="btn btn-danger btn-sm md-close">Close</button>
					</p>
				</div>
			</div>
		</div><!-- End .md-modal -->
		<!--
		============================================================================
		END MODAL DIALOG EXAMPLE
		============================================================================
		-->
		
		<!--
		MODAL OVERLAY
		Always place this div at the end of the page content
		-->
		<div class="md-overlay"></div>
		
		
		
	</div><!-- End div .container -->
	<!-- END PAGE -->
	<style>
	
	</style>
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
	
	<!-- My Scrips -->
	<script src="${resources}assets/js/candidate/edit-candidate.js"></script>
	
	<!-- CHOSEN -->
	<script src="${resources}assets/js/chosen.jquery.min.js"></script>
	
	<script src="${resources}assets/js/resume/main.js"></script>
	
	<!-- LANCENG TEMPLATE JAVASCRIPT -->
	<script src="${resources}assets/js/candidate/candidate.js"></script>
	<script src="${resources}assets/js/lanceng.js"></script>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:44:24 GMT -->
</html>