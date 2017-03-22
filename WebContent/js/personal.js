$(function(){
	// $(".fl-cover.button").button();

	//封面width随着容器大小变化	
	$(".fl-cover-img img").css("width",$(".container").width()+"px");
	$(window).resize(function(){
		$(".fl-cover-img img").css("width",$(".container").width()+"px");
	})

	$(".fl-cover-float").css("left",($(".fl-cover-img img").width()-$(".fl-cover-float").width())/2+"px");
	$(".fl-cover-float").css("top",($(".fl-cover-img img").height()-$(".fl-cover-float").height())/2+"px");
	$(".fl-tabs-link").css("width",$(".container").width()/3-8+"px");
	$(".fl-tab1-publishMain").css("width",$(".container").width()-35+"px");
	$(".fl-tabs-link a").css("margin-left",($(".fl-tabs-link").width()-$(".fl-tabs-link a").width())/2+"px");
	// $("#fl-tab2 ul li img").css("height",$("#fl-tab2 ul li img").height()+14+"px");
	// $("#fl-tab2 ul li img").css("width",$("#fl-tab2 ul li img").width()+14+"px");
	var arrH=[];
	var arrW=[];
	$.each($("#fl-tab2 ul li img"),function(index,value){
		
		arrH[index]=$(value).height()+14+"px";
		arrW[index]=$(value).width()+14+"px";
		// alert($("#fl-tab2 ul").find("img").eq(index).height(arrH[index]+14+"px"));
		// arrH[index]=$(value).height();
		// arrW[index]=$(value).width();
		$("#fl-tab2 ul").find("img").eq(index).css("height",arrH[index]);
		$("#fl-tab2 ul").find("img").eq(index).css("width",arrW[index]);
	})
	
	//$(".fl-tabPhoto-link").css("width",$(".container").width()/3-8+"px");
	$(window).resize(function(){
		$(".fl-cover-float").css("left",($(".fl-cover-img img").width()-$(".fl-cover-float").width())/2+"px");
		$(".fl-cover-float").css("top",($(".fl-cover-img img").height()-$(".fl-cover-float").height())/2+"px");
		$(".fl-tabs-link").css("width",$(".container").width()/3-8+"px");
		$(".fl-tab1-publishMain").css("width",$(".container").width()-35+"px");
		$(".fl-tabs-link a").css("margin-left",($(".fl-tabs-link").width()-$(".fl-tabs-link a").width())/2+"px");
	})

	$("#fl-tabs").tabs({
		active:0,
	});

	// $(".fl-tab-photo").tabs({
	// 	active:0,
	// });




})