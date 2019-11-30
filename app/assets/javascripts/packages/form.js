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
