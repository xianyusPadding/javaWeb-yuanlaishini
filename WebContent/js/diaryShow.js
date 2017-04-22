$(function(){
	var showIndex=$('#diarySelectID').val();
	$.each($('.fl-diary-title ul li'), function(index, value) {
		var i;
		for(i = 0; i < $('.fl-diaryTitle').length; i++) {
			if(i == showIndex){
				$('.fl-diaryTitle').eq(index).parent().parent().parent().next().find('.fl-diary-tab').eq(i).show();
			}	
			else{
				$('.fl-diaryTitle').eq(index).parent().parent().parent().next().find('.fl-diary-tab').eq(i).hide();
			}
		}
	})
	$.each($('.fl-diary-title ul li'), function(index, value) {
//		$('.dropdown-menu').on('click','#fl-deleteFriend',function(){});
		$('.fl-diaryTitle').eq(index).click(function() {
			var i;
			for(i = 0; i < $('.fl-diaryTitle').length; i++) {
				if(i == index){
					$('.fl-diaryTitle').eq(index).parent().parent().parent().next().find('.fl-diary-tab').eq(i).show();
				}	
				else{
					$('.fl-diaryTitle').eq(index).parent().parent().parent().next().find('.fl-diary-tab').eq(i).hide();
				}
			}
		})
	})
	
	//添加分组
	$('#fl-add-group').dialog({
		title:'添加分组',
		maxWidth:300,
		autoOpen:false,
	})
	
	$('.fl-addGroup-btn').click(function(){
		$('#fl-add-group').dialog('open');
		$('#fl-del-group').dialog('close');
		return false;
	})
	
	$('.fl-addGroup-okBtn').click(function(){
		var _this=$('.fl-addGroup-okBtn');
		if(_this.prev().prev().prev().prev().prev().val()==""){
			alert("分组名称不得为空！");
			return false;
		}
		else{
			$('#fl-add-group').dialog('close');
		}	
		return true;
	})
	
	//删除分组
	$('#fl-del-group').dialog({
		title:'删除分组',
		maxWidth:300,
		autoOpen:false,
	})
	
	$('.fl-delGroup-btn').click(function(){
		$('#fl-del-group').dialog('open');
		$('#fl-add-group').dialog('close');
		return false;
	})
	
	$('.fl-delGroup-okBtn').click(function(){
		if($('.fl-delGroup-title').val()==""){
			alert("分组名称不得为空！");
			return false;
		}
		else{
			$('#fl-del-group').dialog('close');
		}		
	})
	
	$('#fl-diary-select').on('change',function(){
		var dg_id=$(this).val();
		var u_id=$('#uid').val();
		$.ajax({
			type:'POST',
			url:'diarySelectServlet',
			data:{
				dg_id:dg_id,
				u_id:u_id
			},
			success:function(response){
				$('.fl-right ul').html(response);
			},
		})
	})
	
	$('#fl-diary-select').find('option').each(function(){
		var _this =$(this);
		if(_this.val()==$('#SelectGp').val()){
			_this.attr("selected","selected");
		}
	})
	
	//设置内容文本的高度
	var fl_diary_p = $('.fl-diary-tab p').height();
	if(fl_diary_p < 400)
		$('.fl-diary-tab p').height("400");
	else
		$('.fl-diary-tab p').height(fl_diary_p);
		
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
});

