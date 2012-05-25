(($) ->

	#$(".btn-group .btn").button()

	$(".icon-clip").bind "click", () ->
		$this = $(this)
		ct = $this.closest(".fd-ui-tl-item").find(".fd-ui-tl-item-ct")
		ct.toggle("clip")


	$(".timeline .fd-ui-btn").tooltip({placement: 'top'})


	# --------------------------------
	# PLACEHOLDERS
	# --------------------------------
	#$('input[placeholder], textarea[placeholder]').placeholder()


	# --------------------------------
	# ANIMATIONS
	# --------------------------------

	# Silding sidebar info and category sidebar
	$('.hide-sidebar').toggleSidebar '#fd-ui-sidebar-left'

	$('.hide-sidebar-info').toggleSidebar '#fd-ui-sidebar-right2', 'right'


	return

)(jQuery)