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
					$(value).parent().parent().parent().parent().next().find($('.fl-tab')).eq(i).show();
				else
					$(value).parent().parent().parent().parent().next().find($('.fl-tab')).eq(i).hide();
					
			}
		})
	})
	
	var fl_rightHeight = $('.fl-right').height();
	if(fl_rightHeight < 500){
		$('.fl-right').height("500");
	}
	else
		$('.fl-right').height(fl_rightHeight);
		
	//在body的高度小于window高度时，把footer置于底部
	var body_height = $('body').height();
	var window_height = $(window).height();
	var window_width = $(window).width();
	
	if(body_height < window_height)
		$('#fl-footer').css("position","fixed").css("bottom",0).css("left",0).css("width",window_width);
	else
		$('#fl-footer').css("position","relative");
		
	$(window).resize(function(){		
		body_height = $('body').height();
	    window_height = $(window).height();
	    window_width = $(window).width();	
	    
		if(body_height < window_height)
			$('#fl-footer').css("position","fixed").css("bottom",0).css("left",0).css("width",window_width);
		else
			$('#fl-footer').css("position","relative");
	})
})
