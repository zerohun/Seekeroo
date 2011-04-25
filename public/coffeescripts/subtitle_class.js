/* DO NOT MODIFY. This file was compiled Mon, 25 Apr 2011 15:32:25 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/subtitle_class.coffee
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
      if (this.size < this.current) {
        this.current = this.current + 1;
      }
      return getText();
    };
    Subtitle.prototype.reset = function() {
      return this.current = 0;
    };
    Subtitle.prototype.prev = function() {
      if (this.current > 0) {
        this.current = this.current - 1;
        return getText();
      }
    };
    return Subtitle;
  })();
}).call(this);
