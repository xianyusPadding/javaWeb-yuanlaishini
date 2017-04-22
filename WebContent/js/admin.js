$(function(){
	$('.fl-admin-navbar').on('click',function(){
		var fl_navbar_ul = $(this).next();
		if(fl_navbar_ul.css('display')=='none')
			fl_navbar_ul.show();
		else
			fl_navbar_ul.hide();
	})
	
	$.each($('.fl-left a'),function(index,value){
		$(value).click(function(){
			var i;
			for(i=0;i<12;i++){
				if(i == index)
					$(value).parent().parent().parent().parent().next().find('div').eq(i).show();
				else
					$(value).parent().parent().parent().parent().next().find('div').eq(i).hide();
					
			}
		})
	})
	
//	var label_length = $('.fl-tab').find('label').length;
//	if(label_length > =10)
//		$('fl-more-btn').show();
})
