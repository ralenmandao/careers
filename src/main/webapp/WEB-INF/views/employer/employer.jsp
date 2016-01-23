<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				  <strong>Success!</strong> posting a job.
				</div>
			</c:if>
			<c:if test="${param.deleted != null}">
				<div class="alert alert-success alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				  <strong>Success!</strong> deleted a job.
				</div>
			</c:if>
				<div class="col-sm-5">
					<div class="box-info">
						<h2><strong>Job Posted</strong></h2>
						<div id = "job-posted">
							<c:forEach items="${jobs}" var="job">
								<span class="label label-success pull-right">${job.applicants.size}</span>
								<a href="/employer/job/edit/${job.id}"><h5>${job.name}</h5></a>
								<h6><span class="fa fa-calendar-o"></span> <fmt:formatDate value="${job.posted}"/></h6>
								<hr>
							</c:forEach>
						</div>
						<br>
						<a href="#"><p class="text-center">See more...</p></a>
					</div>
				</div>
				<div class="col-sm-7">
					<div class="box-info">
						<h2><strong>Company Information</strong></h2>
						<div id = "job-posted">
							<c:choose>
							    <c:when test="${principal.hasPicture}">
							       <img class="media-object pull-right" src="${resources}images/profiles/${principal.id}.png" alt="Avatar" style="height:100px;width:100px">
							    </c:when>    
							    <c:otherwise>
							        <img class="media-object pull-right" src="${resources}images/no-profile.png" alt="Avatar" style="height:100px;width:100px">
							    </c:otherwise>
							</c:choose>
							<h4>${principal.companyName}</h4>
							<h5><span class="fa fa-map-marker"></span> ${principal.location.state.name}, ${principal.location.country.name}</h5>
							<h5><span class="fa fa-sitemap"></span> Company Size : ${principal.size}</h5>
							<p>
								${principal.overview}
							</p>
						</div>
					</div>
				</div>
            </div>
			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
        </div>
     <div class="md-modal md-fade-in-scale-up" id="md-fade-in-scale-up">
		<div class="md-content">
			<h3>Upload Photo</h3>
			<div>
				<spring:url value="/employer/profileUpload" var="uploadPicture" />
				<form method="POST" action="${uploadPicture}" enctype="multipart/form-data">
				 	Picture : <input class="btn btn-default btn-xs" type="file" name="file" />
				 	<br>
				 	<br>
				 	<input type="hidden" value="${principal.id}" name="id">
				 	<button class="btn btn-success md-close" type="submit">Save</button>
				</form>
			</div>
		</div><!-- End div .md-content -->
	</div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			//$.get("/jobs/search/findByEmployerId?id=567ddd7dafbac4211a2db22e&page=0", function(data, status){
		       // alert("Data: " + data.size + "\nStatus: " + status);
		  //  });
		});
	</script>
	</body>
</html>