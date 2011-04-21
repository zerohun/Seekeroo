/* DO NOT MODIFY. This file was compiled Thu, 21 Apr 2011 15:09:06 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/subtitle_field.coffee
 */

(function() {
  var renumberSubtitleFields;
  renumberSubtitleFields = function() {
    $("div.field").each(function(index) {
      return $(this).attr("id", index);
    });
    $("div.field label").each(function(index) {
      $(this).attr("for", "article_subtitles_attributes_" + index + "_text");
      return $(this).text("Subtitle " + index);
    });
    return $("div.field textarea").each(function(index) {
      $(this).attr("id", "article_subtitles_attributes_" + number + "_text");
      return $(this).attr("name", "article[subtitles_attributes][" + number + "][text]");
    });
  };
  $(document).ready(function() {
    $("a.remove_subtitle_field").click(function(event) {
      $(this).parent().remove();
      return event.preventDefault();
    });
    return $("a#add_subtitle_field").click(function(e) {
      var number, subtitleHTML;
      number = $('div#subtitles div.field').length;
      subtitleHTML = JST.subtitle_form({
        number: number
      });
      $('div#subtitles').append(subtitleHTML);
      e.preventDefault();
      return $("a#remove_field_id_" + number).click(function(event) {
        $(this).parent().remove();
        event.preventDefault();
        return renumberSubtitleFields();
      });
    });
  });
}).call(this);
