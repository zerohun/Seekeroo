/* DO NOT MODIFY. This file was compiled Fri, 29 Apr 2011 10:37:22 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/create_default_tag.coffee
 */

(function() {
  this.refreshImageSize = function() {
    var height, width;
    width = $("img#previewimg").data("width");
    height = $("img#previewimg").data("height");
    $("input#article_tagboxes_attributes_0_left").val(0);
    $("input#article_tagboxes_attributes_0_top").val(0);
    $("input#article_tagboxes_attributes_0_width").val(width);
    return $("input#article_tagboxes_attributes_0_height").val(height);
  };
}).call(this);
