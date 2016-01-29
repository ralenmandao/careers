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
				<div class="box-info">
					<h2><strong>Admin</strong> Controls</h2>
					<form class="form-horizontal" method="post" role="form" action="/admin/candidate/${candidate.id}/edit/adminControls">
						<!-- Text input -->
						<div class="form-group">
							<label class="col-sm-2 control-label">Enabled</label>
							<div class="col-sm-10">
								<select class="form-control" name='enabled'>
									<option value="true" ${candidate.user.enabled ? 'selected' : ''}>True</option>
									<option value="false" ${candidate.user.enabled ? '' : 'selected'}>False</option>
								</select>
							</div>
						</div>
						<button type = "submit" class="btn btn-primary pull-right" name="contact" id="sampleSave">Save</button>
					</form>
				</div>
            </div>
        </div>
		<jsp:include page="${views}foot.jsp"></jsp:include>
		<jsp:include page="${views}script-imports.jsp"></jsp:include>
		<script>
			$(document).ready(function(){
				$('#candidates-menu').css('background', '#219CC4');
				$('#candidates-menu a').css('color', 'white');
			})
		</script>
	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>