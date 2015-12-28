$(document).ready(function(){
	/**
	 *  candidate/edit
	 */
	$("#edit").on("click", function(){
		window.location =  "/candidate/edit";
	});

	$(".chosen-select").chosen()
	
	
	
	// Job md showing when user profile is not complet
	$('#resume').on('click', function(){
		$('#md-complete-your-profile').addClass('md-show')
	})

	$('#md-complete-your-profile-close').on('click', function(){
		$('#md-complete-your-profile').removeClass('md-show')
	})
	/*Jobs item desc*/
	
});