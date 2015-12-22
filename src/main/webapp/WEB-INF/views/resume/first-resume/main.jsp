<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:43 GMT -->
<head>
	<title>Careers - Login</title>
	<link href='http://fonts.googleapis.com/css?family=Roboto+Slab:700,400|Shadows+Into+Light+Two' rel='stylesheet' type='text/css'>
	<spring:url value="/resources/" var="resources" />
	<spring:url value="/WEB-INF/views/" var="views" />
	<spring:url value="/" var="root" />
	<link href="${resources}assets/css/resume/resume1/theme.css" rel="stylesheet">
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
				<a href="/candidate/addResume?edit=true" class="btn btn-success" style="position:absolute;right:10px;">Edit</a>
				
				<div class="container" id="resume-container">
					<div class="row">
						<div class="col-xs-12">
							<div class="well">
								<div class="dp-box">
									<c:choose>
									    <c:when test="${candidate.hasPicture}">
									       <img class="media-object img-circle" src="${resources}images/profiles/${candidate.id}.png" alt="Avatar" style="width:200px;height:200px;">
									    </c:when>    
									    <c:otherwise>
									        <img class="media-object img-circle" src="${resources}images/no-profile.png" alt="Avatar" style="width:200px;height:200px;">
									    </c:otherwise>
									</c:choose>
								</div>
								<div class="intro">
									<h1 style="text-transform:capitalize;"><b>Hello,</b> I am ${candidate.firstName} ${candidate.lastName}</h1>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12 col-md-6 col-lg-6">
							<div class="well">
								<h3 class="red">#About me</h3>
								<p>${candidate.about}</p>
							</div>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-6">
							<div class="well">
								<h3 class="red">#Objective</h3>
								<p>${candidate.objective}</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<div class="well">
								<h3 class="red">#Education</h3>
								<ul class="timeline">
									<li class="timeline-inverted">
									  <div class="timeline-badge">${candidate.highSchool.endYear}</div>
									  <div class="timeline-panel">
										<div class="timeline-heading">
										  <h4 class="timeline-title">${candidate.highSchool.school}</h4>
										  <p><small class="text-muted"><i class="fa fa-time"></i> From ${candidate.highSchool.startYear} - ${candidate.highSchool.endYear}</small></p>
										</div>
									  </div>
									</li>
									<li class="timeline-inverted">
									  <div class="timeline-badge success">${candidate.college.endYear}</div>
									  <div class="timeline-panel">
										<div class="timeline-heading">
										  <h4 class="timeline-title">${candidate.college.school}</h4>
										  <h5>${candidate.college.course}</h5>
										  <p><small class="text-muted"><i class="fa fa-time"></i> From ${candidate.college.startYear} - ${candidate.college.endYear}</small></p>
										</div>
									  </div>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<div class="well">
								<h3 class="red">#Skills</h3>
								<c:forEach items="${candidate.skills}" var="skill">
									<span style="font-size:12px;" class="label label-success">${skill.name}</span>
								</c:forEach>
							</div>
							<div class="well">
								<h3 class="red">#Contact me</h3>
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
										<div class="contact-item bigger-120">
										  <div class="icon green pull-left text-center"><span class="fa fa-phone fa-fw"></span></div>
										  <div class="title no-description">${candidate.contactNo}</div>
										</div>
									</div>
									<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
										<div class="contact-item bigger-120">
										  <div class="icon red pull-left text-center"><span class="fa fa-envelope fa-fw"></span></div>
										  <div class="title no-description">${candidate.user.email}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-7 col-lg-12">
							<div class="well">
								<h3 class="red">#Experience</h3>
								<div class="panel-group" id="accordion">
									<c:forEach items="${candidate.experiences}" var="exp">
										<div class="panel panel-default">
											<div class="panel-heading">
											  <h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
												  ${exp.position} (${exp.startYear}-${exp.endYear}) - ${exp.companyName}
												</a>
											  </h4>
											</div>
											<div id="collapseOne" class="panel-collapse collapse in">
											  <div class="panel-body">
												${exp.role}
											  </div>
											</div>
										  </div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
        </div>
		<jsp:include page="${views}foot.jsp"></jsp:include>
		<jsp:include page="${views}script-imports.jsp"></jsp:include>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>