class ComfortInput < SimpleForm::Inputs::CollectionCheckBoxesInput

  def label
  end

  def build_nested_boolean_style_item_tag(collection_builder)
    collection_builder.check_box + template.content_tag(:span, '') + collection_builder.text
  end

  def input
    label_method, value_method = detect_collection_methods
    value_method = :name

    @builder.send("collection_check_boxes",
      attribute_name, collection, value_method, label_method,
      input_options, input_html_options, &collection_block_for_nested_boolean_style
    )
  end

end
