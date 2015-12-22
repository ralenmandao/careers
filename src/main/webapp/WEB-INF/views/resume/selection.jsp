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
				<h2><strong>Resume</strong> Builder</h2>
					<fieldset class="row">
					<div class="container">
						<div class="col-md-2">
					       <label for="first-resume">
					       		<img src="${resources}images/resume1-preview.png" style="width:200px;height:200px;"/>
					       </label>
					       <h5><strong>Roncal's Template</strong></h5>
					       <p>
					       		Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh 
					       </p>
				       </div>
				       <div class="col-md-offset-1 col-md-2">
					       <label for="second-resume">
					       		<img src="${resources}images/resume2-preview.png" style="width:200px;height:200px;"/>
					       </label>
					       <h5><strong>Ralen's Template</strong></h5>
					       <p>
					       		Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh 
					       </p>
				       </div>
				       <div class="col-md-offset-1 col-md-2">
					       <label for="third-resume">
					       		<img src="${resources}images/no-profile.png" style="width:200px;"/>
					       </label>
				       </div>
				       <div class="col-md-offset-1 col-md-2">
					       <label for="forth-resume">
					       		<img src="${resources}images/no-profile.png" style="width:200px;"/>
					       </label>
				       </div>
				       </div>
				    </fieldset>
				    <br>
				    <form action="/candidate/resume/save" method="post">
				    	<div class="form-group">
				    		<div class="col-md-offset-7 col-md-4">
						    	<select class="form-control" name="resume">
						    		<option value="first-resume">Roncal's Template</option>
						    		<option value="second-resume">Ralen's Template</option>
						    	</select>
					    	</div>
					    	<div class="col-md-1">
						    	<button class="btn btn-primary pull-center" >Next</button>
					    	</div>
				    	</div>
				    </div>
			    </div>
            </div>
			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
        </div>
		<jsp:include page="${views}foot.jsp"></jsp:include>
		<jsp:include page="${views}script-imports.jsp"></jsp:include>
		<script>
			
		</script>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>