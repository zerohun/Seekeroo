/* DO NOT MODIFY. This file was compiled Tue, 03 May 2011 14:37:04 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/creating_tag.coffee
 */

(function() {
  /*
    have to envolve with Rect.coffee, TaggingPanel.coffee
  */  var createSubtitleField;
  createSubtitleField = function() {};
  $(document).ready(function() {
    /^{topreventdragimageinfirefox}/;    var html_option, selectionRect, size, taggingPanel;
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
    return taggingPanel = new TaggingPanel($("div.tagbox").first(), $("a#trigger_tag"), selectionRect);
  });
}).call(this);
