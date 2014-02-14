$ ->
  estimate = ->
    return unless $(this).closest('form').length
    params = $(this).closest('form').serializeArray()
    inputField = $('input#order_money_amount')
    button = $('@order-form .btn-success')
    spinner = ''
    $.ajax
      url: '/api/orders/estimate'
      type: 'POST'
      data: params
      beforeSend: ->
        opts = {lines: 7, width: 3, radius: 3, left: 13, top: 23}
        spinner = new Spinner(opts).spin(button.parent().get(0))
      success: (data, status, jqXHR) ->
        spinner.stop()
        if data.status == 'success'
          inputField.val(data.data.total)
          button.val("Заказать за #{data.data.total} р.")
        else
          alert(data.message)

  estimate.apply($('[role=estimate_sensitive]').get(0))
  $('[role=estimate_sensitive]').on 'change', estimate
