<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
			<div class="box-info full">
				<h2>
					<strong>Employers</strong> table
				</h2>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Name</th>
								<th>Location</th>
								<th>Enabled</th>
								<th>Option</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${employers}" var="employer">
								<tr>
									<td>${employer.companyName}</td>
									<td>${employer.location.state.name},
										${employer.location.country.name}</td>
									<td><span
										class="label label-${employer.user.enabled ? 'success' : 'danger'}">${employer.user.enabled ? ' Yes ' : ' No '}</span></td>
									<td>
										<div class="btn-group btn-group-xs">
											<a data-id="${employer.id}"
												candidate-name="${employer.companyName}"
												data-modal="confirm-delete-modal" data-toggle="tooltip"
												title="" class="btn btn-default md-trigger delete-candidate"
												data-original-title="Delete"><i class="fa fa-power-off"></i></a>
											<a href="/admin/candidate/${employer.id}/edit"
												data-toggle="tooltip" title=""
												class="btn btn-default edit-candidate"
												data-original-title="Edit"><i class="fa fa-edit"></i></a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- End div .table-responsive -->
			</div>
			<!-- End div .box-info .full -->
		</div>
		<!-- ============================================================== -->
		<!-- END YOUR CONTENT HERE -->
		<!-- ============================================================== -->

	</div>
	<!-- Modal Logout Primary -->
	<div class="md-modal md-fall" id="confirm-delete-modal">
		<div class="md-content">
			<h3>
				<strong>Delete</strong> Confirmation
			</h3>
			<div>
				<p class="text-center">
					Are you sure you want to delete <span id="modal-delete-name"></span>
				</p>
				<p class="text-center">
					<a href="#" class="btn btn-success md-close" id="delete-url">Yeah,
						I'm sure</a>
				</p>
			</div>
		</div>
	</div>
	<!-- End .md-modal -->
	<div class="md-modal md-fall" id="edit-modal">
		<div class="md-content">
			<h3>
				<strong>Delete</strong> Confirmation
			</h3>
			<div>
				<p class="text-center">
					Are you sure you want to delete <span id="modal-delete-name"></span>
				</p>
				<p class="text-center">
					<a href="#" class="btn btn-success md-close" id="delete-url">Yeah,
						I'm sure</a>
				</p>
			</div>
		</div>
	</div>
	<!-- End .md-modal -->
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$('.delete-candidate').on('click', function(){
				$('#modal-delete-name').html($(this).attr('candidate-name'))
				$('#delete-url').attr('href', '/admin/employer/' + $(this).attr('data-id') + '/delete')
			})
		})
	</script>
</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>