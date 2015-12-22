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
	<body class="tooltips">
		<jsp:include page="${views}admin/head.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- START YOUR CONTENT HERE -->
		<!-- ============================================================== -->
         <div class="scroll-y" id="body-container">
			<div class="body content rows scroll-y">
				<div class="box-info">
					<h2><strong>Personal</strong> Information</h2>
					<form class="form-horizontal" role="form" method="post" action="/admin/edit">
						<div class="form-group">
						<label for="input-text" class="col-sm-2 control-label">Firstname</label>
						<div class="col-sm-10" id="firstNameContainer">
							<input type="text" class="form-control" id="input-text" name="firstName" placeholder="" value="${principal.firstName}">
						</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Lastname</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="input-text" name="lastName" placeholder="" value="${principal.lastName}">
							</div>
						</div>
						<button type = "submit" class="btn btn-primary pull-right">Post</button>
					</form>
				</div>
            </div>
			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
        </div>
		<jsp:include page="${views}foot.jsp"></jsp:include>
		<jsp:include page="${views}script-imports.jsp"></jsp:include>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>