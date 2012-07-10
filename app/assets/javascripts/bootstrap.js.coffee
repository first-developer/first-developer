(($) ->

	# --------------------------------
	# GLOBALS
	# --------------------------------
	isClipped = false


	# --------------------------------
	# TOOLTIPS
	# --------------------------------
	# 1.
	$(".timeline .fd-ui-btn").tooltip({ placement: 'top'})


	# --------------------------------
	# PLACEHOLDERS
	# --------------------------------
	# 1.
	#$('input[placeholder], textarea[placeholder]').placeholder()


	# --------------------------------
	# ANIMATIONS
	# --------------------------------
	# 1. Sliding sidebar info and category sidebar
	$('.hide-sidebar')			.toggleSidebar 		'#fd-ui-sidebar-left'
	$('.hide-sidebar-info')		.toggleSidebar 		'#fd-ui-sidebar-right2', 'right'
	$('#fd-ui-sidebar-right2')	.toggleSlideRight 	0

	# 2. Handle cliping of timeline items	
	$(".icon-clip").bind "click", () ->
		$this = $(this)
		ct = $this.closest(".fd-ui-tl-item").find ".fd-ui-tl-item-ct"
		ct.toggle "blind", {easing: "easeOutExpo"}, 800
		$this.toggleClass "on"

	# 3. Animation the background image when mouse is hover the clip button
	$(".icon-clip").mouseover () ->
		$this = $(this)
		if not $this.hasClass("on")
			$this.stop().animate({backgroundPosition: "-5px -749px"}, "fast")
	
	$(".icon-clip").mouseout () ->
		$this = $(this)
		if not $this.hasClass("on")
			$this.stop().animate({backgroundPosition: "-5px -723px"}, "fast")


	# --------------------------------
	# SELECT2
	# --------------------------------
	# 1.
	$(".entry-category-slot").select2
		tags: [],
		placeholder: "Which category ?",
		width: "94%"
	# fixing issues with empty value of tag
	if $(".select2-search-choice").text() is "[]" then $(".select2-search-choice").remove()


	

	# --------------------------------
	# AUTOSIZE TEXTAREA
	# --------------------------------
	# 1. body entry
	$("textarea.body-for-content-slot").autogrow()
	#$('textarea').autosize()


	# --------------------------------
	# NOTIFICATIONS
	# --------------------------------
	# 1. Handle closing of the notification area
	$("div.#notification_area").find("i.flash-close").live "click", () ->
			parent = $(this).closest("div#notification_area") 
			parent.slideUp 400, () -> 
				parent.remove()	




	return

)(jQuery)