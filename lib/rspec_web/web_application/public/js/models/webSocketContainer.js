var WebSocketContainer = function(rspecWebFrontend, opts) {
  this.host = opts.host;
  this.port = opts.port;
  this.socket = $.gracefulWebSocket('ws://'+this.host+':'+this.port);
  this.socket.onmessage = function(messageEvent){
    var message = $.parseJSON(messageEvent.data);
    var timestamp = message["arguments"][0];
    
    if (message["method"] == "startNewIteration"){
      var exampleCount = message["arguments"][1];
      
      rspecWebFrontend.iterations.add(timestamp, exampleCount);
    } else if (message["method"] == "addToPassing" || message["method"] == "addToPending" || message["method"] == "addToFailing"){
      var data = message["arguments"][1];
      
      if (message["method"] == "addToPassing") {
        rspecWebFrontend.iterations.collection[timestamp].examples.passing.add(data);
      } else if (message["method"] == "addToPending") {
        rspecWebFrontend.iterations.collection[timestamp].examples.pending.add(data);
      } else if (message["method"] == "addToFailing") {
        rspecWebFrontend.iterations.collection[timestamp].examples.failing.add(data);
      }
    }
  };
  
  this.identify = function() {
    this.socket.send( $.toJSON({
      receiver  : "server",
      method    : "identify",
      arguments : ["web"]
    }) );
  };
  
  this.runSpecs = function() {
    var settingsRspecCommand = $.cookie('settingsRspecCommand');
    if (settingsRspecCommand == '' || typeof settingsRspecCommand == 'undefined') {
      settingsRspecCommand = rspecWebFrontend.config.defaultCommand;
    }
    
    this.socket.send( $.toJSON({
      receiver  : "server", 
      method    : "runSpecs", 
      arguments : [ settingsRspecCommand ]
    }) );
  };
};