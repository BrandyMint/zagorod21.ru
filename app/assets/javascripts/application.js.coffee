#= require jquery
#= require jquery_ujs
#= require jquery.role/lib/jquery.role
#= require bootstrap
#= require bootstrap-datepicker
#= require bootstrap-datetimepicker/js/bootstrap-datetimepicker
#= require datepicker_defaults
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
  # $(".fotorama").fotorama
  #   fit: 'scaledown'
  #   thumbspreview: true
  #   shadows: false
  #   allowfullscreen: 'native'

  # preview$('#freetile').freetile()
  # $('input.ui-date-picker').datepicker()
  # $('input.ui-datetime-picker').datetimepicker()
  # $('input.select2').select2()
  # $('select.select2').select2
  #  width: 'element'
  $('.masked_phone').mask("+7 (999) 999-99-99")

  $('@datetimepicker').zagorod_timepicker()
  $('.datepicker').zagorod_datepicker()

  date_from = $('.date_from')
  date_to = $('.date_to')

  setDateTo = ->
    return date_to.datepicker('setStartDate', date_from.datepicker('getDate')) if date_to.length
    []

  setDateTo() if date_from.val()

  date_from.on 'changeDate', (e) ->
    setDateTo().datepicker('show')


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

  tabs = $('.choice a')
  $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
    tabs.removeClass('active')
    $(e.target).toggleClass('active')

  $('.btn-filter-comfort').on 'click.bs.collapse.data-api', (e) ->
    text = $(this).data('text')
    $(this).data('text', $(this).html()).html text

  thumbs = $('#house-thumbnails')
  thumbsControls = thumbs.find('.carousel-control')
  thumbsControls.hide() if thumbs.find('.item').length < 2
  thumbs.on "slid", "", ->
    $this = $(this)
    thumbsControls.show()
    if $this.find(".item:first").hasClass("active")
      thumbsControls.filter(".left").hide()
    else if $this.find(".item:last").hasClass("active")
      thumbsControls.filter(".right").hide()
    return

  $("[data-clampedwidth]").each ->
    elem = $(this)
    parentPanel = elem.data("clampedwidth")
    resizeFn = ->
      sideBarNavWidth = $(parentPanel).width() - parseInt(elem.css("paddingLeft")) - parseInt(elem.css("paddingRight")) - parseInt(elem.css("marginLeft")) - parseInt(elem.css("marginRight")) - parseInt(elem.css("borderLeftWidth")) - parseInt(elem.css("borderRightWidth"))
      elem.css "width", sideBarNavWidth
      return

    resizeFn()
    $(window).resize resizeFn
    return


  filter = $('#filter')
  $document = $(document)

  # mobile filter
  if $document.width() < 991
    $('@filter-collapse-mobile').on 'click.bs.collapse.data-api', (e)->
      if $document.scrollTop() > filter.height()
        $document.scrollTop(0)
        return false if !$(this).hasClass('collapsed')

  # desktop filter
  if $document.width() > 991
    filter.addClass('in')
    filterBtn = $('@filter-collapse')
    filterWrapper = $('.affix-wrapper.filter')
    filterOffset = 150
    deltaTop = 0

    $document.on 'scroll', (e)->
      top = $(this).scrollTop()
      if top > filterOffset && deltaTop < top
        filter.collapse('hide')
      else if top < filterOffset && deltaTop > top
        filter.collapse('show')
      deltaTop = top

    filter
    .on 'show.bs.collapse', (e)->
      if $(e.target).attr('id') == 'filter'
        filterWrapper.addClass('in')
        filterBtn.removeClass('collapsed')
    .on 'hide.bs.collapse', (e)->
      if $(e.target).attr('id') == 'filter'
        filterWrapper.removeClass('in')
        filterBtn.addClass('collapsed')

