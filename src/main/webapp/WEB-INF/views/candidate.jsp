<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<div class="box-info">
				<div class="box-info centered" style="padding-top: 3%;">
					<spring:url value="/candidate" var="searchForm" />
					<form class="form-inline" role="form" action="/candidate"
						id="mainSearchForm">
						<div class="form-group col-md-9">
							<input type="text" class="form-control" id="exampleInputEmail2"
								name="search" placeholder="I'm looking for.."
								style="width: 100%" value="${search}">
						</div>
						<button class="btn btn-primary md-trigger" type="submit"
							id="searchButton" data-modal="form-modal">Search</button>
						<button class="btn btn-default md-trigger" data-modal="form-modal"
							onclick="$('#advance-search').toggle(500);$('#mainSearchForm').toggle(500);return false;">Advance
							Search</button>
					</form>
					<form action="/candidate/advance" id="advance-search"
						class="form-horizontal"
						style="padding-left: 18px; padding-right: 30px; padding-top: 10px;">
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Location</label>
							<div class="col-sm-10">
								<select class="chosen-select" tabindex="6" name="state"
									style="width: 100%" id="location-search">
									<option value=""></option>
									<c:forEach items="${countries}" var="country">
										<optgroup label="${country.name}">
											<c:forEach items="${country.states}" var="state">
												<option value="${state.id}"<c:choose>
												    <c:when test="${empty asearch}">
												       <c:if test="${principal.location.state.id eq state.id}">
															selected
														</c:if>>
												    </c:when>    
												    <c:otherwise>
												         <c:if test="${asearch.state eq state.id}">
															selected
														</c:if>>
												    </c:otherwise>
												</c:choose>						
													${state.name}</option>
											</c:forEach>
										</optgroup>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="type" class="col-sm-2 control-label">Job Type</label>
							<div class="col-sm-10">
								<select class="form-control" name="type">
									<option value="contract"
										<c:if test="${asearch.type eq 'contract'}">selected</c:if>>Full
										Time/Contract</option>
									<option value="temporary"
										<c:if test="${asearch.type eq 'temporary'}">selected</c:if>>Part
										Time/Temporary</option>
									<option value="internship"
										<c:if test="${asearch.type eq 'internship'}">selected</c:if>>Internship</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="input-text" class="col-sm-2 control-label">Skills</label>
							<div class="col-sm-10">
								<select data-placeholder="Choose skills..."
									class="chosen-select form-control" multiple tabindex="5"
									name="skills">
									<option value=""></option>
									<c:forEach items="${skills}" var="skill">
										<option value="${skill.id}"
											<c:choose>
										    <c:when test="${empty asearch}">
										       <c:forEach var="item" items="${principal.skills}">
												  <c:if test="${item.id eq skill.id}">
												    selected
												  </c:if>
												</c:forEach>>
												${skill.name}</option>
										    </c:when>    
										    <c:otherwise>
										         <c:forEach var="item" items="${asearch.skills}">
												  <c:if test="${item eq skill.id}">
												    selected
												  </c:if>
												</c:forEach>>
												${skill.name}</option>
										    </c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
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
											${job.location.country.name}</small> <span class="fa fa-money"></span>
										<small>${job.salaryFrom} - ${job.salaryTo}</small>
									</h4>
									<p>${job.description}</p>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h2 style="text-align: center">No jobs found!</h2>
					</c:otherwise>
				</c:choose>
				
				<!-- 
				<c:choose>
					<c:when test="${param.search == null}">
						<ul class="pagination">
							<c:if test="${(jobSize / 1) > 1}">
								<li><a href="/candidate/?page=1">«</a></li>
								<c:forEach begin="1" end="${jobSize / 1}" varStatus="loop">
									<li
										<c:if test="${param.page == null && loop.index == 1}">class="active"</c:if>
										<c:choose>
							    <c:when test="${param.page == null && loop.index == 1}">
							    	class="active"
							    </c:when>   
							    <c:when test="${param.page == loop.index}">
							    	class="active"
							    </c:when>   
							    <c:otherwise>
							    </c:otherwise>
							</c:choose>><a
										href="/candidate/?page=${loop.index}">${loop.index}</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${(jobSize / 1) > 2}">
								<fmt:parseNumber var="i" integerOnly="true" type="number"
									value="${jobSize / 1}" />
								<li><a href="/candidate/?page=${i}">»</a></li>
							</c:if>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="pagination">
							<c:if test="${(jobSize / 1) > 1}">
								<li><a href="/candidate/?search=${param.search}&page=1">«</a></li>
								<c:forEach begin="1" end="${jobSize / 1}" varStatus="loop">
									<li
										<c:if test="${param.page == null && loop.index == 1}">class="active"</c:if>
										<c:choose>
							    <c:when test="${param.page == null && loop.index == 1}">
							    	class="active"
							    </c:when>   
							    <c:when test="${param.page == loop.index}">
							    	class="active"
							    </c:when>   
							    <c:otherwise>
							    </c:otherwise>
							</c:choose>><a
										href="/candidate/?search=${param.search}&page=${loop.index}">${loop.index}</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${(jobSize / 1) > 2}">
								<fmt:parseNumber var="i" integerOnly="true" type="number"
									value="${jobSize / 1}" />
								<li><a href="/candidate/?search=${param.search}&page=${i}">»</a></li>
							</c:if>
						</ul>
					</c:otherwise>
				</c:choose>
				 -->
				 <ul class="pagination" id="mypage">
				 </ul>
			</div>

		</div>
	</div>
	<!-- ============================================================== -->
	<!-- END YOUR CONTENT HERE -->
	<!-- ============================================================== -->
	<div class="md-modal md-fade-in-scale-up" id="md-fade-in-scale-up">
		<div class="md-content">
			<h3>Upload Photo</h3>
			<div>
				<spring:url value="/candidate/profileUpload" var="uploadPicture" />
				<form method="POST" action="${uploadPicture}"
					enctype="multipart/form-data">
					Picture : <input class="btn btn-default btn-xs" type="file"
						name="file" /> <br> <br> <input type="hidden"
						value="${principal.id}" name="id">
					<button class="btn btn-success md-close" type="submit">Save</button>
				</form>
			</div>
		</div>
		<!-- End div .md-content -->
	</div>
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$('#resume').on('click', function() {
				$('#md-complete-your-profile').addClass('md-show')
			})
			$('#advance-search').toggle()
			if (window.location.href.indexOf("advance") > -1) {
				$('#advance-search').show();
				$('#mainSearchForm').hide()
			}
			
			var PAGE_SIZE = 1;
			var url = window.location.href;
			var currentPage = ${param.page}
			undefined;
			url = url.replace(/\&page=[0-9]+/, '')
			url = url.replace(/page=[0-9]+/, '')
			url = url.replace(/\?page=[0-9]+/, '')
			
			var size = ${jobSize}
			console.log(currentPage)
			if(size / PAGE_SIZE > 1){
				$('#mypage').append('<li><a href="' + getApp(1) + '">«</a></li>')
				for(var x = 1; x <= (size / PAGE_SIZE); x++){
					if(!currentPage && x == 1){
						$('#mypage').append('<li class="active"><a href="' + getApp(x) + '">' + x + '</a></li>')	
					}else if(x == currentPage){
						$('#mypage').append('<li class="active"><a href="' + getApp(x) + '">' + x + '</a></li>')	
					}else{
						$('#mypage').append('<li><a href="' + getApp(x) + '">' + x + '</a></li>')	
					}
				}
			}
			
			if(size / PAGE_SIZE > 2){
				$('#mypage').append('<li><a href="' + getApp(size / PAGE_SIZE) + '">»</a></li>')
			}
			
			function getApp(appz){
				var app = "";
				if(url.indexOf("?") >= 0){
					app = "&page=" + appz;
				}else{
					app = "?page=" + appz;
				}
				return url + app
			}
			
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