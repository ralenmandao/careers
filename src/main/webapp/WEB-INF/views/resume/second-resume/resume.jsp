<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from bootstrap.themesforever.com/themes/simpleness/simpleness.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 22 Dec 2015 07:08:39 GMT -->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>Simpleness V1.0 CV Resume Template - Themes Forever - Bootstrap</title>
  <meta name="Keywords" content="Themes, Templates, Bootstrap, CSS, HTML"/>
  <meta name="Description" content="Themes Forever is developer for template by Bootstrap"/>
  <meta name="Distribution" content="global"/>
  <meta name="Robots" content="all"/>
  <!-- Favicon Browser -->
  <link href="img/favicon.png" type="image/png" rel="icon">
  <!-- Bootstrap Core CSS + Simpleness -->
  <link href="css/bootstrap-simpleness-v1.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700' rel='stylesheet' type='text/css'>
  <!-- Font Awesome -->
  <link href="../../../maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <!-- Plugins CSS -->
  <link href="css/animate.min.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
  <!-- container -->
  <div class="container">

    <!-- nav social -->
    <div class="centered-pills">

      <ul class="nav nav-pills">

        <li><a href="#"><i class="fa fa-facebook" title="Facebook Timothy"></i></a></li>
        <li><a href="#"><i class="fa fa-linkedin" title="Linkedin Timothy"></i></a></li>
        <li><a href="#"><i class="fa fa-twitter" title="Twitter Timothy"></i></a></li>

      </ul>

    </div>

    <!-- wrapper -->
    <div class="cv-wrapper">

      <hr>

      <!-- title name cv-->
      <header class="text-center cv-header">
        <h1 class="text-uppercase">${candidate.firstName} ${candidate.lastName}</h1>
        <p class="lead">
          ${candidate.title}
        </p>
      </header><!--/ title name cv-->

      <hr>

      <br>

      <div class="row">

        <!-- column left -->
        <div class="col-md-7">

          <!-- about me -->
          <section class="cv-section">

            <h3 class="text-uppercase">// About Me</h3>

            <article class="wow" data-wow-delay=".1s">

              <div class="row">

                <div class="col-sm-4 col-sm-push-8 text-center">

                  <img src="img/photo.jpg" class="img-circle cv-portrait-photo">

                </div>

                <div class="col-xs-12 col-sm-8 col-sm-pull-4">

                  <p>
                  	${candidate.about}
                  </p>

                </div>

              </div>

            </article>

          </section><!--/ about me -->

          <!-- experiences -->
          <section class="cv-section">

            <h3 class="text-uppercase">// Experiences</h3>
			
            <article class="wow" data-wow-delay=".1s">
				
              <h4>Web Giants Ltd</h4>
              <p>
                <small class="text-primary"><strong>Lead Programmer,</strong> 2013 to Present</small>
              </p>
              <p>
                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
              </p>
              <p>
                <strong>Accomplishments:</strong>
                <ul>
                  <li>
                    Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris.
                  </li>
                  <li>
                    Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi.
                  </li>
                </ul>
              </p>

            <hr>
            </article>

            <article class="wow" data-wow-delay=".3s">

              <h4>Welsh Web</h4>
              <p>
                <small class="text-primary"><strong>Junior Programmer,</strong> 2011 to 2012</small>
              </p>
              <p>
                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
              </p>
              <p>
                <strong>Accomplishments:</strong>
                <ul>
                  <li>
                    Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.
                  </li>
                </ul>
              </p>

            </article>

          </section><!--/ experiences -->

          <!-- education -->
          <section class="cv-section">

            <h3 class="text-uppercase">// Education</h3>

            <article class="wow" data-wow-delay=".3s">

              <h4>Voluptate Velit</h4>
              <p>
                <small class="text-primary"><strong>MS in Software Engineering Candidate, </strong>2010</small>
              </p>
              <p>
                <strong>Certifications:</strong>
                <ul>
                  <li>
                    Donec lobortis risus a elit, 2009
                  </li>
                  <li>
                    Excepteur sint occaecat, 2008
                  </li>
                </ul>
              </p>
              <hr>

            </article>

            <article class="wow" data-wow-delay=".3s">

              <h4>Donec Fermentum</h4>
              <p>
                <small class="text-primary"><strong>BS in Computer Information Science, </strong>2008</small>
              </p>
              <p>
                <strong>Certifications:</strong>
                <ul>
                  <li>
                    Donec lobortis risus a elit, 2009
                  </li>
                </ul>
              </p>
              <hr>

            </article>

            <article class="wow" data-wow-delay=".3s">

              <h4>Seminars</h4>
              <p>
                <ul>
                  <li>Enterprise Java Development</li>
                  <li>C++ Programming: Concepts, Design and Implementation</li>
                  <li>Windows Programming Using Visual C++</li>
                  <li>Advanced Workshop in Object-Oriented Analysis and Design</li>
                </ul>
              </p>

            </article>

          </section><!--/ education -->

        </div><!--/ column left -->

        <!-- column right -->
        <div class="col-md-5">

          <!-- contact -->
          <section class="cv-section wow" data-wow-delay=".5s">

            <h3 class="text-uppercase">// Contact</h3>

            <article class="media">

              <div class="pull-left">
                <span class="fa fa-phone bg-primary text-primary"></span>
              </div>
              <div class="media-body">+1 650-253-0000</div>

            </article>

            <article class="media">

              <div class="pull-left">
                <span class="fa fa-envelope bg-primary text-primary"></span>
              </div>
              <div class="media-body">timforeman@mail.com</div>

            </article>

            <article class="media">

              <div class="pull-left">
                <span class="fa fa-map-marker bg-primary text-primary"></span>
              </div>
              <div class="media-body">1600 Amphitheatre Parkway Mountain View</div>

            </article>

            <article class="media">

              <div class="pull-left">
                <span class="fa fa-calendar-o bg-primary text-primary"></span>
              </div>
              <div class="media-body">August 15, 1978</div>

            </article>

          </section><!--/ contact -->

          <!-- skills -->
          <section class="cv-section">

            <h3 class="text-uppercase">// Skills</h3>

            <article>

              <div class="row">

                <div class="col-sm-6 col-md-12 wow" data-wow-delay=".5s">

                  <!-- Skills 1 -->
                  <h4>Programming</h4>
                  <hr>

                  <h6>Java</h6>
                  <div class="progress">
                    <div class="progress-bar" style="width: 85%"></div>
                  </div>

                  <h6>C++</h6>
                  <div class="progress">
                    <div class="progress-bar" style="width: 60%"></div>
                  </div>

                  <h6>VB.Net</h6>
                  <div class="progress">
                    <div class="progress-bar" style="width: 75%"></div>
                  </div>

                  <h6>PHP</h6>
                  <div class="progress">
                    <div class="progress-bar" style="width: 55%"></div>
                  </div>

                  <br>

                </div>

                <div class="col-sm-6 col-md-12 wow" data-wow-delay=".8s">
                  <!-- Skills 2 -->
                  <h4>Databases</h4>
                  <hr>

                  <h6>Oracle 8/7</h6>
                  <div class="progress">
                    <div class="progress-bar" style="width: 70%"></div>
                  </div>

                  <h6>MS Access</h6>
                  <div class="progress">
                    <div class="progress-bar" style="width: 60%"></div>
                  </div>

                  <h6>SQL Server</h6>
                  <div class="progress">
                    <div class="progress-bar" style="width: 90%"></div>
                  </div>

                  <h6>MySQL</h6>
                  <div class="progress">
                    <div class="progress-bar" style="width: 80%"></div>
                  </div>

                  <br>

                </div>

                <div class="col-sm-12 wow" data-wow-delay=".3s">

                  <h4>Systems</h4>
                  <hr>

                  <h6>AIX</h6>
                  <div class="progress">
                    <div class="progress-bar progress-bar-success" style="width: 70%"></div>
                  </div>

                  <h6>Linus</h6>
                  <div class="progress">
                    <div class="progress-bar progress-bar-info" style="width: 60%"></div>
                  </div>

                  <h6>Unix</h6>
                  <div class="progress">
                    <div class="progress-bar progress-bar-warning" style="width: 90%"></div>
                  </div>

                  <h6>Windows NT V4.0</h6>
                  <div class="progress">
                    <div class="progress-bar progress-bar-danger" style="width: 80%"></div>
                  </div>

                  <br>

                </div>

              </div>

            </article>

          </section><!--/ skills -->

          <!-- hobbies -->
          <section class="cv-section">

            <h3 class="text-uppercase">// Hobbies</h3>

            <article class="wow" data-wow-delay=".5s">

              <p><i class="fa fa-check"></i>&nbsp; Classical Music</p>
              <hr>

              <p><i class="fa fa-check"></i>&nbsp; Traveling</p>
              <hr>

              <p><i class="fa fa-check"></i>&nbsp; Table Tennis</p>

            </article>

          </section><!--/ hobbies -->

        </div><!--/ column right -->

      </div>

      <hr>

      <!-- button download PDF -->
      <div class="text-center">
        <a href="#" title="Donwload Resume PDF" class="btn btn-primary-outline btn-lg">
          <i class="fa fa-download"></i>&nbsp; Download PDF
        </a>
      </div><!--/ button download PDF -->

    </div><!--/ wrapper -->

  </div><!--/ container-->

  <!-- footer signature -->
  <footer class="text-center cv-footer">
    <p>
      Timothy Foreman&copy;2015 Back-End Web Developer
    </p>
  </footer>

  <!-- jQuery -->
  <script src="../../../ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="js/bootstrap.min.js"></script>
  <!-- Plugins JS -->
  <script src="js/wow.min.js"></script>
  <!-- Core Theme JS -->
  <script src="js/simpleness.js"></script>
  <!-- Color Switch JS / can be removed in production -->
  <script src="js/color-switch.js"></script>

  <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','../../../www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-54963958-3', 'auto');
    ga('send', 'pageview');

  </script>

</body>

<!-- Mirrored from bootstrap.themesforever.com/themes/simpleness/simpleness.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 22 Dec 2015 07:08:48 GMT -->
</html>
