/**
 * 
 */
$(document).ready(function(){
	var selCountry = $('#selCountry');
	var selState = $('#selState');
	
	var countries = null;
	var states = new Array();
	get("/countries/", function(data){
		countries = data._embedded.countries;
		$.each(countries, function(key,value){
			$(selCountry).append('<option value=' + value.id + '>' + value.name + '</option>')
		});
		var index = countries.indexOf($(selCountry).attr("data-id"));
		$(selCountry).val($(selCountry).attr("data-id")).change();
		index = states.indexOf($(selState).attr("data-id"));
		$(selState).val($(selState).attr("data-id")).change();
	},function(){

	});
	
	$(selCountry).on('change', function(){
		console.log('select country was changed!')
		var selecteValue = $(selCountry).val();
		console.log('selected value is ' + selecteValue);
		states = new Array()
		$.each(countries, function(key, val){
			if(val.id == selecteValue){
				$(selState).html("");
				$.each(val.states, function(k,v){
					states.push(v);
					$(selState).append('<option value=' + v.id + '>' + v.name + '</option>')
				})
			}
		});
	});
	
	
	var selQualification = $('#ecQualification');
	$(selQualification).val($(selQualification).attr("data-id")).change();
	
	var selFieldOfStudy = $('#ecFieldOfStudy');
	$(selFieldOfStudy).val($(selFieldOfStudy).attr("data-id")).change();
	
	var selSpecialization = $('#ecSpecialization');
	$(selSpecialization).val($(selSpecialization).attr("data-id")).change(); 
});