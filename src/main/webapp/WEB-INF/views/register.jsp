<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<title>Careers CCS - Candidate Registration</title>
<spring:url value="/resources/" var="resources" />
<spring:url value="/WEB-INF/views/" var="views" />
<spring:url value="/" var="root" />
<jsp:include page="${views}style-imports.jsp"></jsp:include>
</head>
<!-- BODY -->
<style>
.modal{
    display: block !important; /* I added this to see the modal, you don't need this */
}

/* Important part */
#md-newspaper{
    overflow-y: initial !important
}
.md-content{
	width:150%;
    height: 500px;
    overflow-y: auto;
}

.md-modal{
	left:35%;
}

.md-show ~ .md-overlay{
	background:white;
}

.full-content-center img.logo-login{
	width:100px;
}
</style>
<body class="tooltips full-content" style="background:#BDC3C7;">
	<!-- BEGIN PAGE -->
	<div class="container">

		<!-- Begin Register Page -->
		<div class="full-content-center animated fadeInDownBig">
			<a href="/"><img
				src="${resources}images/logo-login.png"
				class="logo-login" alt="Logo"></a>
			<div class="login-wrap">
				<div class="box-info">
					<h2 class="text-center">
						<strong>Register</strong> New Candidate Account
					</h2>
					<spring:url value="/register" var="registerForm" />
					<form:form modelAttribute="candidateRegistration" role="form"
						action="${registerForm}" method="POST" id="registerForm">
						<c:if test="${not empty errors}">
							<div class="error-container">
								<div class="alert alert-danger" role="alert">
									<c:forEach items="${errors}" var="error">
										<div class="error-message-container">
											<span class="glyphicon glyphicon-exclamation-sign"
												aria-hidden="true"></span>
											<c:out value="${error.defaultMessage}" />
										</div>
									</c:forEach>
								</div>
							</div>
						</c:if>
						<div class="form-group login-input">
							<i class="fa fa-user overlay"></i>
							<form:input path="firstName" type="text"
								class="form-control text-input" placeholder="First Name"
								name="firstName" data-parsley-required="true"
								data-parsley-minlength="3"
								data-parsley-maxlength="20"/>
						</div>
						<div class="form-group login-input">
							<i class="fa fa-user overlay"></i>
							<form:input path="lastName" type="text"
								class="form-control text-input" placeholder="Last Name"
								name="lastName" data-parsley-required="true"
								data-parsley-minlength="3"
								data-parsley-maxlength="20"/>
						</div>
						<div class="form-group login-input">
							<i class="fa fa-user overlay"></i>
							<form:input path="studentNumber" type="text"
								class="form-control text-input" placeholder="Student Number"
								name="studentNumber" data-parsley-required="true"
								data-parsley-minlength="3"
								data-parsley-maxlength="20"/>
						</div>
						<div class="form-group login-input">
							<i class="fa fa-envelope overlay"></i>
							<form:input path="user.email" type="email"
								class="form-control text-input" name="email"
								placeholder="Your email" data-parsley-required="true"
								data-parsley-minlength="3"
								data-parsley-maxlength="30"
								data-parsley-type="email"/>
						</div>
						<div class="form-group login-input">
							<i class="fa fa-key overlay"></i>
							<form:input path="user.password" type="password"
								class="form-control text-input" id="password"
								placeholder="Enter Password" name="password"
								data-parsley-required="true"
								data-parsley-minlength="3"
								data-parsley-maxlength="20"/>
						</div>
						<div class="form-group login-input">
							<i class="fa fa-key overlay"></i> <input type="password"
								class="form-control text-input" id="repassword"
								placeholder="Re-type Password" name="repassword"
								data-parsley-required="true"
								data-parsley-minlength="3"
								data-parsley-maxlength="20"
								data-parsley-equalto="#password"/>
						</div>
						<div class="checkbox">
						<label class="">
						<button class="btn btn-default btn-sm md-trigger" id="terms-button" data-modal="md-just-me" style="border:0; color:blue;">
						  <div class="icheckbox_minimal-grey" name="agree" aria-checked="false" aria-disabled="false" style="position: relative;"><input id="agree" type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div> I Agree to the
						</label>Terms and Conditions</button>
						</div>
						<button type="submit" class="btn btn-success btn-block disabled"
							id="submitRegister">
							<i class="fa fa-rocket"></i> Register
						</button>
					</form:form>
				</div>
				<p class="text-center">
					<a href="login.html"><i class="fa fa-sign-in"></i> Back to
						login</a>
				</p>
			</div>
			<div class="md-modal md-3d-sign" id="md-3d-sign">
			<div class="md-content" style="text-align:left;">
				<h3><b>Terms and Conditions</b></h3>
				<div>
					<p>By using Careers CCS, you agree to comply with its TERMS AND CONDITIONS. Careers CCS reserves the right to modify or revise the set terms. Failure to adhere to the terms and conditions will result in the termination of the user's access to both the site and its services.</p>
					<ul>
						<li><strong>1. Candidates</strong><br> Careers CCS is only exclusive for DHVTSU(Don Honorio Ventura Technological State University) I.T. alumni and OJT students. No money is collected from them. They're also known as jobseekers. In order to use Careers CCS, candidate's account must be verified first by the admin through seaching the student or alumni's ID number through database obtained from DHVTSU MIS.

						They are advised to exercise due diligence in accepting job offers. They are also advised to verify any information provided by recruitment agencies to ensure its accuracy.

						Jobseekers agree that any personal information released to companies through Careers CCS is given voluntarily with full understanding that it may be accessible to any company registered to Careers CCS. They also agree to be responsible for the accuracy of any personal information they make available to or through the site and agree further that Careers CCS shall not be held liable in any manner in connection with the personal information they have made available through the site.

						Jobseekers agree to use Careers CCS or any information accessed through or found within the site for personal, employment-seeking, and lawful purposes. Jobseekers may submit their resumes directly to any company that advertises on or through the website.

						The jobseeker may also choose to submit his resume to Careers CCS in response to any advertised job opportunity or for the said resume to be stored in the site's resume database. The jobseeker's resume will be stored in the database for a lifetime unless the jobseeker chooses to delete it.

						A jobseeker's resume or personal information will only be available to registered companies. Should any of the said companies choose to have a copy of the resume, Careers CCS will not be responsible or held liable in any way if the company uses the jobseeker's personal data for any purpose other than consideration for employment.</li>
						<li><strong>1.1 DISCLAIMER</strong><br> Careers CCS does not warrant or assume any legal liability or responsibility for the accuracy, completeness or usefulness of any information disclosed in the website. Careers CCS does not give any warranty or other assurance as to the operation, quality or functionality of the site. Access to the site may be interrupted, restricted or delayed for any reason.

						Careers CCS is not in any manner engaged in the recruitment, placement or referral of contract workers. Careers CCS merely accepts advertisements from DTI/SEC certified companies, which are solely responsible for the recruitment and placement of workers.

						Careers CCS advertises job openings from recruitment agencies as declared or required by the latter. Careers CCS does not guaranty and will not take any responsibility for the accuracy and reliability of such job advertisements.

						The COMPANY is responsible for ensuring that their job openings submitted for inclusion on Careers CCS comply with all relevant laws and regulations. Careers CCS will not take any responsibility for any error, omission or inaccuracy in the information thus provided.

						To the full extent permissible by law, Careers CCS disclaims all responsibility for any damage or loss (including, without limitation to, illegal recruitment, financial loss, damages for loss in business projects, loss of profits or other consequential losses) arising in contract, or otherwise from the use of inability to use the website or any material appearing on Careers CCS, or from any action or decision taken as a result of or in connection with using Careers CCS or any such material.</li>
						<li><strong>2. COMPANIES</strong> <br> Careers CCS can only be used by DTI(Department of Trade and Industry)/SEC(Security and Exchange Commission) certified companies in good standing.

						In order to use Careers CCS, company's account must be verified first by the admin through seaching the company's name through DTI/SEC database.

						Companies agree to ensure that their job openings, manpower pooling, and recruitment methods comply with all applicable Philippine laws. They also agree to use whatever information they obtain from or through the site, including but not limited to applicant's resume, in a confidential, lawful manner for employment purposes only.

						Companies shall have access to Careers CCS' services upon approval of their application. They shall be entitled to advertise job vacancies in the site for a pre-determined period of time and shall have access to the site's resume database.

						Suspension of the company's certification with the DTI/SEC will result in the suspension of company's account with Careers CCS. Careers CCS reserves the right to suspend accounts without prior notice.</li>
						<li><strong>2.1 PROHIBITED USE</strong><br> Companies agree not to use Careers CCS for any of the following purposes:<br>

							- illegal recruitment<br>
							- to post incomplete, false and information not their own<br>
							- to communicate with applicants for purposes other than employment<br>
							- to obtain in any way personal information about other users for purposes other than employment<br>
							- to revise or delete another user's information<br>
							- to violate or attempt to violate the security and privacy of Careers CCS and its users by<br>
							* accessing or attempting to access data that is not their own or not intended for them<br>
							* logging on or attempting to log on to an account that they are not authorized to access; and/or<br>
							* breaching or attempting to breach the site's security and authentication measures without proper authorization<br>
						    * Attempt to breach or violate system security may result in civil or criminal liability.<br>
							- to transmit, distribute, store, or display material or information that violates any applicable laws, infringes the copyright, trademark, or property of others, or invades the privacy or publicity of others<br>
							- to transmit, distribute, store, or display information or material that is derogatory, libelous, threatening, abusive, or hateful.<br>
							- to advertise or promote other products/services such as:<br>
							* posting content or link that aims to drive traffic and promote similar or competing websites and,<br>
							* posting content or link that are not in any way related to employment/recruitment.</li>
					<h3>Violation of Careers CCS' terms and conditions will result in immediate suspension of company's account.</h3>
					<li><strong>3. LINKS TO OTHER SITES</strong> <br> Careers CCS contains links to other sites. However, these links do not in any way serve as an endorsement by Careers CCS of the third parties contents. Access to these links is done at the users' own risk and Careers CCS shall not be held responsible for any information or material obtained from these links.</li>
					<li><strong>4. SECURITY </strong> <br>By accessing and using Careers CCS, you agree to hold harmless Careers CCS from and against any claims, actions, or demands, alleging or resulting from your use of the material.</li>
					<li><strong>5. PRIVACY POLICY </strong> <br>We at Careers CCS value the information that our clients and users share and disclose in our website. We exercise responsible use of all information given to us, and our commitment to guaranteed confidentiality and privacy are clearly stated in our Privacy Policy.</li>
					<li><strong>6. DISCLAIMER </strong> <br>The materials in this site are provided on a 'as is' basis and do not offer warranties of any kind. Downloading and obtaining of contents and/or information from this site is done at the user's own discretion and risk. Careers CCS does not guarantee the full efficiency, reliability, or accuracy of any material downloaded or obtained from the site.</li>
					<li><strong>Careers CCS shall not in any manner be held liable for any loss or expense including direct, special, economic/financial, or consequential damage resulting from or in connection with:</strong> <br>
					- reliance on the content of the website;<br>
					- the use of downloaded site material <br>
					- access, use, or the inability to access or use this website; <br>
					- any delay in transmission, computer virus, or malfunction in the user's system, server, or connection; and/or <br>
					- the use of or access to any other website linked to Careers CCS.
					</li>
					</ul>
					<p>
					<button class="btn btn-success md-close" id="close-modal">I Agree.</button>
					<button class="btn btn-danger md-close" id="i-decline">I Decline.</button>
					</p>
				</div>
			</div><!-- End div .md-content -->
		</div>
		<div class="md-overlay"></div>
		</div>
		<!-- End Register Page -->
	</div>
	<!-- End div .container -->
	<jsp:include page="${views}foot.jsp"></jsp:include>
	<jsp:include page="${views}script-imports.jsp"></jsp:include>
	<script>
	$(document).ready(function(){
		$('#terms-button').click(function(){
			if(document.getElementById('agree').checked == false){
				$('#md-3d-sign').addClass('md-show')	
			}
		})
		
		$('#i-decline').click(function(){
			$('#terms-button').trigger( "click" ) 
			$('#md-3d-sign').removeClass('md-show')
		})
		
		$('#close-modal').click(function(){
			$('#md-3d-sign').removeClass('md-show')
		})
		
		$('#submitRegister').click(function(){
			if(document.getElementById('agree').checked == false){
				$('#agg-error').remove();
				$('#registerForm').append('<small id="agg-error" class="help-block" style="color:red">Accept the Terms and Conditions before registration</small>')
				return false;
			}
			$('#agg-error').remove();
			return true;
		});
		$('#registerForm').bootstrapValidator({
			message : 'This value is not valid',
			fields : {
				firstName : {
					message : 'invalid firstname',
					validators : {
						notEmpty : {
							message : 'firstname field is empty'
						},
						regexp :{
							regexp : /^[a-zA-Z ,.'-]+$/,
							message : 'invalid firstname'
						},
						stringLength: {
	                        message: 'firstname must be 3 characters minimum and 25 maximum characters',
	                        max: function(
	                            value,
	                            validator,
	                            $field) {
	                            return 25 - (value
	                                .match(/\r/g) || []).length;
	                        },
	                        min: function(
	                            value,
	                            validator,
	                            $field) {
	                        	return 3 - (value
		                                .match(/\r/g) || []).length;
	                        }
	                    }
					}
				},
				lastName : {
					message : 'lastName experience',
					validators : {
						notEmpty : {
							message : 'lastname field is empty'
						},
						regexp :{
							regexp : /^[a-zA-Z ,.'-]+$/,
							message : 'lastname contains invalid character(s)'
						},
						stringLength: {
	                        message: 'lastname must be 3 characters minimum and 25 maximum characters',
	                        max: function(
	                            value,
	                            validator,
	                            $field) {
	                            return 25 - (value
	                                .match(/\r/g) || []).length;
	                        },
	                        min: function(
	                            value,
	                            validator,
	                            $field) {
	                        	return 3 - (value
		                                .match(/\r/g) || []).length;
	                        }
	                    }
					}
				},
				'user.email' : {
					message : 'invalid email',
					validators : {
						notEmpty : {
							message : 'email field is empty'
						},
						emailAddress: {
	                        message: 'The input is not a valid email address'
	                    }
					}
				},
				'user.password' : {
					message : 'invalid password expiration',
					validators : {
						notEmpty : {
							message : 'password field is empty'
						},
						stringLength: {
	                        message: 'password must be 6 characters minimum and 25 characters maximum',
	                        max: function(
	                            value,
	                            validator,
	                            $field) {
	                            return 25 - (value
	                                .match(/\r/g) || []).length;
	                        },
	                        min: function(
	                            value,
	                            validator,
	                            $field) {
	                            return 6;
	                        }
	                    }
					}
				},
				repassword : {
					message : 'invalid password expiration',
					validators : {
						notEmpty : {
							message : 'password must not be empty'
						},
						identical: {
	                        field: 'user.password',
	                        message: 'The password and its confirm are not the same'
	                    }
					}
				},
				studentNumber : {
					message: 'Invalid student number',
					validators : {
						notEmpty : {
							message : 'student number must not be empty'
						},
						regexp :{
							regexp : /^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$/,
							message : 'invalid student number format'
						}
					}
				}
			}
		});
		$('#submitRegister').removeClass('disabled')
	})
	</script>
</body>

</html>