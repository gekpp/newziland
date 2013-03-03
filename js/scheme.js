function endsWith(str, suffix) {
	return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function pinclick(no) {
	$(".scheme_pushpin", ".wr_scheme_item_title", ".scheme_item_description")
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
}