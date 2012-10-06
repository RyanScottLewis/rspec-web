var Iteration = Backbone.Model.extend({
  initialize : function() {
    var self = this;
    
    this.examples = {
      passing : new ExampleCollection(self, 'passing'),
      pending : new ExampleCollection(self, 'pending'),
      failing : new ExampleCollection(self, 'failing'),
      finishedCount : function() { return self.examples.passing.finishedCount() + self.examples.pending.finishedCount() + self.examples.failing.finishedCount(); }
    }
  },
  updateListEntryIcon : function() {
    var listEntryIconElement = $('#iteration-'+this.get('timestamp')+'-list-entry-icon');
    var newListEntryIconClass;
    
    if (this.examples.passing.finishedCount() > 0){ newListEntryIconClass = 'icon-ok-sign'; }
    if (this.examples.pending.finishedCount() > 0){ newListEntryIconClass = 'icon-question-sign'; }
    if (this.examples.failing.finishedCount() > 0){ newListEntryIconClass = 'icon-remove-sign'; }
    
    if ( !listEntryIconElement.hasClass(newListEntryIconClass) ){
      listEntryIconElement.removeClass('icon-info-sign');
      listEntryIconElement.removeClass('icon-ok-sign');
      listEntryIconElement.removeClass('icon-question-sign');
      listEntryIconElement.removeClass('icon-remove-sign');
      
      listEntryIconElement.addClass(newListEntryIconClass);
    }
  },
  updateProgressBar : function(){
    var timestamp = this.get('timestamp');
    var percentageComplete = (this.examples.finishedCount() / this.get('exampleCount')) * 100;
    var progressRowElement = $('#iteration-'+timestamp+'-progress-row');
    var progressContainerElement = $('#iteration-'+timestamp+'-progress-container');
    var progressBarElement = $('#iteration-'+timestamp+'-progress-bar');
    var newProgressBarClass;
    
    progressBarElement.css('width', percentageComplete + '%');
    
    if (this.examples.passing.finishedCount() > 0){ newProgressBarClass = 'progress-passing'; }
    if (this.examples.pending.finishedCount() > 0){ newProgressBarClass = 'progress-pending'; }
    if (this.examples.failing.finishedCount() > 0){ newProgressBarClass = 'progress-failing'; }
    
    if ( !progressContainerElement.hasClass(newProgressBarClass) ){
      progressContainerElement.removeClass('progress-passing');
      progressContainerElement.removeClass('progress-pending');
      progressContainerElement.removeClass('progress-failing');
      
      progressContainerElement.addClass(newProgressBarClass);
    }
    
    if (percentageComplete == 100){ 
      progressContainerElement.removeClass('active');
      progressContainerElement.removeClass('progress-striped');
    }
  }
});