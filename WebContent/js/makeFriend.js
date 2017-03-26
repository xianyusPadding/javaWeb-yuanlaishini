$(function(){
	//让分组里的下拉列表和父元素的li等宽
	$(".dropdown-menu").css("width",$(".dropdown").width()+"px");
	
	//index大于2的分组隐藏
	$.each($(".fl-navbar-group>li"),function(index,value){
		if(index>2)
			$(value).css("display","none");
	})
	
	//点击展开
	$(".fl-group-openBtn").click(function(){
		$.each($(".fl-navbar-group>li"),function(index,value){
			if(index>2)
				$(value).css("display","");
		})
		$(".fl-group-openBtn").css("display","none");
		$(".fl-group-closeBtn").css("display","");
	})
	
	//点击关闭
	$(".fl-group-closeBtn").click(function(){
		$.each($(".fl-navbar-group>li"),function(index,value){
			if(index>2)
				$(value).css("display","none");
		})
		$(".fl-group-closeBtn").css("display","none");
		$(".fl-group-openBtn").css("display","");
	})
	
	
})