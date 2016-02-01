<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:43:15 GMT -->
<head>
<title>Careers - ${principal.firstName}</title>
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
			<div class="row">
				<!-- Visitor Info Box -->
				<div class="col-sm-3 col-xs-6">
					<!-- Box info -->
					<div class="box-info">
						<!-- Icon box -->
						<div class="icon-box">
							<span class="fa-stack"> <i
								class="fa fa-circle fa-stack-2x success"></i> <i
								class="glyphicon glyphicon-user fa-stack-1x fa-inverse"></i>
							</span>
						</div>
						<!-- End div .icon-box -->
						<!-- Text box -->
						<div class="text-box">
							<h3>${candidateSize}</h3>
							<p>Candidates</p>
						</div>
						<!-- End div .text-box -->
					</div>
					<!-- End div .info-box -->
				</div>
				<!-- End Visitor Info Box -->


				<!-- Orders Info Box -->
				<div class="col-sm-3 col-xs-6">
					<!-- Box info -->
					<div class="box-info">
						<!-- Icon box -->
						<div class="icon-box">
							<span class="fa-stack"> <i
								class="fa fa-circle fa-stack-2x danger"></i> <i
								class="fa fa-users fa-stack-1x fa-inverse"></i>
							</span>
						</div>
						<!-- End div .icon-box -->
						<!-- Text box -->
						<div class="text-box">
							<h3>${employerSize}</h3>
							<p>Employers</p>
						</div>
						<!-- End div .text-box -->
					</div>
					<!-- End div .info-box -->
				</div>
				<!-- End Orders Info Box -->


				<!-- Downloads Info Box -->
				<div class="col-sm-3 col-xs-6">
					<!-- Box info -->
					<div class="box-info">
						<!-- Icon box -->
						<div class="icon-box">
							<span class="fa-stack"> <i
								class="fa fa-circle fa-stack-2x info"></i> <i
								class="fa fa-briefcase fa-stack-1x fa-inverse"></i>
							</span>
						</div>
						<!-- End div .icon-box -->
						<!-- Text box -->
						<div class="text-box">
							<h3>${jobSize}</h3>
							<p>Jobs</p>
						</div>
						<!-- End div .text-box -->
					</div>
					<!-- End div .info-box -->
				</div>
				
				<div class="col-sm-3 col-xs-6">
					<!-- Box info -->
					<div class="box-info">
						<!-- Icon box -->
						<div class="icon-box">
							<span class="fa-stack"> <i
								class="fa fa-circle fa-stack-2x info"></i> <i
								class="fa fa-check fa-stack-1x fa-inverse"></i>
							</span>
						</div>
						<!-- End div .icon-box -->
						<!-- Text box -->
						<div class="text-box">
							<h3>${selectedSize}</h3>
							<p>Selected Candidates</p>
						</div>
						<!-- End div .text-box -->
					</div>
					<!-- End div .info-box -->
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8">

					<!-- Box info -->
					<div class="box-info" id="myarticles">
						<h2>Articles/News</h2>
						<c:forEach items="${articles}" var="article">
							<h4>${article.title}</h4>
							<p>${article.message}</p>
						</c:forEach>
						<c:if test="${not empty articles}">
							<br>
							<a href="/admin/articles"><p class="text-center">See
									more...</p></a>
						</c:if>
					</div>
					<!-- End div .info-box -->
				</div>
				<div class="col-sm-4">
					<div class="box-info">
						<h2>
							<strong>Candidates</strong>
						</h2>
						<c:if test="${empty candidates}">
							<p class="text-center">No candidates yet!</p>
						</c:if>
						<c:forEach items="${candidates}" var="candidate">
							<div class="row">
								<div class="col-sm-2">
									<c:choose>
										<c:when test="${candidate.hasPicture}">
											<img class="media-object"
												src="/candidate/profilePicture/${candidate.pictureId}"
												alt="Avatar" style="width: 50px; height: 50px;">
										</c:when>
										<c:otherwise>
											<img class="media-object"
												src="${resources}images/no-profile.png" alt="Avatar"
												style="width: 50px; height: 50px;">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-sm-offset-1 col-sm-8">
									<h5>
										<a href="/admin/candidates/${candidate.id}">${candidate.firstName} ${candidate.lastName}</a>
									</h5>
									<c:if test="${not empty candidate.location}">
										<h5>
											<span class="fa fa-map-marker"></span>
											${candidate.location.state.name},
											${candidate.location.country.name}
										</h5>
									</c:if>
								</div>
							</div>
							<br>
						</c:forEach>
						<c:if test="${not empty candidates}">
							<br>
							<a href="/admin/candidates"><p class="text-center">See
									more...</p></a>
						</c:if>
					</div>

					<div class="box-info">
						<h2>
							<strong>Employers</strong>
						</h2>
						<c:if test="${empty employers}">
							<p class="text-center">No employers yet!</p>
						</c:if>
						<c:forEach items="${employers}" var="employer">
							<div class="row">
								<div class="col-sm-2">
									<c:choose>
										<c:when test="${employer.hasPicture}">
											<img class="media-object"
												src="/candidate/profilePicture/${employer.pictureId}"
												alt="Avatar" style="width: 50px; height: 50px;">
										</c:when>
										<c:otherwise>
											<img class="media-object"
												src="${resources}images/no-profile.png" alt="Avatar"
												style="width: 50px; height: 50px;">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-sm-offset-1 col-sm-8">
									<h5>
										<a href="/admin/employers/${employer.id}">${employer.companyName}</a>
									</h5>
									<c:if test="${not empty employer.location}">
										<h5>
											<span class="fa fa-map-marker"></span>
											${employer.location.state.name},
											${employer.location.country.name}
										</h5>
									</c:if>
								</div>
							</div>
							<br>
						</c:forEach>
						<c:if test="${not empty employers}">
							<br>
							<a href="/admin/employers"><p class="text-center">See
									more...</p></a>
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<!-- ============================================================== -->
		<!-- END YOUR CONTENT HERE -->
		<!-- ============================================================== -->

	</div>
	<style>
		#myarticles p {
			max-height: 20px;
			height: 20px;
			max-height: 50px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
	</style>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$('#main-home').css('background', '#219CC4');
            $('#main-home a').css('color', 'white');
		})
	</script>
</body>
</html>