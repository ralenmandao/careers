<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:url value="/resources/" var="resources" />
<spring:url value="/" var="root" />
<!DOCTYPE html>
<html>
	
<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
<head>
	<title>Lanceng - Responsive Admin Template</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="description" content="">
	<meta name="keywords" content="admin, bootstrap,admin template, bootstrap admin, simple, awesome">
	<meta name="author" content="">

	<!-- BOOTSTRAP -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- LANCENG CSS -->
	<link href="assets/css/style.css" rel="stylesheet">
	<link href="assets/css/style-responsive.css" rel="stylesheet">
	
	<!-- VENDOR -->
	<link href="assets/css/animate.css" rel="stylesheet">
	<link href="assets/third/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="assets/third/weather-icon/css/weather-icons.min.css" rel="stylesheet">
	<link href="assets/third/morris/morris.css" rel="stylesheet">
	<link href="assets/third/nifty-modal/css/component.css" rel="stylesheet">
	<link href="assets/third/sortable/sortable-theme-bootstrap.css" rel="stylesheet"> 
	<link href="assets/third/icheck/skins/minimal/grey.css" rel="stylesheet"> 
	<link href="assets/third/select/bootstrap-select.min.css" rel="stylesheet"> 
	<link href="assets/third/summernote/summernote.css" rel="stylesheet">
	<link href="assets/third/magnific-popup/magnific-popup.css" rel="stylesheet"> 
	<link href="assets/third/datepicker/css/datepicker.css" rel="stylesheet">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
	
	<!-- FAVICON -->
	<link rel="shortcut icon" href="assets/img/favicon.ico">

	<!-- Add-Ons Styles -->
	<link rel="Resume/styles.css" rel="stylesheet">
