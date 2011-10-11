/* ============================================================
 * bootstrap-dropdown.js v1.3.0
 * http://twitter.github.com/bootstrap/javascript.html#dropdown
 * ============================================================
 * Copyright 2011 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */


!function( $ ){

  var d = 'a.menu, .dropdown-toggle';

  function clearMenus() {
    $(d).parent('li').removeClass('open');
  }

  $(function () {
    $('html').bind("click", clearMenus);
    $('body').dropdown( '[data-dropdown] a.menu, [data-dropdown] .dropdown-toggle' );
  });

  /* DROPDOWN PLUGIN DEFINITION
   * ========================== */

  $.fn.dropdown = function ( selector ) {
    return this.each(function () {
      $(this).delegate(selector || d, 'click', function (e) {
        var li = $(this).parent('li')
          , isActive = li.hasClass('open');

        clearMenus();
        !isActive && li.toggleClass('open');
        return false;
      })
    })
  }

}( window.jQuery || window.ender );


/* ========================================================
 * bootstrap-tabs.js v1.3.0
 * http://twitter.github.com/bootstrap/javascript.html#tabs
 * ========================================================
 * Copyright 2011 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ======================================================== */


!function( $ ){

  function activate ( element, container ) {
    container.find('.active').removeClass('active')
    element.addClass('active')
  }

  function tab( e ) {
    var $this = $(this)
      , href = $this.attr('href')
      , $ul = $this.closest('ul')
      , $controlled

    if (/^#\w+/.test(href)) {
      e.preventDefault()

      if ($this.hasClass('active')) {
        return
      }

      $href = $(href)

      activate($this.parent('li'), $ul)
      activate($href, $href.parent())
    }
  }


 /* TABS/PILLS PLUGIN DEFINITION
  * ============================ */

  $.fn.tabs = $.fn.pills = function ( selector ) {
    return this.each(function () {
      $(this).delegate(selector || '.tabs li > a, .pills > li > a', 'click', tab)
    })
  }

  $(document).ready(function () {
    $('body').tabs('ul[data-tabs] li > a, ul[data-pills] > li > a')
  })

}( window.jQuery || window.ender );

/**
 * @author Alexander Farkas
 * v. 1.22
 */


(function($) {
	if(!document.defaultView || !document.defaultView.getComputedStyle){ // IE6-IE8
		var oldCurCSS = $.curCSS;
		$.curCSS = function(elem, name, force){
			if(name === 'background-position'){
				name = 'backgroundPosition';
			}
			if(name !== 'backgroundPosition' || !elem.currentStyle || elem.currentStyle[ name ]){
				return oldCurCSS.apply(this, arguments);
			}
			var style = elem.style;
			if ( !force && style && style[ name ] ){
				return style[ name ];
			}
			return oldCurCSS(elem, 'backgroundPositionX', force) +' '+ oldCurCSS(elem, 'backgroundPositionY', force);
		};
	}
	
	var oldAnim = $.fn.animate;
	$.fn.animate = function(prop){
		if('background-position' in prop){
			prop.backgroundPosition = prop['background-position'];
			delete prop['background-position'];
		}
		if('backgroundPosition' in prop){
			prop.backgroundPosition = '('+ prop.backgroundPosition;
		}
		return oldAnim.apply(this, arguments);
	};
	
	function toArray(strg){
		strg = strg.replace(/left|top/g,'0px');
		strg = strg.replace(/right|bottom/g,'100%');
		strg = strg.replace(/([0-9\.]+)(\s|\)|$)/g,"$1px$2");
		var res = strg.match(/(-?[0-9\.]+)(px|\%|em|pt)\s(-?[0-9\.]+)(px|\%|em|pt)/);
		return [parseFloat(res[1],10),res[2],parseFloat(res[3],10),res[4]];
	}
	
	$.fx.step. backgroundPosition = function(fx) {
		if (!fx.bgPosReady) {
			var start = $.curCSS(fx.elem,'backgroundPosition');
			if(!start){//FF2 no inline-style fallback
				start = '0px 0px';
			}
			
			start = toArray(start);
			fx.start = [start[0],start[2]];
			var end = toArray(fx.end);
			fx.end = [end[0],end[2]];
			
			fx.unit = [end[1],end[3]];
			fx.bgPosReady = true;
		}
		//return;
		var nowPosX = [];
		nowPosX[0] = ((fx.end[0] - fx.start[0]) * fx.pos) + fx.start[0] + fx.unit[0];
		nowPosX[1] = ((fx.end[1] - fx.start[1]) * fx.pos) + fx.start[1] + fx.unit[1];           
		fx.elem.style.backgroundPosition = nowPosX[0]+' '+nowPosX[1];

	};
})(jQuery);

  
/**
 * jQuery sound plugin (no flash)
 * 
 * port of script.aculo.us' sound.js (http://script.aculo.us), based on code by Jules Gravinese (http://www.webveteran.com/) 
 * 
 * Copyright (c) 2007 Jörn Zaefferer (http://bassistance.de) 
 * 
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *   
 * $Id$
 */

