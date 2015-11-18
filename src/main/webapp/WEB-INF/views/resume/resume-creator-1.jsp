<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url value="/resources/" var="resources" />
<div class="jumbotron sm">
	<h1>Resume Creator</h1>
	<p>
		Choose from the templates below
	</p>
	<div class="row">
					<div class="col-sm-3 col-xs-6">
						<div class="box-info full">
							<div class="img-wrap">
							<img src="${resources}images/small/img001_small.jpg" alt="Image small">
							</div>
							<div class="des-thumbnail">
								<h4>Thumbnail Box</h4>
								<p>
								Simple yet elegant Layout
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-3 col-xs-6">
						<div class="box-info full">
							<div class="img-wrap">
							<img src="${resources}images/small/img005_small.jpg" alt="Image small">
							</div>
							<div class="des-thumbnail">
								<h4>Thumbnail Box</h4>
								<p>
								Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-3 col-xs-6">
						<div class="box-info full">
							<div class="img-wrap">
							<img src="${resources}images/small/img001_small.jpg" alt="Image small">
							</div>
							<div class="des-thumbnail">
								<h4>Thumbnail Box</h4>
								<p>
								Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-3 col-xs-6">
						<div class="box-info full">
							<div class="img-wrap">
							<img src="${resources}images/small/img005_small.jpg" alt="Image small">
							</div>
							<div class="des-thumbnail">
								<h4>Thumbnail Box</h4>
								<p>
								Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
								</p>
							</div>
						</div>
					</div>
				</div>
		<p><a class="btn btn-danger pull-right" role="button"><i class="fa fa-arrow-circle-o-right"></i> Next</a></p>
</div>