$(function() {
    
    // Activate dropdown menu 
    $('.topbar li.menu').dropdown();
    
    //Activate tabs menu 
    $('.tabs').tabs();
    
    //Animate .fd_tut_go btn 
    $(".fd_tut_go").bind({
      mouseover: function(){
        $(this).animate({backgroundPosition: "-65px -158px"}, 100);
      },
      mouseout:function(){
         $(this).animate({backgroundPosition: "-96px -158px"}, 100);
      }
    });
});
