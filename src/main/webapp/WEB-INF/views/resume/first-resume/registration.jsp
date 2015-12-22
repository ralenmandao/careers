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
		<jsp:include page="${views}head.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- START YOUR CONTENT HERE -->
		<!-- ============================================================== -->
         <div class="scroll-y" id="body-container">
			<div class="body content rows scroll-y">
				<div class="box-info">
				<form action="/candidate/resume/save" class="form-horizontal" role="form" method="post">
					<h2><strong>Education</strong></h2>
						<div class="form-group">
							<label class="col-sm-2 control-label">High School</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-6">
										<input type="text" name="highschool-year" class="form-control" data-mask="9999-9999" placeholder="Year eg. 2010-2014">
									</div>
									<div class="col-sm-6">
										<input type="text" name="highschool-name" class="form-control" data-mask="aaaaaa" placeholder="School name">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">College</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-6">
										<input type="text" name="college-year" class="form-control" data-mask="9999-9999" placeholder="Year eg. 2010-2014">
									</div>
									<div class="col-sm-6">
										<input type="text" name="college-name" value="Don Honorio Ventura Technological State University" class="form-control" data-mask="aaaaaa" placeholder="School name">
									</div>
								</div>
							</div>
						</div>
					
					<h2><strong>Experience</strong></h2>
						<button id="add-experience" onclick="return false;" class="btn btn-default">Add</button>
						<div id="experience-container">
							<div id="experience-form">
								<hr>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-10">
										<div class="row">
											<div class="col-sm-4">
												<input type="text" class="form-control" name="experience-year" data-mask="9999-9999" placeholder="Year eg. 2010-2014">
											</div>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="experience-position" data-mask="aaaaaa" placeholder="Position">
											</div>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="experience-company-name" data-mask="aaaaaa" placeholder="Company name">
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-10">
										<textarea class="form-control" name="experience-role" placeholder="Role description" style="height: 100px; resize: none"></textarea>
									</div>
								</div>
							</div>
						</div>
					<h2><strong>Others</strong></h2>
					<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">About yourself</label>
							<div class="col-sm-10">
								<textarea class="summernote-small form-control" name="about"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Objective</label>
							<div class="col-sm-10">
								<textarea class="summernote-small form-control" name="objective"></textarea>
							</div>
						</div>
						<input type="hidden" name="resume" value="first-resume">
						<button type = "submit" class="btn btn-primary pull-right" name="contact" id="sampleSave">Finish</button>
					</form>
				</div>
            </div>
			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
        </div>
		<jsp:include page="${views}foot.jsp"></jsp:include>
		<jsp:include page="${views}script-imports.jsp"></jsp:include>
		<script>
			$(document).ready(function(){
				$('#add-experience').on('click', function(){
					$("#experience-form").clone().
					find("input:text").val("").end().
					find("textarea").val("").end().
					appendTo("#experience-container");
				})
			})
		</script>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>