<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:43:15 GMT -->
<head>
	<title>Careers - ${principal.companyName}</title>
	<spring:url value="/resources/" var="resources" />
	<spring:url value="/WEB-INF/views/" var="views" />
	<spring:url value="/" var="root" />
	<jsp:include page="${views}style-imports.jsp"></jsp:include>
</head>
	<!-- BODY -->
	<body class="tooltips">	
		<jsp:include page="${views}employer/head.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- START YOUR CONTENT HERE -->
		<!-- ============================================================== -->
           <div class="scroll-y" id="body-container">
			<div class="body content rows scroll-y">
				<div class="box-info default">
					<c:forEach items="${candidates}" var="candidate">
						<div class="candidate-item">
							<hr>
							<h5><strong>${candidate.firstName} ${candidate.lastName}</strong></h5>
							<h5>${candidate.location.country.name}, ${candidate.location.state.name}</h5>
							<h6><strong>Skills :</strong>
							
							<c:forEach items="${candidate.skills}" var="skill">
								<span class="label label-success">${skill.name}</span>
							</c:forEach>
							</h6>
							<br>
						</div>
					</c:forEach>
				</div>
            </div>
			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
        </div>
     <div class="md-modal md-fade-in-scale-up" id="md-fade-in-scale-up">
		<div class="md-content">
			<h3>Upload Photo</h3>
			<div>
				<spring:url value="/employer/profileUpload" var="uploadPicture" />
				<form method="POST" action="${uploadPicture}" enctype="multipart/form-data">
				 	Picture : <input class="btn btn-default btn-xs" type="file" name="file" />
				 	<br>
				 	<br>
				 	<input type="hidden" value="${principal.id}" name="id">
				 	<button class="btn btn-success md-close" type="submit">Save</button>
				</form>
			</div>
		</div><!-- End div .md-content -->
	</div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	</body>
</html>