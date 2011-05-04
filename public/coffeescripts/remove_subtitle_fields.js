/* DO NOT MODIFY. This file was compiled Wed, 04 May 2011 00:54:25 GMT from
 * /home/zerohun/rails_apps/Fingeroo/app/coffeescripts/remove_subtitle_fields.coffee
 */

(function() {
  $(document).ready(function() {
    return $("a.remove_subtitle_fields").click(function(event) {
      this.parent().remove();
      return event.preventDefault();
    });
  });
}).call(this);
