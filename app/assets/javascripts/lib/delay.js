(function(window) {
  window.delay = function(func, wait) {
    var args = Array.prototype.slice.call(arguments, 2);
    if(!wait) wait = 0;
    return setTimeout(function(){ return func.apply(null, args); }, wait);
  };
})(this);
