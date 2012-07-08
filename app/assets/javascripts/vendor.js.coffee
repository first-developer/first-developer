
# --------------------------------
# PLUGINS & HELPERS
# --------------------------------

(($) ->

	# --------------------------------
	# Animations & easing
	# --------------------------------
	
	# Sliding element to the left
	$.fn.toggleSlideLeft = (duration = 1000, easing = 'easeInOutExpo') ->
		sb = $(this)

		sb.removeClass "sidebar-closed" 
		
		w = sb.width() # get width
		dist = "-#{w}px"

		if parseInt($(this).css('left')) >= 0
			sb.animate { left: dist}, duration, easing
			$('.fd-ui-tools').css({left: '0px'})
		else
			sb.animate { left: '0px'}, duration, easing
			$('.fd-ui-tools').css({left: 'none'})
		return

	# Sliding element to the right
	$.fn.toggleSlideRight = (duration = 1000, easing = 'easeInOutExpo') ->
		sb = $(this)

		sb.removeClass "sidebar-closed" 

		w = sb.width() 	# get width
		dist = "-#{w}px"

		if parseInt($(this).css("right")) >= -1  	# Closed
			sb.animate { right: dist}, duration, easing
		else										# opened	
			sb.animate { right: '-1px'}, duration, easing
		return

	# Toggling the slide effet on an element
	$.fn.toggleSidebar = (sidebarID, direction='left') ->
		btn = $(this)
		sb  = $(sidebarID) # 	ny sidebar

		sb.show if not sb.is ":hidden"

		btn.live 'click', ->
			if btn.hasClass("closed")
				btn.removeClass("closed")
				btn.addClass("opened")
			else
				btn.removeClass("opened")
				btn.addClass("closed")
			if direction is 'left'
				sb.toggleSlideLeft()
			else
				sb.toggleSlideRight()
			return
		return


	# --------------------------------
	# Checkboxes
	# --------------------------------

	$.fn.beCheckable = () ->
		return




)(jQuery)