<%@page import="com.boot.data.entity.State"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:43:15 GMT -->
<head>
	<title>Careers - edit</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="description" content="">
	<meta name="keywords" content="admin, bootstrap,admin template, bootstrap admin, simple, awesome">
	<meta name="author" content="">

	<spring:url value="/resources/" var="resources" />
	<spring:url value="/WEB-INF/views/" var="views" />
	<spring:url value="/" var="root" />
	<script>
		var principal = "${principal.user.username}"
	</script>

	<!-- BOOTSTRAP -->
	<link href="${resources}assets/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- LANCENG CSS -->
	<link href="${resources}assets/css/style.css" rel="stylesheet">
	<link href="${resources}assets/css/style-responsive.css" rel="stylesheet">
	
	<!-- VENDOR -->
	<link href="${resources}assets/css/animate.css" rel="stylesheet">
	<link href="${resources}assets/third/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="${resources}assets/third/weather-icon/css/weather-icons.min.css" rel="stylesheet">
	<link href="${resources}assets/third/morris/morris.css" rel="stylesheet">
	<link href="${resources}assets/third/nifty-modal/css/component.css" rel="stylesheet">
	<link href="${resources}assets/third/sortable/sortable-theme-bootstrap.css" rel="stylesheet"> 
	<link href="${resources}assets/third/icheck/skins/minimal/grey.css" rel="stylesheet"> 
	<link href="${resources}assets/third/select/bootstrap-select.min.css" rel="stylesheet"> 
	<link href="${resources}assets/third/summernote/summernote.css" rel="stylesheet">
	<link href="${resources}assets/third/magnific-popup/magnific-popup.css" rel="stylesheet"> 
	<link href="${resources}assets/third/datepicker/css/datepicker.css" rel="stylesheet">

	<!-- CHOSEN -->
	<link href="${resources}assets/css/chosen.min.css" rel="stylesheet">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
	
	<!-- FAVICON -->
	<link rel="shortcut icon" href="${resources}assets/img/favicon.ico">
	</head>
	
	
	
	<!-- BODY -->
	<body class="tooltips">	
	<!-- BEGIN PAGE -->
			<jsp:include page="${views}/employer/head.jsp"></jsp:include>
			<!-- ============================================================== -->
			<!-- START YOUR CONTENT HERE -->
			<!-- ============================================================== -->
            <div class="body content rows scroll-y" id="body-container">
			<div class="box-info">
					<h2><strong>Company</strong> Information</h2>
					<form class="form-horizontal" role="form" method="post" action="/employer/edit">
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Industry</label>
							<div class="col-sm-10">
						        <select data-placeholder="Choose company industries..." class="chosen-select form-control" multiple tabindex="5" name="industries">
						        	<option value=""></option>
									<c:forEach items="${industries}" var="industry">
										<option value="${industry.id}"
											<c:forEach var="item" items="${principal.industries}">
											  <c:if test="${item.id eq industry.id}">
											    selected
											  </c:if>
											</c:forEach>
												>
										${industry.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Location</label>
							<div class="col-sm-10">
								<select data-placeholder="State" class="chosen-select form-control" id="ecLocation" data-id="${principal.location.state.id}" tabindex="6" name="state">
						            <option value=""></option>
						            <c:forEach items="${countries}" var="country">
										<optgroup label="${country.name}">
											<c:forEach items="${country.states}" var="state">
												<option value="${state.id}" <c:if test="${principal.location.state.id eq state.id}">
													selected
												</c:if>>
													${state.name}
												</option>
											</c:forEach>
										</optgroup>
									</c:forEach>
		
						          </select>
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Company Size</label>
							<div class="col-sm-10">
								<input type="text" value="${principal.size}" class="form-control" id="input-text" name="companySize" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Company Overview</label>
							<div class="col-sm-10">
								<textarea class="summernote-small form-control" name="companyOverview">${principal.overview}</textarea>
							</div>
						</div>
						<button type = "submit" class="btn btn-primary pull-right">Save</button>
					</form>
					
			</div>			
        </div>
		<!-- END CONTENT -->
		
		
		
		
		
		<!--
		============================================================================
		MODAL DIALOG EXAMPLE
		You can change transition style, just view element page
		============================================================================
		-->
		<!-- Modal Upload Picture -->
		<div class="md-modal md-fade-in-scale-up" id="md-fade-in-scale-up">
			<div class="md-content">
				<h3>Upload Photo</h3>
				<div>
					<spring:url value="/candidate/uploadPicture" var="uploadPicture" />
					<form method="POST" action="${uploadPicture}" enctype="multipart/form-data">
					 	Picture : <input class="btn btn-default btn-xs" type="file" name="file" />
					</form>
					<br>
					<p>
						<button class="btn btn-danger md-close">Close</button>
						<button class="btn btn-success md-close">Save</button>
					</p>
				</div>
			</div><!-- End div .md-content -->
		</div>
		<!-- Modal Logout Primary -->
		<div class="md-modal md-fall" id="logout-modal">
			<div class="md-content">
				<h3><strong>Logout</strong> Confirmation</h3>
				<div>
					<p class="text-center">Are you sure want to logout from this awesome system?</p>
					<p class="text-center">
					<a href="#" class="btn btn-success md-close">Yeah, I'm sure</a>
					</p>
				</div>
			</div>
		</div><!-- End .md-modal -->
		
		<!-- Modal Logout Alternatif -->
		<div class="md-modal md-just-me" id="logout-modal-alt">
			<div class="md-content">
				<h3><strong>Logout</strong> Confirmation</h3>
				<div>
					<p class="text-center">Are you sure want to logout from this awesome system?</p>
					<spring:url value="/logout" var="logoutUrl"/>
					<form:form action="${logoutUrl}" method="post" class="text-center">
					<button type="submit" class="btn btn-success md-close">Yeah, I'm sure</button>
					</form:form>
				</div>
			</div>
		</div><!-- End .md-modal -->
		
		<!-- Modal Task Progress -->	
		<div class="md-modal md-slide-stick-top" id="task-progress">
			<div class="md-content">
				<h3><strong>Task Progress</strong> Information</h3>
				<div>
					<p>CLEANING BUGS</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
						<span class="sr-only">80&#37; Complete</span>
					  </div>
					</div>
					<p>POSTING SOME STUFF</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 65%">
						<span class="sr-only">65&#37; Complete</span>
					  </div>
					</div>
					<p>BACKUP DATA FROM SERVER</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 95%">
						<span class="sr-only">95&#37; Complete</span>
					  </div>
					</div>
					<p>RE-DESIGNING WEB APPLICATION</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
						<span class="sr-only">100&#37; Complete</span>
					  </div>
					</div>
					<p class="text-center">
					<button class="btn btn-danger btn-sm md-close">Close</button>
					</p>
				</div>
			</div>
		</div><!-- End .md-modal -->
		<!--
		============================================================================
		END MODAL DIALOG EXAMPLE
		============================================================================
		-->
		
		<!--
		MODAL OVERLAY
		Always place this div at the end of the page content
		-->
		<div class="md-overlay"></div>
		
		
		
	</div><!-- End div .container -->
	<!-- END PAGE -->
	<style>
	
	</style>
	<!--
	================================================
	JAVASCRIPT
	================================================
	-->
	<!-- Basic Javascripts (Jquery and bootstrap) -->
	<script src="${resources}assets/js/jquery.js"></script>
	<script src="${resources}assets/js/bootstrap.min.js"></script>
	
	<!-- VENDOR -->
	
	<!-- Slimscroll js -->
	<script src="${resources}assets/third/slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- Morris js -->
	<script src="${resources}assets/js/raphael-min.js"></script>
	<script src="${resources}assets/third/morris/morris.js"></script>
	
	<!-- Nifty modals js -->
	<script src="${resources}assets/third/nifty-modal/js/classie.js"></script>
	<script src="${resources}assets/third/nifty-modal/js/modalEffects.js"></script>
	
	<!-- Sortable js -->
	<script src="${resources}assets/third/sortable/sortable.min.js"></script>
	
	<!-- Bootstrao selectpicker js -->
	<script src="${resources}assets/third/select/bootstrap-select.min.js"></script>
	
	<!-- Summernote js -->
	<script src="${resources}assets/third/summernote/summernote.js"></script>
	
	<!-- Magnific popup js -->
	<script src="${resources}assets/third/magnific-popup/jquery.magnific-popup.min.js"></script> 
	
	<!-- Bootstrap file input js -->
	<script src="${resources}assets/third/input/bootstrap.file-input.js"></script>
	
	<!-- Bootstrao datepicker js -->
	<script src="${resources}assets/third/datepicker/js/bootstrap-datepicker.js"></script>
	
	<!-- Icheck js -->
	<script src="${resources}assets/third/icheck/icheck.min.js"></script>
	
	<!-- Form wizard js -->
	<script src="${resources}assets/third/wizard/jquery.snippet.min.html"></script>
	<script src="${resources}assets/third/wizard/jquery.easyWizard.js"></script>
	<script src="${resources}assets/third/wizard/scripts.js"></script>
	
	<!-- My Scrips -->
	<script src="${resources}assets/js/candidate/edit-candidate.js"></script>
	
	<!-- CHOSEN -->
	<script src="${resources}assets/js/chosen.jquery.min.js"></script>
	
	<!-- LANCENG TEMPLATE JAVASCRIPT -->
	<script src="${resources}assets/js/candidate/candidate.js"></script>
	<script src="${resources}assets/js/lanceng.js"></script>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:44:24 GMT -->
</html>