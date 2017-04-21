$(function(){
	
	var body_width = $('body').width();
	$('#myCarousel').width(body_width);
	
	var fl_contentTop = ($('.fl-carousel-img').height() - $('.fl-content').height())/2;
	var fl_contentLeft = $('.fl-carousel-img').width()*0.1;
	$('.fl-content').css('top',fl_contentTop).css('right',fl_contentLeft);
	$('.fl-content-black').css('top',fl_contentTop).css('left',fl_contentLeft);
		
	$(window).resize(function(){
		
		body_width = $('body').width();
		$('#myCarousel').width(body_width);
		
		fl_contentTop = ($('.fl-carousel-img').height() - $('.fl-content').height())/2;
		fl_contentLeft = $('.fl-carousel-img').width()*0.1;
		$('.fl-content').css('top',fl_contentTop).css('right',fl_contentLeft);
		$('.fl-content-black').css('top',fl_contentTop).css('left',fl_contentLeft);
	})

//	$("#carousel").swipeleft(function() {
//
//	  $(this).carousel('next');
//	
//	 });
//	
//	$("#carousel").swiperight(function() {
//	
//	  $(this).carousel('prev');
//	
//	 });
	
	
})
