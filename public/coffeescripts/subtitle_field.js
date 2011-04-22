/* DO NOT MODIFY. This file was compiled Fri, 22 Apr 2011 06:21:11 GMT from
 * /home/zerohun/rails_apps/Fingeroo/app/coffeescripts/subtitle_field.coffee
 */

(function() {
  var removeField, renumberSubtitleFields;
  removeField = function(buttonobj) {
    buttonobj.parent().remove();
    return renumberSubtitleFields();
  };
  renumberSubtitleFields = function() {
    $("div.field").each(function(index) {
      return $(this).attr("id", index);
    });
    $("div.field label").each(function(index) {
      $(this).attr("for", "article_subtitles_attributes_" + index + "_text");
      return $(this).text("Subtitle " + (index + 1));
    });
    return $("div.field textarea").each(function(index) {
      $(this).attr("id", "article_subtitles_attributes_" + index + "_text");
      return $(this).attr("name", "article[subtitles_attributes][" + index + "][text]");
    });
  };
  $(document).ready(function() {
    $("a.remove_subtitle_field").click(function(e) {
      e.preventDefault();
      return removeField($(this));
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
        event.preventDefault();
        return removeField($(this));
      });
    });
  });
}).call(this);
