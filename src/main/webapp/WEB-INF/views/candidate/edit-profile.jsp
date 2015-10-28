<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="box-info">
	<h2><strong>Personal</strong> Information</h2>
	<form class="form-horizontal" role="form">
		<!-- Text input -->
		<div class="form-group">
			<label for="input-text" class="col-sm-2 control-label">Firstname</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="input-text" placeholder="" value="${candidate.firstName}">
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-2 control-label">Lastname</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="input-text" placeholder="" value="${candidate.lastName}">
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-2 control-label">Birthdate</label>
			<div class="col-sm-10">
				<div class="row">
					<div class="col-sm-2">
						<!-- Day -->
						<select class="form-control">
							<c:forEach begin="1" end="30" var="day">
								<option value="${day}">
									<c:out value="${day}" />
								</option>
							</c:forEach> 
						</select>
						<p class="help-block">Day</p>
					</div>
					<!-- Month -->
					<div class="col-sm-4">
						<select class="form-control">
							<option value="1">January</option>
							<option value="2">February</option>
							<option value="3">March</option>
							<option value="4">April</option>
							<option value="5">May</option>
							<option value="6">June</option>
							<option value="7">July</option>
							<option value="8">August</option>
							<option value="9">September</option>
							<option value="10">October</option>
							<option value="11">November</option>
							<option value="12">December</option>
						</select>
						<p class="help-block">Month</p>
					</div>
					<div class="col-sm-6">
						<select class="form-control">
							<c:forEach begin="1990" end="2015" var="year">
								<option value="${year}">
									<c:out value="${year}" />
								</option>
							</c:forEach>
						</select>
						<p class="help-block">Year</p>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-2 control-label">Location</label>
			<div class="col-sm-10">
				<div class="row">
					<div class="col-md-6">
					<!-- Countries -->
					<c:if test="${not empty countries}">
						<select class="form-control" id ="registerCountrySelect">
							<c:forEach items="${countries}" var="country">
								<option value="${country.countryId}">
									<c:out value="${country.name}" />
								</option>
							</c:forEach>
						</select>
						<p class="help-block">Country</p>
					</c:if>
					</div>
					<div class="col-md-6">
						<select class="form-control sStates">
							
						</select>
						<p class="help-block">State</p>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-2 control-label">Contact Number</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="input-text" placeholder="">
			</div>
		</div>
		<button type = "submit" class="btn btn-primary pull-right" id="sampleSave">Save</button>
	</form>
</div>
<div class="box-info">
	<h2><strong>Login</strong> Information</h2>
	<form class="form-horizontal" role="form">
		<!-- Text input -->
		<div class="form-group">
			<label class="col-sm-2 control-label">Email</label>
			<div class="col-sm-10">
				<p class="form-control-static">${candidate.user.username}</p>
			</div>
		</div>
		<div class="pull-right">
			<button class="btn btn-primary">Change Email</button>
			<button class="btn btn-primary">Change Password</button>
		</div>
	</form>
</div>
<div class="box-info">
	<h2><strong>Professional</strong> Information</h2>
	<form class="form-horizontal" role="form">
		<!-- Text input -->
		<div class="form-group">
			<label for="input-text" class="col-sm-3 control-label">Highest Qualification</label>
			<div class="col-sm-9">
				<select class="form-control">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-3 control-label">Field of Study</label>
			<div class="col-sm-9">
				<select class="form-control">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-3 control-label">Specializations</label>
			<div class="col-sm-9">
				<select class="form-control">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-3 control-label">Preffered work location</label>
			<div class="col-sm-9">
				<select class="form-control">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-3 control-label">Expected Salary</label>
			<div class="col-sm-9">
				<div class="input-group">
					<span class="input-group-addon">PHP</span>
					<input type="text" class="form-control">
					<span class="input-group-addon">.00</span>
				</div>
			</div>
		</div>
		<button type = "submit" class="btn btn-primary pull-right">Save</button>
	</form>
</div>

<div class="box-info">
	<h2><strong>Highest</strong> education qualification</h2>
	<form class="form-horizontal" role="form">
		<!-- Text input -->
		<div class="form-group">
			<label for="input-text" class="col-sm-3 control-label">Highest Qualification</label>
			<div class="col-sm-9">
				<select class="form-control">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-3 control-label">Field of Study</label>
			<div class="col-sm-9">
				<select class="form-control">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-3 control-label">Specializations</label>
			<div class="col-sm-9">
				<select class="form-control">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-3 control-label">Preffered work location</label>
			<div class="col-sm-9">
				<select class="form-control">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="input-text" class="col-sm-3 control-label">Expected Salary</label>
			<div class="col-sm-9">
				<div class="input-group">
					<span class="input-group-addon">PHP</span>
					<input type="text" class="form-control">
					<span class="input-group-addon">.00</span>
				</div>
			</div>
		</div>
		<button type = "submit" class="btn btn-primary pull-right">Save</button>
	</form>
</div>