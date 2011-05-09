/* DO NOT MODIFY. This file was compiled Fri, 06 May 2011 10:23:37 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/AreaSelector.coffee
 */

(function() {
  this.AreaSelector = (function() {
    function AreaSelector(context, canvasWidth, canvasHeight, background) {
      this.context = context;
      this.background = background;
      this.sx = 0;
      this.sy = 0;
      this.ex = 0;
      this.ey = 0;
      this.firstdrawing = true;
      this.lineWidth = 5;
      this.canvasWidth = canvasWidth;
      this.canvasHeight = canvasHeight;
    }
    AreaSelector.prototype.setBox = function(sx, sy, ex, ey) {
      this.sx = sx;
      this.sy = sy;
      this.ex = ex;
      this.ey = ey;
      if (this.firstdrawing === false) {
        this.eraseBox();
      }
      this.context.strokeRect(sx, sy, ex - sx, ey - sy);
      return this.firstdrawing = false;
    };
    AreaSelector.prototype.restoreBackground = function(x, y, width, height) {
      this.context.fillStyle = "red";
      this.context.strokeWidth = 0;
      return this.context.fillRect(x, y, width, height);
      /*
      @context.drawImage(@background, x, y, width, height)
      */
    };
    AreaSelector.prototype.eraseBox = function() {
      return this.context.drawImage(this.background, 0, 0);
      /*

      boxWidth = @ex - @sy
      boxHeight = @ey - @sy


      @restoreBackground(@sx - @lineWidth/2,
                        @sy - @lineWidth/2,
                        boxWidth + @lineWidth,
                        @lineWidth)

      @restoreBackground(@sx - @lineWidth/2,
                        @ey - @lineWidth/2,
                        boxWidth + @lineWidth,
                        @lineWidth)

      @restoreBackground(@sx - @lineWidth/2,
                        @sy - @lineWidth/2,
                        @lineWidth,
                        boxHeight + @lineWidth)

      @restoreBackground(@ex - @lineWidth/2,
                        @sy - @lineWidth/2,
                        @lineWidth,
                        boxHeight + @lineWidth)

      */
    };
    return AreaSelector;
  })();
}).call(this);
