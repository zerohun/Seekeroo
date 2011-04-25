/* DO NOT MODIFY. This file was compiled Mon, 25 Apr 2011 15:30:11 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/subtitle_view.coffee
 */

(function() {
  $(document).ready(function() {
    var subtitlelist, text, _i, _len, _ref;
    subtitlelist = new SubtitleView();
    alert("its created");
    _ref = $("subtitle");
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      text = _ref[_i];
      subtitlelist.addText(text);
    }
    alert(subtitlelist.getText());
    $("div#subtitle_view").text(subtitlelist.getText());
    return $("a#nextsubtitle").click(function(event) {
      event.preventDefault();
      return $("div#subtitle_view").text(subtitlelist.next());
    });
  });
}).call(this);
