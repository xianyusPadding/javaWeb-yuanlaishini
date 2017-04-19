$(function(){
	$.each($('.fl-diary-title ul li'), function(index, value) {
		$('.fl-diaryTitle').eq(index).click(function() {
			var i;
			for(i = 0; i < 8; i++) {
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
	})
	
	$('.fl-addGroup-okBtn').click(function(){
		console.log($('#dg_title').val());
		if($('#dg_title').val()==""){
			alert("分组名称不得为空！");
		}
		else{
			$('#fl-add-group').dialog('close');
		}		
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
	})
	
	$('.fl-delGroup-okBtn').click(function(){
		if($('.fl-delGroup-title').val()==""){
			alert("分组名称不得为空！");
		}
		else{
			$('#fl-del-group').dialog('close');
		}		
	})
	
	//
//	if()
//	$('.fl-diary-tab p')
	
})
