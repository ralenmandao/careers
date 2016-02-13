<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	
<head>
	<title>Careers CCS - List of Candidates</title>
	<spring:url value="/resources/" var="resources" />
	<spring:url value="/WEB-INF/views/" var="views" />
	<spring:url value="/" var="root" />
	<jsp:include page="${views}style-imports.jsp"></jsp:include>
	</head>
	<!-- BODY -->
	<body class="tooltips">	
		<jsp:include page="${views}admin/head.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- CONTENT -->
		<!-- ============================================================== -->
         <div class="scroll-y" id="body-container">
			<div class="body content rows scroll-y">
				<div class="box-info full">
					<h2><strong>Candidates</strong> table</h2>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Name</th>
									<th>Student Number</th>
									<th>Enabled</th>
									<th>Option</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach items="${candidates}" var="candidate">
									<tr>
										<td><a href="/admin/candidates/${candidate.id}">${candidate.firstName} ${candidate.lastName}</a></td>
										<td>${candidate.studentNumber}</td>
										<td><span class="label label-${candidate.user.enabled ? 'success' : 'danger'}">${candidate.user.enabled ? ' Yes ' : ' No '}</span></td>
										<td>
											<div class="btn-group btn-group-xs">
												<a data-id="${candidate.id}" candidate-name="${candidate.firstName} ${candidate.lastName}" data-modal="confirm-delete-modal" data-toggle="tooltip" title="" class="btn btn-default md-trigger delete-candidate" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
												<a href="/admin/candidate/${candidate.id}/edit" data-toggle="tooltip" title="" class="btn btn-default edit-candidate" data-original-title="Edit"><i class="fa fa-edit"></i></a>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div><!-- End div .table-responsive -->
				</div><!-- End div .box-info .full -->
            </div>
			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
        </div>
        <!-- Modal Logout Primary -->
		<div class="md-modal md-fall" id="confirm-delete-modal">
			<div class="md-content">
				<h3><strong>Delete</strong> Confirmation</h3>
				<div>
					<p class="text-center">Are you sure you want to delete <span id="modal-delete-name"></span></p>
					<p class="text-center">
					<a href="#" class="btn btn-success md-close" id="delete-url">Yeah, I'm sure</a>
					</p>
				</div>
			</div>
		</div><!-- End .md-modal -->
		<div class="md-modal md-fall" id="edit-modal">
			<div class="md-content">
				<h3><strong>Delete</strong> Confirmation</h3>
				<div>
					<p class="text-center">Are you sure you want to delete <span id="modal-delete-name"></span></p>
					<p class="text-center">
					<a href="#" class="btn btn-success md-close" id="delete-url">Yeah, I'm sure</a>
					</p>
				</div>
			</div>
		</div><!-- End .md-modal -->
		<jsp:include page="${views}foot.jsp"></jsp:include>
		<jsp:include page="${views}script-imports.jsp"></jsp:include>
			<script>
		$(document).ready(function(){
			$('.delete-candidate').on('click', function(){
				$('#modal-delete-name').html($(this).attr('candidate-name'))
				$('#delete-url').attr('href', '/admin/candidate/' + $(this).attr('data-id') + '/delete')
			})
			$('#candidates-menu').css('background', '#219CC4');
			$('#candidates-menu a').css('color', 'white');
		})
	</script>
	</body>

</html>