$ ->
  $.fn.datepicker.dates["ru"] =
    days: ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
    daysShort: ["Вск", "Пнд", "Втр", "Срд", "Чтв", "Птн", "Суб", "Вск"]
    daysMin: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
    months: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
    monthsShort: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"]
    today: "Сегодня"
    meridiem: 1
    weekStart: 1

  $.fn.datetimepicker.dates["ru"] = $.fn.datepicker.dates["ru"]

  $.fn.zagorod_datepicker = ->
    @datepicker
      language: "ru"
      autoclose: true
      startDate: new Date()
      format: "dd.mm.yyyy"

  $.fn.zagorod_timepicker = ->
    @datetimepicker
      language: "ru"
      autoclose: true
      startDate: new Date()
      format: "dd MM hh:ii"
      minuteStep: 30
      # minView: 'day'

  hideKeyboard = (element) ->
    element.attr "readonly", "readonly" # Force keyboard to hide on input field.
    element.attr "disabled", "true" # Force keyboard to hide on textarea field.
    setTimeout (->
      element.blur() #actually close the keyboard
      # Remove readonly attribute after keyboard is hidden.
      element.removeAttr "readonly"
      element.removeAttr "disabled"
      return
    ), 100


  $document = $(document)

  if $document.width() < 991
    $('@datetimepicker, .datepicker').on 'focus', (e) ->
      hideKeyboard $(this)

  $('@datetimepicker').zagorod_timepicker()
  $('.datepicker').zagorod_datepicker()

  $('@reset-date').on 'click', ->
    $(this).siblings('input').val('')

  date_from = $('.date_from')
  date_to = $('.date_to')

  setDateTo = ->
    return date_to.datepicker('setStartDate', date_from.datepicker('getDate')) if date_to.length
    []

  setDateTo() if date_from.val()

  date_from.on 'changeDate', (e) ->
    setDateTo().datepicker('show')

  $('@order-form').submit ->
    date_picker = null
    $(@).find('.datepicker').each ()->
      if $(this).val() is ""
        date_picker = $(this)
        return false

    if date_picker
      date_picker.focus()
      return false
