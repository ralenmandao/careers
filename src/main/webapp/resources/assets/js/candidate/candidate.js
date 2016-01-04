$(document).ready(function(){
	/**
	 *  candidate/edit
	 */
	$("#edit").on("click", function(){
		window.location =  "/candidate/edit";
	});

	$(".chosen-select").chosen()
	
	
	
	// FIXING LOGOUT ON CANDIDATE
	
	$('.logout').on('click', function(){
		$('#logout-modal-alt').addClass('md-show')
	})
	
	$('.md-overlay').on('click', function(){
		$('#logout-modal-alt').removeClass('md-show')
	})
	
	// Job md showing when user profile is not complet
	$('#resume').on('click', function(){
		$('#md-complete-your-profile').addClass('md-show')
	})

	$('#md-complete-your-profile-close').on('click', function(){
		$('#md-complete-your-profile').removeClass('md-show')
	})
	/*Jobs item desc*/
	
});