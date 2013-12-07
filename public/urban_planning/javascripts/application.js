/* swapElements(elm1, elm2)
 * Author: T.J. Crowder
 * http://stackoverflow.com/a/8034949/237176 */
function swapElements(elm1, elm2) {
  var parent1, next1,
      parent2, next2;

  parent1 = elm1.parentNode;
  next1   = elm1.nextSibling;
  parent2 = elm2.parentNode;
  next2   = elm2.nextSibling;

  parent1.insertBefore(elm2, next1);
  parent2.insertBefore(elm1, next2);
}

$(function () {
  var row;
  var col;
  var limit = 5;

  function needsSwapping(fst, snd) {
    return (($(fst).hasClass('house') && $(snd).hasClass('business')) ||
            ($(snd).hasClass('house') && $(fst).hasClass('business')));
  }

  for (row=0; row<limit; row+=1) {
    for (col=0; col<limit; col+=1) {
      selector = '.row' + row + '.col' + col;
      $(selector).on('click', function () {
        $(this).toggleClass('selected');
        if ($('.selected').length == 2) {
          if (needsSwapping($('.selected')[0], $('.selected')[1])) {
            swapElements($('.selected')[0], $('.selected')[1]);
          }
          $('.selected').toggleClass('selected');
        }
      });
    }
  }
});
