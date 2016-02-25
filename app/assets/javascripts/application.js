// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require cocoon
//= require bootstrap
//= require_tree .

$(document).ready(function() {
  var table = $('#most_fights').DataTable({
    "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0,
            "sClass": "right"
        } ],
    "order": [[ 3, "desc" ]],
    "columnDefs": [ {
      "targets": [2, 3, 4],
      "sClass": "center"
    } ]
  });

  table.on( 'order.dt search.dt', function () {
    table.column(0, {order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
  } ).draw();
} );


$(document).ready(function() {
  var table = $('#most_win_lose').DataTable({
    "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
        } ],
    "order": [[ 3, "desc" ]],
    "columnDefs": [ {
      "targets": [2, 3, 4],
      "sClass": "center"
    } ]
  });

  table.on( 'order.dt search.dt', function () {
    table.column(0, {order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
  } ).draw();
} );

$(document).ready(function() {
  var table = $('#most_pow_attack').DataTable({
    "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
        } ],
    "order": [[ 3, "desc" ]],
    "columnDefs": [ {
      "targets": [2, 3, 4],
      "sClass": "center"
    } ]
  });

  table.on( 'order.dt search.dt', function () {
    table.column(0, {order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
    } );
  } ).draw();
} );
