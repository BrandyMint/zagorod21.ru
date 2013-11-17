class ResortDecorator < Draper::Decorator
  delegate_all

  def preview_image
    h.image_tag source.preview.file.thumb.url if source.preview.present?
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
