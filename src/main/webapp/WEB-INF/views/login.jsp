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
				</div>
				<p class="text-center"><a href="forgot-password.html"><i class="fa fa-lock"></i> Forgot password?</a></p>
			</div>
		</div>
		<!-- End Login Page -->
		
	</div><!-- End div .container -->
		<jsp:include page="${views}foot.jsp"></jsp:include>
		<jsp:include page="${views}script-imports.jsp"></jsp:include>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>