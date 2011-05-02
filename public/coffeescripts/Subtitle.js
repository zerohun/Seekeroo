/* DO NOT MODIFY. This file was compiled Mon, 02 May 2011 13:26:55 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/Subtitle.coffee
 */

(function() {
  this.Subtitles = (function() {
    function Subtitles() {
      this.textlist = [];
      this.current = 0;
      this.size = 0;
    }
    Subtitles.prototype.addText = function(textdata) {
      this.textlist.push(textdata);
      return this.size = this.size + 1;
    };
    Subtitles.prototype.getText = function() {
      return this.textlist[this.current];
    };
    Subtitles.prototype.next = function() {
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
    Subtitles.prototype.reset = function() {
      return this.current = 0;
    };
    Subtitles.prototype.prev = function() {
      if (this.current > 0) {
        this.current = this.current - 1;
        return this.getText();
      }
    };
    Subtitles.prototype.pagecount = function() {
      var text;
      if (this.current === -1) {
        text = "";
      } else {
        text = "(" + (this.current + 1) + "/" + this.size + ")";
      }
      return text;
    };
    Subtitles.prototype.printSubtitle = function(page, subtitle_view, page_view) {
      if (page === "current") {
        subtitle_view.text(this.getText());
        page_view.text(this.pagecount());
      }
      if (page === "next") {
        subtitle_view.text(this.next());
        return page_view.text(this.pagecount());
      }
    };
    return Subtitles;
  })();
}).call(this);
