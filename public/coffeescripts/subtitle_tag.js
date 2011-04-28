/* DO NOT MODIFY. This file was compiled Thu, 28 Apr 2011 14:07:41 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/subtitle_tag.coffee
 */

(function() {
  var Rect, TaggingPanel;
  TaggingPanel = (function() {
    function TaggingPanel(panel, startButton, selectionBox) {
      this.ismousedown = false;
      $("body").append("<div id='debugbox'> </div>");
      startButton.click(function() {
        panel.unbind('click');
        return panel.mouseup(function(event) {
          this.ismousedown = false;
          return $("div#debugbox").text("up");
        }).mousedown(function(event) {
          this.ismousedown = true;
          this.startX = event.pageX;
          this.startY = event.pageY;
          return $("div#debugbox").text("down");
        }).mousemove(function(event) {
          var endX, endY;
          if (this.ismousedown) {
            endX = event.pageX;
            endY = event.pageY;
            return selectionBox.setPoint(this.startX, this.startY, endX, endY);
          }
        }).mouseleave(function(event) {
          this.ismousedown = false;
          return $("div#debugbox").text("leave");
        });
      });
    }
    return TaggingPanel;
  })();
  Rect = (function() {
    function Rect(html_option, target) {
      this.style = {};
      this.html_option = html_option;
      this.div_id = this.html_option["id"];
      this.div_class = this.html_option["class"];
      target.append("<div id=" + this.div_id + " class=" + this.div_class + "></div>");
      this.hide();
    }
    Rect.prototype.applyStyle = function() {
      var key, value, _ref;
      _ref = this.style;
      for (key in _ref) {
        value = _ref[key];
        $("div#" + this.div_id).css(key, value);
      }
      return $("div#" + this.div_id).css("position", "absolute");
    };
    Rect.prototype.setLocation = function(x, y) {
      this.style["left"] = x;
      return this.style["top"] = y;
    };
    Rect.prototype.getLocation = function() {
      return [this.style["left"], this.style["top"]];
    };
    Rect.prototype.setSize = function(width, height) {
      this.style["width"] = width;
      return this.style["height"] = height;
    };
    Rect.prototype.getSize = function() {
      return [this.style["width"], this.style["height"]];
    };
    Rect.prototype.setPoint = function(startX, startY, endX, endY) {
      var height, left, top, width;
      if (startX < endX) {
        left = startX;
        width = endX - startX;
      } else {
        left = endX;
        width = startX - endX;
      }
      if (startY < endY) {
        top = startY;
        height = endY - startY;
      } else {
        top = endY;
        height = startY - endY;
      }
      this.style["left"] = left;
      this.style["top"] = top;
      this.style["width"] = width;
      this.style["height"] = height;
      return this.applyStyle();
    };
    Rect.prototype.show = function() {
      $("div#" + this.div_id).css("visibility", "visible");
      return this.applyStyle();
    };
    Rect.prototype.hide = function() {
      $("div#" + this.div_id).css("visibility", "hidden");
      return this.applyStyle();
    };
    return Rect;
  })();
  $(document).ready(function() {
    var html_option, selectionRect, size, taggingPanel;
    $("img#showimage").mousedown(function(event) {
      return event.preventDefault();
    });
    size = {
      width: $("img#showimage").data("width"),
      height: $("img#showimage").data("height")
    };
    $("div#image_view").css("width", size["width"]);
    html_option = {
      id: "selection_rectangle",
      "class": "selection_rectangle"
    };
    selectionRect = new Rect(html_option, $("div#image_view"));
    selectionRect.show();
    return taggingPanel = new TaggingPanel($("div#image_view"), $("a#trigger_tag"), selectionRect);
  });
}).call(this);
