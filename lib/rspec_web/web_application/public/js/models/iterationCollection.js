// var IterationCollection = function(max) {
var IterationCollection = function(rspecWebFrontend) {
  this.collection = {};
  // this.max = max;
  
  this.add = function(timestamp, exampleCount) {
    $('#btn-run-specs').removeAttr('disabled');
    
    var templateVariables = {
      timestamp          : timestamp,
      exampleCount       : exampleCount,
      formattedTimestamp : new Date(timestamp*1000).toString('ddd MMM d h:mm:ss tt'),
      iterationsCount    : this.collection.length
    };
    
    var firstIterationListEntry = $('#iterationsList').children()[0]; // Iterations header
    
    var newIterationListEntryTemplate = _.template( $('#iterationListEntry').html() );
    var newIterationListEntry = $( newIterationListEntryTemplate(templateVariables) );
    
    var newIterationEntryTemplate = _.template( $('#iterationEntry').html() );
    var newIterationEntry = $( newIterationEntryTemplate(templateVariables) );
    
    $('#iterations').prepend(newIterationEntry);
    
    newIterationListEntry.insertAfter(firstIterationListEntry);
    newIterationListEntry.popover( rspecWebFrontend.iterations.newIterationListEntryPopoverOptions );
    
    rspecWebFrontend.views.show('iterations');
    
    newIterationListEntry.addClass('active');
    newIterationEntry.addClass('active');
    newIterationListEntry.slideDown();
    
    this.collection[timestamp] = new Iteration({ timestamp : timestamp, exampleCount : exampleCount });
  };
  
  this.count = function() { return this.collection.length; };
}