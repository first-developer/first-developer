(($) ->


	# --------------------------------
	# TOOLTIPS
	# --------------------------------
	# 1.
	$(".timeline .fd-ui-btn").tooltip({placement: 'top'})


	# --------------------------------
	# PLACEHOLDERS
	# --------------------------------
	# 1.
	#$('input[placeholder], textarea[placeholder]').placeholder()


	# --------------------------------
	# ANIMATIONS
	# --------------------------------
	# 1. Silding sidebar info and category sidebar
	$('.hide-sidebar').toggleSidebar '#fd-ui-sidebar-left'
	$('.hide-sidebar-info').toggleSidebar '#fd-ui-sidebar-right2', 'right'

	# 2. Handle cliping of timeline items	
	$(".icon-clip").bind "click", () ->
		$this = $(this)
		ct = $this.closest(".fd-ui-tl-item").find(".fd-ui-tl-item-ct")
		ct.toggle("clip")

	# --------------------------------
	# SELECT2
	# --------------------------------
	# 1.
	$(".entry-category-slot").select2
		placeholder: "Which category ?",
		width: "94%"

	# 2.
	$(".entry-tags-slot").select2
		tags:["programming", "other", "jQuery"],
		width: "94%"
	

	# --------------------------------
	# AUTOSIZE TEXTAREA
	# --------------------------------
	# 1. body entry
	$("textarea.body-for-content-slot").autogrow()
	#$('textarea').autosize()


	return

)(jQuery)