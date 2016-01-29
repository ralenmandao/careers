<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<c:if test="${param.success != null}">
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">×</button>
					<strong>Success!</strong> posting a job.
				</div>
			</c:if>
			<c:if test="${param.deleted != null}">
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">×</button>
					<strong>Success!</strong> deleted a job.
				</div>
			</c:if>
			<div class="row">
				<div class="col-sm-5">
					<div class="box-info">
						<h2>
							<strong>Job Posted</strong>
						</h2>
						<div id="job-posted">
							<c:forEach items="${jobs}" var="job">
								<h6 class="pull-right">
									<span class="fa fa-calendar-o"></span>
									<fmt:formatDate value="${job.posted}" />
								</h6>
								<a href="/employer/job/edit/${job.id}"><h5>${job.name}</h5></a>
								<h6><span class="fa fa-map-marker"></span> ${job.location.state.name}, ${job.location.country.name}</h6>
								<hr>
							</c:forEach>
						</div>
						<c:if test="${empty jobs}">
							<p>
								Post a job <a href="/employer/postJob">here</a>
							</p>
						</c:if>
						<c:if test="${not empty jobs}">
							<br>
							<a href="/employer/postedJob"><p class="text-center">See more...</p></a>
						</c:if>
					</div>
				</div>
				<div class="col-sm-7">
					<div class="box-info">
						<h2>
							<strong>Company Information</strong>
						</h2>
						<div id="job-posted">
							<c:choose>
								<c:when test="${principal.hasPicture}">
									<img class="media-object pull-right"
										src="/employer/profilePicture/${principal.pictureId}"
										alt="Avatar" style="height: 100px; width: 100px">
								</c:when>
								<c:otherwise>
									<img class="media-object pull-right"
										src="${resources}images/no-profile.png" alt="Avatar"
										style="height: 100px; width: 100px">
								</c:otherwise>
							</c:choose>
							<h4>${principal.companyName}</h4>
							<c:if test="${not empty principal.industries}">
								<strong>Industries : </strong>
								<c:forEach items="${principal.industries}" var="industry">
									<span class="label label-success">${industry.name}</span>
								</c:forEach>
							</c:if>
							<c:choose>
								<c:when
									test="${ not empty principal.location &&
							    		 not empty principal.size &&
							    		 not empty principal.overview }">
									<h5>
										<span class="fa fa-map-marker"></span>
										${principal.location.state.name},
										${principal.location.country.name}
									</h5>
									<h5>
										<span class="fa fa-sitemap"></span> Company Size :
										${principal.size}
									</h5>
									<p>${principal.overview}</p>
								</c:when>
								<c:otherwise>
									<p>
										Update your account information <a href="/employer/edit">here</a>
									</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-5">
					<div class="box-info">
						<h2>
							<strong>Recent Applicants</strong>
						</h2>
						<c:if test="${empty applicants}">
							<p class="text-center">No applications yet!</p>
						</c:if>
						<c:forEach items="${applicants}" var="applicant">
							<div class="row">
								<div class="col-sm-2">
									<c:choose>
										<c:when test="${applicant.candidate.hasPicture}">
											<img class="media-object img-circle"
												src="/candidate/profilePicture/${applicant.candidate.pictureId}"
												alt="Avatar" style="width: 50px; height: 50px;">
										</c:when>
										<c:otherwise>
											<img class="media-object img-circle"
												src="${resources}images/no-profile.png" alt="Avatar"
												style="width: 50px; height: 50px;">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-sm-offset-1 col-sm-8">
									<h5>
										<a href="/employer/job/${applicant.job.id}/${applicant.candidate.id}">${applicant.candidate.firstName}
											${applicant.candidate.lastName}</a>
									</h5>
									<c:if test="${not empty applicant.candidate.location}">
										<h5>
											<span class="fa fa-map-marker"></span>
											${applicant.candidate.location.state.name},
											${applicant.candidate.location.country.name}
										</h5>
									</c:if>
								</div>
							</div>
						</c:forEach>
						<c:if test="${not empty applicants}">
							<br>
							<a href="/employer/postedJob"><p class="text-center">See more...</p></a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- END YOUR CONTENT HERE -->
		<!-- ============================================================== -->

	</div>
	<!-- 
	<div class="md-modal md-fade-in-scale-up" id="md-fade-in-scale-up">
		<div class="md-content">
			<h3>Upload Photo</h3>
			<div>
				<spring:url value="/employer/profileUpload" var="uploadPicture" />
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
	 -->
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			//$.get("/jobs/search/findByEmployerId?id=567ddd7dafbac4211a2db22e&page=0", function(data, status){
			// alert("Data: " + data.size + "\nStatus: " + status);
			//  });
			$('#home-menu').css('background', '#219CC4');
            $('#home-menu a').css('color', 'white');
		});
	</script>
</body>
</html>