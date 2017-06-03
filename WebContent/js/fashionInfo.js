$(function(){
	//设置内容高度
	var fl_content_p = $('.fl-content p').height();
	var body_height = $('body').height();
	var window_height = $(window).height();
	var window_width = $(window).width();
	
	if(fl_content_p < 500)
		$('.fl-content p').height('500');
		
	if(body_height < window_height)
		$('#fl-footer').css("position","fixed").css("bottom",0).css("left",0).css("width",window_width);
	else
		$('#fl-footer').css("position","relative");
		
	
	$(window).resize(function(){
		fl_content_p = $('.fl-content p').height();
		body_height = $('body').height();
	    window_height = $(window).height();
	    window_width = $(window).width();
	    
		if(fl_content_p < 500)
		$('.fl-content p').height('500');
		
		if(body_height < window_height)
			$('#fl-footer').css("position","fixed").css("bottom",0).css("left",0).css("width",window_width);
		else
			$('#fl-footer').css("position","relative");
	})
})

