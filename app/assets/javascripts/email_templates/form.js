$(document).ready(function() {
  $('.template-type-select').change(function(){
    var templatEmail = $("#template-" + $(this).val()).val();
    $('#cke_18').click();
    $('textarea.cke_source').val(templatEmail);
  });
});
