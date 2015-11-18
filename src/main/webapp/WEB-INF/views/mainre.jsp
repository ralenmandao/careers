<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
<head>
	<title>Careers - Register</title>
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
	<script src="${resources}https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="${resources}https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
	
	<!-- FAVICON -->
	<link rel="shortcut icon" href="assets/img/favicon.ico">
	</head>
	
	
	
	<!-- BODY -->
	<body class="tooltips full-content">
	
	<!-- BEGIN PAGE -->
	<div class="container">
		
		<!-- Begin Register Page -->
		<div class="full-content-center animated fadeInDownBig">
			<a href="#fakelink"><img src="${resources}assets/img/logo-login.png" class="logo-login img-circle" alt="Logo"></a>
			<div class="login-wrap">
				<div class="box-info">
				<h2 class="text-center"><strong>Register</strong> new account</h2>
					<spring:url value="/register" var="registerForm" />
					<form:form modelAttribute = "candidateRegistration" role="form" action="${registerForm}" method="POST">
						<c:if test="${not empty errors}">
							<div class="error-container">
								<div class="alert alert-danger" role="alert">
									<c:forEach items="${errors}" var="error">
									    <div class="error-message-container">
									    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
									    <c:out value="${error.defaultMessage}" />
									    </div>
									</c:forEach>
								</div>
							</div>
						</c:if>
						<div class="form-group login-input">
							<i class="fa fa-user overlay"></i>
							<div class="row">
								<div class="col-md-6">
									<form:input path="firstName" type="text" class="form-control text-input" placeholder="First Name" />
								</div>
								<div class="col-md-6">
									<form:input path="lastName" type="text" class="form-control text-input" placeholder="Last Name" />
								</div>
							</div>
						</div>
						<div class="form-group login-input">
							<i class="fa fa-envelope overlay"></i>
							<form:input path="email" type="email" class="form-control text-input" placeholder="Your email" />
						</div>
						<div class="form-group login-input">
							<i class="fa fa-key overlay"></i>
							<form:input path="password" type="password" class="form-control text-input" id="password" placeholder="Password" />
						</div>
						<div class="form-group login-input">
							<i class="fa fa-eye overlay"></i>
							<form:input path="repassword" type="password" class="form-control text-input" id="repassword" placeholder="Re-Password" />
						</div>
						
						<button type="submit" class="btn btn-success btn-block" id="submitRegister"><i class="fa fa-rocket"></i> Register</button>
					</form:form>
					
					<p class="text-center"><strong>- or -</strong></p>
					
					<button type="button" class="btn btn-primary btn-block btn-facebook"><i class="fa fa-facebook"></i> Register with Facebook</button>
					<button type="button" class="btn btn-primary btn-block btn-twitter"><i class="fa fa-twitter"></i> Register with Twitter</button>
					
				</div>
				<p class="text-center"><a href="login.html"><i class="fa fa-sign-in"></i> Back to login</a></p>
			</div>
		</div>
		<!-- End Register Page -->
		
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

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>