class EstimateDecorator < Draper::Decorator
  delegate_all

  def button
    h.link_to source.total, h.house_url(source.house, form: source.form_object), class: 'btn btn-success', role: 'tooltip', title: description
  end

  def description
    h.simple_format "Сумма за дом: #{amounts[:dates]}\nСумма за транспорт: #{amounts[:transport]}\nСумма за питание: #{amounts[:food]}"
  end
end
