class HtmlEditorInput < Formtastic::Inputs::TextInput
  def input_html_options
    super.merge(class: "wyswing")
  end
end