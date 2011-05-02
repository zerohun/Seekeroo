/* DO NOT MODIFY. This file was compiled Fri, 29 Apr 2011 16:16:51 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/TaggingPanel.coffee
 */

(function() {
  this.TaggingPanel = (function() {
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
}).call(this);
