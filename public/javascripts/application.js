// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(function($) {
	$("#loading").hide();
	
	  // create a convenient toggleLoading function
	  var toggleLoading = function() { $("#loading").toggle() };
	 //var toggleLoading = function() { $("#main").append("loading....")};
	  $("#tool-form").bind("ajax:loading",  toggleLoading).bind("ajax:complete", toggleLoading).bind("ajax:success", function(data, status, xhr) {
	      $("#main").html(status);
	    });
	});