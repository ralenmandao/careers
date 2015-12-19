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
	<jsp:include page="${views}head.jsp"></jsp:include>
	<!-- BEGIN PAGE -->
	<div class="scroll-y" id="body-container">
		<div class="body content rows scroll-y">
			<div class="box-info default">
				<h1>${job.name}</h1>
				<hr>
				<p>${job.description}</p>
				<strong>Skills Required : </strong>
				<c:forEach items="${job.skills}" var="skill">
					<span class="label label-success">${skill.name}</span>
				</c:forEach>
				<hr>
				<form action="/job/${job.id}/apply" method="post">
					<div class="form-group">
						<label for="input-text" class="col-sm-2 control-label">Cover Letter</label>
						<div class="col-sm-10">
							<textarea class="summernote-small form-control" name="cover"></textarea>
						</div>
					</div>
					
					<div class="form-group" style="margin-right:15px;">
						<button type = "submit" class="btn btn-primary pull-right" name="contact">Apply Now</button>		
					</div>
				</form>
			</div>
		</div>	
	</div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>