/* DO NOT MODIFY. This file was compiled Thu, 21 Apr 2011 12:23:37 GMT from
 * /home/zerohun/Projects/Fingeroo/app/coffeescripts/remove_subtitle_field.coffee
 */

(function() {
  $(document).ready(function() {
    return $("a.remove_subtitle_field").click(function(event) {
      $(this).parent().remove();
      return event.preventDefault();
    });
  });
}).call(this);
