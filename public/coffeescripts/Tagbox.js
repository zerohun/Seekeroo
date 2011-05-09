/* DO NOT MODIFY. This file was compiled Mon, 09 May 2011 09:41:23 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/Tagbox.coffee
 */

(function() {
  this.Tagbox = (function() {
    function Tagbox(sx, sy, ex, ey, subtitles, id) {
      this.sx = sx;
      this.sy = sy;
      this.ex = ex;
      this.ey = ey;
      this.subtitles = subtitles;
      this.id = id;
      this.is_draw = false;
    }
    Tagbox.prototype.draw = function(context) {
      var height, width;
      width = this.ex - this.sx;
      height = this.ey - this.sy;
      context.strokeStyle = "grey";
      context.lineWidth = 5;
      context.strokeRect(this.sx, this.sy, width, height);
      return this.is_draw = true;
    };
    Tagbox.prototype.isDraw = function() {
      return this.is_draw;
    };
    Tagbox.prototype.isInside = function(x, y) {
      return x >= this.sx && x <= this.ex && y >= this.sy && y <= this.ey;
    };
    Tagbox.prototype.getID = function() {
      return this.id;
    };
    Tagbox.prototype.printSubtitles = function(subtitle_view, page_view) {
      return this.subtitles.print("next", subtitle_view, page_view);
    };
    return Tagbox;
  })();
}).call(this);
