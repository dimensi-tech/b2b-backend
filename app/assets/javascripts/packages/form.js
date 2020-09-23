$(document).ready(function() {
  $('.down-payment-fields').hide();
  $('.itinerary-saving-fields').hide();
  $('.product-select').select2()

  if ($('.checkbox-saving').is(':checked')) {
    $('.down-payment-fields').show();
    $('.itinerary-saving-fields').show();
  } else {
    $('.down-payment-fields').hide();
    $('.itinerary-saving-fields').hide();
  }

  if ($('.dp-type-select').val() == 'flat') {
    $('.dp-flat-field').attr('type', 'number');
    $('.dp-percentage-field').attr('type', 'hidden');
  } else if ($('.dp-type-select').val() == 'percentage') {
    $('.dp-percentage-field').attr('type', 'number');
    $('.dp-flat-field').attr('type', 'hidden');
  }

  $('.checkbox-saving').change(function() {
    if($(this).is(':checked')){
      $('.down-payment-fields').show();
      $('.itinerary-saving-fields').show();
    } else if($(this).is(':not(:checked)')){
      $('.down-payment-fields').hide();
      $('.itinerary-saving-fields').hide();
    }
  });

  $('.dp-type-select').change(function() {
    $('.dp-flat-field, .dp-percentage-field').attr('type', 'hidden');

    if (this.value == 'flat') {
      $('.dp-flat-field').attr('type', 'number');
      $('.dp-percentage-field').attr('type', 'hidden');
    } else if (this.value == 'percentage') {
      $('.dp-percentage-field').attr('type', 'number');
      $('.dp-flat-field').attr('type', 'hidden');
    }
  });

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
