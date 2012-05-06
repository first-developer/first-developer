jQuery ->
	#$("a[rel=popover]").popover()
	#$(".tooltip").tooltip()
	#$("a[rel=tooltip]").tooltip()
	$(".icon-clip").bind "click", () ->
		$this = $(this)
		ct = $this.closest(".fd-ui-tl-item").find(".fd-ui-tl-item-ct")
		ct.toggle("clip")

	options = {
		placement: 'top'
	}
	$(".timeline .fd-ui-btn").tooltip(options)