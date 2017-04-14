$(function(){
	$('.fl-diary-title').find("p").click(function(){
		$('.fl-diary-write').hide();
		$('.fl-diary').show();
	})
	
	$('.fl-writeDiary-btn').click(function(){
		$('.fl-diary-write').show();
		$('.fl-diary').hide();
	})
	
})
