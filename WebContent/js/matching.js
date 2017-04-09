$(function(){
	$(".fl-share-publishMain").css("width",$(".container").width()-35+"px");
	
	$(window).resize(function(){
		$(".fl-share-publishMain").css("width",$(".container").width()-35+"px");
	})
	
	//条件的下拉列表
	$('.fl-Select-navbar').children().find("a").click(function(){
		if($(this).next().css("display")=="none"){
			$('.fl-selectNavber2').hide();
			$(this).next().css("display","block");
		}
		else{
			$(this).next().css("display","none");
		}
	})
	
	//身高 体重 年龄的option
	var i;
	for(i = 140; i <= 210; i++)
		$('.fl-select-height').append('<option value='+i+'>' + i + '</option>');

	for(i = 30; i <= 130; i++)
		$('.fl-select-weight').append('<option  value='+i+'>' + i + '</option>');

	for(i = 18; i <= 45; i++)
		$('.fl-select-age').append('<option  value='+i+'>' + i + '</option>');
	
	//点击改变下啦列表第一个ul的值	
	//性别
	$('.fl-selectNavber2').find('select').eq(0).find('option').click(function(){
		$(this).parent().parent().parent().prev().html($(this).html());
		$(this).parent().parent().parent().hide();
	})
	//年龄
	$('.fl-selectNavber2').find('select').eq(1).find('option').click(function(){
		if($(this).html()=='不限'){
			$(this).parent().parent().parent().prev().html("身高不限");
		}
		else
			$(this).parent().parent().parent().prev().html($(this).html()+ "岁");
	})
	$('.fl-selectNavber2').find('select').eq(2).find('option').click(function(){
		var select_age=	$(this).parent().parent().parent().prev();
		if(select_age.html()<$(this).html()){
			select_age.html(select_age.html() + '-'+ $(this).html() + "岁");
		}
		else
			select_age.html(select_age.html());
		$(this).parent().parent().parent().hide();
	})
	//地址
	$('.fl-selectNavber2').find('select').eq(3).find('option').click(function(){
		$(this).parent().parent().parent().prev().html($(this).html());
	})
	$('#s_city').click(function(){
		$('.fl-selectNavber2').find('select').eq(4).find('option').click(function(){
			if($(this).parent().parent().parent().prev().html() != $(this).html()){
				$(this).parent().parent().parent().prev().html($(this).parent().parent().parent().prev().html() + $(this).html());
			}
		})
	})
	$('#s_county').click(function(){
		$('.fl-selectNavber2').find('select').eq(5).find('option').click(function(){
			$(this).parent().parent().parent().prev().html($(this).parent().parent().parent().prev().html()  + $(this).html());
			$(this).parent().parent().parent().hide();
		})
	})
	
	//身高
	$('.fl-selectNavber2').find('select').eq(6).find('option').click(function(){
		$(this).parent().parent().parent().prev().html($(this).html() + 'cm');
	})
	$('.fl-selectNavber2').find('select').eq(7).find('option').click(function(){
		if($(this).parent().parent().parent().prev().html()  > $(this).html()){
			$(this).parent().parent().parent().prev().html($(this).parent().parent().parent().prev().html());
			$(this).parent().parent().parent().hide();
		}
		else{
			$(this).parent().parent().parent().prev().html($(this).parent().parent().parent().prev().html() + '-'+ $(this).html() + 'cm');
			$(this).parent().parent().parent().hide();
		}
	})
	//薪水
	$('.fl-selectNavber2').find("button").click(function(){
		if($(this).parent().prev().find("input").eq(0).val() < $(this).parent().prev().find("input").eq(1).val()){
			$(this).parent().parent().prev().html($(this).parent().prev().find("input").eq(0).val() + '元 - ' + $(this).parent().prev().find("input").eq(1).val() + '元');
			$(this).parent().parent().hide();
		}
		else if($(this).parent().prev().find("input").eq(0).val() == ''){
			$(this).parent().parent().prev().html('薪水不限');
			$(this).parent().parent().hide();
		}
		else{
			$(this).parent().parent().prev().html($(this).parent().prev().find("input").eq(0).val() + '元以上' );
			$(this).parent().parent().hide();
		}
			
		
	})
	

//	$(window).resize(function(){
//		$('#fl-main-middle figure img').width($('#fl-main-middle figure').width() - 14 + 'px');
//	})
	
})
