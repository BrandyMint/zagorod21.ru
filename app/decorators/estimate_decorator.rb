class EstimateDecorator < Draper::Decorator
  delegate_all

  def button
    label = h.money source.total
    h.link_to order_url, class: 'btn btn-success btn-block btn-house', title: h.sanitize(description) do
      h.content_tag(:span, label, class: 'rline col-xs-5 size-16px') <<
      h.content_tag(:span, 'Заказать', class: 'size-16px bold col-xs-7')
    end
  end

  def order_url
    h.house_url(source.house, house_order: source.form_object.to_order)
  end

  def description
    buffer = [amount_text("Сумма за дом: ", :dates)]
    add_amount buffer, "Сумма за транспорт: ", :transport
    add_amount buffer, "Сумма за питание: ", :food

    return buffer.join('<br/>')
  end

  private

  def add_amount buffer, text, amount
    str = amount_text text, amount
    buffer << str if str.present?
  end

  def amount_text text, amount
    value = amounts[amount]
    value.to_i>0 ? "#{text} #{h.money(value)}" : nil
  end
end
