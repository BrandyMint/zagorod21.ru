$ ->
  filter = $('#filter')
  houses = $('.houses-found')
  $document = $(document)

  # mobile
  if $document.width() < 991
    submitBtn = $('.submit-mobile')

    $document.on 'scroll', (e)->
      top = $(this).scrollTop()
      if top > (houses.offset().top - $(window).height())
        submitBtn.addClass('absolute').width()
      else
        submitBtn.removeClass('absolute').width()

    $('@filter-collapse-mobile').on 'click.bs.collapse.data-api', (e)->
      if $document.scrollTop() > filter.height()
        $document.scrollTop(0)
        return false if !$(this).hasClass('collapsed')

  # desktop
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
