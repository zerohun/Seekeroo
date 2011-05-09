/* DO NOT MODIFY. This file was compiled Thu, 05 May 2011 07:18:45 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/TagboxDrawer.coffee
 */

(function() {
  this.TagboxDrawer = (function() {
    function TagboxDrawer(context) {
      this.context = context;
      this.taggingmode = false;
      this.isactivated = false;
    }
    TagboxDrawer.prototype.drawBox = function(x, y, width, height) {
      if (this.isactivated) {
        return strokeRect(x, y, width, height);
      }
    };
    TagboxDrawer.prototype.activate = function() {
      return this.isactivated = true;
    };
    TagboxDrawer.prototype.deactivate = function() {
      return this.isactivated = false;
    };
    return TagboxDrawer;
  })();
}).call(this);
