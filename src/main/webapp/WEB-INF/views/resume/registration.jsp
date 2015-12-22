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
	<spring:url value="/" var="root" />

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
           <div class="body content rows scroll-y" id="body-container">
			
								
				<!-- Page header -->
				<div class="page-heading animated fadeInDownBig">
					<h1>Blank Page <small>lorem ipsum dolor</small></h1>
				</div>
				<!-- End page header -->
				
				<!-- Sample Resume -->
				<div class="box-info full">
					<!-- FOrm selector #myWizard -->
					<form id="myWizard" action="${root}candidate/addResume" method="post">
						<!-- First step -->
						<section class="step" data-step-title="First step">
<!--						<div class="row">
							<div class="col-sm-3 col-xs-6">
								<div class="box-info full">
									<div class="img-wrap cc-selector">
										<label class="drinkcard-cc visa" for="visa"></label>
       								    <input class="first-resume" style="height:150px;" type="radio" name="credit-card" value="mastercard" />
									</div>
									<div class="des-thumbnail">
										<h4>Simple Resume</h4>
										<p>
										A simple resume to display your skills
										</p>
									</div>
								</div>
							</div> 
							<div class="col-sm-3 col-xs-6">
								<div class="box-info full">
									<div class="img-wrap second-resume" style="height:150px;">
									
									</div>
									<div class="des-thumbnail">
										<h4>Simple Resume</h4>
										<p>
										A simple resume to display your skills
										</p>
									</div>
								</div>
							</div>
							</div><!-- End div .row -->
							<fieldset class="row">
						       <input type="radio" name="feeling" id="feelingSad" value="sad" />
						       <label for="feelingSad">
						       		<img src="${resources}images/no-profile.png" />
						       </label>
						       <input type="radio" name="feeling" id="feelingHappy" value="happy" />
						       <label for="feelingHappy">
						       		<img src="${resources}images/no-profile.png" />
						       </label>
						    </fieldset>
						    <style>
						    	
						    </style>
						</section>
						<!-- End first step -->
						
						
						<!-- Second step -->
						<section class="step" data-step-title="Second step">
							<div class="row" id = "registrationInput">
								
							</div><!-- End div .row -->
						</section>
						<!-- End second step -->
					</form>
				</div><!-- End div .box-info -->
				<!-- End form wizard -->

				<!-- Footer -->
				<footer>
				&copy; 2014 <a href="index.html">Lanceng Admin</a>. Design with love by <a href="http://isohdesign.com/" target="_blank">Isoh Design Studio</a> from <a href="#fakelink">Yogyakarta, ID</a>
				</footer>
				<!-- End Footer -->
		
           </div>
		<!-- ============================================================== -->
		<!-- END YOUR CONTENT HERE -->
		<!-- ============================================================== -->
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:44:24 GMT -->
</html>