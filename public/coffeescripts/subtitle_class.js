/* DO NOT MODIFY. This file was compiled Tue, 26 Apr 2011 05:01:35 GMT from
 * /home/zerohun/rails_apps/Fingeroo/app/coffeescripts/subtitle_class.coffee
 */

(function() {
  var Subtitle;
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
      if (this.size - 1 > this.current) {
        this.current = this.current + 1;
      } else {
        this.current = 0;
      }
      return this.getText();
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
      return "(" + (this.current + 1) + "/" + this.size + ")";
    };
    return Subtitle;
  })();
  $(document).ready(function() {
    var subtitles;
    subtitles = new Subtitle();
    $("subtitle").filter(function(index) {
      return subtitles.addText($("subtitle#" + index).data("text"));
    });
    $("div#subtitle_view p").text(subtitles.getText());
    $("div#subtitle_page_count p").text(subtitles.pagecount());
    return $("a#nextsubtitle").click(function(event) {
      event.preventDefault();
      $("div#subtitle_view p").text(subtitles.next());
      return $("div#subtitle_page_count p").text(subtitles.pagecount());
    });
  });
}).call(this);
