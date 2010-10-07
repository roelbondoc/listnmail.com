
/* --------------- GALLERY SLIDESHOW ------------------------ */

$(function(){
  var nextButton = $('.nextbutton'), prevButton = $('.prevbutton');

  //Remove scrollbars
  $('.sc_menu').css({overflow: 'hidden'});

	var galleryNum = $('#gallery li').size();
	var currentItem = 1;
	var temporaryLoc;
	var newLoc;
	
	nextButton.click(function() {
		if(currentItem == galleryNum - 4) {
			currentItem = 1;
			$('#gallery').animate({"left":"0px"});
		} else {
			temporaryLoc = currentItem * 95;
			newLoc = temporaryLoc - temporaryLoc - temporaryLoc;
			$('#gallery').animate({"left":newLoc});
			currentItem++;
		}
			return false;
	});
	
	prevButton.click(function() {
		if(currentItem == 1) {
			currentItem = 1;
			$('#gallery').animate({"left":"0px"});
		} else {
			temporaryLoc = currentItem * 95 - 190;
			newLoc = temporaryLoc - temporaryLoc - temporaryLoc;
			$('#gallery').animate({"left":newLoc});
			currentItem--;
		}
			return false;
	});
		
/* --------------- TOGGLE BOXES ------------------------ */

$(".toggle-body").hide();  	  
$(".toggle-head").click(function()
{
	var tb = $(this).next(".toggle-body");

	if (tb.is(':hidden')) {
		tb.slideDown('200');
		$(this).children('.toggle-icon').html('<img src="images/down.png" alt="" />');	
	} else 
	{
		tb.slideUp('200');
		$(this).children('.toggle-icon').html('<img src="images/plus.png" alt="" />');				
	}
});

/* --------------- LIGHTBOX ------------------------ */

$(function() {
	$('a.thumb').lightBox(); 
});  

/* --------------- AJAXFORM ------------------------ */

$('#ajaxform').ajaxForm({
target: '#log',
success: function(responseText) 
{
	var x = $('div.success').text().length;
	if(x>0) $('#ajaxform').slideUp('slow');	
}
});


});