</head>
	
	
	
	<!-- BODY -->
	<body class="tooltips">
	
	<!-- BEGIN PAGE -->
	<div class="container">
			
		<!-- Your logo goes here -->
		<div class="logo-brand header sidebar rows">
			<div class="logo">
				<h1><a href="#fakelink"><img src="assets/img/logo.png" alt="Logo"> LANCENG ADMIN</a></h1>
			</div>
		</div><!-- End div .header .sidebar .rows -->
	
		<!-- BEGIN SIDEBAR -->
		<div class="left side-menu">
			
			
            <div class="body rows scroll-y">
				
				<!-- Scrolling sidebar -->
                <div class="sidebar-inner slimscroller">
				
					<!-- User Session -->
					<div class="media">
						<a class="pull-left" href="#fakelink">
							<img class="media-object img-circle" src="assets/img/avatar/masarie.jpg" alt="Avatar">
						</a>
						<div class="media-body">
							Welcome back,
							<h4 class="media-heading"><strong>Mas Bro</strong></h4>
							<a href="user-profile.html">Edit</a>
							<a class="md-trigger" data-modal="logout-modal-alt">Logout</a>
						</div><!-- End div .media-body -->
					</div><!-- End div .media -->
					
					
					<!-- Search form -->
					<div id="search">
						<form role="form">
							<input type="text" class="form-control search" placeholder="Search here...">
							<i class="fa fa-search"></i>
						</form>
					</div><!-- End div #search -->
					
				
					<!-- Sidebar menu -->				
					<div id="sidebar-menu">
						<ul>
							<li><a href="index.html"><i class="fa fa-home"></i> Dashboard</a></li>
							<li><a href="#fakelink"><i class="fa fa-leaf"></i> Frontend <span class="label label-danger new-circle">COMING SOON</span></a></li>
							<li><a href="#fakelink"><i class="fa fa-bug"></i><i class="fa fa-angle-double-down i-right"></i> Elements</a>
								<ul>
									<li><a href="element-primary.html"><i class="fa fa-angle-right"></i> Primary <span class="label label-success new-circle">UPDATED</span></a></li>
									<li><a href="element-extended.html"><i class="fa fa-angle-right"></i> Extended</a></li>
								</ul>
							</li>
							<li><a href="#fakelink"><i class="fa fa-code"></i><i class="fa fa-angle-double-down i-right"></i> Widgets</a>
								<ul>
									<li><a href="widget-awesome.html"><i class="fa fa-angle-right"></i> Awesome <span class="label label-danger new-circle">+5 new</span></a></li>
									<li><a href="widget-grid.html"><i class="fa fa-angle-right"></i> Grid</a></li>
								</ul>
							</li>
							<li><a href="#fakelink"><i class="fa fa-edit"></i><i class="fa fa-angle-double-down i-right"></i> Forms</a>
								<ul>
									<li><a href="form-element.html"><i class="fa fa-angle-right"></i> Form Element</a></li>
									<li><a href="form-wizard.html"><i class="fa fa-angle-right"></i> Form Wizard</a></li>
									<li><a href="form-validation.html"><i class="fa fa-angle-right"></i> Form Validation</a></li>
								</ul>
							</li>
							<li><a href="tables.html"><i class="fa fa-table"></i> Tables</a></li>
							<li><a href="gallery.html"><i class="fa fa-picture-o"></i><i class="fa fa-star i-right yellow"></i> Gallery</a></li>
							<li><a href="morris.html"><i class="fa fa-bar-chart-o"></i> Graph / Chart</a></li>
							<li class="active"><a href="#fakelink"><i class="fa fa-home"></i><i class="fa fa-angle-double-down i-right"></i> Pages <span class="label label-success new-circle animated double shake span-left">13</span></a>
								<ul class="visible">
									<li><a href="login.html"><i class="fa fa-angle-right"></i> Login</a></li>
									<li><a href="lock-screen.html"><i class="fa fa-angle-right"></i> Lock Screen</a></li>
									<li><a href="forgot-password.html"><i class="fa fa-angle-right"></i> Forgot Password</a></li>
									<li><a href="register.html"><i class="fa fa-angle-right"></i> Register</a></li>
									<li><a href="user-profile.html"><i class="fa fa-angle-right"></i> User Profile</a></li>
									<li><a href="user-profile-2.html"><i class="fa fa-angle-right"></i> User Profile 2 <span class="label label-danger new-circle">NEW</span></a></li>
									<li><a href="empty-data.html"><i class="fa fa-angle-right"></i> Empty Data <span class="label label-danger new-circle">NEW</span></a></li>
									<li><a href="invoice.html"><i class="fa fa-angle-right"></i> Invoice</a></li>
									<li><a href="pricing-table.html"><i class="fa fa-angle-right"></i> Pricing Table <span class="label label-success new-circle">UPDATED</span></a></li>
									<li><a href="faq.html"><i class="fa fa-angle-right"></i> FAQ</a></li>
									<li><a href="search-result.html"><i class="fa fa-angle-right"></i> Search Result <span class="label label-success new-circle">UPDATED</span></a></li>
									<li><a href="404.html"><i class="fa fa-angle-right"></i> 404</a></li>
									<li class="active"><a href="blank.html"><i class="fa fa-angle-right"></i> Blank</a></li>
								</ul>
							</li>
							<li><a href="#fakelink"><i class="fa fa-smile-o"></i><i class="fa fa-angle-double-down i-right"></i> Icons</a>
								<ul>
									<li><a href="font-awesome.html"><i class="fa fa-angle-right"></i> Font Awesome</a></li>
									<li><a href="glyphicons.html"><i class="fa fa-angle-right"></i> Glyphicons</a></li>
									<li><a href="weather-icons.html"><i class="fa fa-angle-right"></i> Weather icons <span class="label label-danger new-circle">NEW</span></a></li>
								</ul>
							</li>
							<li><a href="#fakelink"><i class="fa fa-envelope"></i><i class="fa fa-angle-double-down i-right"></i> Message  <span class="label label-success new-circle span-left">UPDATED</span></a>
								<ul>
									<li><a href="inbox.html"><i class="fa fa-angle-right"></i> Inbox</a></li>
									<li><a href="new-message.html"><i class="fa fa-angle-right"></i> New Message</a></li>
									<li><a href="reply-message.html"><i class="fa fa-angle-right"></i> Reply Message <span class="label label-danger new-circle">NEW</span></a></li>
									<li><a href="read-message.html"><i class="fa fa-angle-right"></i> Read Message</a></li>
								</ul>
							</li>
						</ul>
						<div class="clear"></div>
					</div><!-- End div #sidebar-menu -->
				</div><!-- End div .sidebar-inner .slimscroller -->
            </div><!-- End div .body .rows .scroll-y -->
			
			<!-- Sidebar footer -->
            <div class="footer rows animated fadeInUpBig">
				<div class="progress progress-xs progress-striped active">
				  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
					<span class="progress-precentage">80&#37;</span>
				  </div><!-- End div .pogress-bar -->
				  <a data-toggle="tooltip" title="See task progress" class="btn btn-default md-trigger" data-modal="task-progress"><i class="fa fa-inbox"></i></a>
				</div><!-- End div .progress .progress-xs -->
            </div><!-- End div .footer .rows -->
        </div>
		<!-- END SIDEBAR -->
		
		
		
		<!-- BEGIN CONTENT -->
        <div class="right content-page">
		
			<!-- BEGIN CONTENT HEADER -->
            <div class="header content rows-content-header">
			
				<!-- Button mobile view to collapse sidebar menu -->
				<button class="button-menu-mobile show-sidebar">
					<i class="fa fa-bars"></i>
				</button>
				
				<!-- BEGIN NAVBAR CONTENT-->				
				<div class="navbar navbar-default" role="navigation">
					<div class="container">
						<!-- Navbar header -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<i class="fa fa-angle-double-down"></i>
							</button>
						</div><!-- End div .navbar-header -->
						
						<!-- Navbar collapse -->	
						<div class="navbar-collapse collapse">
						
							<!-- Left navbar -->
							<ul class="nav navbar-nav">
								<li>
									<a href="#fakelink">
										<i class="fa fa-cog"></i>
									</a>
								</li>
								
								<!-- Dropdown language -->
								<li class="dropdown">
									<a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown">English (US) <i class="fa fa-chevron-down i-xs"></i></a>
									<ul class="dropdown-menu animated half flipInX">
										<li><a href="#fakelink">English (British)</a></li>
										<li><a href="#fakelink">Bahasa Indonesia</a></li>
										<li><a href="#fakelink">French</a></li>
									</ul>
								</li>
							</ul>
						
							<!-- Right navbar -->
							<ul class="nav navbar-nav navbar-right top-navbar">
								
								<!-- Dropdown notifications -->
								<li class="dropdown">
									<a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i><span class="label label-danger absolute">24</span></a>
									<ul class="dropdown-menu dropdown-message animated half flipInX">
										<!-- Dropdown notification header -->
										<li class="dropdown-header notif-header">New Notifications</li>
										<li class="divider"></li>
										
										<!-- Dropdown notification body -->
										<li class="unread">
											<a href="#fakelink">
											<p><strong>John Doe</strong> Uploaded a photo <strong>&#34;DSC000254.jpg&#34;</strong>
											<br /><i>2 minutes ago</i></p>
											</a>
										</li>
										<li class="unread">
											<a href="#fakelink">
											<p><strong>John Doe</strong> Created an photo album  <strong>&#34;Indonesia Tourism&#34;</strong>
											<br /><i>8 minutes ago</i></p>
											</a>
										</li>
										<li>
											<a href="#fakelink">
											<p><strong>Annisa</strong> Posted an article  <strong>&#34;Yogyakarta never ending Asia&#34;</strong>
											<br /><i>an hour ago</i></p>
											</a>
										</li>
										<li>
											<a href="#fakelink">
											<p><strong>Ari Rusmanto</strong> Added 3 products
											<br /><i>3 hours ago</i></p>
											</a>
										</li>
										<li>
											<a href="#fakelink">
											<p><strong>Hana Sartika</strong> Send you a message  <strong>&#34;Lorem ipsum dolor...&#34;</strong>
											<br /><i>12 hours ago</i></p>
											</a>
										</li>
										<li>
											<a href="#fakelink">
											<p><strong>Johnny Depp</strong> Updated his avatar
											<br /><i>Yesterday</i></p>
											</a>
										</li>
										
										<!-- Dropdown notification footer -->
										<li class="dropdown-footer"><a href="#fakelink"><i class="fa fa-refresh"></i> Refresh</a></li>
									</ul>
								</li>
								<!-- End Dropdown notifications -->
							
								
								<!-- Dropdown Messages -->
								<li class="dropdown">
									<a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i><span class="label label-danger absolute">24</span></a>
									<ul class="dropdown-menu dropdown-message animated half flipInX">
										<!-- Dropdown Messages header -->
										<li class="dropdown-header notif-header">New Messages</li>
										
										<!-- Dropdown messages body -->
										<li class="divider"></li>
										<li class="unread">
											<a href="#fakelink">
											<img src="assets/img/avatar/2.jpg" class="xs-avatar ava-dropdown" alt="Avatar">
											<strong>John Doe</strong><br />
											<p>Duis autem vel eum iriure dolor in hendrerit ...</p>
											<p><i>5 minutes ago</i></p>
											</a>
										</li>
										<li class="unread">
											<a href="#fakelink">
											<img src="assets/img/avatar/1.jpg" class="xs-avatar ava-dropdown" alt="Avatar">
											<strong>Annisa Rusmanovski</strong><br />
											<p>Duis autem vel eum iriure dolor in hendrerit ...</p>
											<p><i>2 hours ago</i></p>
											</a>
										</li>
										<li>
											<a href="#fakelink">
											<img src="assets/img/avatar/3.jpg" class="xs-avatar ava-dropdown" alt="Avatar">
											<strong>Ari Rusmanto</strong><br />
											<p>Duis autem vel eum iriure dolor in hendrerit ...</p>
											<p><i>5 hours ago</i></p>
											</a>
										</li>
										
										<!-- Dropdown messages footer -->
										<li class="dropdown-footer"><a href="#fakelink"><i class="fa fa-share"></i> See all messages</a></li>
									</ul>
								</li>
								<!-- End Dropdown messages -->
							
								<!-- Dropdown User session -->
								<li class="dropdown">
									<a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown">Howdy, <strong>Mas Bro</strong> <i class="fa fa-chevron-down i-xs"></i></a>
									<ul class="dropdown-menu animated half flipInX">
										<li><a href="#fakelink">My Profile</a></li>
										<li><a href="#fakelink">Change Password</a></li>
										<li><a href="#fakelink">Account Setting</a></li>
										<li class="divider"></li>
										<li class="dropdown-header">Another action</li>
										<li><a href="#fakelink">Help</a></li>
										<li><a href="lock-screen.html">Lock me</a></li>
										<li><a class="md-trigger" data-modal="logout-modal">Logout</a></li>
									</ul>
								</li>
								<!-- End Dropdown User session -->
							</ul>
						</div><!-- End div .navbar-collapse -->
					</div><!-- End div .container -->
				</div>
				<!-- END NAVBAR CONTENT-->
            </div>
			<!-- END CONTENT HEADER -->
			
			
			
			
			<!-- ============================================================== -->
			<!-- START YOUR CONTENT HERE -->
			<!-- ============================================================== -->
            <div class="body content rows scroll-y">
				
				<!-- Page header -->
				<div class="page-heading animated fadeInDownBig">
					<h1>Blank Page <small>lorem ipsum dolor</small></h1>
				</div>
				<!-- End page header -->
				
				<!-- Sample Resume -->
				<div class="box-info full">
					<!-- FOrm selector #myWizard -->
					<form id="myWizard">
						<!-- First step -->
						<section class="step" data-step-title="First step">
							<div class="row">
							<div class="col-sm-3 col-xs-6">
								<div class="box-info full">
									<div class="img-wrap">
									<img src="images/small/img001_small.jpg" alt="Image small">
									</div>
									<div class="des-thumbnail">
										<h4>Simple Resume</h4>
										<p>
										Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
										</p>
									</div>
								</div>
							</div> <!-- End div. col-sm-6 -->
							</div><!-- End div .row -->
						</section>
						<!-- End first step -->
						
						
						<!-- Second step -->
						<section class="step" data-step-title="Second step">
							<div class="row">
								<div class="col-sm-6">
									<div class="jumbotron">
									  <h1>Complete Address</h1>
									  <p>
									  Address :D
									  </p>
									</div>
								</div><!-- End div .col-sm-6 -->
								<div class="col-sm-6">
									<!-- Wizard notes -->
									<div class="notes">
										<h4><strong>Example</strong> note</h4>
										<p style="text-align: justify">
										Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
										</p>
										<ol>
											<li>Duis autem vel eum iriure dolor in hendrerit in vulputate</li>
											<li>Lorem ipsum dolor sit amet</li>
											<li>Sed diam nonummy nibh euismod tincidunt</li>
											<li>Sonsectetuer adipiscing elit</li>
											<li>Tincidunt ut laoreet dolore magna aliquam erat volutpat</li>
										</ol>
										<p style="text-align: justify">
										Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
										</p>
									</div><!-- End div .notes -->
								</div><!-- End div .col-sm-6 -->
							</div><!-- End div .row -->
						</section>
						<!-- End second step -->
						
						
						<!-- Third step -->
						<section class="step" data-step-title="Third step">
							<div class="row">
								<div class="col-sm-6">
									<h4>Complete Address</h4>
										<div class="jumbotron">
										  <p>
										  qwqweqrvwe
										  </p>
										  <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>
										</div>
								</div><!-- End div .col-sm-6 -->
							</div><!-- End div .row -->
						</section>
						<!-- End third step -->
					</form>
				</div><!-- End div .box-info -->
				<!-- End form wizard -->

				<!-- Footer -->
				<footer>
				&copy; 2014 <a href="index.html">Lanceng Admin</a>. Design with love by <a href="http://isohdesign.com/" target="_blank">Isoh Design Studio</a> from <a href="#fakelink">Yogyakarta, ID</a>
				</footer>
				<!-- End Footer -->
			
            </div>
			<!-- ============================================================== -->
			<!-- END YOUR CONTENT HERE -->
			<!-- ============================================================== -->
			
			
        </div>
		<!-- END CONTENT -->
		
		
		
		
		
		<!--
		============================================================================
		MODAL DIALOG EXAMPLE
		You can change transition style, just view element page
		============================================================================
		-->
		<!-- Modal Logout Primary -->
		<div class="md-modal md-fall" id="logout-modal">
			<div class="md-content">
				<h3><strong>Logout</strong> Confirmation</h3>
				<div>
					<p class="text-center">Are you sure want to logout from this awesome system?</p>
					<p class="text-center">
					<button class="btn btn-danger md-close">Nope!</button>
					<a href="login.html" class="btn btn-success md-close">Yeah, I'm sure</a>
					</p>
				</div>
			</div>
		</div><!-- End .md-modal -->
		
		<!-- Modal Logout Alternatif -->
		<div class="md-modal md-just-me" id="logout-modal-alt">
			<div class="md-content">
				<h3><strong>Logout</strong> Confirmation</h3>
				<div>
					<p class="text-center">Are you sure want to logout from this awesome system?</p>
					<p class="text-center">
					<button class="btn btn-danger md-close">Nope!</button>
					<a href="login.html" class="btn btn-success md-close">Yeah, I'm sure</a>
					</p>
				</div>
			</div>
		</div><!-- End .md-modal -->
		
		<!-- Modal Task Progress -->	
		<div class="md-modal md-slide-stick-top" id="task-progress">
			<div class="md-content">
				<h3><strong>Task Progress</strong> Information</h3>
				<div>
					<p>CLEANING BUGS</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
						<span class="sr-only">80&#37; Complete</span>
					  </div>
					</div>
					<p>POSTING SOME STUFF</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 65%">
						<span class="sr-only">65&#37; Complete</span>
					  </div>
					</div>
					<p>BACKUP DATA FROM SERVER</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 95%">
						<span class="sr-only">95&#37; Complete</span>
					  </div>
					</div>
					<p>RE-DESIGNING WEB APPLICATION</p>
					<div class="progress progress-xs for-modal">
					  <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
						<span class="sr-only">100&#37; Complete</span>
					  </div>
					</div>
					<p class="text-center">
					<button class="btn btn-danger btn-sm md-close">Close</button>
					</p>
				</div>
			</div>
		</div><!-- End .md-modal -->
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
		
		
		
	</div><!-- End div .container -->
	<!-- END PAGE -->

	<!--
	================================================
	JAVASCRIPT
	================================================
	-->
	<!-- Basic Javascripts (Jquery and bootstrap) -->
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	
	<!-- VENDOR -->
	
	<!-- Slimscroll js -->
	<script src="assets/third/slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- Morris js -->
	<script src="../../../../cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="assets/third/morris/morris.js"></script>
	
	<!-- Nifty modals js -->
	<script src="assets/third/nifty-modal/js/classie.js"></script>
	<script src="assets/third/nifty-modal/js/modalEffects.js"></script>
	
	<!-- Sortable js -->
	<script src="assets/third/sortable/sortable.min.js"></script>
	
	<!-- Bootstrao selectpicker js -->
	<script src="assets/third/select/bootstrap-select.min.js"></script>
	
	<!-- Summernote js -->
	<script src="assets/third/summernote/summernote.js"></script>
	
	<!-- Magnific popup js -->
	<script src="assets/third/magnific-popup/jquery.magnific-popup.min.js"></script> 
	
	<!-- Bootstrap file input js -->
	<script src="assets/third/input/bootstrap.file-input.js"></script>
	
	<!-- Bootstrao datepicker js -->
	<script src="assets/third/datepicker/js/bootstrap-datepicker.js"></script>
	
	<!-- Icheck js -->
	<script src="assets/third/icheck/icheck.min.js"></script>
	
	<!-- Form wizard js -->
	<script src="assets/third/wizard/jquery.snippet.min.html"></script>
	<script src="assets/third/wizard/jquery.easyWizard.js"></script>
	<script src="assets/third/wizard/scripts.js"></script>
	
	<!-- LANCENG TEMPLATE JAVASCRIPT -->
	<script src="assets/js/lanceng.js"></script>

	</body>

<!-- Mirrored from diliat.in/wrapbootstrap/Lanceng/1.1.1/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 03 Oct 2015 13:45:44 GMT -->
</html>