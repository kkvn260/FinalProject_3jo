/**
 * 
 */
$(function() {
	$('#deal').click(function () {
		if($('#deal_price').css("display")=='none'){
			$('#deal_price').show();
		}else{
			$('#deal_price').hide();
		}
	})
})