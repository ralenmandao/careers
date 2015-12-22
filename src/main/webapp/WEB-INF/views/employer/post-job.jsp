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
					<form action="/employer/postJob" class="form-horizontal" role="form" method="post">
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Title</label>
							<div class="col-sm-9">
								<input type="text" value="" class="form-control" id="input-text" name="title" placeholder="" />
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Salary</label>
							<div class="col-sm-4">
								<div class="input-group">
									<span class="input-group-addon">PHP</span>
									<input type="text" class="form-control" name="salaryTo" value="0" />
									<span class="input-group-addon">.00</span>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="input-group">
									<span class="input-group-addon">PHP</span>
									<input type="text" class="form-control" name="salaryFrom" value="0" />
									<span class="input-group-addon">.00</span>
								</div>
							</div>
						</div>
						<div class="form-group">
								<label for="input-text" class="col-sm-3 control-label">Location</label>
								<div class="col-sm-9">
									<select data-placeholder="State" class="chosen-select form-control" data-id="" tabindex="6" name="stateId">
							            <option value=""></option>
							            <c:forEach items="${countries}" var="country">
											<optgroup label="${country.name}">
												<c:forEach items="${country.states}" var="state">
													<option value="${state.id}">
														${state.name}
													</option>
												</c:forEach>
											</optgroup>
										</c:forEach>
			
							          </select>
								</div>
							</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Skills</label>
								<div class="col-sm-9">
							        <select data-placeholder="Choose skills..." class="chosen-select form-control" multiple tabindex="5" name="skills">
							        	<option value=""></option>
										<c:forEach items="${skills}" var="skill">
											<option value="${skill.id}">
											${skill.name}</option>
										</c:forEach>
									</select>
								</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Job expiration</label>
							<div class="col-sm-3">
								<input name="expiry" type="text" class="form-control datepicker-input" data-mask="99-99-9999" placeholder="mm-dd-yyyy">
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Job Description</label>
							<div class="col-sm-9">
								<textarea class="summernote-small form-control" name="description"></textarea>
							</div>
						</div>
						<button type = "submit" class="btn btn-primary pull-right" id="sampleSave">Post</button>
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
</html>