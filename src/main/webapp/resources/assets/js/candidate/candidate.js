$(document).ready(function(){
	var principal = $('#principal').val();
	var loading = $('#ajaxLoad');
	
	// Display the name of the principal
	console.log(contextPath + '/candidates/search/findByUserUsername?username=' + principal);
	var name = $('#nameContainer');
	$.ajax({
		type: 'GET',
		url: contextPath + '/candidates/search/findByUserUsername?username=' + principal,
		dataType: 'json',
		async: true,
		success: function(data){
			$(name).html(data.lastName + ", " + data.firstName);
			$(loading).css("display","none");
		},
		error: function(){
			alert("error");
		}
	});
});