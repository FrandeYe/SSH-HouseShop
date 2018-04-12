$(function () {

  'use strict';

  var $distpicker = $('#distpicker');

  $distpicker.distpicker({
    province: '江西省',
    city: '赣州市',
    district: '章贡区'
  });

  $('#reset').click(function () {
    $distpicker.distpicker('reset');
  });

  $('#reset-deep').click(function () {
    $distpicker.distpicker('reset', true);
  });

});
