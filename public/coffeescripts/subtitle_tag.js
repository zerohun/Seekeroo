/* DO NOT MODIFY. This file was compiled Wed, 04 May 2011 05:37:41 GMT from
 * /home/zerohun/rails_apps/Fingeroo/app/coffeescripts/subtitle_tag.coffee
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
    $("div#image_view").css("width", "" + size["width"] + "pt");
    $("div#image_view").css("height", "" + size["height"] + "pt");
    html_option = {
      id: "selection_rectangle",
      "class": "selection_rectangle"
    };
    selectionRect = new Rect(html_option, $("div#image_view"));
    selectionRect.show();
    return taggingPanel = new TaggingPanel($("div#image_view"), $("a#trigger_tag"), selectionRect);
  });
}).call(this);
