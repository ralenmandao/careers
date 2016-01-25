<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
				<form action="/employer/postJob" class="form-horizontal" role="form"
					method="post" id="postJobForm">
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label">Job Type</label>
						<div class="col-sm-9">
							<select class="form-control" name="type">
								<option value="contract">Full Time/Contract</option>
								<option value="temporary">Part Time/Temporary</option>
								<option value="internship">Internship</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Title</label>
						<div class="col-sm-9">
							<input type="text" value="" class="form-control" id="input-text"
								name="title" placeholder="Job title"
								data-parsley-required="true" />
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Experience</label>
						<div class="col-sm-9">
							<input type="text" value="" class="form-control" id="input-text"
								name="experience" placeholder="Experience eg. 0-4"
								data-parsley-required="true" />
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Salary</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="salary"
								placeholder="Salary range eg. 1000-2000"
								data-parsley-required="true" />
						</div>
					</div>
					<div class="form-group" style="" id="grp-state">
						<label for="input-text" class="col-sm-3 control-label"
							id="lbl-location">Location</label>
						<div class="col-sm-9">
							<select data-placeholder="State"
								class="chosen-select form-control" data-id="" tabindex="6"
								name="stateId" data-parsley-required="true" id="location-select">
								<option value=""></option>
								<c:forEach items="${countries}" var="country">
									<optgroup label="${country.name}">
										<c:forEach items="${country.states}" var="state">
											<option value="${state.id}">${state.name}</option>
										</c:forEach>
									</optgroup>
								</c:forEach>

							</select>
						</div>
					</div>
					<div class="form-group" id="grp-skill">
						<label for="input-text" class="col-sm-3 control-label"
							id="lbl-skills">Skills</label>
						<div class="col-sm-9">
							<select data-placeholder="Choose skills..."
								class="chosen-select form-control" multiple tabindex="5"
								name="skills" data-parsley-required="true" id="skills-select">
								<option value=""></option>
								<c:forEach items="${skills}" var="skill">
									<option value="${skill.id}">${skill.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Job expiration</label>
						<div class="col-sm-3">
							<input name="expiry" type="text"
								class="form-control datepicker-input" data-mask="99-99-9999"
								placeholder="mm-dd-yyyy" data-parsley-required="true">
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Job
							Description</label>
						<div class="col-sm-9">
							<textarea class="summernote-small form-control"
								name="description" data-parsley-required="true"></textarea>
						</div>
					</div>
					<button type="submit" class="btn btn-primary pull-right"
						id="sampleSave">Post</button>
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
		$(document).ready(function() {
			$('#sampleSave').click(function() {
				var noError = true;
				if($('#location-select').val() == ''){
					$('#location_select_chosen').css('border-radius', '6px')
					$('#location_select_chosen').css('border', '2px solid #a94442')
					$('#lbl-location').css('color', '#a94442')
					$('#grp-state').append('<small class="help-block col-sm-offset-3 col-sm-9" style="color:#a94442">please select a location</small>');
					noError = false;
				}
				
				
				if($('#skills-select + div > ul').text() == ''){
					$('#skills_select_chosen').css('border', '2px solid #a94442')
					$('#lbl-skills').css('color', '#a94442')
					$('#grp-skill').append('<small class="help-block col-sm-offset-3 col-sm-9" style="color:#a94442">please select a skill</small>');
					noError = false;
				}
				return noError;
			});
			
			$("#skills-select").chosen().change(function(event) {
			    if($(event.target).val() != ''){
			    	$('#skills_select_chosen').css('border', '')
					$('#lbl-skills').css('color', '')
					$('small:last-child', $('#grp-skill')).remove();
			    }
			});
			
			$("#location-select").chosen().change(function(event) {
			    if($(event.target).val() != ''){
			    	$('#location_select_chosen').css('border-radius', '')
					$('#location_select_chosen').css('border', '')
					$('#lbl-location').css('color', '')
					$('small:last-child', $('#grp-state')).remove();
			    }
			});
			
			$('#postJobForm').bootstrapValidator({
				message : 'This value is not valid',
				fields : {
					title : {
						message : 'invalid title',
						validators : {
							notEmpty : {
								message : 'title must not be empty'
							}
						}
					},
					experience : {
						message : 'invalid experience',
						validators : {
							notEmpty : {
								message : 'experience must not be empty'
							},
							regexp : {
								regexp : /[0-9]+-[0-9]+/,
								message : 'invalid experience format eg. 0-4'
							}
						}
					},
					salary : {
						message : 'invalid salary',
						validators : {
							notEmpty : {
								message : 'salary must not be empty'
							},
							regexp : {
								regexp : /[0-9]+-[0-9]+/,
								message : 'invalid salary format eg. 1000-2000'
							}
						}
					},
					expiry : {
						message : 'invalid job expiration',
						validators : {
							notEmpty : {
								message : 'job expiration must not be empty'
							},
							regexp : {
								regexp : /[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/,
								message : 'invalid date format'
							}
						}
					},
					description : {
						message : 'invalid description',
						validators : {
							notEmpty : {
								message : 'description must not be empty'
							}
						}
					}
				}
			});
		});
	</script>
	<style>
#location-select+ul {
	position: absolute;
	top: 25px;
}

#grp-skill>ul {
	position: relative;
	top: 25px;
	left: 25px;
}
</style>
</body>
</html>