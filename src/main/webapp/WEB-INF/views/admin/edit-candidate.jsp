<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
					<h2><strong>Admin</strong> Controls</h2>
					<form class="form-horizontal" method="post" role="form" action="/admin/candidate/${candidate.id}/edit/adminControls">
						<!-- Text input -->
						<div class="form-group">
							<label class="col-sm-2 control-label">Enabled</label>
							<div class="col-sm-10">
								<select class="form-control" name='enabled'>
									<option value="true" ${candidate.user.enabled ? 'selected' : ''}>True</option>
									<option value="false" ${candidate.user.enabled ? '' : 'selected'}>False</option>
								</select>
							</div>
						</div>
						<button type = "submit" class="btn btn-primary pull-right" name="contact" id="sampleSave">Save</button>
					</form>
				</div>
				<div class="box-info">
					<h2><strong>Personal</strong> Information</h2>
					<form class="form-horizontal" role="form" method="post" action="/admin/candidate/${candidate.id}/edit/savePersonalInformation">
						<!-- Text input -->
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Firstname</label>
							<div class="col-sm-10" id="firstNameContainer">
								<input type="text" class="form-control" id="input-text" name="firstName" placeholder="" value="${candidate.firstName}">
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Lastname</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="input-text" name="lastName" placeholder="" value="${candidate.lastName}">
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Birthdate</label>
							<div class="col-sm-10">
								<input type="text" class="form-control datepicker-input" value="<fmt:formatDate value="${candidate.birthdate}" pattern="yyyy-MM-dd" />" name="birthdate" data-mask="9999-99-99" placeholder="yyyy-mm-dd">
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Location</label>
							<div class="col-sm-10">
								<select data-placeholder="State" class="chosen-select form-control" id="ecLocation" data-id="${candidate.location.state.id}" tabindex="6" name="state">
						            <option value=""></option>
						            <c:forEach items="${countries}" var="country">
										<optgroup label="${country.name}">
											<c:forEach items="${country.states}" var="state">
												<option value="${state.id}" <c:if test="${candidate.location.state.id eq state.id}">
													selected
												</c:if>>
													${state.name}
												</option>
											</c:forEach>
										</optgroup>
									</c:forEach>
		
						          </select>
							</div>
						</div>

						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Contact Number</label>
							<div class="col-sm-10">
								<input type="text" value="${candidate.contactNo}" class="form-control" id="input-text" name="contact" placeholder="">
							</div>
						</div>
						<button type = "submit" class="btn btn-primary pull-right" name="contact" id="sampleSave">Save</button>
					</form>
				</div>
				<div class="box-info">
					<h2><strong>Login</strong> Information</h2>
					<form class="form-horizontal" role="form">
						<!-- Text input -->
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<p class="form-control-static">${candidate.user.email}</p>
							</div>
						</div>
						<div class="pull-right">
							<button class="btn btn-primary">Change Email</button>
							<button class="btn btn-primary">Change Password</button>
						</div>
					</form>
				</div>
				<div class="box-info">
					<h2><strong>Professional</strong> Information</h2>
					<form class="form-horizontal" role="form" method="post" action="/admin/candidate/${candidate.id}/edit/saveProfessionalInformation">
						<!-- Text input -->
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Highest Qualification</label>
							<div class="col-sm-9">
								<select class="form-control" id="ecQualification" name="qualification" data-id="${candidate.qualification.id}">
									<option value=""></option>
									<c:forEach items="${qualifications}" var="qualification">
										<option value="${qualification.id}">${qualification.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Field of Study</label>
							<div class="col-sm-9">
								<select class="form-control" id="ecFieldOfStudy" name="fieldOfStudy" data-id="${candidate.field.id}">
								<option value=""></option>
									<c:forEach items="${fieldOfStudies}" var="fieldOfStudy">
										<option value="${fieldOfStudy.id}">${fieldOfStudy.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Specializations</label>
							<div class="col-sm-9">
								<select class="form-control" id="ecSpecialization" name="specialization" data-id="${candidate.specialization.id}">
									<option value=""></option>
									<c:forEach items="${specializations}" var="specialization">
										<option value="${specialization.id}">${specialization.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Expected Salary</label>
							<div class="col-sm-9">
								<div class="input-group">
									<span class="input-group-addon">PHP</span>
									<input type="text" class="form-control" name="salary" value="${candidate.expectedSalary}">
									<span class="input-group-addon">.00</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Title</label>
							<div class="col-sm-9">
								<input type="text" value="${candidate.title}" class="form-control" id="input-text" name="title" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Skills</label>
							<div class="col-sm-9">
						        <select data-placeholder="Choose skills..." class="chosen-select form-control" multiple tabindex="5" name="skills">
						        	<option value=""></option>
									<c:forEach items="${skills}" var="skill">
										<option value="${skill.id}"
											<c:forEach var="item" items="${candidate.skills}">
											  <c:if test="${item.id eq skill.id}">
											    selected
											  </c:if>
											</c:forEach>
												>
										${skill.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<button type = "submit" class="btn btn-primary pull-right">Save</button>
					</form>
				</div>
            </div>
        </div>
		<jsp:include page="${views}foot.jsp"></jsp:include>
		<jsp:include page="${views}script-imports.jsp"></jsp:include>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>