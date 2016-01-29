<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<spring:url value="/resources/" var="resources" />
<spring:url value="/" var="root" />
<!-- END CONTENT -->
<!--
		============================================================================
		MODAL DIALOG EXAMPLE
		You can change transition style, just view element page
		============================================================================
		-->
<!-- Modal Logout Primary -->
<div class="md-modal md-fade-in-scale-up" id="md-fade-in-scale-up">
		<div class="md-content">
			<h3>Upload Photo</h3>
			<div>
				<c:choose>
					<c:when test="${principal.user.role eq 'ROLE_CANDIDATE'}">
						<spring:url value="/candidate/profileUpload" var="uploadPicture" />
					</c:when>
					<c:otherwise>
						<spring:url value="/employer/profileUpload" var="uploadPicture" />
					</c:otherwise>
				</c:choose>
				<!-- 
				<form method="POST" action="${uploadPicture}"
					enctype="multipart/form-data" id="uploadProfile">
					Picture : <input class="btn btn-default btn-xs" type="file"
						name="file" accept="image/*"/> <br> <br> <input type="hidden"
						value="${principal.id}" name="id">
					<button class="btn btn-success md-close" type="submit">Save</button>
				</form>
				-->
				<form method="POST" action="${uploadPicture}"
					enctype="multipart/form-data" id="uploadProfile"
					class="form-horizontal">
					<div class="form-group">
						<label class="col-xs-3 control-label"></label>
						<div class="col-xs-6">
							<input class="btn btn-default btn-xs" type="file"
								name="file" accept="image/*"/> <br> <br> 
								<input type="hidden" value="${principal.id}" name="id">
						</div>
					</div>
					<button class="btn btn-success" type="submit">Save</button>
				</form>
				
			</div>
		</div>
		<!-- End div .md-content -->
	</div>
<div class="md-modal md-fall" id="logout-modal">
	<div class="md-content">
		<h3>
			<strong>Logout</strong> Confirmation
		</h3>
		<div>
			<p class="text-center">Are you sure want to logout ?<br><br><br></p>
			<p class="text-center">
				<a href="#" class="btn btn-success md-close">Yeah, I'm sure</a>
			</p>
		</div>
	</div>
</div>
<!-- End .md-modal -->

<!-- Modal Logout Alternatif -->
<div class="md-modal md-just-me" id="logout-modal-alt">
	<div class="md-content">
		<h3>
			<strong>Logout</strong> Confirmation
		</h3>
		<div>
			<p class="text-center">Are you sure want to logout from this
				awesome system?</p>
			<spring:url value="/logout" var="logoutUrl" />
			<form:form action="${logoutUrl}" method="post" class="text-center">
				<button type="submit" class="btn btn-success md-close">Yeah,
					I'm sure</button>
			</form:form>
		</div>
	</div>
</div>
<!-- End .md-modal -->

<!-- Modal Logout Alternatif -->
<div class="md-modal md-just-me body rows scroll-y" id="disclaimer-modal">
	<div class="md-content">
		<h3>
			<strong>Disclaimer </strong> of Liability
		</h3>
		<div>
			<p class="text-center">Careers CCS does not assure the users of
				any legal liability or responsibility for the accuracy,
				completeness, or usefulness of any information found in the website.
				Likewise, we do not give any warranty or other statement as to the
				operation, quality or functionality of the site. Access to the site
				may be interrupted, limited or delayed for any reason.</p>
			<p class="text-center">Careers CCS is not accountable for any
				error, omission or inaccuracy of the job openings submitted for
				inclusion on the website. It is the responsibility of the companies
				to ensure that the information they submit complies with all
				relevant laws and regulations. Furthermore, we only advertise jobs
				according to what the companies declared or required.</p>
			<p class="text-center">Careers CCS shall not be liable for any
				loss of information caused whether as a result of any interruption,
				suspension or termination of the service or for the contents,
				accuracy or quality of information in the database.</p>
			<p class="text-center">Careers CCS makes no representations and
				warranties of any kind, whether expressed or implied, for the
				services and in relation to the accuracy or quality of any
				information obtained through the service.</p>
			<p class="text-center">To the fullest extent permitted by law,
				the Company disclaims any representation or warranty, whether
				express or implied, as to the title, fitness for a particular
				purpose, merchantability, accuracy or standard of quality of the
				Services and/or any database content (whether maintained by the
				Company or otherwise), and no warranty whatsoever is given that the
				Service will be uninterrupted or error free, or in relation to the
				database content obtained or to be obtained from or through use of
				the Company and/or the Services unless otherwise specifically
				mentioned in this agreement.</p>
			<h3>
				<strong>Disclaimer of Endorsement</strong>
			</h3>
			<p class="text-center">Careers CCS does not collect any fee from
				the jobseekers, endorse or recommend companies, job postings,
				articles, and any other information included in the website.</p>
		</div>
	</div>
</div>
<!-- End .md-modal -->

<!-- Modal Task Progress -->
<div class="md-modal md-slide-stick-top" id="task-progress">
	<div class="md-content">
		<h3>
			<strong>Task Progress</strong> Information
		</h3>
		<div>
			<p>CLEANING BUGS</p>
			<div class="progress progress-xs for-modal">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
					style="width: 80%">
					<span class="sr-only">80&#37; Complete</span>
				</div>
			</div>
			<p>POSTING SOME STUFF</p>
			<div class="progress progress-xs for-modal">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
					style="width: 65%">
					<span class="sr-only">65&#37; Complete</span>
				</div>
			</div>
			<p>BACKUP DATA FROM SERVER</p>
			<div class="progress progress-xs for-modal">
				<div class="progress-bar progress-bar-info" role="progressbar"
					aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
					style="width: 95%">
					<span class="sr-only">95&#37; Complete</span>
				</div>
			</div>
			<p>RE-DESIGNING WEB APPLICATION</p>
			<div class="progress progress-xs for-modal">
				<div class="progress-bar progress-bar-primary" role="progressbar"
					aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">
					<span class="sr-only">100&#37; Complete</span>
				</div>
			</div>
			<p class="text-center">
				<button class="btn btn-danger btn-sm md-close">Close</button>
			</p>
		</div>
	</div>
</div>
<!-- End .md-modal -->

<div class="md-modal md-fade-in-scale-up" id="md-complete-your-profile">
	<div class="md-content">
		<h3>
			<strong>Error</strong>
		</h3>
		<div>
			<p>Complete your profile or upload your resume to proceed</p>
			<p>
				<button id="md-complete-your-profile-close"
					class="btn btn-danger md-close">Close me!</button>
			</p>
		</div>
	</div>
	<!-- End div .md-content -->
</div>
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