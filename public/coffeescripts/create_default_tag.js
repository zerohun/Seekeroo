/* DO NOT MODIFY. This file was compiled Fri, 29 Apr 2011 07:38:17 GMT from
 * /home/zerohun/rails_apps/Fingeroo/app/coffeescripts/create_default_tag.coffee
 */

(function() {
  $("img#previewimg").change(function() {
    var height, width;
    width = $("img#previewimg").data("width");
    height = $("img#previewimg").data("height");
    $("input#article_tagboxes_attributes_0_left").value(0);
    $("input#article_tagboxes_attributes_0_top").value(0);
    $("input#article_tagboxes_attributes_0_width").value(width.to_s);
    return $("input#article_tagboxes_attributes_0_height").value(height.to_s);
  });
}).call(this);
