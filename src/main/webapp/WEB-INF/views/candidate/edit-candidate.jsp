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
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">×</button>
					<strong>Error!</strong> email is not available
				</div>
			</c:if>
			<c:if test="${param.success != null}">
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">×</button>
					<strong>Success!</strong> updating profile.
				</div>
			</c:if>
			<c:if test="${param.changeEmail != null}">
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">×</button>
					<strong>Success!</strong> check your email.
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
						<label for="firstName" class="col-sm-2 control-label">Firstname</label>
						<div class="col-sm-10" id="firstNameContainer">
							<input type="text" class="form-control" id="input-text"
								name="firstName" placeholder="" value="${principal.firstName}">
						</div>
					</div>
					<div class="form-group">
						<label for="lastName" class="col-sm-2 control-label">Lastname</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="input-text"
								name="lastName" placeholder="" value="${principal.lastName}">
						</div>
					</div>
					<div class="form-group" id="grp-birthdate">
						<label for="birthdate" class="col-sm-2 control-label"
							id="lbl-birthdate">Birthdate</label>
						<div class="col-sm-10">
							<input type="text" class="form-control"
								value="<fmt:formatDate value="${principal.birthdate}" pattern="yyyy-MM-dd" />"
								name="birthdate" data-mask="9999-99-99" placeholder="yyyy-mm-dd"
								id="birthdate">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Location</label>
						<div class="col-sm-10">
							<div class="row">
								<div class="col-sm-6">
									<select class="form-control" name="country" id="country">
										<option value=""></option>
										<c:forEach items="${countries}" var="country">
											<option value="${country.id}"
												<c:if test="${country.id == principal.location.country.id}">selected</c:if>>${country.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-6">
									<select class="form-control" name="state" id="state">
										<c:forEach items="${principal.location.country.states}"
											var="state">
											<option value="${state.id}"
												<c:if test="${state.id == principal.location.state.id}">selected</c:if>>${state.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
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
						<label for="contactNumber" class="col-sm-2 control-label">Contact
							Number</label>
						<div class="col-sm-10">
							<input type="contact" class="form-control"
								value="${principal.contactNo}" id="contactNumber"
								data-fv-integer-message="The value is not an integer"
								name="contactNumber" placeholder="">
						</div>
					</div>
					<button type="submit" class="btn btn-primary pull-right"
						name="contact" id="sampleSave">Save</button>
				</form>
			</div>
			<div class="box-info">
				<h2>
					<strong>Upload</strong> Resume
				</h2>
				<form method="POST" action="/candidate/uploadResume"
					enctype="multipart/form-data" id="resumeForm"
					class="form-horizontal">

					<div class="form-group">
						<label class="col-xs-3 control-label">
							${principal.realResumeName} </label>
						<div class="col-xs-6">
							<input type="file" class="form-control" name="file"
								accept=".pdf,.docx,.doc" /><small style="color: red">Note:
								maximum file size is 512kb</small><br> <small style="color: red">Note:
								docx/doc files are not viewable by employers and can only be
								downloaded</small><br>
								<small style="color: red">Note: pdf,docx,doc are the only file types allowed</small>
						</div>
					</div>
					<br> <input type="hidden" value="${principal.id}" name="id">
					<button type="submit" class="btn btn-primary pull-right"
						name="contact" id="resumeSave">Save</button>
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
						<a href="/candidate/changeEmail/${principal.user.id}"
							class="btn btn-primary">Change Email</a> <a
							href="/candidate/changePassword/${principal.user.id}"
							id="change-password" class="btn btn-primary">Change Password</a>
					</div>
					<div style="display: none;" id="change-email-form">
						<br> <br>
						<h2>
							<strong>Change</strong> Email
						</h2>
						<form class="form-horizontal" role="form"
							action="/candidate/changeEmail" method="post"
							id="changeEmailForm">
							<div class="form-group">
								<label for="input-text" class="col-sm-2 control-label">New
									Email</label>
								<div class="col-sm-10" id="firstNameContainer">
									<input type="text" class="form-control" name="email"
										placeholder="" value="">
								</div>
							</div>
							<div class="pull-right">
								<button type="input" class="btn btn-danger btn-cancel"
									onclick="$('#change-email-form').hide(500);return false;">Cancel</button>
								<button type="submit" class="btn btn-primary btn-save">Save</button>
							</div>
						</form>
					</div>
					<div style="display: none;" id="change-password-form">
						<br> <br>
						<h2>
							<strong>Change</strong> Password
						</h2>
						<form class="form-horizontal" role="form"
							action="/candidate/changePassword" method="post"
							id="changePasswordForm">
							<div class="form-group">
								<label for="input-text" class="col-sm-2 control-label">New
									Password</label>
								<div class="col-sm-10" id="firstNameContainer">
									<input type="password" class="form-control" name="password"
										placeholder="" value="">
								</div>
							</div>
							<div class="form-group">
								<label for="input-text" class="col-sm-2 control-label">New
									Password confirmation</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="repassword"
										placeholder="" value="">
								</div>
							</div>
							<div class="pull-right">
								<button type="input" class="btn btn-danger btn-cancel"
									onclick="$('#change-password-form').hide(500);return false;">Cancel</button>
								<button type="submit" class="btn btn-primary btn-save">Save</button>
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
					action="${root}candidate/saveProfessionalInformation"
					id="saveProfForm">
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
							<!-- 
							<select data-placeholder="Choose skills..." class="form-control select2-select"
								multiple tabindex="5" name="skills" id="skills">
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
							 -->
							<input class="form-control" name="skills" id="skills"
								value="<c:forEach varStatus="loop" items="${principal.skills}" var="skill">${skill.name}<c:if test="${!loop.last}">,</c:if></c:forEach>"
								multiple data-placeholder="Choose skills" />
						</div>
					</div>
					<button type="submit" class="btn btn-primary pull-right">Save</button>
				</form>
			</div>
			<div class="box-info">
				<h2>
					<strong>Certifications </strong>
				</h2>
				<div class="row">
					<c:forEach items="${principal.documents}" var="document">
						<div class="col-md-1">
							<img src="/candidate/document/${document}"
								style="width: 100px; height: 100px" />
						</div>
					</c:forEach>
				</div>
				<br>
				<form method="POST" action="/candidate/uploadDocuments"
					enctype="multipart/form-data" id="documentsForm"
					class="form-horizontal">
					<div class="form-group">
						<label class="col-xs-3 control-label"></label>
						<div class="col-xs-6">
							<input type="file" class="form-control" name="file"
								accept="image/*" /> <small style="color: red">Note:
								maximum file size is 512kb</small><br>
								<small style="color: red">Note:
								png,jpg are the only file types allowed</small>
						</div>
					</div>
					<br> <input type="hidden" value="${principal.id}" name="id">
					<button type="submit" class="btn btn-primary pull-right"
						name="contact" id="resumeSave">Save</button>
				</form>
			</div>
			<div class="box-info">
				<h2>
					<strong>Legal </strong>Documents
				</h2>
				<div class="row">
					<ul>
						<c:forEach items="${principal.legal}" var="legal">
							<li><a href="/candidate/legal/${legal.id}" download="${legal.name}">${legal.name}</a></li>
						</c:forEach>
					</ul>
				</div>
				<br>
				<form method="POST" action="/candidate/uploadLegal"
					enctype="multipart/form-data" id="legalForm"
					class="form-horizontal">
					<div class="form-group">
						<label class="col-xs-3 control-label"></label>
						<div class="col-xs-6">
							<input type="file" class="form-control" name="file"
								accept=".pdf,.docx,.doc" /> <small style="color: red">Note:
								maximum file size is 512kb</small><br>
								<small style="color: red">Note:
								pdf,docx,doc are the only file types allowed</small>
						</div>
					</div>
					<br> <input type="hidden" value="${principal.id}" name="id">
					<button type="submit" class="btn btn-primary pull-right"
						name="contact" id="resumeSave">Save</button>
				</form>
			</div>
			<div class="box-info">
				<h2>
					<strong>Education</strong>
				</h2>
				<form class="form-horizontal" role="form" method="post"
					action="${root}candidate/saveEducation" id="educationForm">
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
									<select class="form-control" name="college-course">
										<option value="Information Technology"
											<c:if test="${principal.college.course eq 'Information Technology'}">selected</c:if>>Information
											Technology</option>
										<option value="Computer Science"
											<c:if test="${principal.college.course eq 'Computer Science'}">selected</c:if>>Computer
											Science</option>
										<option value="Computer Engineering"
											<c:if test="${principal.college.course eq 'Computer Engineering'}">selected</c:if>>Computer
											Engineering</option>
										<option value="Associate Information Technology"
											<c:if test="${principal.college.course eq 'Associate Information Technology'}">selected</c:if>>Associate
											Information Technology</option>
										<option value="Computer Secretarial"
											<c:if test="${principal.college.course eq 'Computer Secretarial'}">selected</c:if>>Computer
											Secretarial</option>
										<option value="Computer Technician"
											<c:if test="${principal.college.course eq 'Computer Technician'}">selected</c:if>>Computer
											Technician</option>
										<option value="Computer Programming"
											<c:if test="${principal.college.course eq 'Computer Programming'}">selected</c:if>>Computer
											Programming</option>
									</select>
								</div>
								<div class="col-sm-4">
									<input type="text" name="college-name"
										value="${principal.college.school}" class="form-control"
										data-mask="aaaaaa" placeholder="School Name">
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
					action="${root}candidate/saveExperience" id="experienceForm">
					<button id="add-experience" onclick="return false;"
						class="btn btn-default">Add</button>
					<button id="remove-experience" onclick="return false;"
						class="btn btn-default">Remove</button>
					<div id="experience-container">
						<c:forEach items="${principal.experiences}" var="exp">
							<div class="add-exp-node">
								<hr>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-10">
										<div class="row">
											<div class="col-sm-4">
												<input type="text" class="form-control"
													value="${exp.startYear}-${exp.endYear}"
													name="experience-year[]" placeholder="Year eg. 2010-2014">
											</div>
											<div class="col-sm-4">
												<input type="text" class="form-control"
													value="${exp.position}" name="experience-position[]"
													data-mask="aaaaaa" placeholder="Position">
											</div>
											<div class="col-sm-4">
												<input type="text" class="form-control"
													value="${exp.companyName}" name="experience-company-name[]"
													data-mask="aaaaaa" placeholder="Company name">
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-10">
										<textarea class="form-control" name="experience-role[]"
											placeholder="Role description"
											style="height: 100px; resize: none">${exp.role}</textarea>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<button type="submit" class="btn btn-primary pull-right"
						id="saveExp">Save</button>
				</form>
			</div>
			<div class="box-info">
				<h2>
					<strong>Other</strong> Information
				</h2>
				<form class="form-horizontal" role="form" method="post"
					action="${root}candidate/saveOther" id="otherForm">
					<div class="form-group" id="grp-about">
						<label for="input-text" class="col-sm-2 control-label"
							id="lbl-about">About yourself</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="about" id="about">${principal.about}</textarea>
						</div>
					</div>
					<div class="form-group" id="grp-objective">
						<label for="input-text" class="col-sm-2 control-label"
							id="lbl-objective">Objective</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="objective" id="objective">${principal.objective}</textarea>
						</div>
					</div>
					<button type="submit" class="btn btn-primary pull-right"
						id="otherSave">Save</button>
				</form>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- END YOUR CONTENT HERE -->
		<!-- ============================================================== -->
		<div style="display: none">
			<div id="experience-form" class="add-exp-node">
				<hr>
				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-4">
								<input type="text" class="form-control" name="experience-year[]"
									data-mask="9999-9999" placeholder="Year eg. 2010-2014">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control"
									name="experience-position[]" data-mask="aaaaaa"
									placeholder="Position">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control"
									name="experience-company-name[]" data-mask="aaaaaa"
									placeholder="Company name">
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
						<textarea class="form-control" name="experience-role[]"
							placeholder="Role description"
							style="height: 100px; resize: none"></textarea>
					</div>
				</div>

				<script>
					
				</script>
			</div>
		</div>
		<div class="md-modal md-fade-in-scale-up" id="md-fade-in-scale-up">
			<div class="md-content">
				<h3>Upload Photo</h3>
				<div>
					<spring:url value="/candidate/profileUpload" var="uploadPicture" />
					<form method="POST" action="${uploadPicture}"
						enctype="multipart/form-data">
						Picture : <input class="btn btn-default btn-xs" type="file"
							name="file" /> <br> <br> <input type="hidden"
							value="${principal.id}" name="id">
						<button class="btn btn-success md-close" type="submit">Save</button>
					</form>
				</div>
			</div>
			<!-- End div .md-content -->
		</div>
	</div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
	$(document)
    .ready(
        function() {
        	$("#saveExp").addClass('disabled')
        	$('#resumeSave').addClass('disabled')
        	$('#remove-experience').click(function(){
        		$('#experience-container .add-exp-node:last-child').remove()
        		$("#saveExp").removeClass('disabled')
        	})
            $('#add-experience')
                .on(
                    'click',
                    function() {
                        $clone = $("#experience-form")
                            .clone();

                        $clone
                            .find("input:text")
                            .val("")
                            .end()
                            .find("textarea")
                            .val("")
                            .end()
                            .appendTo(
                                "#experience-container");

                        $year = $clone.find('[name="experience-year[]"]');
                        $position = $clone.find('[name="experience-position[]"]');
                        $name = $clone.find('[name="experience-company-name[]"]');
                        $role = $clone.find('[name="experience-role[]"]');

                        $("#saveExp").removeClass('disabled')
                        
                        // Add new field
                        $('#experienceForm').formValidation('addField', $year);
                        $('#experienceForm').formValidation('addField', $position);
                        $('#experienceForm').formValidation('addField', $name);
                        $('#experienceForm').formValidation('addField', $role);
                    })

            $('#change-email').on('click', function() {
                $('#change-email-form').toggle(500);
            })

            $('#change-password').on('click', function() {
                $('#change-password-form').toggle(500);
            })

            /* POPULATE STATE */
            $('#country')
                .change(
                    function(data) {
                        $
                            .get(
                                "/states/search/findByCountryId?id=" + $(
                                    '#country')
                                .val(),
                                function(data) {
                                    if (data._embedded.states.length == 0) {
                                        $('#state').empty();
                                    }
                                    $('#state').empty();
                                    $('#state').append('<option value=""></option>')
                                    $.each(data._embedded.states,function(index, value) {
                                        $('#state').append('<option value="' + value.id + '">' + value.name + "</option>")
                                      });
                                });
                    })

            $('#birthdate').datepicker({
                format: 'yyyy-mm-dd'
            }).on(
                'changeDate',
                function(e) {
                    // Revalidate the date field
                    $('#personalInformationForm')
                        .formValidation(
                            'revalidateField',
                            'birthdate');
                });

            /* PERSONAL INFORMATION VALIDATION */
            $('#personalInformationForm')
                .formValidation({
                    framework: 'bootstrap',

                    icon: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        firstName: {
                            validators: {
                                notEmpty: {
                                    message: 'The firstname is required'
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z ,.'-]+$/,
                                    message: 'invalid firstname'
                                }
                            }
                        },
                        lastName: {
                            validators: {
                                notEmpty: {
                                    message: 'The lastname is required'
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z ,.'-]+$/,
                                    message: 'invalid lastname'
                                }
                            }
                        },
                        birthdate: {
                            validators: {
                                notEmpty: {
                                    message: 'The date is required'
                                },
                                date: {
                                    format: 'YYYY-MM-DD',
                                    message: 'The date is not a valid'
                                }
                            }
                        },
                        contactNumber: {
                            validators: {
                                notEmpty: {
                                    message: 'The contact number is required'
                                },
                                integer: {
                                    message: 'The contact must be a number'
                                },
                                stringLength: {
                                    message: 'The contact number must be 11 digit number ',
                                    max: function(
                                        value,
                                        validator,
                                        $field) {
                                        return 11 - (value
                                            .match(/\r/g) || []).length;
                                    },
                                    min: function(
                                        value,
                                        validator,
                                        $field) {
                                        return 11;
                                    }
                                }

                            }
                        },
                        address: {
                            validators: {
                                notEmpty: {
                                    message: 'The address is required'
                                }
                            }
                        },
                        state: {
                            validators: {
                                notEmpty: {
                                    message: 'The location is required'
                                }
                            }
                        }
                    }
                })
                .on(
                    'success.validator.fv',
                    function(e, data) {
                        if (data.field === 'birthdate' && data.validator === 'date' && data.result.date) {
                            // The eventDate field passes the date validator
                            // We can get the current date as a Javascript Date object
                            var currentDate = data.result.date,
                                day = currentDate
                                .getDay();
                            var todayDate = new Date();

                            if (todayDate > currentDate) {

                            }

                            // If the selected date is Sunday
                            if (todayDate < currentDate) {
                                // Treat the field as invalid
                                data.fv
                                    .updateStatus(
                                        data.field,
                                        data.fv.STATUS_INVALID,
                                        data.validator)
                                    .updateMessage(
                                        data.field,
                                        data.validator,
                                        'Please choose a valid date');
                            } else if ((todayDate.getYear() - currentDate.getYear()) < 18) {
                                // Treat the field as invalid
                                data.fv
                                    .updateStatus(
                                        data.field,
                                        data.fv.STATUS_INVALID,
                                        data.validator)
                                    .updateMessage(
                                        data.field,
                                        data.validator,
                                        'You must be 18 years old and above');
                            } else {
                                // Reset the message
                                data.fv
                                    .updateMessage(
                                        data.field,
                                        data.validator,
                                        'The date is not valid date');
                            }
                        }
                    });

            /* CHANGE EMAIL VALIDATION */
            $('#changeEmailForm')
                .formValidation({
                    framework: 'bootstrap',
                    icon: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        email: {
                            message: 'Email is invalid',
                            validators: {
                                notEmpty: {
                                    message: 'Email is empty'
                                },
                                emailAddress: {
                                    message: 'Email format is not correct'
                                }
                            }
                        }
                    }
                })

            /* CHANGE PASSWORD VALIDATION */
            $('#changePasswordForm')
                .formValidation({
                    framework: 'bootstrap',
                    icon: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        password: {
                            message: 'password is invalid',
                            validators: {
                                notEmpty: {
                                    message: 'password is empty'
                                },
                                stringLength: {
                                    message: 'Post content must be less than 10 characters and greater than 5 characters',
                                    max: function(
                                        value,
                                        validator,
                                        $field) {
                                        return 10 - (value
                                            .match(/\r/g) || []).length;
                                    },
                                    min: function(
                                        value,
                                        validator,
                                        $field) {
                                        return 5;
                                    }
                                }
                            }
                        },
                        repassword: {
                            message: 'password is invalid',
                            validators: {
                                notEmpty: {
                                    message: 'password is empty'
                                },
                                identical: {
                                    field: 'password',
                                    message: 'The password and its confirm are not the same'
                                }
                            }
                        }
                    }
                })

            /* CHANGE prof VALIDATION */
            $('#skills')
                .select2({
                        tags: [<c:forEach items="${skills}" var="skill">'${skill.name}',</c:forEach>]

                        })
                    // Revalidate the color when it is changed
                    .change(function(e) {
                        $('#saveProfForm').formValidation('revalidateField', 'skills');
                    })
                    .end()
                    // Revalidate the color when it is changed


                    /* SAVE PROF. INFORMATION FORM */
                    $('#saveProfForm')
                    .formValidation({
                        framework: 'bootstrap',
                        icon: {
                            valid: 'glyphicon glyphicon-ok',
                            invalid: 'glyphicon glyphicon-remove',
                            validating: 'glyphicon glyphicon-refresh'
                        },
                        fields: {
                            qualification: {
                                message: 'Qualification is invalid',
                                validators: {
                                    notEmpty: {
                                        message: 'Qualification is empty'
                                    }
                                }
                            },
                            fieldOfStudy: {
                                message: 'Field of study is invalid',
                                validators: {
                                    notEmpty: {
                                        message: 'Field of study is empty'
                                    }
                                }
                            },
                            specialization: {
                                message: 'Specialization is invalid',
                                validators: {
                                    notEmpty: {
                                        message: 'Specialization is empty'
                                    }
                                }
                            },
                            salary: {
                                message: 'Salary is invalid',
                                validators: {
                                    notEmpty: {
                                        message: 'Salary is empty'
                                    },
                                    regexp: {
                                        message: 'Salary must only be a numeric value',
                                        regexp: /^[0-9]+$/
                                    }
                                }
                            },
                            title: {
                                message: 'Title is invalid',
                                validators: {
                                    notEmpty: {
                                        message: 'Title is empty'
                                    }
                                }
                            },
                            'skills': {
                                validators: {
                                    callback: {
                                        message: 'Please choose skill',
                                        callback: function(value, validator, $field) {
                                            // Get the selected options
                                            var options  = validator.getFieldElements('skills').val()
                                            return options.length != 0;
                                        }
                                    }
                                }
                            }
                        }
                    })

                    /* EDUCATION FORM VALIDATION */
                    $('#educationForm')
                    .formValidation({
                        framework: 'bootstrap',
                        icon: {
                            valid: 'glyphicon glyphicon-ok',
                            invalid: 'glyphicon glyphicon-remove',
                            validating: 'glyphicon glyphicon-refresh'
                        },
                        fields: {
                            'highschool-year': {
                                message: 'High school year is invalid',
                                validators: {
                                    notEmpty: {
                                        message: 'High school year is empty'
                                    },
                                    regexp: {
                                        regexp: /^[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$/,
                                        message: 'Invalid year format eg. 2001-2005'
                                    }
                                }
                            },
                            'college-year': {
                                message: 'College year is invalid',
                                validators: {
                                    notEmpty: {
                                        message: 'College year is empty'
                                    },
                                    regexp: {
                                        regexp: /^[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$/,
                                        message: 'Invalid year format eg. 2001-2005'
                                    }
                                }
                            },
                            'college-course': {
                                message: 'College course is invalid',
                                validators: {
                                    notEmpty: {
                                        message: 'College course is empty'
                                    }
                                }
                            },
                            'highschool-name': {
                                message: 'Highschool name is invalid',
                                validators: {
                                    notEmpty: {
                                        message: 'Highschool name is empty'
                                    },
                                    regexp: {
                                        regexp: /^[a-zA-Z ]+$/,
                                        message: 'Invalid school name'
                                    }
                                }
                            },
                            'college-name': {
                                message: 'College name is invalid',
                                validators: {
                                    notEmpty: {
                                        message: 'College name is empty'
                                    },
                                    regexp: {
                                        regexp: /^[a-zA-Z ]+$/,
                                        message: 'Invalid school name'
                                    }
                                }
                            }
                        }
                    })

                    /* OTHER INFO VALIDATION */
                    $('#otherForm')
                    .formValidation({
                        framework: 'bootstrap',
                        excluded: [':disabled'],
                        icon: {
                            valid: 'glyphicon glyphicon-ok',
                            invalid: 'glyphicon glyphicon-remove',
                            validating: 'glyphicon glyphicon-refresh'
                        },
                        fields: {
                            title: {
                                validators: {
                                    notEmpty: {
                                        message: 'The title is required and cannot be empty'
                                    }
                                }
                            },
                            objective: {
                                validators: {
                                    callback: {
                                        message: 'minimum length is 100 characters',
                                        callback: function(value, validator, $field) {
                                            var code = $('[name="objective"]').code();
                                            // <p><br></p> is code generated by Summernote for empty content
                                            return code.replace(/(<([^>]+)>)/ig, "").length > 100;
                                        }
                                    }
                                }
                            },
                            about: {
                                validators: {
                                    callback: {
                                        message: 'minimum length is 100 characters',
                                        callback: function(value, validator, $field) {
                                            var code = $('[name="about"]').code();
                                            // <p><br></p> is code generated by Summernote for empty content
                                            return code.replace(/(<([^>]+)>)/ig, "").length > 100;
                                        }
                                    }
                                }
                            }
                        }
                    })
                    .find('[name="objective"]')
                    .summernote({
                        height: 400
                    })
                    .on('summernote.change', function(customEvent, contents, $editable) {
                        // Revalidate the content when its value is changed by Summernote
                        $('#otherForm').formValidation('revalidateField', 'objective');
                    })
                    .end()
                    .find('[name="about"]')
                    .summernote({
                        height: 400
                    })
                    .on('summernote.change', function(customEvent, contents, $editable) {
                        // Revalidate the content when its value is changed by Summernote
                        $('#otherForm').formValidation('revalidateField', 'about');
                    })
                    .end();

                    /*EXPERIENCE VALIDATION*/
                    $('#experienceForm')
                    .formValidation({
                        framework: 'bootstrap',
                        icon: {
                            valid: 'glyphicon glyphicon-ok',
                            invalid: 'glyphicon glyphicon-remove',
                            validating: 'glyphicon glyphicon-refresh'
                        },
                        fields: {
                            'experience-year[]': {
                                validators: {
                                    notEmpty: {
                                        message: 'The question required and cannot be empty'
                                    },
                                    regexp: {
                                        message: 'Invalid year eg. 2010-2015',
                                        regexp: /[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]/
                                    },
                                    callback : {
                                    	message : 'Invalid year format',
                                    	callback: function(value, validator, $field) {
                                    		var v = value.split("-");
                                    		if(v.length > 2 || v.length <= 1)
                                    			return false;
                                    		var first = v[0]
                                    		var second = v[1]
                                    		if(first > second)
                                    			return false;
                                    		return true;
                                    	}
                                    }
                                }
                            },
                            'experience-position[]': {
                                validators: {
                                    notEmpty: {
                                        message: 'The option required and cannot be empty'
                                    }
                                }
                            },
                            'experience-company-name[]': {
                                validators: {
                                    notEmpty: {
                                        message: 'The option required and cannot be empty'
                                    }
                                }
                            },
                            'experience-role[]': {
                                validators: {
                                    notEmpty: {
                                        message: 'The option required and cannot be empty'
                                    }
                                }
                            }
                        }
                    })
                    /* Resume input validation */
                    $("#resumeForm").formValidation({
                    	fields: {
                            'file': {
                                validators: {
                                    file: {
                                        extension: 'pdf,docx,doc',
                                        maxSize: 512000,
                                        message: 'Please choose a pdf/doc file with a maximum of 512kb'
                                    },
                                    notEmpty: {
                                    	message : 'Please select a file'
                                    }
                                }
                            }
                        }
                    });
                    
                    /* Documents input validation */
                    $("#documentsForm").formValidation({
                    	fields: {
                            'file': {
                                validators: {
                                    file: {
                                        extension: 'png,jpg',
                                        maxSize: 512000,
                                        message: 'Please choose a image file with a maximum of 512kb'
                                    },
                                    notEmpty: {
                                    	message : 'Please select a file'
                                    }
                                }
                            }
                        }
                    });
                    /* Documents input validation */
                    $("#legalForm").formValidation({
                    	fields: {
                            'file': {
                                validators: {
                                    file: {
                                        extension: 'docx,pdf',
                                        maxSize: 512000,
                                        message: 'Please choose a document file with a maximum of 512kb'
                                    },
                                    notEmpty: {
                                    	message : 'Please select a file'
                                    }
                                }
                            }
                        }
                    });
                    $('#account-home-menu').css('background', '#219CC4');
                    $('#account-home-menu a').css('color', 'white');
                })
	</script>
</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>