(function(a){a.fn.scrollbar=function(b){b=a.extend({taille_englobe:"auto",taille_scrollbar:"auto",taille_bouton:50,pas:40,molette:true,drag:true,debug:false,style:"basic",position:"droite",alignement_scrollbar:"haut",orientation:"vertical",marge_scroll_contenu:0,largeur_scrollbar:10},b);return this.each(function(){var m=a(this);var c=b.taille_englobe;var q=b.taille_scrollbar;function f(){return b.taille_englobe-o}function d(){return b.taille_scrollbar-b.taille_bouton}function g(s){var r=(s/f())*(d());if(r<0){r=0}if(r>d()){r=d()}a("#bouton").css({top:r+"px"})}function e(s){var r=(s/d())*(f());if(r>0){r=0}if(r<f()){r=f()}a("#englobe").css({top:r+"px"})}function p(t,u){var w;var s;var v;switch(t){case"droite":a("#englobe").after('<div id="scrollbar"><div id="bouton">&nbsp;</div></div>');a("#scrollbar").css({"margin-left":b.marge_scroll_contenu+"px"});break;case"gauche":a("#englobe").before('<div id="scrollbar"><div id="bouton">&nbsp;</div></div>');a("#scrollbar").css({"margin-right":b.marge_scroll_contenu+"px"});break}switch(u){case"haut":a("#scrollbar").css({"margin-top":"0px"});break;case"centre":var r=(b.taille_englobe-b.taille_scrollbar)/2;a("#scrollbar").css({"margin-top":r+"px"});break;case"bas":var r=b.taille_englobe-b.taille_scrollbar;a("#scrollbar").css({"margin-top":r+"px"});break}}var k=0;var i=0;var o=m.height()+40;function n(){if(b.taille_englobe=="auto"){k=a("#contenu").css("padding-top");k=k.substring(0,k.length-2);i=a("#contenu").css("padding-bottom");i=i.substring(0,i.length-2);b.taille_englobe=a(window).height()-40-i-k}else{return false}}n();function h(){n();if(o>b.taille_englobe){if(b.taille_scrollbar=="auto"){b.taille_scrollbar=b.taille_englobe}if(b.taille_scrollbar>b.taille_englobe){b.taille_scrollbar=b.taille_englobe}return true}else{return false}}if(h()){window.onresize=function(){if(c=="auto"){b.taille_englobe=a(window).height()-40-i-k;m.css({height:b.taille_englobe+"px"});if(q=="auto"){b.taille_scrollbar=b.taille_englobe;a("#scrollbar").css({height:b.taille_scrollbar+"px"});g(a("#englobe").css("top").substring(0,a("#englobe").css("top").length-2));if(b.debug){j()}}}};var l=m.width();m.css({width:b.marge_scroll_contenu+b.largeur_scrollbar+l+"px"});m.wrapInner('<div id="englobe"></div>');m.css({height:b.taille_englobe+"px",overflow:"hidden",position:"relative"});a("#englobe").css({top:0+"px","float":"left",position:"relative",width:l+"px"});p(b.position,b.alignement_scrollbar);m.append('<div class="clear"></div>');a(".clear").css({clear:"both"});switch(b.style){case"basic":a("#scrollbar").css({width:b.largeur_scrollbar+"px","float":"left",height:b.taille_scrollbar+"px",background:"#ebd9b3"});a("#bouton").css({width:b.largeur_scrollbar+"px",height:b.taille_bouton+"px",background:"#cda042",top:0+"px",cursor:"pointer"});break}if(b.drag){a("#bouton").draggable({containment:"parent",axis:"y",start:function(){},drag:function(r,s){e(s.position.top);if(b.debug){j()}},stop:function(){}})}if(b.molette){m.mousewheel(function(s,u){var t=a("#englobe").css("top");t=parseInt(t.substring(0,(t.length-2)));var r=a("#bouton").css("top");r=parseInt(r.substring(0,(r.length-2)));if(u>0){t=t+b.pas;if(t>0){t=0}a("#englobe").css({top:t+"px"})}else{if(u<0){t=t-b.pas;if(t<f()){t=f()}a("#englobe").css({top:t+"px"})}}g(t);if(b.debug){j()}})}if(b.debug){m.after('<div id="debug"></div>');a("#debug").css({position:"fixed",top:"200px",right:"50px",border:"2px solid #EF9700",background:"#FFDC9F",padding:"0px"}).append('<p id="hauteurcontenu">Hauteur du contenu:'+o+"</p>").append('<p id="hauteurenglobe">Hauteur de l\'espace visible:'+b.taille_englobe+"</p>").append('<p id="hauteurscrollbar">Hauteur du srcoll:'+b.taille_scrollbar+"</p>").append('<p id="hauteurbouton">Hauteur du bouton:'+b.taille_bouton+"</p>").append('<p id="topcontenu">Top du contenu:'+m.css("top")+"</p>").append('<p id="topbouton">Top du bouton:'+a("#bouton").css("top")+"</p>").append('<p id="topmaxbouton">Top max du bouton:'+f()+"</p>").append('<p id="topmaxcontenu">Top max du contenu:'+d()+"</p>").children().css({margin:"0",padding:"5px"});function j(){a("#hauteurcontenu").html("Hauteur du contenu:"+o);a("#hauteurenglobe").html("Hauteur de l'espace visible:"+b.taille_englobe);a("#hauteurscrollbar").html("Hauteur du srcoll:"+b.taille_scrollbar);a("#hauteurbouton").html("Hauteur du bouton:"+b.taille_bouton);a("#topcontenu").html("Top du contenu:"+a("#englobe").css("top"));a("#topbouton").html("Top du bouton:"+a("#bouton").css("top"));a("#topmaxbouton").html("Top max du bouton:"+f());a("#topmaxcontenu").html("Top max du contenu:"+d())}}}else{alert("Pas de scrollbar")}})}})(jQuery);