#= require jquery
#= require jquery_ujs
#= require jquery.role/lib/jquery.role
#= require bootstrap
#= require bootstrap-datepicker
#= require bootstrap-datetimepicker/js/bootstrap-datetimepicker
#= require jquery.maskedinput/jquery.maskedinput.min
#= require spin.js/spin.js
#= require estimate_order
#= require orders
#= require infinite_houses
#= require filter
#= require datepickers
#= require_self

$ ->
  $('@tooltip').tooltip()
  $('.masked_phone').mask("+7 (999) 999-99-99")

  $('tr.clickable_tr').on 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()
    window.location.href = $(this).data('url')

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
