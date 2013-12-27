$ ->
  spinnerEl = $('div.spinner').get(0)
  opts = {lines: 13, width: 14, radius: 3, length: 39, radius: 40}
  spinner = new Spinner(opts)
  
  loadComplete = ->
    $('#houses').attr('data-complete') == 'true'

  scrolledToFooter = ->
    $('body').scrollTop() + $(window.top).height() > $('footer').offset().top

  listenForScroll = ->
    $(window).on 'scroll', loadHouses unless loadComplete()

  loadHouses = ->
    return unless scrolledToFooter()
    page = 1 + parseInt $('#houses').attr('data-page')
    $.ajax
      url: '/search'
      type: 'GET'
      data: {page: page}
      dataType: 'script'
      beforeSend: ->
        spinner.spin(spinnerEl)
        $(window).off 'scroll'
      success: (data, status, jqXHR) ->
        spinner.stop()
        listenForScroll()

  listenForScroll()