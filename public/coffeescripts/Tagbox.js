/* DO NOT MODIFY. This file was compiled Tue, 03 May 2011 14:20:31 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/Tagbox.coffee
 */

(function() {
  this.Tagbox = (function() {
    function Tagbox(param) {
      var id;
      id = param["id"];
      this.tagbox = $("div.tagbox#" + id);
      this.left = this.tagbox.data("left");
      this.top = this.tagbox.data("top");
      this.width = this.tagbox.data("width");
      this.height = this.tagbox.data("height");
      this.subtitles = param["subtitles"];
      this.subtitle_view = param["subtitle_view"];
      this.page_view = param["page_view"];
      this.draw();
      this.initClickEvent();
    }
    Tagbox.prototype.draw = function() {
      this.tagbox.css("left", this.left);
      this.tagbox.css("top", this.top);
      this.tagbox.css("width", "" + this.width + "px");
      this.tagbox.css("height", "" + this.height + "px");
      return this.tagbox.data("isDraw", "true");
    };
    Tagbox.prototype.isDraw = function() {
      var result;
      result = false;
      if ($("div.tagbox#" + this.id).data("isDraw") === "true") {
        result = true;
      }
      return result;
    };
    Tagbox.prototype.initClickEvent = function() {
      var page_view, subtitle_view, subtitles;
      subtitles = this.subtitles;
      subtitle_view = this.subtitle_view;
      page_view = this.page_view;
      this.subtitles.print("next", this.subtitle_view, this.page_view);
      return this.tagbox.click(function(event) {
        event.preventDefault();
        return subtitles.print("next", subtitle_view, page_view);
      });
    };
    return Tagbox;
  })();
}).call(this);
