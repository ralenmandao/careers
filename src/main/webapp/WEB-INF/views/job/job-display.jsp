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
<body class="tooltips full-content">
	<jsp:include page="${views}head.jsp"></jsp:include>
	<!-- BEGIN PAGE -->
	<div class="scroll-y" id="body-container">
		<div class="body content rows scroll-y">
			<!-- 
			<div class="box-info default">
				<h2><strong>${job.name}</strong> (${job.employer.companyName})</h2>
				<div class="row">
					<div class="col-md-6">
						<h2>Job Description</h2>
						<p>${job.description}</p>
					</div>
					<div class="col-md-6">
						<h2>Company Overview</h2>
						<p>
						${job.employer.overview}
						<br>
						</p>
						<span class="glyphicon glyphicon-map-marker"> </span> ${job.employer.location.state.name}, ${job.employer.location.country.name}
					</div>
				</div>
				<strong>Skills Required : </strong>
				<c:forEach items="${job.skills}" var="skill">
					<span class="label label-success">${skill.name}</span>
				</c:forEach>
				<br>
				<strong>Salary :</strong> ${job.salaryFrom} - ${job.salaryTo} PHP
				<br>
				<strong>Experience Required :</strong> ${job.experienceFrom} - ${job.experienceTo} year(s)
				<br>
				<strong>Job Type :</strong>
					<c:choose>
					    <c:when test="${job.type == 'contract'}">
					       	Full Time/Contract
					    </c:when>    
					    <c:when test="${job.type == 'temporary'}">
					       	Part Time/Temporary
					    </c:when>  
					    <c:otherwise>
					        Internship
					    </c:otherwise>
					</c:choose>
				<br>
				<strong>Location :</strong> ${job.location.state.name}, ${job.location.country.name}
				
				<hr>
				<c:if test="${not applied}">
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
				</c:if>
			</div>
			 -->
			<div class="row">
				<div class="col-sm-7">
					<div class="box-info">
						<h2>
							<strong>${job.name} 
								<c:if test="${job.expired == true}">
									<span class="label label-danger">Expired</span>
								</c:if>
							</strong>
							<div class="pull-right">
								<fmt:formatDate type="date" value="${job.posted}" /> - <fmt:formatDate type="date" value="${job.expiry}" />
							</div>
						</h2>
						<strong>Skills Required : </strong>
						<c:forEach items="${job.skills}" var="skill">
							<span class="label label-success">${skill.name}</span>
						</c:forEach>
						<br> 
						<c:if test="${job.salaryFrom != 0 && job.salaryTo != 0}">
							<strong>Salary :</strong> ${job.salaryFrom} -
									${job.salaryTo} PHP
									<br>
						</c:if>
						<c:choose>
							<c:when test="${job.experienceFrom != 0 && job.experienceTo==0}">
								<c:set var="exp" value="${job.experienceFrom}" />
							</c:when>
							<c:otherwise>
								<c:set var="exp" value="${job.experienceFrom}-${job.experienceTo}" />
							</c:otherwise>
						</c:choose>
						<c:if test="${job.experienceFrom != 0}">
							<strong>Experience Required
							:</strong> ${exp} year(s) <br>
						</c:if>
							  <strong>Job
							Type :</strong>
						<c:choose>
							<c:when test="${job.type == 'contract'}">
					       	Full Time/Contract
					    </c:when>
							<c:when test="${job.type == 'temporary'}">
					       	Part Time/Temporary
					    </c:when>
							<c:otherwise>
					        Internship
					    </c:otherwise>
						</c:choose>
						<br> <strong>Location :</strong> ${job.location.state.name},
						${job.location.country.name}
						<h4><strong>Description :</strong></h4>
						<p>
							${job.description}
						</p>
					</div>
				</div>
				<div class="col-sm-5">
					<div class="box-info">
						<h2>
							<strong>${job.employer.companyName}</strong>
						</h2>
						<div id="job-posted">
							<c:choose>
								<c:when test="${job.employer.hasPicture}">
									<img class="media-object pull-right"
										src="/candidate/profilePicture/${job.employer.pictureId}"
										alt="Avatar" style="height: 100px; width: 100px">
								</c:when>
								<c:otherwise>
									<img class="media-object pull-right"
										src="${resources}images/no-profile.png" alt="Avatar"
										style="height: 100px; width: 100px">
								</c:otherwise>
							</c:choose>
							
							<c:if test="${not empty job.employer.industries}">
								<strong>Industries : </strong>
								<c:forEach items="${job.employer.industries}" var="industry">
									<span class="label label-success">${industry.name}</span>
								</c:forEach>
							</c:if>
							
							<c:if test="${not empty job.employer.location}">
								<h5>
									<span class="fa fa-map-marker"></span>
									${job.employer.location.state.name},
									${job.employer.location.country.name}
								</h5>
							</c:if>
							<c:if test="${not empty job.employer.size || job.employer.size != 0}">
								<h5>
									<span class="fa fa-sitemap"></span> Company Size :
									${job.employer.size}
								</h5>
							</c:if>
							<c:if test="${not empty job.employer.overview}">
								<p>${job.employer.overview}</p>
							</c:if>
							<c:if test="${empty job.employer.location &&
							    		 empty job.employer.size &&
							    		 empty job.employer.overview &&
							    		 empty job.employer.industries}">
							    <h5>Company information not available!</h5>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<c:if test="${not applied}">
						<div class="box-info">
							<form action="/job/${job.id}/apply" method="post" id="apply">
								<div class="form-group">
									<label for="input-text" class="col-sm-2 control-label">Cover
										Letter</label>
									<div class="col-sm-10">
										<textarea class="form-control" name="cover"></textarea>
									</div>
								</div>

								<div class="form-group" style="margin-right: 15px;">
									<button type="submit" class="btn btn-primary pull-right"
										name="contact">Apply Now</button>
								</div>
							</form>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$('#apply')
            .formValidation({
                framework: 'bootstrap',
                excluded: [':disabled'],
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                	cover: {
                        validators: {
                            notEmpty: {
                                message: 'The cover letter is required and cannot be empty'
                            },
                            stringLength: {
                                message: 'PThe cover letter must be less than 500 characters and greater than 100 characters',
                                max: function (value, validator, $field) {
                                    return 500 - (value.match(/\r/g) || []).length;
                                },
                                min: function (value, validator, $field) {
                                	return 100 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    }
                }
            })
  
			$('#job-applications-home').css('background', '#219CC4');
            $('#job-applications-home a').css('color', 'white');
		})
	</script>
</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>