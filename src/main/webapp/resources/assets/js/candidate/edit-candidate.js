/**
 * 
 */
$(document).ready(function(){
	var selCountry = $('#selCountry');
	var selState = $('#selState');
	
	var selQualification = $('#ecQualification');
	$(selQualification).val($(selQualification).attr("data-id")).change();
	
	var selFieldOfStudy = $('#ecFieldOfStudy');
	$(selFieldOfStudy).val($(selFieldOfStudy).attr("data-id")).change();
	
	var selSpecialization = $('#ecSpecialization');
	$(selSpecialization).val($(selSpecialization).attr("data-id")).change(); 
	
	var selLocation = $('#ecLocation');
	$(selLocation).chosen();
	//$(selLocation).val($(selLocation).attr("data-id")).change(); 
	//$(selLocation).chosen();
});