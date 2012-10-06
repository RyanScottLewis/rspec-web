$(function(){
  var $iterationsListContainer = $('#iterationsListContainer');
  var $iterationsList = $("#iterationsList");
  var $iterationsContainer = $('#iterationsContainer');
  var $iterations = $("#iterations");
  var $iterationEntry = $("#iterationEntry");
  var $iterationListEntry = $("#iterationListEntry");
  
  setTimeout(function() { rspecWebFrontend.webSocket.identify(); }, 1000);
  // ===--- Socket - End -----------------------------------------=== \\
  
  
  // ===--- Events - Start ---------------------------------------=== \\
  $('#btn-run-specs').mouseup(function(e){
    var $self = $(this);
    
    if (typeof $self.attr('disabled') == 'undefined') {
      rspecWebFrontend.webSocket.runSpecs();
      
      $self.attr('disabled', 'disabled');
    }
  });
  
  $('#btn-settings').mouseup(function(e){
    // rspecWebFrontend.views.show('settings');
    $('#settings').slideDown();
  });
  
  $('#btn-settings-cancel').mouseup(function(e){
    $('#settings').slideUp(function(){
      $('#settingsRspecCommand').val( $.cookie('settingsRspecCommand') );
      $('#alertSettingsNotSaved').slideDown(function(){
        setTimeout(function(){ $('#alertSettingsNotSaved').slideUp(); }, 2000);
      });
    });
  });
  
  $('#btn-settings-save').mouseup(function(e){
    $.cookie('settingsRspecCommand', $('#settingsRspecCommand').val(), { path: '/' });
    $('#settings').slideUp(function(){
      $('#alertSettingsSaved').slideDown(function(){
        setTimeout(function(){ $('#alertSettingsSaved').slideUp(); }, 2000);
      });
    });
  });
  
  var fixIterationsTable = function(){
    if ($(window).width() < 768) {
      $iterationsListContainer.removeClass('span4');
      $iterationsContainer.removeClass('span8');
    } else {
      $iterationsListContainer.addClass('span4');
      $iterationsContainer.addClass('span8');
    }
  }
  fixIterationsTable();
  $(window).resize(fixIterationsTable);
  
  var fixSettingsAndAlertsWidth = function(){
    var viewsWidth = $('#views').width();
    $('#settings').css('width', viewsWidth+'px');
    $('.alert').css('width', viewsWidth-50+'px');
  };
  fixSettingsAndAlertsWidth();
  $(window).resize(fixSettingsAndAlertsWidth);
  // ===--- Events - End -----------------------------------------=== \\
  
  // ===--- Init - Start -----------------------------------------=== \\
  $('#settingsRspecCommand').attr('placeholder', "Rspec run command (default: '" + rspecWebFrontend.config.defaultCommand + "')")
  rspecWebFrontend.views.show('noIterationsError');
  $('#settingsRspecCommand').val( $.cookie('settingsRspecCommand') );
  // ===--- Init - Start -----------------------------------------=== \\
});