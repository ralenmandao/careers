/**
 * 
 */
$(document).ready(function(){
	/* Edit account info auto select existing values */
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
	
	
	/* Resume creator */
	get("/candidate/getResumeEditor1", function(data){
		//$("#registrationInput").html(data)
		alert(data)
	}, function(){ })
	
});