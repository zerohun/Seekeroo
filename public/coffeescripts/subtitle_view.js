/* DO NOT MODIFY. This file was compiled Mon, 02 May 2011 14:44:35 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/subtitle_view.coffee
 */

(function() {
  $(document).ready(function() {
    var page_view, subtitle_view, subtitles;
    subtitles = new Subtitles();
    $("subtitle").filter(function(index) {
      return subtitles.addText($("subtitle#" + index).data("text"));
    });
    subtitle_view = $("div#subtitle_view p");
    page_view = $("div#subtitle_page_count p");
    return $("div#image_view").click(function(event) {
      event.preventDefault();
      return subtitles.printSubtitle("next", subtitle_view, page_view);
    });
  });
}).call(this);
