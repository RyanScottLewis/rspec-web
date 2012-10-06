var ExampleCollection = function(iteration, exampleType) {
  this.collection = [];
  this.iteration = iteration;
  this.exampleType = exampleType;
  
  this.add = function(data) {
    var timestamp = this.iteration.get('timestamp');
    
    $.extend(data, { timestamp: timestamp, exampleIndex: this.finishedCount()-1 });
    
    var template = _.template( $('#exampleEntry').html() );
    var newExampleEntry = $( template(data) );
    
    this.collection.push(newExampleEntry);
    
    $('#iteration-'+timestamp+'-tab-content-'+this.exampleType).append(newExampleEntry);
    $('#iteration-'+timestamp+'-tab-'+this.exampleType+'-count').html( this.finishedCount() );
    $('#iteration-'+timestamp+'-finished-example-count').html( this.iteration.examples.finishedCount() );
    
    this.iteration.updateProgressBar();
    this.iteration.updateListEntryIcon();
  };
  
  this.finishedCount = function() { return this.collection.length; };
}
