<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<title>Careers CCS - Job Applications</title>
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
			<c:if test="${param.applied != null}">
				<div class="alert alert-success" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span> Job
					application succesfull!
				</div>
			</c:if>
			<!-- Page header
				<div class="page-heading animated fadeInDownBig">
					<h1>AVAILABLE JOBS</h1>
				</div>
				-->
			<!-- End page header -->
			<div class="box-info">
				<h2>
					<strong>Job Applications</strong>
				</h2>
				<c:choose>
					<c:when test="${not empty applications}">
						<c:forEach items="${applications}" var="application">
							<div class="box-info">
								<div class="media-body">
									<h4 class="media-heading">
										<a href="/job/${application.job.id}">${application.job.name}</a>
										<c:choose>
											<c:when test="${application.viewCount == 0}">
												<span class="label label-danger">Not yet viewed</span>
											</c:when>
											<c:otherwise>
												<span class="label label-success">${application.viewCount}
													view/s</span>
											</c:otherwise>
										</c:choose>
										<c:if test="${application.job.expired == true}">
											<span class="label label-danger">EXPIRED</span>
										</c:if>
										<c:if test="${not empty application.result}">
											<span class="label label-info">${application.result}</span>
										</c:if>
										<br> <small>${application.job.location.state.name},
											${application.job.location.country.name}</small>
									</h4>
									<p>${application.job.description}</p>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h2 style="text-align: center">No job applications!</h2>
					</c:otherwise>
				</c:choose>

			</div>

		</div>
		<!-- Footer -->
		<!-- End Footer -->

	</div>
	<!-- ============================================================== -->
	<!-- END YOUR CONTENT HERE -->
	<!-- ============================================================== -->

	</div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$('#job-applications-home').css('background', '#219CC4');
			$('#job-applications-home a').css('color', 'white');
		})
	</script>
</body>
</html>