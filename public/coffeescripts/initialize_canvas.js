/* DO NOT MODIFY. This file was compiled Wed, 04 May 2011 06:05:50 GMT from
 * /home/zerohun/rails_apps/Fingeroo/app/coffeescripts/initialize_canvas.coffee
 */

(function() {
  $(document).ready(function() {
    var canvas, context, img;
    canvas = $("canvas#image_viewer");
    context = canvas[0].getContext("2d");
    img = new Image();
    img.onload = function() {
      return context.drawImage(img, 0, 0);
    };
    return img.src = canvas.data("imgsrc");
  });
}).call(this);
