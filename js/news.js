function endsWith(str, suffix) {
	return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function selectNews(no){
	var curActiveId = $(".shownNewsItem").first().attr("id");
	if (!(curActiveId === undefined))
		if (endsWith(curActiveId, no))
		return;

	$(".wr_news_full").each(function(index){
		console.log($(this));
		if (endsWith($(this).attr("id"),no)){
			$(this).removeClass("hidenNewsItem");
			$(this).addClass("shownNewsItem");
		}
		else{
			$(this).addClass("hidenNewsItem");
			$(this).removeClass("shownNewsItem");
		}
	});
	$(".hidenNewsItem").fadeTo(300,0.0, function(){
		$(".hidenNewsItem").css("display","none");
		$(".shownNewsItem").fadeTo(400,1.0);
	});
	$(".hidenNewsItem .galleria").removeClass("galleria");
	$(".shownNewsItem>.wr_galery>div:first-child").addClass("galleria");
	Galleria.run(".galleria");
}
