<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:43:15 GMT -->
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
				
				<!-- Page header
				<div class="page-heading animated fadeInDownBig">
					<h1>AVAILABLE JOBS</h1>
				</div>
				-->
				<!-- End page header -->
				 <div class="box-info full">
					<div class="box-info centered" style="padding-top:3%;">
							<spring:url value="/candidate" var="searchForm"/>
							<form class="form-inline" role="form" action="${searchForm}">
							  <div class="form-group">
								<input type="text" class="form-control" id="exampleInputEmail2" name="search" placeholder="I'm looking for.." style="width:315px;" value = "${search}">
							  </div>
							  <button class="btn btn-primary md-trigger" type="submit" data-modal="form-modal">Search</button>
						</form>
					</div>
					<hr>
					<c:choose> 
					  <c:when test="${not empty jobs}">
					    <c:forEach items="${jobs}" var="job">
				 		<div class="box-info"> 
							<div class="media-body">
								 <h4 class="media-heading"><a href="/job/${job.id}">${job.name}</a><br> <small>${job.location.state.name}, ${job.location.country.name}</small>
								 <a href="#" class="btn btn-gray fa fa-plus toggle"></a>
								 <a href="#" class="btn btn-gray fa fa-star"></a>
								 <a href="#" class="btn btn-gray fa fa-link"></a>
								 </h4>
									 <p>${job.description}</p>
							</div>
						</div>
				 		</c:forEach>
					  </c:when>
					  <c:otherwise>
					  	<h1>No jobs found!</h1>
					  </c:otherwise>
					</c:choose>
				 	
				 </div>

				</div>
				<!-- Footer -->
				<footer>
				© 2014 <a href="index.html">Lanceng Admin</a>. Design with love by <a href="http://isohdesign.com/" target="_blank">Isoh Design Studio</a> from <a href="#fakelink">Yogyakarta, ID</a>
				</footer>
				<!-- End Footer -->
			
            </div>
			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
        </div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	</body>
</html>