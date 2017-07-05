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

function getPWVProm () {
  var field1, field2, field3, field4, prom, div = 3;
  field1 = Number(document.getElementById('evaluation_car_pwv1a').value);
  field2 = Number(document.getElementById('evaluation_car_pwv2a').value);
  field3 = Number(document.getElementById('evaluation_car_pwv3a').value);
  if (isNaN(field3) || field3 === 0) {
    field3 = 0;
    div = 2;
  }
  prom = (field1 + field2 + field3) / div;
  document.getElementById('evaluation_car_pwv4a').value = prom.toFixed(2);
};

function getTTProm () {
  var field1, field2, field3, field4, prom, div = 3;
  field1 = Number(document.getElementById('evaluation_car_tt1a').value);
  field2 = Number(document.getElementById('evaluation_car_tt2a').value);
  field3 = Number(document.getElementById('evaluation_car_tt3a').value);
  if (isNaN(field3) || field3 === 0) {
    field3 = 0;
    div = 2;
  }
  prom = (field1 + field2 + field3) / div;
  document.getElementById('evaluation_car_tt4a').value = prom.toFixed(2);
};

function getPOPProm () {
  var field1, field2, field3, field4, prom, div = 3;
  field1 = Number(document.getElementById('evaluation_car_popscore1a').value);
  field2 = Number(document.getElementById('evaluation_car_popscore2a').value);
  field3 = Number(document.getElementById('evaluation_car_popscore3a').value);
  if (isNaN(field3) || field3 === 0) {
    field3 = 0;
    div = 2;
  }
  prom = (field1 + field2 + field3) / div;
  document.getElementById('evaluation_car_popscore4a').value = prom.toFixed(2);
};

function getQimtProm () {
  var field1, field2, field3, prom, div = 2;
  field1 = Number(document.getElementById('evaluation_car_artlab_qimt_izq').value);
  field2 = Number(document.getElementById('evaluation_car_artlab_qimt_der').value);
  if (isNaN(field1) || field1 === 0) {
    field1 = 0;
    div = 1;
  }
  if (isNaN(field2) || field2 === 0) {
    field2 = 0;
    div = 1;
  }
  prom = (field1 + field2) / div;
  document.getElementById('evaluation_car_artlab_qimt_prom').value = prom.toFixed(2);
};

function getDinamDerProm () {
  var field1, field2, field3, field4, prom, div = 3;
  field1 = Number(document.getElementById('evaluation_dinam_der1a').value);
  field2 = Number(document.getElementById('evaluation_dinam_der2a').value);
  field3 = Number(document.getElementById('evaluation_dinam_der3a').value);
  if (isNaN(field3) || field3 === 0) {
    field3 = 0;
    div = 2;
  }
  prom = (field1 + field2 + field3) / div;
  document.getElementById('evaluation_dinam_der4a').value = prom.toFixed(2);
};

function getDinamIzqProm () {
  var field1, field2, field3, field4, prom, div = 3;
  field1 = Number(document.getElementById('evaluation_dinam_izq1a').value);
  field2 = Number(document.getElementById('evaluation_dinam_izq2a').value);
  field3 = Number(document.getElementById('evaluation_dinam_izq3a').value);
  if (isNaN(field3) || field3 === 0) {
    field3 = 0;
    div = 2;
  }
  prom = (field1 + field2 + field3) / div;
  document.getElementById('evaluation_dinam_izq4a').value = prom.toFixed(2);
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

