<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:43 GMT -->
<head>
	<title>Careers - Login</title>
	<spring:url value="/resources/" var="resources" />
	<spring:url value="/WEB-INF/views/" var="views" />
	<spring:url value="/" var="root" />
	<jsp:include page="${views}style-imports.jsp"></jsp:include>
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
				<h2 class="text-center"><strong>Register</strong> new account</h2>
					<spring:url value="/employer/register" var="registerForm" />
					<form:form modelAttribute = "employerRegistration" role="form" action="${registerForm}" method="POST">
						<div class="form-group login-input">
							<i class="fa fa-envelope overlay"></i>
							<form:input path="companyName" class="form-control text-input" placeholder="Company name" />
						</div>
						<div class="form-group login-input">
							<i class="fa fa-envelope overlay"></i>
							<form:input path="user.email" type="email" class="form-control text-input" placeholder="Your email" />
						</div>
						<div class="form-group login-input">
							<i class="fa fa-key overlay"></i>
							<form:input path="user.password" type="password" class="form-control text-input" id="password" placeholder="Password" />
						</div>
						<div class="form-group login-input">
							<i class="fa fa-eye overlay"></i>
							<input type="password" class="form-control text-input" id="repassword" placeholder="Re-Password" />
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
		<!-- End Login Page -->
	</div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>