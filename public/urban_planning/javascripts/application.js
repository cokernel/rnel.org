$(function () {
  var row;
  var col;
  var limit = 5;

  function needsSwapping(fst, snd) {
    return (($(fst).hasClass('house') && $(snd).hasClass('business')) ||
            ($(snd).hasClass('house') && $(fst).hasClass('business')));
  }

  function nextState() {
    var DIGIT_TO_LETTER = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "j", "k", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"];
    var state = '';
    var digit;
    var selector;
    for (row=0; row<limit; row+=1) {
      digit = 0;
      for (col=0; col<limit; col+=1) {
        selector = '.row' + row + '.col' + col;
        if ($(selector).hasClass('house')) {
          digit += Math.pow(2, limit - col - 1);
        }
      }
      state += DIGIT_TO_LETTER[digit];
    }
    return state;
  }

  for (row=0; row<limit; row+=1) {
    for (col=0; col<limit; col+=1) {
      selector = '.row' + row + '.col' + col;
      $(selector).on('click', function () {
        $(this).toggleClass('selected');
        if ($('.selected').length == 2) {
          var fst = $('.selected')[0];
          var snd = $('.selected')[1];
          var ns = needsSwapping(fst, snd);
          if (ns) {
            $('.selected').toggleClass('house');
            $('.selected').toggleClass('business');
          }
          $('.selected').toggleClass('selected');
          if (ns) {
            window.location.href = '/urban_planning/' + nextState();
          }
        }
      });
    }
  }
});
