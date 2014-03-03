$ ->
  spinnerEl = $('div.spinner').get(0)
  opts = {lines: 13, width: 8, length: 19, radius: 40}
  spinner = new Spinner(opts)
  houses = $('#houses')
  housesHeight = houses.offset().top + houses.height() if houses.length

  loadComplete = ->
    houses.attr('data-complete') == 'true'

  scrolledToFooter = ->
    $(window).scrollTop() + $(window.top).height() > housesHeight

  listenForScroll = ->
    if houses.length
      $(window).on 'scroll', loadHouses unless loadComplete()

  appendHouses = (html, page) ->
    $html = $(html)
    houses.append $html
    houses.attr('data-page', page)

  loadHouses = ->
    return unless scrolledToFooter()
    page = 1 + parseInt houses.attr('data-page')
    query = searchQuery()
    query['page'] = page
    $.ajax
      url: '/welcome/houses_rows'
      type: 'GET'
      data: query
      dataType: 'html'
      beforeSend: ->
        spinner.spin(spinnerEl)
        $(window).off 'scroll'
      success: (data, status, jqXHR) ->
        spinner.stop()
        appendHouses(data, page)
        listenForScroll() if data.length > 1

  searchQuery = ->
    queryDict = {}
    if window.location.search
      for item in decodeURIComponent(window.location.search).substr(1).split("&")
        kv = item.split("=")
        multi = kv[0].split("[]")
        if multi.length > 1
          queryDict[multi[0]] = [] if queryDict[multi[0]] is undefined
          queryDict[multi[0]].push kv[1]
        else
          queryDict[kv[0]] = kv[1]
    queryDict

  listenForScroll()
