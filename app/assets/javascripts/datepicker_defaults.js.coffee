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
