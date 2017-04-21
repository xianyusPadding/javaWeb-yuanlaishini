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
	
	//
//	if()
//	$('.fl-diary-tab p')
	
})
