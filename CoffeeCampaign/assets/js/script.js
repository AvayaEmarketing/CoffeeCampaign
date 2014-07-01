$(document).ready(function(){
	$('.example').mouseenter(function(){
		$('.card').addClass('cardvisible');
	});

	$('.example').mouseleave(function(){
		$('.card').removeClass('cardvisible');
	});

	$('.firstcamp').mouseenter(function(){
		$(this).addClass('campdown');
	});

	$('.firstcamp').mouseleave(function(){
		$(this).removeClass('campdown');
	});

	
});