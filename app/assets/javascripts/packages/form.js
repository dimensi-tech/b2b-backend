$(document).ready(function() {
  $('.product-select').select2()

  const availableDates = $('#package_available_date').data('dates')
  const datepickerConfig = {
    minDate: 0,
    numberOfMonths: [1, 4],
    altField: '#package_available_date'
  }
  availableDates.length && (datepickerConfig['addDates'] = availableDates)
  $('#available_date_datepicker').multiDatesPicker(datepickerConfig)
})

$(document).on('cocoon:after-insert', function(event){
  $('.sort-field').change(function(e, state) {
    // Check if event trigger from code
    if (typeof state!='undefined' && state){
      return false;
    }

    var row             = $(this).closest('.row');
    var sort_val        = $(this).val();
    var adult_price_val = $('.adult-price-field').val();
    var child_price_val = $('.child-price-field').val();

    row.find('.adult-amount-field').val((parseFloat(adult_price_val) / parseFloat(sort_val)).toFixed(1));
    row.find('.child-amount-field').val((parseFloat(child_price_val) / parseFloat(sort_val)).toFixed(1));
  })
})
