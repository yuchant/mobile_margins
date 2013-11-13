(function() {
  $(function() {
    var $container, margin, margins, _i, _len, _results;
    margins = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    _results = [];
    for (_i = 0, _len = margins.length; _i < _len; _i++) {
      margin = margins[_i];
      $container = $(".grid-container:first").clone().insertAfter($(".grid-container:last"));
      $container.css({
        padding: margin
      });
      _results.push($container.find('.margins').html(margin));
    }
    return _results;
  });

  $(function() {
    return console.log("Home coffee");
  });

}).call(this);
