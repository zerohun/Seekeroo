/* DO NOT MODIFY. This file was compiled Wed, 04 May 2011 00:54:25 GMT from
 * /home/zerohun/rails_apps/Fingeroo/app/coffeescripts/subtitle_class.coffee
 */

(function() {
  var Subtitle, printSubtitle;
  Subtitle = (function() {
    function Subtitle() {
      this.textlist = [];
      this.current = 0;
      this.size = 0;
    }
    Subtitle.prototype.addText = function(textdata) {
      this.textlist.push(textdata);
      return this.size = this.size + 1;
    };
    Subtitle.prototype.getText = function() {
      return this.textlist[this.current];
    };
    Subtitle.prototype.next = function() {
      var text;
      if (this.size - 1 > this.current) {
        this.current = this.current + 1;
        text = this.getText();
      } else {
        this.current = -1;
        text = "";
      }
      return text;
    };
    Subtitle.prototype.reset = function() {
      return this.current = 0;
    };
    Subtitle.prototype.prev = function() {
      if (this.current > 0) {
        this.current = this.current - 1;
        return this.getText();
      }
    };
    Subtitle.prototype.pagecount = function() {
      var text;
      if (this.current === -1) {
        text = "";
      } else {
        text = "(" + (this.current + 1) + "/" + this.size + ")";
      }
      return text;
    };
    return Subtitle;
  })();
  printSubtitle = function(subtitle_list, page) {
    if (page === "current") {
      $("div#subtitle_view p").text(subtitle_list.getText());
      $("div#subtitle_page_count p").text(subtitle_list.pagecount());
    }
    if (page === "next") {
      $("div#subtitle_view p").text(subtitle_list.next());
      return $("div#subtitle_page_count p").text(subtitle_list.pagecount());
    }
  };
  $(document).ready(function() {
    var image_height, image_width, ismousedown, startX, startY, subtitles;
    subtitles = new Subtitle();
    $("subtitle").filter(function(index) {
      return subtitles.addText($("subtitle#" + index).data("text"));
    });
    printSubtitle(subtitles, "current");
    $("a#nextsubtitle").click(function(event) {
      event.preventDefault();
      return printSubtitle(subtitles, "next");
    });
    $("body").onselectstart = "return false;";
    $.fn.disableSelection = function() {
      return $(this).attr('unselectable', 'on').css('-moz-user-select', 'none').each(function() {
        return this.onselectstart = function() {
          return false;
        };
      });
    };
    $("div#image_view").append("<div id='selected' class='selected'></div>");
    $("div#image_view").append("<div id='area_rectangle' class='area_rectangle'></div>");
    $("div#image_view").append("<div id='debugbox'></div>");
    image_width = $("img#showimage").data("width");
    image_height = $("img#showimage").data("height");
    $("div#image_view").css("width", "" + image_width + "px");
    $("div#image_view").css("height", "" + image_height + "px");
    ismousedown = false;
    startX = 0;
    startY = 0;
    return $("a#trigger_tag").click(function(event) {
      event.preventDefault();
      $("a#nextsubtitle").unbind('click');
      $("a#nextsubtitle").click(function(event) {
        $("div#selected").css("left", "" + event.pageX + "px");
        $("div#selected").css("top", "" + event.pageY + "px");
        $("div#selected").css("width", "100px");
        $("div#selected").css("height", "100px");
        return $("div#debugbox").text("click");
      });
      $("div#image_view").mouseup(function(event) {
        ismousedown = false;
        return $("div#debugbox").text("up");
      }).mousedown(function(event) {
        ismousedown = true;
        startX = event.pageX;
        startY = event.pageY;
        $("div#area_rectangle").css("left", "" + startX + "px");
        $("div#area_rectangle").css("top", "" + startY + "px");
        $("div#area_rectangle").css("width", "0px");
        $("div#area_rectangle").css("height", "0px");
        return $("div#debugbox").text("down");
      }).mouseleave(function(event) {
        $("div#debugbox").text("leave");
        return ismousedown = false;
      });
      return $("div#image_view").mousemove(function(event) {
        var height, width;
        if (ismousedown === true) {
          width = event.pageX - startX;
          height = event.pageY - startY;
          if (width < 0) {
            $("div#area_rectangle").css("left", "" + event.pageX + "px");
            $("div#area_rectangle").css("width", "" + (-width) + "px");
          } else {
            $("div#area_rectangle").css("width", "" + width + "px");
          }
          if (height < 0) {
            $("div#area_rectangle").css("top", "" + event.pageY + "px");
            $("div#area_rectangle").css("height", "" + (-height) + "px");
          } else {
            $("div#area_rectangle").css("height", "" + height + "px");
          }
          return $("div#debugbox").text("width:" + width + "  height:" + height);
        }
      });
    });
  });
}).call(this);
