/* DO NOT MODIFY. This file was compiled Thu, 28 Apr 2011 05:25:16 GMT from
 * /home/zerohun/rails_apps/Fingeroo/app/coffeescripts/subtitle_view.coffee
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
    var subtitles;
    subtitles = new Subtitle();
    $("subtitle").filter(function(index) {
      return subtitles.addText($("subtitle#" + index).data("text"));
    });
    printSubtitle(subtitles, "current");
    return $("div#image_view").click(function(event) {
      event.preventDefault();
      return printSubtitle(subtitles, "next");
    });
  });
}).call(this);
