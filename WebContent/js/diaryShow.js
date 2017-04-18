$(function(){
	$.each($('.fl-diary-title ul li'), function(index, value) {
		$('.fl-diary-title ul li').eq(index).click(function() {
			var i;
			for(i = 0; i < 8; i++) {
				if(i == index){
					$('.fl-diary').show();
					$('.fl-diary-title ul li').eq(index).parent().parent().parent().next().find('.fl-diary-tab').eq(i).show();
				}	
				else{
					$('.fl-diary-title ul li').eq(index).parent().parent().parent().next().find('.fl-diary-tab').eq(i).hide();
					$('.fl-diary-write').hide();
				}
			}
		})
	})

	
	$('.fl-writeDiary-btn').click(function(){
		$('.fl-diary-write').show();
		$('.fl-diary').hide();
	})
	
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
		if($('.fl-addGroup-title').val()==""){
			alert("分组名称不得为空！");
		}
		else{
			$('#fl-add-group').dialog('close');
		}		
	})
	
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
	
})
