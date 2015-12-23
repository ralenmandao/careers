<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:43 GMT -->
<head>
	<title>Careers - Login</title>
	<spring:url value="/resources/" var="resources" />
	<spring:url value="/WEB-INF/views/" var="views" />
	<spring:url value="/" var="root" />
	<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700' rel='stylesheet' type='text/css'>
	<link href="${resources}assets/css/resume/resume2/theme.css" rel="stylesheet">
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
				<div class="box-info">
				<div class="container">				
				    <!-- wrapper -->
				    <div>
				
				      <hr>
				
				      <!-- title name cv-->
				      <header class="text-center cv-header">
				        <h1 class="text-uppercase">${candidate.firstName} ${candidate.lastName}</h1>
				        <p class="lead">
				          ${candidate.title}
				        </p>
				      </header><!--/ title name cv-->
				
				      <hr>
				
				      <br>
				
				      <div class="row">
				
				        <!-- column left -->
				        <div class="col-md-7">
				
				          <!-- about me -->
				          <section class="cv-section">
				
				            <h3 class="text-uppercase">// About Me</h3>
				
				            <article class="wow" data-wow-delay=".1s">
				
				              <div class="row">
				
				                <div class="col-sm-4 col-sm-push-8 text-center">
									 <c:choose>
									    <c:when test="${candidate.hasPicture}">
									       <img src="${resources}images/profiles/${candidate.id}.png" alt="Avatar" class="img-circle cv-portrait-photo">
									    </c:when>    
									    <c:otherwise>
									        <img src="${resources}images/no-profile.png" alt="Avatar" class="img-circle cv-portrait-photo">
									    </c:otherwise>
									</c:choose>
				                </div>
				
				                <div class="col-xs-12 col-sm-8 col-sm-pull-4">
				
				                  <p>
				                   ${candidate.about}
				                  </p>
				
				                </div>
				
				              </div>
				
				            </article>
				
				          </section><!--/ about me -->
				
				          <!-- experiences -->
				          <section class="cv-section">
				
				            <h3 class="text-uppercase">// Experiences</h3>
							<c:forEach items="${candidate.experiences}" var="exp">
								 <article class="wow" data-wow-delay=".1s">
						              <h4>${exp.companyName}</h4>
						              <p>
						                <small class="text-primary"><strong>${exp.position},</strong> ${exp.startYear} to ${exp.endYear}</small>
						              </p>
						              <p>
						                ${exp.role}
						              </p>						
						            <hr>
						        </article>
							</c:forEach>	
				          </section><!--/ experiences -->
				
				          <!-- education -->
				          <section class="cv-section">
				
				            <h3 class="text-uppercase">// Education</h3>
				
				            <article class="wow" data-wow-delay=".3s">
				
				              <h4>${candidate.college.school}</h4>
				              <p>
				                <small class="text-primary"><strong>${candidate.college.course}, </strong>${candidate.college.endYear}</small>
				              </p>
				              <hr>
				
				            </article>
				          </section><!--/ education -->
				
				        </div><!--/ column left -->
				
				        <!-- column right -->
				        <div class="col-md-5">
				
				          <!-- contact -->
				          <section class="cv-section wow" data-wow-delay=".5s">
				
				            <h3 class="text-uppercase">// Contact</h3>
				
				            <article class="media">
				
				              <div class="pull-left">
				                <span class="fa fa-phone bg-primary text-primary"></span>
				              </div>
				              <div class="media-body">${candidate.contactNo}</div>
				
				            </article>
				
				            <article class="media">
				
				              <div class="pull-left">
				                <span class="fa fa-envelope bg-primary text-primary"></span>
				              </div>
				              <div class="media-body">${candidate.user.email}</div>
				
				            </article>
				
				            <article class="media">
				
				              <div class="pull-left">
				                <span class="fa fa-map-marker bg-primary text-primary"></span>
				              </div>
				              <div class="media-body">${candidate.address}</div>
				
				            </article>
				
				            <article class="media">
				
				              <div class="pull-left">
				                <span class="fa fa-calendar-o bg-primary text-primary"></span>
				              </div>
				              <div class="media-body">
				              
				             	 <fmt:formatDate type="date"  dateStyle="long" value="${candidate.birthdate}" />
				               </div>
				
				            </article>
				
				          </section><!--/ contact -->
				
				          <!-- skills -->
				          <section class="cv-section">
				
				            <h3 class="text-uppercase">// Skills</h3>
				
				            <c:forEach items="${candidate.skills}" var="skill">
				            	<h4 style="margin-left: 30px"><span class="fa fa-check bg-primary text-primary" style="padding:5px;margin-right:15px;"></span> ${skill.name}</h4>
				            </c:forEach>
				          </section><!--/ skills -->

				        </div><!--/ column right -->
				
				      </div>
				
				      <hr>
				
				    </div><!--/ wrapper -->
				
				  </div><!--/ container-->
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