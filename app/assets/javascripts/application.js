// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require rails-ujs
//= require jquery.easy-autocomplete
//= require turbolinks
//= require_tree
//= require Chart.min
<<<<<<< HEAD

$(document).ajaxError(function(event,xhr,options,exc) {
    
    var errors = JSON.parse(xhr.responseText);
    var er ="<ul>";
    for(var i = 0; i < errors.length; i++){
        var list = errors[i];
        er += "<li>"+list+"</li>"
    }
    er+="</ul>"
    $("#error_explanation").html(er);
       
});

jQuery(function($) {
$("tr[data-link]").click(function() {
window.location = this.dataset.link
});
})


