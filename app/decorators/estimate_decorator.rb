class EstimateDecorator < Draper::Decorator
  delegate_all

  def button
    label = h.money source.total
    h.link_to label, h.house_url(source.house, order: source.form_object.to_order),
      class: 'btn btn-success',
      role: 'tooltip',
      title: description,
      data: { html: true }
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
