/* DO NOT MODIFY. This file was compiled Thu, 21 Apr 2011 07:24:20 GMT from
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
