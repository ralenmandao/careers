<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	<spring:url value="/resources/" var="resources" />
	<spring:url value="/WEB-INF/views/" var="views" />
	<spring:url value="/" var="root" />

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="description" content="Careers CCS is an online career resource that offers local jobs and employment opportunities to the I.T. alumni and internship jobs to the OJT students of DHVTSU (Don Honorio Ventura Technological State University-Bacolor, Pampanga, Philippines) College of Computing Studies.">
	<meta name="keywords" content="careers ccs, online job portal, job portal, online recruitment, ojt, internship, ccs, dhvtsu, jobs in philippines, philippines jobs, DOLE, Department of Labor and Employment, work in philippines, jobs local, local jobs, local employment guidelines, job, jobs, call center jobs, bpo jobs, IT jobs, employer, find job, job search, job vacancy, job opening, job recruitment, jobseeker, resume, job ads, job employment">
	<meta name="author" content="Careers CCS DHVTSU">
	
	
	<!-- BOOTSTRAP -->
	<link href="${resources}assets/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- CSS -->
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
	<link href="${resources}assets/third/select/bootstrap-multiselect.css" rel="stylesheet"> 
	<link href="${resources}assets/third/select/select2.min.css" rel="stylesheet"> 
	<link href="${resources}assets/third/select/select2-bootstrap.min.css" rel="stylesheet"> 
	
	<link href="${resources}assets/third/summernote/summernote.css" rel="stylesheet">
	<link href="${resources}assets/third/magnific-popup/magnific-popup.css" rel="stylesheet"> 
	<link href="${resources}assets/third/datepicker/css/datepicker.css" rel="stylesheet">
	<link href="${resources}assets/third/validator/formValidation.min.css" rel="stylesheet">
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