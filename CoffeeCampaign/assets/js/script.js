$(document).ready(function(){
	$('.example').mouseenter(function(){
		$('.card').addClass('cardvisible');
	});

	$('.example').mouseleave(function(){
		$('.card').removeClass('cardvisible');
	});
});