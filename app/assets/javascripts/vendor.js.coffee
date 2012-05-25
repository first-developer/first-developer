
# --------------------------------
# ANIMATIONS METHODS
# --------------------------------

(($) ->
	
	# Sliding element to the left
	$.fn.toggleSlideLeft = (duration = 1500) ->
		w = $(this).width() # get width
		dist = '-' + w + 'px'

		if parseInt($(this).css('left')) >= 0
			$(this).animate { left: dist}, duration
			$('.fd-ui-tools').css({left: '0px'})
		else
			$(this).animate { left: '0px'}, duration
			$('.fd-ui-tools').css({left: 'none'})

	# Sliding element to the right
	$.fn.toggleSlideRight = (duration = 1500) ->
		w = $(this).width() # get width
		dist = '-' + w + 'px'

		if parseInt($(this).css("right")) >= -1
			console.log($(this).css("right") + " 1")
			$(this).animate { right: dist}, duration
		else
			console.log($(this).css("right") + " 2")
			$(this).animate { right: '-1px'}, duration

	# Toggling the slide effet on an element
	$.fn.toggleSidebar = (sidebarID, direction='left') ->
		btn = $(this)
		sb  = $(sidebarID) # 	ny sidebar

		btn.live 'click', ->
			if btn.hasClass("closed")
				btn.removeClass("closed")
				btn.addClass("opened")
			else
				btn.removeClass("opened")
				btn.addClass("closed")
			if direction is 'left'
				console.log("go left");
				sb.toggleSlideLeft()
			else
				console.log("go right");
				sb.toggleSlideRight()
		return


	return
)(jQuery)