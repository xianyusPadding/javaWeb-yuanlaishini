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
				var fl_right_tab = $(value).parent().parent().parent().parent().next().find($('.fl-tab')).eq(i);
				if(i == index){
					fl_right_tab.show();
					var fl_rightHeight = fl_right_tab.height();
					if(fl_right_tab < 500){
						fl_right_tab.height("500");
					}
					else
						fl_right_tab.height(fl_rightHeight);
				}
				else
					fl_right_tab.hide();	
			}

		})
	})
	
		
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
