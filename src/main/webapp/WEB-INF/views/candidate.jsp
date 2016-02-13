<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<title>Careers CCS - ${principal.firstName} ${principal.lastName} - Account Dashboard</title>
<spring:url value="/resources/" var="resources" />
<spring:url value="/WEB-INF/views/" var="views" />
<spring:url value="/" var="root" />
<jsp:include page="${views}style-imports.jsp"></jsp:include>
</head>
<!-- BODY -->
<body class="tooltips">
	<jsp:include page="${views}head.jsp"></jsp:include>
	<!-- ============================================================== -->
	<!-- CONTENT -->
	<!-- ============================================================== -->
	<div class="scroll-y" id="body-container">

		<div class="body content rows scroll-y">
			<!-- Page header
				<div class="page-heading animated fadeInDownBig">
					<h1>AVAILABLE JOBS</h1>
				</div>
				-->
			<!-- End page header -->
			<div class="box-info" style="padding-left: 0 0 0 0;">
				<c:if test="${param.changeEmailSuccessful != null}">
					<div class="alert alert-success" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span> <span class="sr-only">Error:</span>
						Email change successful!
					</div>
				</c:if>
				<div class="box-info centered" style="padding-top: 3%;">
					<spring:url value="/candidate" var="searchForm" />
					<form class="form-inline" role="form" action="/candidate"
						id="mainSearchForm">
						<div class="form-group col-xs-12 col-md-8 col-lg-9">
							<input type="text" class="form-control" id="exampleInputEmail2"
								name="search" placeholder="I'm looking for.."
								style="width: 100%" value="${search}">
						</div>
						<button class="btn btn-primary md-trigger" type="submit"
							id="searchButton" data-modal="form-modal" class="col-md-2"
							style="margin-left: 15px;">Search</button>
						<button class="btn btn-default md-trigger" data-modal="form-modal"
							onclick="$('#advance-search').toggle(500);$('#mainSearchForm').toggle(500);return false;"
							class="col-md-2" style="margin-left: 5px;">Advanced
							Search</button>
					</form>
					<form action="/candidate/advance" id="advance-search"
						class="form-horizontal"
						style="padding-left: 18px; padding-right: 30px; padding-top: 10px;"
						>
						<div class="form-group">
							<label class="col-sm-2 control-label">Location</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-6">
										<select class="form-control" name="country" id="country">
											<option value="all"
												<c:if test="${param.country eq 'all'}">selected</c:if>>All</option>
											<c:forEach items="${countries}" var="country">
												<option value="${country.id}">${country.name}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-6">
										<select class="form-control" name="state" id="state">
											<c:if test="${param.country eq 'all'}">
												<option value="" selected></option>
											</c:if>
											<c:forEach items="${principal.location.country.states}"
												var="state">
												<option value="${state.id}">${state.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="type" class="col-sm-2 control-label">Job Type</label>
							<div class="col-sm-4 col-md-6 col-lg-10">
								<select class="form-control" name="type">
									<option value="contract"
										<c:if test="${param.type eq 'contract'}">selected</c:if>>Full
										Time/Contract</option>
									<option value="temporary"
										<c:if test="${param.type eq 'temporary'}">selected</c:if>>Part
										Time/Temporary</option>
									<option value="internship"
										<c:if test="${param.type eq 'internship'}">selected</c:if>>Internship</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Skills</label>
							<div class="col-sm-10">
								<input class="form-control" name="skills" id="skills"
									value="<c:forEach varStatus="loop" items="${param.skills}" var="skill">${skill}<c:if test="${!loop.last}">,</c:if></c:forEach>"
									multiple data-placeholder="Skills" /> <small
									class="help-block" style="color: #a94442"> (Note:
									select nothing for all) </small>
							</div>
						</div>
						<input type="hidden" name="advance" />
						<button class="btn btn-primary md-trigger" type="submit"
							id="searchButton" data-modal="form-modal">Search</button>
						<button class="btn btn-danger md-trigger" type="submit"
							id="searchButton" data-modal="form-modal"
							onclick="$('#advance-search').toggle(500);$('#mainSearchForm').toggle(500);return false;">Cancel</button>
					</form>
				</div>
				<hr>
				<c:choose>
					<c:when test="${not empty jobs}">
						<c:forEach items="${jobs}" var="job">
							<div class="box-info">
								<div class="media-body">
									<h4 class="media-heading">
										<a href="/job/${job.id}">${job.name}</a> <span
											style="margin-left: 5px" class="label label-success">${job.type}</span><br>
										<small><a href="/candidate/c/${job.employer.id}">${job.employer.companyName}</a></small><br>
										<span class="glyphicon glyphicon-map-marker"></span> <small
											style="margin-right: 5px;">${job.location.state.name},
											${job.location.country.name}</small>
										<c:if test="${job.salaryFrom != 0 && job.salaryTo != 0}">
											<span class="fa fa-money"></span>
											<small>${job.salaryFrom} - ${job.salaryTo}</small>
										</c:if>
									</h4>
									<span class="fa fa-calendar"></span>
						<fmt:formatDate type="date" value="${job.posted}" /> - <span class="fa fa-calendar"></span> <fmt:formatDate type="date" value="${job.expiry}" />
									<p>${job.description}</p>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h2 style="text-align: center">No jobs found!</h2>
					</c:otherwise>
				</c:choose>
				<ul class="pagination" id="mypage">
				</ul>
			</div>

		</div>
	</div>
	<!-- ============================================================== -->
	<!-- CONTENT -->
	<!-- ============================================================== -->
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
		$(document).ready(
				function() {
					$('#state').empty();
					$('#resume').on('click', function() {
						$('#md-complete-your-profile').addClass('md-show')
					})
					$('#advance-search').toggle()
					if (window.location.href.indexOf("advance") > -1) {
						$('#advance-search').show();
						$('#mainSearchForm').hide()
					}

					var PAGE_SIZE = 5;
					var url = window.location.href;
					var currentPage = ${param.page}
					undefined;
					url = url.replace(/\&page=[0-9]+/, '')
					url = url.replace(/page=[0-9]+/, '')
					url = url.replace(/\?page=[0-9]+/, '')

					var size = ${jobSize}
					console.log(currentPage)
					console.log(size)
					if (size / PAGE_SIZE > 1) {
						$('#mypage').append(
								'<li><a href="' + getApp(1) + '">«</a></li>')
						for (var x = 1; x <= (Math.ceil(size / PAGE_SIZE)); x++) {
							if (!currentPage && x == 1) {
								$('#mypage').append(
										'<li class="active"><a href="'
												+ getApp(x) + '">' + x
												+ '</a></li>')
							} else if (x == currentPage) {
								$('#mypage').append(
										'<li class="active"><a href="'
												+ getApp(x) + '">' + x
												+ '</a></li>')
							} else {
								$('#mypage').append(
										'<li><a href="' + getApp(x) + '">' + x
												+ '</a></li>')
							}
						}
					}

					if (size / PAGE_SIZE > 2) {
						$('#mypage').append(
								'<li><a href="' + getApp(Math.floor(size / PAGE_SIZE))
										+ '">»</a></li>')
					}

					function getApp(appz) {
						var app = "";
						if (url.indexOf("?") >= 0) {
							app = "&page=" + appz;
						} else {
							app = "?page=" + appz;
						}
						return url + app
					}

					/* Change states when selected country */
					$('#country')
                .change(
                    function(data) {
                        $
                            .get(
                                "/states/search/findByCountryId?id=" + $('#country').val(),
                               		 function(data) {
	                                    if (data._embedded.states.length == 0) {
	                                        $('#state').empty();
	                                    }
	                                    $('#state').empty();
	                                    $.each(data._embedded.states,function(index, value) {
                                        	$('#state').append('<option value="' + value.id + '">' + value.name + "</option>")
                                      });
                                });
                    })
                    
                    /* Set the skills */
                    $('#skills').select2({
                        	tags: [<c:forEach items="${skills}" var="skill">'${skill.name}',</c:forEach>]
                        })
                    // Revalidate the color when it is changed
                    .change(function(e) {
                        $('#saveProfForm').formValidation('revalidateField', 'skills');
                    })
                    .end()
                    
					$('#main-home').css('background', '#219CC4');
		            $('#main-home a').css('color', 'white');
				})
	</script>
	<style>
.form-horizontal .control-label {
	/* text-align:right; */
	text-align: left;
}
</style>
</body>
</html>