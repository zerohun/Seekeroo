/* DO NOT MODIFY. This file was compiled Fri, 06 May 2011 09:04:24 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/TagboxCreator.coffee
 */

(function() {
  this.TagboxCreator = (function() {
    function TagboxCreator(context, canvasWidth, canvasHeight, bgimage) {
      this.context = context;
      this.isactivated = false;
      this.areaSelector = new AreaSelector(this.context, canvasWidth, canvasHeight, bgimage);
    }
    TagboxCreator.prototype.setSelectBox = function(sx, sy, ex, ey) {
      if (this.isactivated) {
        if (sx > ex) {
          this.swap(sx, ex);
        }
        if (sy > ey) {
          this.swap(sy, ey);
        }
        return this.areaSelector.setBox(sx, sy, ex, ey);
      }
    };
    TagboxCreator.prototype.createTagboxForm = function(target) {};
    TagboxCreator.prototype.activate = function() {
      return this.isactivated = true;
    };
    TagboxCreator.prototype.deactivate = function() {
      return this.isactivated = false;
    };
    TagboxCreator.prototype.isActivated = function() {
      return this.isactivated;
    };
    TagboxCreator.prototype.swap = function(a, b) {
      var temp;
      temp = a;
      a = b;
      return b = temp;
    };
    return TagboxCreator;
  })();
}).call(this);
