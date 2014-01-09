$ ->
  # при создании заказа, если не заполнено поле даты FF не скроллит к полю приезд или отъезд
  # фикс скрола, если не выбрана одна из дат
  $("input#order_submit").on "click", ->
    from = $("#order_date_from").val()
    to = $("#order_date_to").val()
    name = $("#order_name").val()
    phone = $("#order_phone").val()
    if name && phone
      $(window).scrollTop $("order_date_to").scrollTop() unless from and to
