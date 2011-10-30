$(function() {
    
  // Activate dropdown menu 
  // -----------------------------
  $('.topbar li.menu').dropdown();


  // Activate tabs menu 
  // ---------------------------------
  $('.tabs').pills();


  // Animate .fd_tut_go btn 
  // ---------------------------------
  $(".fd_tut_go").slideBackground("-96px -158px", "-65px -158px" );


  // Animate pagination btn
  // ---------------------------------
  $(".fd_pgb .fd_pgb_content .fd_pgb_left.enabled").slideBackground("-363px 0", "-439px 0", 200, 150 );
  $(".fd_pgb .fd_pgb_content .fd_pgb_right.enabled").slideBackground("-564px -5px", "-501px -5px", 200, 150 );
      
      
  // Handle displaying of admin box
	// ---------------------------------
	  $(this).click(function() {	
	    $(".fd_admin_action")
	      .removeClass('fd_admin_action_hover') 
	      .find(".fd_admin_action_content").hide();
	  });	

	  //$(".fd_admin_action ul").hide();
	
	  $(".fd_admin_action").bind("click",function(e) {
	    e.stopPropagation();
	    // Hide other action box
	    if ($(this).hasClass('fd_admin_action_hover')) {
	      $(this).find(".fd_admin_action_content").hide();
	      $(this).removeClass('fd_admin_action_hover'); 
	    }	
	    else {
	      $(".fd_admin_action")
	        .removeClass('fd_admin_action_hover') 
	        .find(".fd_admin_action_content").hide();
	      $(this).addClass('fd_admin_action_hover');
	      $(this).find(".fd_admin_action_content").show(); 
	    }  	  
	  });

  // Handle follow and unfollow acion
  // ---------------------------------
  /* $(".fd_follow_action.on").hover(
    function() {
      $(this).stop().animate({backgroundPosition : "-428px -32px"});
    },
    //callback
    function() {
      $(this).stop().animate({backgroundPosition : "-547px -32px"});
    }
  );*/
    

    
    
});
