$(document).ready(function() {
  $('.product-select').select2();
  $(".available-date-select option[value='']").remove();
  $('.available-date-select').select2({
    tags: true
  });
});
