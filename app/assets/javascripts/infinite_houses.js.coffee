$ ->
  spinnerEl = $('div.spinner').get(0)
  opts = {lines: 13, width: 8, length: 19, radius: 40}
  spinner = new Spinner(opts)
  houses = $('#houses')
  more = $('@more-btn')
  housesHeight = houses.offset().top + houses.height() if houses.length

  loadComplete = ->
    houses.attr('data-complete') == 'true'

  scrolledToFooter = ->
    $(window).scrollTop() + $(window.top).height() > housesHeight

  listenForScroll = ->
    if houses.length
      $(window).on 'scroll', loadHouses unless loadComplete()

  listenMoreBtn = ->
    if more.length
      more.on 'click', (e) ->
        e.preventDefault()
        loadHouses() # unless loadComplete()

  appendHouses = (html, page) ->
    $html = $(html)
    houses.append $html
    houses.attr('data-page', page)

  loadHouses = ->
    return unless scrolledToFooter()
    page = 1 + parseInt houses.attr('data-page')
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

  listenForScroll()
  listenMoreBtn()
