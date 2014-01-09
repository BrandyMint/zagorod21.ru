$ ->
  spinnerEl = $('div.spinner').get(0)
  opts = {lines: 13, width: 8, length: 19, radius: 40}
  spinner = new Spinner(opts)

  loadComplete = ->
    $('#houses').attr('data-complete') == 'true'

  scrolledToFooter = ->
    $(window).scrollTop() + $(window.top).height() > $('footer').offset().top

  listenForScroll = ->
    $(window).on 'scroll', loadHouses unless loadComplete()

  appendHouses = (html, page) ->
    $html = $(html)
    $('#houses').append $html
    $('#houses').attr('data-page', page)

  loadHouses = ->
    return unless scrolledToFooter()
    page = 1 + parseInt $('#houses').attr('data-page')
    $.ajax
      url: '/welcome/houses_rows'
      type: 'GET'
      data: {page: page}
      dataType: 'html'
      beforeSend: ->
        spinner.spin(spinnerEl)
        $(window).off 'scroll'
      success: (data, status, jqXHR) ->
        spinner.stop()
        appendHouses(data, page)
        listenForScroll() if data.length > 1

  listenForScroll() if $('#estimates').length
