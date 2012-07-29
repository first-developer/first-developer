(($) ->

	# --------------------------------
	# GLOBALS
	# --------------------------------
	isClipped 		 = false
	DEFAULT_DURATION = 800
	SHOT_MIN_HEIGHT  = "50px"


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


	# 4. Show and hide entry images
	$(".paperclip").each () ->
		parent 		  = $(this).parent 	"div"
		shot 		  = parent .find  	"img"
		parent_height = "#{parent.height()}px"
		paperclip 	  = $(this)
		console.log parent.height()
		paperclip.click () ->
			if paperclip.hasClass "expandable"
				parent.animate {height: parent_height}, DEFAULT_DURATION, "easeInOutCirc", showShotCalllback
				paperclip.removeClass "expandable"
			else
				paperclip.addClass "expandable"
				parent.animate {height: SHOT_MIN_HEIGHT}, DEFAULT_DURATION, "easeInOutCirc", hideShotCalllback

		showShotCalllback = () ->
			shot.fadeIn()
		hideShotCalllback = () ->
			shot.hide()
		return



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
	$("textarea.cmt-user-text").autogrow()
	#$('textarea').autosize()


	# --------------------------------
	# NOTIFICATIONS
	# --------------------------------
	# 1. Handle closing of the notification area
	$("div.#notification_area").find("i.flash-close").live "click", () ->
    parent = $(this).closest("div#notification_area") 
		  parent.slideUp 400, () -> 
		    parent.remove()	



  $(".type-input-choice").each =>
    $this = $(this)
    $this.bind "click", ->
      label = $(this).prev	"label.choice-label"
      if $this.is ":checked" 
        label .addClass	   "on"	
        $(".type-input-choice").not(":checked").prev().removeClass "on"	
	

	# --------------------------------
	# SIRI & SPEECH FEATURE
	# --------------------------------

	# Siri feature 
  $("#fd-siri").bind "click", ->
    $("#jpId").remove()
    $("<div id=\"jpId\"></div>").appendTo("body").jPlayer
      ready: ->
    	  $(this).jPlayer "setMedia",
    		  mp3: "assets/siri_sound.mp3"

      swfPath: "assets/Jplayer.swf"

    $("#jpId").bind $.jPlayer.event.ready, ->
      $(this).jPlayer "play"    
    
  
	
  return  

)(jQuery)
