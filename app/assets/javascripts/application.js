// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap/modal.js
//= require_tree .


function gloat() {
  $.post('/gloats');
}

function bite() {
  $.post('/bites');
}

$(document).ready(function(){
  $("body").keypress(function(event) {
    if ( event.which == 13 ) {
      event.preventDefault();
    }
    else if ( event.which == 103 ) {
      gloat();
    }
    else if ( event.which == 32 ) {
      bite();
    }
  });

  $("#chat-input form").submit(function() { 
    $form = $(this);
    $.post($form.attr("action"), 
           $form.serialize());

    var chat_input = $('input#message');
    var message = chat_input.val();
    chat_input.val('').focus();

    $('#chat_events').append('<tr><th>you</th><td>' + message + '</td></tr>');

    return false;
  });
});
