$(function(){
	var wrap2 = $('#wrapper2');
	$('.action').click(function(){
		var action = $(this).attr('rel'); // get the appropriate action from the rel attribute
		wrap2.trigger(action+'.evtpaginate');
		return false;
	});
	$('select[name=perpage]').change(function(){
		wrap2.trigger('refresh.evtpaginate', { perPage : $(this).val() } );
		return false;
	});
	// listen out for events triggered by the plugin to update the counter
	wrap2.bind( 'initialized.evtpaginate', function(e, startnum, totalnum ){
		$('#count2').text(startnum);
		$('#total2').text(totalnum);
	}); 
	wrap2.bind( 'finished.evtpaginate', function(e, num, isFirst, isLast ){ $('#count2').text(num); } ); 	
	wrap2.evtpaginate({perPage:4, atEnd:'loop'}); // call the plugin!	
});