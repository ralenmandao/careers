<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:43 GMT -->
<head>
	<title>Careers - Login</title>
	<spring:url value="/resources/" var="resources" />
	<spring:url value="/WEB-INF/views/" var="views" />
	<spring:url value="/" var="root" />
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
				
				                  <img src="${resources}images/no-profile.png" class="img-circle cv-portrait-photo">
				
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
				              <div class="media-body">${candidate.birthdate}</div>
				
				            </article>
				
				          </section><!--/ contact -->
				
				          <!-- skills -->
				          <section class="cv-section">
				
				            <h3 class="text-uppercase">// Skills</h3>
				
				            <article>
				
				              <div class="row">
				
				                <div class="col-sm-6 col-md-12 wow" data-wow-delay=".5s">
				
				                  <!-- Skills 1 -->
				                  <h4>Programming</h4>
				                  <hr>
				
				                  <h6>Java</h6>
				                  <div class="progress">
				                    <div class="progress-bar" style="width: 85%"></div>
				                  </div>
				
				                  <h6>C++</h6>
				                  <div class="progress">
				                    <div class="progress-bar" style="width: 60%"></div>
				                  </div>
				
				                  <h6>VB.Net</h6>
				                  <div class="progress">
				                    <div class="progress-bar" style="width: 75%"></div>
				                  </div>
				
				                  <h6>PHP</h6>
				                  <div class="progress">
				                    <div class="progress-bar" style="width: 55%"></div>
				                  </div>
				
				                  <br>
				
				                </div>
				
				                <div class="col-sm-6 col-md-12 wow" data-wow-delay=".8s">
				                  <!-- Skills 2 -->
				                  <h4>Databases</h4>
				                  <hr>
				
				                  <h6>Oracle 8/7</h6>
				                  <div class="progress">
				                    <div class="progress-bar" style="width: 70%"></div>
				                  </div>
				
				                  <h6>MS Access</h6>
				                  <div class="progress">
				                    <div class="progress-bar" style="width: 60%"></div>
				                  </div>
				
				                  <h6>SQL Server</h6>
				                  <div class="progress">
				                    <div class="progress-bar" style="width: 90%"></div>
				                  </div>
				
				                  <h6>MySQL</h6>
				                  <div class="progress">
				                    <div class="progress-bar" style="width: 80%"></div>
				                  </div>
				
				                  <br>
				
				                </div>
				
				                <div class="col-sm-12 wow" data-wow-delay=".3s">
				
				                  <h4>Systems</h4>
				                  <hr>
				
				                  <h6>AIX</h6>
				                  <div class="progress">
				                    <div class="progress-bar progress-bar-success" style="width: 70%"></div>
				                  </div>
				
				                  <h6>Linus</h6>
				                  <div class="progress">
				                    <div class="progress-bar progress-bar-info" style="width: 60%"></div>
				                  </div>
				
				                  <h6>Unix</h6>
				                  <div class="progress">
				                    <div class="progress-bar progress-bar-warning" style="width: 90%"></div>
				                  </div>
				
				                  <h6>Windows NT V4.0</h6>
				                  <div class="progress">
				                    <div class="progress-bar progress-bar-danger" style="width: 80%"></div>
				                  </div>
				
				                  <br>
				
				                </div>
				
				              </div>
				
				            </article>
				
				          </section><!--/ skills -->
				
				          <!-- hobbies -->
				          <section class="cv-section">
				
				            <h3 class="text-uppercase">// Hobbies</h3>
				
				            <article class="wow" data-wow-delay=".5s">
				
				              <p><i class="fa fa-check"></i>&nbsp; Classical Music</p>
				              <hr>
				
				              <p><i class="fa fa-check"></i>&nbsp; Traveling</p>
				              <hr>
				
				              <p><i class="fa fa-check"></i>&nbsp; Table Tennis</p>
				
				            </article>
				
				          </section><!--/ hobbies -->
				
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