$ ->
  estimate = ->
    params = $(this).closest('form').serializeArray()
    outputEl = $('span#order_price')
    inputField = $('input#order_money_amount')
    $.ajax
      url: '/api/orders/estimate'
      type: 'POST'
      data: params
      beforeSend: ->
        opts = {lines: 7, width: 3, radius: 3}
        outputEl.empty()
        new Spinner(opts).spin(outputEl.get(0))
      success: (data, status, jqXHR) ->
        if data.status == 'success'
          inputField.val(data.data.total)
          outputEl.html(data.data.total)
        else
          alert(data.message)

  estimate.apply($('[role=estimate_sensitive]').get(0))
  $('[role=estimate_sensitive]').on 'change', estimate
  