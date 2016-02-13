<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<title>Careers CCS - Post a Job</title>
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
				<h2>
					<strong>Post a job</strong>
				</h2>
				<form action="/employer/postJob" class="form-horizontal" role="form"
					method="post" id="postJobForm">
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label">Job Type</label>
						<div class="col-sm-9">
							<select class="form-control" name="type" id="type">
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
					<div class="form-group" id="grp-experience">
						<label for="input-text" class="col-sm-3 control-label">Experience</label>
						<div class="col-sm-9">
							<input type="text" value="" class="form-control" id="experience"
								name="experience" placeholder="Experience eg. 0-4"
								data-parsley-required="true" />
						</div>
					</div>
					<div class="form-group" id="grp-salary">
						<label for="input-text" class="col-sm-3 control-label">Salary</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="salary" id="salary"
								placeholder="Salary range eg. 1000-2000"
								data-parsley-required="true" />
						</div>
					</div>
					<!-- 
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
					-->
					<div class="form-group">
						<label class="col-sm-3 control-label">Location</label>
						<div class="col-sm-9">
							<div class="row">
								<div class="col-sm-6">
									<select class="form-control" name="country" id="country">
										<option value=""></option>
										<c:forEach items="${countries}" var="country">
											<option value="${country.id}" <c:if test="${country.id == principal.location.country.id}">selected</c:if>>${country.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-6">
									<select class="form-control" name="state" id="state">
										<c:forEach items="${principal.location.country.states}" var="state">
											<option value="${state.id}" <c:if test="${state.id == principal.location.state.id}">selected</c:if>>${state.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
					<!-- 
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
					-->
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Skills</label>
						<div class="col-sm-9">
							 <input class="form-control" name="skills" id="skills" 
                   					multiple data-placeholder="Choose skills" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Job expiration</label>
						<div class="col-sm-3">
							<input name="expiry" type="text" id="expiry"
								class="form-control datepicker-input" data-mask="99-99-9999"
								placeholder="mm-dd-yyyy" data-parsley-required="true">
						</div>
					</div>
					<div class="form-group">
						<label for="input-text" class="col-sm-3 control-label">Job
							Description</label>
						<div class="col-sm-9">
							<textarea class="form-control" id="description"
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
		$(document).ready(function(){
			var myContents 
			
			/*
			$('#description')
            .summernote({
                height: 200
            })
            .on('summernote.change', function(customEvent, contents, $editable) {
                // Revalidate the content when its value is changed by Summernote
               	myContents = contents
                $('#postJobForm').formValidation('revalidateField', 'description');
            })
            .end()
            */
            $('#type').change(function(){
            	if($(this).val() == 'internship'){
            		$("#grp-experience").hide(200);
                	$("#grp-salary").hide(200);	
                	$("#salary").val('0-0')
                	$("#experience").val('0-0')
            	}else{
            		$("#grp-experience").show(200);
                	$("#grp-salary").show(200);	
                	$("#salary").val('')
                	$("#experience").val('')
            	}
            })
			
			$('#postJobForm').formValidation({
                framework: 'bootstrap',
                excluded: [':disabled'],
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
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
								regexp : /([0-9]+-[0-9]+)|([0-9]+)/,
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
								regexp : /^[0-9]+-[0-9]+$/,
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
							},
							callback: {
	                            message: 'Invalid specified date',
	                            callback: function (value, validator, $field) {
	                            	var sel = new Date(value)
	                            	var nowD = new Date()
	                            	if(sel < nowD)
	                            		return false
	                            	return true;
	                            }
	                        }
						}
					},
					state: {
                        validators: {
                            notEmpty: {
                                message: 'The location is required'
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
                    },
                    description : {
                        validators: {
                        	 notEmpty: {
                                 message: 'The description is required'
                             },
                             stringLength: {
                                 message: 'The description minimum character is 100 ',
                                 min: function(
                                     value,
                                     validator,
                                     $field) {
                                     return 100;
                                 }
                             }
                        }
                    }
				}
			}).on(
                    'success.validator.fv',
                    function(e, data) {
                        if (data.field === 'expiry' && data.validator === 'date' && data.result.date) {
                            // The eventDate field passes the date validator
                            // We can get the current date as a Javascript Date object
                            var currentDate = data.result.date,
                                day = currentDate
                                .getDay();
                            var todayDate = new Date();
							console.log(currentDate)
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
                            } else {
                                // Reset the message
                                data.fv
                                    .updateMessage(
                                        data.field,
                                        data.validator,
                                        'The date is not valid date');
                            }
                        }
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
                                    $.each(data._embedded.states,function(index, value) {
                                        $('#state').append('<option value="' + value.id + '">' + value.name + "</option>")
                                      });
                                });
                    })
                    
                          /* CHANGE prof VALIDATION */
            $('#skills')
                .select2({
                        tags: [<c:forEach items="${skills}" var="skill">'${skill.name}',</c:forEach>]

                        })
                    // Revalidate the color when it is changed
                    .change(function(e) {
                        $('#postJobForm').formValidation('revalidateField', 'skills');
                    })
                    .end()
                    // Revalidate the color when it is changed
                    
                    $('#expiry').datepicker({
                        format: 'yyyy-mm-dd'
                    }).on(
                        'changeDate',
                        function(e) {
                            // Revalidate the date field
                            $('#postJobForm')
                                .formValidation(
                                    'revalidateField',
                                    'expiry');
                        });
			$('#post-a-job-menu').css('background', '#219CC4');
			$('#post-a-job-menu a').css('color', 'white');
		});
	</script>
	<style>
#location-select+ul {
	position: absolute;
	top: 25px;
}
.datepicker {
	z-index: 99999999999;
}
#grp-skill>ul {
	position: relative;
	top: 25px;
	left: 25px;
}
</style>
</body>
</html>