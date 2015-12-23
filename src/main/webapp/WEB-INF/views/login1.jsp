<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:43 GMT -->
<head>
	<title>Careers - Login</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="description" content="">
	<meta name="keywords" content="admin, bootstrap,admin template, bootstrap admin, simple, awesome">
	<meta name="author" content="">

	<spring:url value="/resources/" var="resources" />
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
	<link href="${resources}assets/css/my-style.css" rel="stylesheet">
	</head>

	
	<!-- BODY -->
	<body class="tooltips full-content">
	
	
	<!-- BEGIN PAGE -->
	<div class="container">

		<!-- Begin Login Page -->
		<div class="full-content-center animated fadeInDownBig">
			<a href="#fakelink"><img src="${resources}assets/img/logo-login.png" class="logo-login img-circle" alt="Logo"></a>
			<div class="login-wrap">
				<div class="box-info">
				<h2 class="text-center"><strong>Login</strong> form</h2>
					<spring:url value="/login" var="loginForm"/>
					<form action="${loginForm}" role="form" method="POST">
						<c:if test="${param.logout != null}">
							<div class="alert alert-success" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  Logout successful
							</div>
						</c:if>
						<c:if test="${param.success != null}">
							<div class="alert alert-success" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  Registration Successful please verify your email
							</div>
						</c:if>
						<c:if test="${param.error != null}">
							<div class="alert alert-danger" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  Invalid email address or password
							</div>
						</c:if>
						<c:if test="${param.disabled != null}">
							<div class="alert alert-danger" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  Account is not yet activated or disabled please check your email
							</div>
						</c:if>
						<c:if test="${param.activated != null}">
							<div class="alert alert-success" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  Account successfully activated
							</div>
						</c:if>
						<div class="form-group login-input">
						<i class="fa fa-sign-in overlay"></i>
						<input type="text" id="username" name="username" class="form-control text-input" placeholder="Email" />
						</div>
						<div class="form-group login-input">
						<i class="fa fa-key overlay"></i>
						<input type="password" id="password" name="password" class="form-control text-input" placeholder="Password" />
						</div>
						<div class="checkbox">
						<label>
							<input type="checkbox"> Remember me
						</label>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
						<div class="row">
							<div class="col-sm-6">
							<button type="submit" class="btn btn-success btn-block"><i class="fa fa-unlock"></i> Login</button>
							</div>
							<div class="col-sm-6">
							<a href="${root}register" class="btn btn-default btn-block"><i class="fa fa-rocket"></i> Register</a>
							</div>
						</div>
					</form>
					<p class="text-center"><strong>- or -</strong></p>
					
					<button type="button" class="btn btn-primary btn-block btn-facebook"><i class="fa fa-facebook"></i> Login with Facebook account</button>
					<button type="button" class="btn btn-primary btn-block btn-twitter"><i class="fa fa-twitter"></i> Login with Twitter account</button>
					
				</div>
				<p class="text-center"><a href="forgot-password.html"><i class="fa fa-lock"></i> Forgot password?</a></p>
			</div>
		</div>
		<!-- End Login Page -->
		
	</div><!-- End div .container -->
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
	<script src="${resources}assets/js/lanceng.js"></script>

	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>