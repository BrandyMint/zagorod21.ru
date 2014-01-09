#= require jquery
#= require jquery_ujs
#= require jquery.role/lib/jquery.role
#= require fotorama
#= require bootstrap
#= require bootstrap-datepicker
#= require datepicker_defaults
#= require isotope/jquery.isotope.min
#= require jquery.maskedinput/jquery.maskedinput.min
#= require spin.js/spin.js
#= require estimate_order
#= require orders
#= require infinite_houses

# require jquery.freetile
# require jquery-ui
# require jquery.ui.datepicker-ru
# require select2
# require jquery_nested_form
#
# sass-ный jquery
# require jquery.ui.all

$ ->
  $('@tooltip').tooltip()
  $(".fotorama").fotorama
    fit: 'scaledown'
    thumbspreview: true
    shadows: false
    allowfullscreen: 'native'

  # preview$('#freetile').freetile()
  # $('input.ui-date-picker').datepicker()
  # $('input.ui-datetime-picker').datetimepicker()
  # $('input.select2').select2()
  # $('select.select2').select2
  #  width: 'element'
  $('.masked_phone').mask("+7 (999) 999-99-99")

  $('.datepicker').zagorod_picker()
  $('.date_from').on 'changeDate', (e) ->
      from_date = $(this).datepicker 'getDate'
      $('.date_to').datepicker('setStartDate', from_date)
      $('.date_to').datepicker('show')

  $('tr.clickable_tr').on 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()
    window.location.href = $(this).data('url')


  $('@order-form').submit ()->
    date_picker = null
    $(@).find('.datepicker').each ()->
      if $(this).val() == ""
        date_picker = $(this)
        return false

    if date_picker
      $("body").animate({scrollTop: 0},
        {
          duration: 200
          queue: true
          complete: ()->
            date_picker.datepicker('show')
        }
      )
      return false
