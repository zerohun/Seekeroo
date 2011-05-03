/* DO NOT MODIFY. This file was compiled Tue, 03 May 2011 01:29:56 GMT from
 * /home/zerohun/rails_apps/Fingeroo/app/coffeescripts/subtitle_field.coffee
 */

(function() {
  var changeIDNumber, changeNameNumber, duplicate, removeField, renumberSubtitleFields;
  changeNameNumber = function(target, index) {
    var beforetext, newtext;
    beforetext = target.attr("name");
    newtext = beforetext.replace("[subtitles_attributes][0]", "[subtitles_attributes][" + index + "]");
    return target.attr("name", newtext);
  };
  changeIDNumber = function(target, index, attribute) {
    var beforetext, newtext;
    beforetext = target.attr(attribute);
    newtext = beforetext.replace("subtitles_attributes_0", "subtitles_attributes_" + index);
    return target.attr(attribute, newtext);
  };
  duplicate = function(target, index) {
    var cloned;
    cloned = target.clone(true);
    changeIDNumber(cloned.find("label"), index, "for");
    changeIDNumber(cloned.find("textarea"), index, "id");
    changeNameNumber(cloned.find("textarea"), index);
    cloned.find("textarea").val("");
    cloned.find("label").text("Subtitle " + (index + 1));
    cloned.attr("id", index);
    return cloned.appendTo(target.parent());
  };
  removeField = function(buttonobj) {
    buttonobj.parent().remove();
    return renumberSubtitleFields();
  };
  renumberSubtitleFields = function() {
    $("div.subtitlefields").each(function(index) {
      return $(this).attr("id", index);
    });
    $("label").each(function(index) {
      changeIDNumber($(this), index, "for");
      return $(this).text("Subtitle " + (index + 1));
    });
    return $("textarea").each(function(index) {
      changeIDNumber($(this), index, "id");
      return changeNameNumber($(this), index);
    });
  };
  $(document).ready(function() {
    $("a.remove_subtitle_field").click(function(e) {
      e.preventDefault();
      return removeField($(this));
    });
    return $("a#add_subtitle_field").click(function(e) {
      var number;
      e.preventDefault();
      $("a#remove_field_id_" + number).click(function(event) {
        event.preventDefault();
        return removeField($(this));
      });
      number = $('div.subtitlefields').length;
      return duplicate($('div.subtitlefields#0'), number);
    });
  });
}).call(this);
