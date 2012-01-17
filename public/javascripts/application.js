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

  // Handle select checkbock for interest
  //---------------------------------------
  // Unchecked answer
  $(".fd_poll-item-checked").attr("checked","");
  $(".fd_poll-item-li").each(function() {
    var poll_li = $(this);
    var checked_class = "answering fd_poll-answer-checked";
    var answer = poll_li.find("input.fd_poll-item-answer");
    poll_li.find("input.fd_poll-item-answer:checked").parent().addClass(checked_class);
    
    answer.each(function(){
      var a =$(this);
      a.bind("click", function(){ 
        if (a.not(":checked")) {
          poll_li.find("input.fd_poll-item-answer").parent(".fd_poll-answer-checked")
            .removeClass(checked_class);
          a.parent().addClass(checked_class);
        }  
      });
      
    });
      
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
    
  // Handle sliding up of the comment infos 
  // ---------------------------------------
    
    var size;
    var wrap = $(".wrap");
    size = wrap.first().children().length - 1;
    var wrap_resize = $(".wrap").find(".fd-ui-list-item:lt(" + size + ")"); 
    wrap_resize.hide();
  $(".fd_comment_info_count").live("click", function() {
    var wrap_resize = $(this).parent().find(".wrap .fd-ui-list-item:lt(" + size + ")");
    var indic = $(this).find(".fd-open-and-close-indicator");
    
    wrap_resize.slideToggle({ duration:500});
     
    if ( indic.hasClass("open") ) {
      indic.removeClass("open").addClass("close");
    }
    else {
      indic.removeClass("close").addClass("open");
    }

  });
  
  // Handle the display of the reply comment form
  // ----------------------------------------------
  
  $(".fd_comment_reply_icon").live("click", function() {
    var cf = $(this).closest(".fd-ui-list-item-center").find(".fd_comment_reply_form");
    $(this).toggleClass("on");
    cf.slideToggle({ duration:200});
  });
    
  // Handle switches
  // -----------------------------------------------
  
  $(".switches").live("click", function() {
    var s = $(this);
    if (s.hasClass("on")) {
      s.removeClass("on").addClass("off");
    }
    else {
      s.removeClass("off").addClass("on");
    }
  });
  
  // Handle opacity animation on dashbord icons 
  // ----------------------------------------------
  
  /*$(".fd_user_minimalist_dashboard .fd-ui-icons li a:not(.disabled)").hover(
    function() {
      $(this).stop().fadeTo("",0.99);
    },
    function() {
      $(this).stop().fadeTo("", 0.5);
    } 
  );*/
  
  // Handle title corner 
  // ------------------------
  // for the sidebar 
  $(".fd_sidebar ").corned("10px bevel tr");
      
});
