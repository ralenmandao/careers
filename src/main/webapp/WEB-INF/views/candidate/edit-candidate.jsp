<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:43 GMT -->
<head>
<title>Careers - ${principal.firstName} ${principal.lastName}</title>
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
		<c:if test="${param.emailNotAvailable != null}">
			<div class="alert alert-danger alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				  <strong>Error!</strong> email is not available
				</div>
		</c:if>
		<c:if test="${param.success != null}">
			<div class="alert alert-success alert-dismissable">
			  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			  <strong>Success!</strong> updating profile.
			</div>
		</c:if>
			<div class="box-info">
				<h2>
					<strong>Personal</strong> Information
				</h2>
				<form class="form-horizontal" role="form" method="post"
					action="${root}candidate/savePersonalInformation"
					id="personalInformationForm">
					<!-- Text input -->
					<div class="form-group">
						<label for="input-text" class="col-sm-2 control-label">Firstname</label>
						<div class="col-sm-10" id="firstNameContainer">
							<input type="text" class="form-control" id="input-text"
								name="firstName" placeholder="" value="${principal.firstName}">
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-2 control-label">Lastname</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="input-text"
								name="lastName" placeholder="" value="${principal.lastName}">
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-2 control-label">Birthdate</label>
						<div class="col-sm-10">
							<input type="text" class="form-control datepicker-input"
								value="<fmt:formatDate value="${principal.birthdate}" pattern="yyyy-MM-dd" />"
								name="birthdate" data-mask="9999-99-99" placeholder="yyyy-mm-dd">
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-2 control-label">Location</label>
						<div class="col-sm-9">
							<select data-placeholder="State"
								class="chosen-select form-control" id="ecLocation"
								data-id="${principal.location.state.id}" tabindex="6"
								name="state" width="100%;">
								<option value=""></option>
								<c:forEach items="${countries}" var="country">
									<optgroup label="${country.name}">
										<c:forEach items="${country.states}" var="state">
											<option value="${state.id}"
												<c:if test="${principal.location.state.id eq state.id}">
													selected
												</c:if>>
												${state.name}</option>
										</c:forEach>
									</optgroup>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-2 control-label">Address</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="input-text"
								name="address" placeholder="" value="${principal.address}">
						</div>
					</div>
					<div class="form-group">
						<label for="contact" class="col-sm-2 control-label">Contact
							Number</label>
						<div class="col-sm-10">
							<input type="text" value="${principal.contactNo}"
								class="form-control" id="contact" name="contact"
								placeholder="">
						</div>
					</div>
					<button type="submit" class="btn btn-primary pull-right"
						name="contact" id="sampleSave">Save</button>
				</form>
			</div>
			<div class="box-info">
				<h2>
					<strong>Login</strong> Information
				</h2>
				<div class="form-horizontal" role="form">
					<!-- Text input -->
					<div class="form-group">
						<label class="col-sm-2 control-label">Email</label>
						<div class="col-sm-10">
							<p class="form-control-static">${principal.user.email}</p>
						</div>
					</div>
					<div class="pull-right">
						<button id="change-email" class="btn btn-primary">Change Email</button>
						<button id="change-password" class="btn btn-primary">Change Password</button>
					</div>
					<div style="display:none;" id="change-email-form">
						<br>
						<br>
						<h2><strong>Change</strong> Email</h2>
						<form class="form-horizontal" role="form" action="/candidate/changeEmail" method="post">
							<div class="form-group">
								<label for="input-text" class="col-sm-2 control-label">New Email</label>
								<div class="col-sm-10" id="firstNameContainer">
									<input type="text" class="form-control" name="email" placeholder="" value="">
								</div>
							</div>
							<div class="pull-right">
								<button type="input" class="btn btn-danger btn-cancel" onclick="$('#change-email-form').hide(500);return false;">Cancel</button>
								<button type = "submit" class="btn btn-primary btn-save">Save</button>
							</div>
						</form>
					</div>
					<div style="display:none;" id="change-password-form">
						<br>
						<br>
						<h2><strong>Change</strong> Password</h2>
						<form class="form-horizontal" role="form" action="/candidate/changePassword" method="post">
							<div class="form-group">
								<label for="input-text" class="col-sm-2 control-label">New Password</label>
								<div class="col-sm-10" id="firstNameContainer">
									<input type="password" class="form-control" name="password" placeholder="" value="">
								</div>
							</div>
							<div class="pull-right">
								<button type="input" class="btn btn-danger btn-cancel" onclick="$('#change-password-form').hide(500);return false;">Cancel</button>
								<button type = "submit" class="btn btn-primary btn-save">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="box-info">
				<h2>
					<strong>Professional</strong> Information
				</h2>
				<form class="form-horizontal" role="form" method="post"
					action="${root}candidate/saveProfessionalInformation">
					<!-- Text input -->
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Highest
							Qualification</label>
						<div class="col-sm-9">
							<select class="form-control" id="ecQualification"
								name="qualification" data-id="${principal.qualification.id}">
								<option value=""></option>
								<c:forEach items="${qualifications}" var="qualification">
									<option value="${qualification.id}">${qualification.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Field
							of Study</label>
						<div class="col-sm-9">
							<select class="form-control" id="ecFieldOfStudy"
								name="fieldOfStudy" data-id="${principal.field.id}">
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
							<select class="form-control" id="ecSpecialization"
								name="specialization" data-id="${principal.specialization.id}">
								<option value=""></option>
								<c:forEach items="${specializations}" var="specialization">
									<option value="${specialization.id}">${specialization.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<!-- 
						<div class="form-group">
							<label for="input-text" class="col-sm-3 control-label">Preffered work location</label>
							<div class="col-sm-9">
								<select class="form-control">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>
							</div>
						</div>
						-->
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Expected
							Salary</label>
						<div class="col-sm-9">
							<div class="input-group">
								<span class="input-group-addon">PHP</span> <input type="text"
									class="form-control" name="salary"
									value="${principal.expectedSalary}"> <span
									class="input-group-addon">.00</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Title</label>
						<div class="col-sm-9">
							<input type="text" value="${principal.title}"
								class="form-control" id="input-text" name="title" placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Skills</label>
						<div class="col-sm-9">
							<select data-placeholder="Choose skills..."
								class="chosen-select form-control" multiple tabindex="5"
								name="skills">
								<option value=""></option>
								<c:forEach items="${skills}" var="skill">
									<option value="${skill.id}"
										<c:forEach var="item" items="${principal.skills}">
											  <c:if test="${item.id eq skill.id}">
											    selected
											  </c:if>
											</c:forEach>>
										${skill.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<button type="submit" class="btn btn-primary pull-right">Save</button>
				</form>
			</div>
			<div class="box-info">
				<h2>
					<strong>Education</strong>
				</h2>
				<form class="form-horizontal" role="form" method="post"
					action="${root}candidate/saveEducation">
					<div class="form-group">
						<label class="col-sm-2 control-label">High School</label>
						<div class="col-sm-10">
							<div class="row">
								<div class="col-sm-6">
									<c:choose>
										<c:when test="${not empty principal.highSchool}">
											<input type="text" name="highschool-year"
												value="${principal.highSchool.startYear}-${principal.highSchool.endYear}"
												class="form-control" data-mask="9999-9999"
												placeholder="Year eg. 2010-2014">
										</c:when>
										<c:otherwise>
											<input type="text" name="highschool-year"
												class="form-control" data-mask="9999-9999"
												placeholder="Year eg. 2010-2014">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-sm-6">
									<input type="text" name="highschool-name"
										value="${principal.highSchool.school}" class="form-control"
										data-mask="aaaaaa" placeholder="School name">
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">College</label>
						<div class="col-sm-10">
							<div class="row">
								<div class="col-sm-4">
									<c:choose>
										<c:when test="${not empty principal.college}">
											<input type="text" name="college-year"
												value="${principal.college.startYear}-${principal.college.endYear}"
												class="form-control" data-mask="9999-9999"
												placeholder="Year eg. 2010-2014">
										</c:when>
										<c:otherwise>
											<input type="text" name="college-year" class="form-control"
												data-mask="9999-9999" placeholder="Year eg. 2010-2014">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-sm-4">
									<input type="text" name="college-course"
										value="${principal.college.course}" class="form-control"
										data-mask="aaaaaa" placeholder="College course">
								</div>
								<div class="col-sm-4">
									<input type="text" name="college-name"
										value="${principal.college.school}" class="form-control"
										data-mask="aaaaaa" placeholder="College Name">
								</div>
							</div>
						</div>
					</div>
					<button type="submit" class="btn btn-primary pull-right">Save</button>
				</form>
			</div>
			<div class="box-info">
				<h2>
					<strong>Experience</strong>
				</h2>
				<form class="form-horizontal" role="form" method="post"
					action="${root}candidate/saveExperience">
					<button id="add-experience" onclick="return false;"
						class="btn btn-default">Add</button>
					<div id="experience-container">
						<c:forEach items="${principal.experiences}" var="exp">
							<div>
								<hr>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-10">
										<div class="row">
											<div class="col-sm-4">
												<input type="text" class="form-control"
													value="${exp.startYear}-${exp.endYear}"
													name="experience-year" placeholder="Year eg. 2010-2014">
											</div>
											<div class="col-sm-4">
												<input type="text" class="form-control"
													value="${exp.position}" name="experience-position"
													data-mask="aaaaaa" placeholder="Position">
											</div>
											<div class="col-sm-4">
												<input type="text" class="form-control"
													value="${exp.companyName}" name="experience-company-name"
													data-mask="aaaaaa" placeholder="Company name">
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-10">
										<textarea class="form-control" name="experience-role"
											placeholder="Role description"
											style="height: 100px; resize: none">${exp.role}</textarea>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<button type="submit" class="btn btn-primary pull-right">Save</button>
				</form>
			</div>
			<div class="box-info">
				<h2>
					<strong>Other</strong> Information
				</h2>
				<form class="form-horizontal" role="form" method="post"
					action="${root}candidate/saveOther">
					<div class="form-group">
						<label for="input-text" class="col-sm-2 control-label">About
							yourself</label>
						<div class="col-sm-10">
							<textarea class="summernote-small form-control" name="about">${principal.about}</textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-2 control-label">Objective</label>
						<div class="col-sm-10">
							<textarea class="summernote-small form-control" name="objective">${principal.objective}</textarea>
						</div>
					</div>
					<button type="submit" class="btn btn-primary pull-right">Save</button>
				</form>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- END YOUR CONTENT HERE -->
		<!-- ============================================================== -->
		<div style="display: none">
			<div id="experience-form">
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-4">
								<input type="text" class="form-control" name="experience-year"
									data-mask="9999-9999" placeholder="Year eg. 2010-2014">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control"
									name="experience-position" data-mask="aaaaaa"
									placeholder="Position">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control"
									name="experience-company-name" data-mask="aaaaaa"
									placeholder="Company name">
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
						<textarea class="form-control" name="experience-role"
							placeholder="Role description"
							style="height: 100px; resize: none"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
		$(document).ready(
				function() {
					$('#add-experience').on(
							'click',
							function() {
								$("#experience-form").clone()
										.find("input:text").val("").end().find(
												"textarea").val("").end()
										.appendTo("#experience-container");
							})

					
					$('#change-email').on('click', function(){
						$('#change-email-form').toggle(500);
					})
					
					$('#change-password').on('click', function(){
						$('#change-password-form').toggle(500);
					})
				})
	</script>
</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>