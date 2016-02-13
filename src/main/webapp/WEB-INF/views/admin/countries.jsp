<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	
<head>
	<title>Careers CCS - Manage Countries</title>
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
				<div class="box-info">
					<h2><strong>Countries</strong> table</h2>
					<button class="btn btn-default" id="add-record"><span class="fa fa-plus"> </span> Add</button>
					<br>
					<br>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Country</th>
									<th>Options</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach items="${countries}" var="country">
									<tr>
										<td>${country.name}</td>
										<td>
											<div class="btn-group btn-group-xs">
												<a data-id="${country.id}" candidate-name="${country.name}" data-modal="confirm-delete-modal" data-toggle="tooltip" title="" class="btn btn-default md-trigger delete-candidate" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
												<a href="#" data-id = "${country.id}" data-name="${country.name}" data-toggle="tooltip" title="" class="btn btn-default edit-candidate" data-original-title="Edit"><i class="fa fa-edit"></i></a>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div><!-- End div .table-responsive -->
					<br>
					<div style="display:none;" id="edit-country">
						<h2><strong>Edit</strong> Country</h2>
						<form class="form-horizontal" role="form" action="/admin/country/edit" id="countryForm">
							<div class="form-group">
								<label for="input-text" class="col-sm-2 control-label">Country</label>
								<div class="col-sm-10" id="firstNameContainer">
									<input type="text" class="form-control" id="input-text" name="name" placeholder="" value="">
								</div>
							</div>
						<input type="hidden" id="country-id" name="id" value="" />
						<div class="pull-right">
							<button type="input" class="btn btn-danger btn-cancel" onclick="$('#edit-country').hide(500);return false;">Cancel</button>
							<button type = "submit" class="btn btn-primary btn-save" name="contact" id="sampleSave">Save</button>
						</div>
						</form>
					</div>
					<br>
					<div style="display:none;" id="add-country">
						<h2><strong>Add</strong> Country</h2>
						<form class="form-horizontal" role="form" action="/admin/country/add" id="addCountry">
							<div class="form-group">
								<label for="input-text" class="col-sm-2 control-label">Country</label>
								<div class="col-sm-10" id="firstNameContainer">
									<input type="text" class="form-control" name="name" placeholder="" value="">
								</div>
							</div>
						<div class="pull-right">
							<button type="input" class="btn btn-danger btn-cancel" onclick="$('#add-country').hide(500);return false;">Cancel</button>
							<button type = "submit" class="btn btn-primary btn-save" name="contact" id="sampleSave">Save</button>
						</div>
						</form>
					</div>
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
		<jsp:include page="${views}foot.jsp"></jsp:include>
		<jsp:include page="${views}script-imports.jsp"></jsp:include>
			<script>
		$(document).ready(function(){
			$('.delete-candidate').on('click', function(){
				$('#modal-delete-name').html($(this).attr('candidate-name'))
				$('#delete-url').attr('href', '/admin/country/' + $(this).attr('data-id') + '/delete')
			})
			
			$('.edit-candidate').on('click', function(){
				var countryId = $(this).attr('data-id')
				var countryName = $(this).attr('data-name')
				$('#input-text').val(countryName)
				$('#country-id').val(countryId)
				$('#edit-country').show(500)
			})
			
			$('.btn-save').on('click', function(){
				$('#edit-country').hide(500)
			})
			
			$('#add-record').on('click',function(){
				$('#add-country').toggle(500)
			})
			$('#countries-menu').css('background', '#219CC4');
			$('#countries-menu a').css('color', 'white');
			
			$('#countryForm').formValidation({
                framework: 'bootstrap',
                excluded: [':disabled'],
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
				fields : {
					name : {
						message : 'invalid title',
						validators : {
							notEmpty : {
								message : 'country must not be empty'
							},
							regexp: {
								regexp: /^[a-zA-Z ,']+$/,
								message : 'invalid country format'
							}
						}
					}
				}
			})
			
			$('#addCountry').formValidation({
                framework: 'bootstrap',
                excluded: [':disabled'],
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
				fields : {
					name : {
						message : 'invalid title',
						validators : {
							notEmpty : {
								message : 'country must not be empty'
							},
							regexp: {
								regexp: /^[a-zA-Z ,']+$/,
								message : 'invalid country format'
							}
						}
					}
				}
			})
			
			$('#myentities ul').css('display', 'block')
		})
		</script>
	</body>

</html>