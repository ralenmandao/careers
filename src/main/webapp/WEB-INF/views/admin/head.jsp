<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	<spring:url value="/resources/" var="resources" />
	<spring:url value="/" var="root" />
	
	<div class="container">
		<spring:url value="/" var="root"></spring:url>
		<!-- Your logo goes here -->
		<div class="logo-brand header sidebar rows">
			<div class="logo">
				<h1><a href="/"><img src="${resources}assets/img/logo-login.png" alt="Logo"> CAREERS CCS</a></h1>
			</div>
		</div><!-- End div .header .sidebar .rows -->
	
		<!-- BEGIN SIDEBAR -->
		<div class="left side-menu">
			
			
            <div class="body rows scroll-y">
				
				<!-- Scrolling sidebar -->
                <div class="sidebar-inner slimscroller">
				
					<!-- User Session -->
					<div class="media">
						<!--
						<a class="pull-left md-trigger" data-modal = "md-fade-in-scale-up">
							<img class="media-object img-circle" src="${resources}assets/img/avatar/masarie.jpg" alt="Avatar" id="candidate-picture">
						</a>
						 -->
						<div class="media-body">
							Welcome back,
							<h4 class="media-heading"><strong id="nameContainer">${principal.firstName}</strong></h4>
							<!--
							<a href="#" id="edit">Edit</a>
							-->
							<a class="md-trigger" data-modal="logout-modal-alt">Logout</a>
						</div><!-- End div .media-body -->
					</div><!-- End div .media -->
					
					
					<!-- Search form -->
					<div id="search">
						<form role="form" action="${root}candidate">
							<input type="text" class="form-control search" name="search" placeholder="Search here...">
							<i class="fa fa-search"></i>
							<input type="submit" style="position: absolute; left: -9999px"/>
						</form>
					</div><!-- End div #search -->
					
				
					<!-- Sidebar menu -->				
					<div id="sidebar-menu">
						<ul>
							<li style="background:#65BD77;"><a href="${root}employer/" style="color:white;"><i class="fa fa-home"></i> Home</a></li>
							<li><a href="/admin/edit"><i class="fa fa-users"></i> Account</a></li>
							<li><a href="/admin/candidates"><i class="fa fa-users"></i> Candidates</a></li>
							<li><a href="/admin/employers"><i class="fa fa-users"></i> Employers</a></li>
							<li><a href="#fakelink"><i class="fa fa-bug"></i><i class="fa fa-angle-double-down i-right"></i> Entities</a>
								<ul>
									<li><a href="/admin/countries"><i class="fa fa-angle-right"></i> Countries</a></li>
									<li><a href="/admin/states"><i class="fa fa-angle-right"></i> States</a></li>
									<li><a href="/admin/fields"><i class="fa fa-angle-right"></i> Field of Study</a></li>
									<li><a href="/admin/industries"><i class="fa fa-angle-right"></i> Industry</a></li>
									<li><a href="/admin/qualifications"><i class="fa fa-angle-right"></i> Qualification</a></li>
									<li><a href="/admin/skills"><i class="fa fa-angle-right"></i> Skill</a></li>
									<li><a href="/admin/specializations"><i class="fa fa-angle-right"></i> Specialization</a></li>
								</ul>
							</li>
							<!--
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
							<li><a href="#fakelink"><i class="fa fa-home"></i><i class="fa fa-angle-double-down i-right"></i> Pages <span class="label label-success new-circle animated double shake span-left">13</span></a>
								<ul>
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
									<li><a href="blank.html"><i class="fa fa-angle-right"></i> Blank</a></li>
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
						-->
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

							</ul>
						
							<!-- Right navbar -->
							<ul class="nav navbar-nav navbar-right top-navbar">							
								<!-- Dropdown User session -->
								<li class="dropdown">
									<a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown">Howdy, <strong>${principal.firstName}</strong> <i class="fa fa-chevron-down i-xs"></i></a>
									<ul class="dropdown-menu animated half flipInX">
										<li><a href="/logout">Logout</a></li>
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