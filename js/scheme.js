function endsWith(str, suffix) {
	return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function pinclick(no) {
	$(".scheme_pushpin, .wr_scheme_item_title, .scheme_item_description")
			.each(function(index) {
				var id = $(this).attr('id');
				if (endsWith(id, "_" + no)) {
					$(this).removeClass("non_active_pin");
					$(this).addClass("active_pin");
				}else{
					$(this).removeClass("active_pin");
					$(this).addClass("non_active_pin");
				}
			});
	$(".scheme_pushpin.non_active_pin").fadeTo("fast",0.0, function(){
		$(".scheme_pushpin.non_active_pin").css("display","none");
	});

	$(".wr_scheme_item_title.non_active_pin").fadeTo("slow",0.6);
	$("#scheme_entire_page_text").css("display","none");
	$(".scheme_item_description.non_active_pin").css("opacity",0.0);
	$(".scheme_pushpin.active_pin, .wr_scheme_item_title.active_pin").fadeTo("slow",1.0);
        $(".scheme_item_description.non_active_pin").fadeTo(200,0.0, 
		function(){
		 $(".scheme_item_description.non_active_pin").css("display","none");
		});
	$(".scheme_item_description.active_pin").css("display","block");
	$(".scheme_item_description.active_pin").fadeTo(300,1.0);
	$(".scheme_item_description.active_pin").css("display","block");
}

function showAllPins(){
	$(".scheme_pushpin").css("display","block");
	$(".scheme_pushpin, .wr_scheme_item_title").fadeTo("slow",1.0);
	$(".scheme_item_description").fadeTo(200,0.0);
	$("#scheme_entire_page_text").css("opacity", 0);
	$("#scheme_entire_page_text").css("display", "block");
	$("#scheme_entire_page_text").fadeTo(300,1.0);
}
