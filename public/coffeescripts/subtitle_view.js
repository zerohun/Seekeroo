/* DO NOT MODIFY. This file was compiled Tue, 03 May 2011 06:43:52 GMT from
 * /home/zerohun/rails_apps/Fingeroo/app/coffeescripts/subtitle_view.coffee
 */

(function() {
  $(document).ready(function() {
    var number_of_tags, tagboxes;
    number_of_tags = $("div.tagbox");
    tagboxes = [];
    return $("div.tagbox").each(function() {
      var a, subtitles, tagboxobj;
      subtitles = new Subtitles();
      $(this).find("subtitle").each(function() {
        return subtitles.addText($(this).data("text"));
      });
      a = subtitles.deepCopy();
      return tagboxobj = new Tagbox({
        id: $(this).attr("id"),
        subtitles: subtitles.deepCopy(),
        subtitle_view: $("div#subtitle_view p"),
        page_view: $("div#page_view p")
      });
    });
  });
}).call(this);
