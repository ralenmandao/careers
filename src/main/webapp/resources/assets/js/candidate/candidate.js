$(document).ready(function(){
	var principal = '${principal}';
	$.ajax({
		type: 'GET',
		url: contextPath + '/candidate/' + principal,
		dataType: 'json',
		async: false,
		success: function(data){
			var candidate = jQuery.parseJSON(data);
			
		}
	});
});