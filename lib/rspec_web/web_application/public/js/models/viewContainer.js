var ViewContainer = function(rspecWebFrontend, opts) {
  this.currentName = opts.initialView;
  this.show = function() {
    var viewName = arguments[0].replace(/View$/, '');
    var callback = arguments[1];
    
    $('#'+this.currentName+'View').fadeOut(function(){
      $('#'+viewName+'View').fadeIn();
      if (typeof callback != 'undefined'){ callback(); }
    });
    
    this.currentName = viewName;
  };
};