<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	<spring:url value="/resources/" var="resources" />
	<spring:url value="/WEB-INF/views/" var="views" />
	<spring:url value="/" var="root" />

	<!-- Basic Javascripts (Jquery and bootstrap) -->
	<script src="${resources}assets/js/jquery.js"></script>
	<script src="${resources}assets/js/bootstrap.min.js"></script>
	
	<!-- VENDOR -->
	
	<!-- Slimscroll js -->
	<script src="${resources}assets/third/slimscroll/jquery.slimscroll.min.js"></script>
	
	<!-- Morris js -->
	<script src="${resources}assets/js/raphael-min.js"></script>
	<script src="${resources}assets/third/morris/morris.js"></script>
	
	<!-- Nifty modals js -->
	<script src="${resources}assets/third/nifty-modal/js/classie.js"></script>
	<script src="${resources}assets/third/nifty-modal/js/modalEffects.js"></script>
	
	<!-- Sortable js -->
	<script src="${resources}assets/third/sortable/sortable.min.js"></script>
	
	<!-- Bootstrao selectpicker js -->
	<script src="${resources}assets/third/select/bootstrap-select.min.js"></script>
	
	<!-- Summernote js -->
	<script src="${resources}assets/third/summernote/summernote.js"></script>
	
	<!-- Magnific popup js -->
	<script src="${resources}assets/third/magnific-popup/jquery.magnific-popup.min.js"></script> 
	
	<!-- Bootstrap file input js -->
	<script src="${resources}assets/third/input/bootstrap.file-input.js"></script>
	
	<!-- Bootstrao datepicker js -->
	<script src="${resources}assets/third/datepicker/js/bootstrap-datepicker.js"></script>
	
	<!-- CHOSEN -->
	<script src="${resources}assets/js/chosen.jquery.min.js"></script>
	
	<!-- Icheck js -->
	<script src="${resources}assets/third/icheck/icheck.min.js"></script>
	
	<!-- Form validation -->
	<script src="${resources}assets/third/validator/bootstrapValidator.min.js"></script>
	<script src="${resources}assets/third/validator/example.js"></script>
	<script src="${resources}assets/third/validator/parsley.min.js"></script>
	
	<!-- Form wizard js 
	<script src="${resources}assets/third/wizard/jquery.snippet.min.html"></script>
	<script src="${resources}assets/third/wizard/jquery.easyWizard.js"></script>
	<script src="${resources}assets/third/wizard/scripts.js"></script>
	-->
	
	<!-- LANCENG TEMPLATE JAVASCRIPT -->
	<script src="${resources}assets/js/candidate/edit-candidate.js"></script>
	<script src="${resources}assets/js/candidate/candidate.js"></script>
	<script src="${resources}assets/js/lanceng.js"></script>