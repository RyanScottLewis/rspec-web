var rspecWebFrontend = {
  config : {
    defaultCommand : 'rspec spec --f RspecWeb::Formatter --drb'
  }
};

$(function() {
  rspecWebFrontend.webSocket  = new WebSocketContainer(rspecWebFrontend, { host: window.location.hostname, port: 10081 });
  rspecWebFrontend.views      = new ViewContainer(rspecWebFrontend, { initialView: 'noIterationsError' });
  rspecWebFrontend.iterations = new IterationCollection(rspecWebFrontend);
});