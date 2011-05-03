/* DO NOT MODIFY. This file was compiled Tue, 03 May 2011 14:35:30 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/subtitle_tag.coffee
 */

(function() {
  $(document).ready(function() {
    /^{topreventdragimageinfirefox}/;    var html_option, selectionRect, size, taggingPanel;
    $("img#showimage").mousedown(function(event) {
      return event.preventDefault();
    });
    size = {
      width: $("img#showimage").data("width"),
      height: $("img#showimage").data("height")
    };
    $("div#image_view").css("width", "" + size["width"] + "px");
    $("div#image_view").css("height", "" + size["height"] + "px");
    html_option = {
      id: "selection_rectangle",
      "class": "selection_rectangle"
    };
    selectionRect = new Rect(html_option, $("div#image_view"));
    selectionRect.show();
    return taggingPanel = new TaggingPanel($("div.tagbox").first(), $("a#trigger_tag"), selectionRect);
  });
}).call(this);
