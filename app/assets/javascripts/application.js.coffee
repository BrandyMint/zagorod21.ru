#= require jquery
#= require jquery.role/lib/jquery.role
#= require fotorama
#= require bootstrap
#= require bootstrap-datepicker
#= require datepicker_defaults
#= require phrasing
#= require isotope/jquery.isotope.min

# require jquery.freetile
# require jquery_ujs
# require jquery-ui
# require jquery.ui.datepicker-ru
# require select2
# require jquery_nested_form
#
# sass-ный jquery
# require jquery.ui.all

$ ->
  $('@tooltip').tooltip()
  $('.fotorama').fotorama
    thumbspreview: true
    shadows: false
    #allowfullscreen: 'native'
  # preview$('#freetile').freetile()
  # $('input.ui-date-picker').datepicker()
  # $('input.ui-datetime-picker').datetimepicker()
  # $('input.select2').select2()
  # $('select.select2').select2
  #  width: 'element'

  $('.datepicker').zagorod_picker()

  return
