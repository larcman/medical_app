// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap.min
//= require_tree .

function filterTable (field, table, colnum) {
  var input, filter, tab, tr, td, i;
  input = document.getElementById(field);
  filter = input.value.toUpperCase();
  tab = document.getElementById(table);
  tr = tab.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[colnum];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
};


$(document).ready(function () {

/* FIXME: It does not work all the time	
  $('#date_picker').datepicker({
    format: 'dd/mm/yyyy',
    todayHighlight: true,
    autoclose: true,
    orientation: 'top',
    clearBtn: true,
    todayBtn: true,
    keyboardNavigation: true,
    language: 'es'
  });
*/

});

