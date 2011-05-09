/* DO NOT MODIFY. This file was compiled Sat, 07 May 2011 09:26:16 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/TagboxManager.coffee
 */

(function() {
  this.TagboxManager = (function() {
    function TagboxManager(context, width, height, bgimage) {
      this.context = context;
      this.width = width;
      this.height = height;
      this.bgimage = bgimage;
      this.tagboxlist = [];
      this.isactivated = false;
    }
    TagboxManager.prototype.addTagbox = function(tagbox) {
      this.tagboxlist.push(tagbox);
      return tagbox.draw();
    };
    TagboxManager.prototype.removeTagbox = function(tagbox) {
      var count, listed, _i, _len, _ref;
      count = 0;
      _ref = this.tagboxlist;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        listed = _ref[_i];
        if (listed.getID() === tagbox.getID()) {
          this.tagboxlist.splice(count, 1);
        }
        count++;
      }
      return refresh();
    };
    TagboxManager.prototype.refresh = function() {
      this.context.clearRect(0, 0, this.width, this.height);
      this.context.drawImage(this.bgimage);
      return drawAll();
    };
    TagboxManager.prototype.drawAll = function() {
      var tagbox, _i, _len, _ref, _results;
      _ref = this.tagboxlist;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        tagbox = _ref[_i];
        _results.push(tagbox.draw(this.context));
      }
      return _results;
    };
    TagboxManager.prototype.loadTagboxesFromHtml = function() {
      var tagboxlist;
      tagboxlist = [];
      $("tagbox").each(function() {
        var ex, ey, id, subtitles, sx, sy, tagbox;
        subtitles = new Subtitles();
        $(this).find("subtitle").each(function() {
          return subtitles.addText($(this).data("text"));
        });
        sx = $(this).data("left");
        sy = $(this).data("top");
        ex = (parseFloat(sx) + parseFloat($(this).data("width"))).toString();
        ey = (parseFloat(sy) + parseFloat($(this).data("height"))).toString();
        id = $(this).attr("id");
        tagbox = new Tagbox(sx, sy, ex, ey, subtitles.deepCopy(), id);
        return tagboxlist.push(tagbox);
      });
      return this.tagboxlist = this.tagboxlist.concat(tagboxlist);
    };
    TagboxManager.prototype.getClickedTagbox = function(x, y) {
      var count, tagbox, _i, _len, _ref;
      count = 0;
      _ref = this.tagboxlist;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        tagbox = _ref[_i];
        if (tagbox.isInside(x, y) === true) {
          if (count > 0) {
            return tagbox;
          } else {
            count++;
          }
        }
      }
      return this.tagboxlist[0];
    };
    return TagboxManager;
  })();
}).call(this);
