/* DO NOT MODIFY. This file was compiled Mon, 09 May 2011 09:42:30 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/initialize_canvas.coffee
 */

(function() {
  var requestNewTagboxForm;
  requestNewTagboxForm = function(sx, sy, ex, ey) {
    var height, left, top, width;
    left = sx;
    top = sy;
    width = ex - sx;
    height = ey - sy;
    if (width < 0) {
      width = -width;
    }
    if (height < 0) {
      height = -height;
    }
    return $.ajax({
      type: "GET",
      url: "" + location.href + "/tagboxes/new",
      dataType: "script",
      data: "left=" + left + "&top=" + top + "&width=" + width + "&height=" + height
    });
  };
  $(document).ready(function() {
    var bgimage, canvas, context, endX, endY, height, ismousedown, page_view, startX, startY, subtitle_view, tagboxcreator, tagboxmanager, width;
    canvas = $("canvas#image_viewer");
    context = canvas[0].getContext("2d");
    width = parseFloat(canvas.data("width"));
    height = parseFloat(canvas.data("height"));
    bgimage = new Image();
    subtitle_view = $("div#subtitle_view");
    page_view = $("div#page_view");
    tagboxmanager = new TagboxManager(context, width, height, bgimage);
    tagboxmanager.loadTagboxesFromHtml();
    tagboxcreator = new TagboxCreator(context, width, height, bgimage);
    bgimage.onload = function() {
      context.drawImage(bgimage, 0, 0);
      return tagboxmanager.drawAll();
    };
    bgimage.src = canvas.data("imgsrc");
    $("a#start_tagging").click(function(event) {
      event.preventDefault();
      return tagboxcreator.activate();
    });
    $("a#done_tagging").click(function(event) {
      event.preventDefault();
      return tagboxcreator.deactivate();
    });
    ismousedown = false;
    startX = 0;
    startY = 0;
    endX = 0;
    endY = 0;
    return canvas.click(function(event) {
      var tagbox;
      if (tagboxcreator.isActivated() === false) {
        tagbox = tagboxmanager.getClickedTagbox(event.pageX, event.pageY);
        return tagbox.printSubtitles(subtitle_view, page_view);
      }
    }).mousedown(function(event) {
      ismousedown = true;
      startX = event.pageX;
      return startY = event.pageY;
    }).mouseup(function(event) {
      ismousedown = false;
      if (tagboxcreator.isActivated() === true) {
        return requestNewTagboxForm(startX, startY, endX, endY);
      }
    }).mousemove(function(event) {
      if (ismousedown) {
        endX = event.pageX;
        endY = event.pageY;
        return tagboxcreator.setSelectBox(startX, startY, endX, endY);
      }
    }).mouseout(function(event) {
      if (tagboxcreator.isActivated && ismousedown) {
        requestNewTagboxForm(startX, startY, endX, endY);
      }
      return ismousedown = false;
    });
  });
}).call(this);
