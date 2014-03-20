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

  $document = $(document)

  hideKeyboard = (element) ->
    document.activeElement.blur()

  if $document.width() < 991
    $('@datetimepicker-input, @datepicker').on 'focus', (e) ->
      hideKeyboard()

  $('@datetimepicker').zagorod_timepicker()
  $('@datepicker').zagorod_datepicker()

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