/**
 * API Documentation
 * 
 * // play a sound from the url
 * $.sound.play(url)
 * 
 * // play a sound from the url, on a track, stopping any sound already running on that track
 * $.sound.play(url, {
 *   track: "track1"
 * });
 * 
 * // increase the timeout to four seconds before removing the sound object from the dom for longer sounds
 * $.sound.play(url, {
 *   timeout: 4000
 * });
 * 
 * // stop a sound by removing the element returned by play
 * var sound = $.sound.play(url);
 * sound.remove();
 * 
 * // disable playing sounds
 * $.sound.enabled = false;
 * 
 * // enable playing sounds
 * $.sound.enabled = true
 */

(function($) {
  
$.sound = {
  tracks: {},
  enabled: true,
  template: function(src) {
          return '<embed style="height:0" loop="false" src="' + src + '" autostart="true" hidden="true"/>';
  },
  play: function(url, options){
          if (!this.enabled)
                  return;
          var settings = $.extend({
                  url: url,
                  timeout: 2000
          }, options);
          
          if (settings.track) {
                  if (this.tracks[settings.track]) {
                          var current = this.tracks[settings.track];
                          // TODO check when Stop is avaiable, certainly not on a jQuery object
                          current.Stop && current.Stop();
                          current.remove();  
                  }
          }
          
          var element = $.browser.msie
                  ? $('<bgsound/>').attr({
                  src: settings.url,
                          loop: 1,
                          autostart: true
                })
                  : $(this.template(settings.url));
                  
          element.appendTo("body");
          
          if (settings.track) {
                  this.tracks[settings.track] = element;
          }
          
          setTimeout(function() {
                  element.remove();
          }, options.timeout)
          
          return element;
  }
};
})(jQuery); 
  
  
(function($) {
  // ==================================================
  //  Extend Jquery with plugins 
  // ==================================================
  
  // SlideBackground: to slide the background image of an element
  // -------------------------------------------------------------
  $.fn.slideBackground = function(defaultPos,slidePos, start_duration, end_duration) {
    start_duration=  start_duration || 150;
    end_duration=  end_duration || 100;
    var elt =$(this);
    elt.bind({
      mouseover: function(){
      $(this).animate({backgroundPosition: slidePos}, start_duration);
      },
      mouseout:function(){
         $(this).animate({backgroundPosition: defaultPos}, end_duration);
      } 
    });
  }
  
  
  // Show slide effect with direction options
  // -------------------------------------------
  $.fn.showSlideAndUpdateCredit = function ( direction, duration, credit) {
    // set credit if null
    credit = credit || Math.floor(Math.random()*1000);
    
    var elt = $(this);
    
    // remove audio player container
    $('#jpId').remove();
    
    // sliding animation and update credit
    elt.hide("slide", {direction:direction},duration, function() {
      elt
        .show("slide", {direction:direction},duration+100, function () {        
          // Play the audio sound
          $('<div id="jpId"></div>')
            .appendTo("body")
            .jPlayer({ ready: function() {$(this).jPlayer("setMedia", { mp3: "../songs/sound1.mp3"}); },swfPath: "/javascripts"});  
          $("#jpId").bind($.jPlayer.event.ready, function() {
            elt.find(".large-bande").html(credit);
            $(this).jPlayer("play");  
          });
          
        });
        
    });
    
    
  }
  
})(jQuery);
