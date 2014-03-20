class TimePickerInput < SimpleForm::Inputs::StringInput
  enable :placeholder

  def input
    input_html_options[:readonly] = false
    @input_html_classes.push('datetimepicker').push(@attribute_name)

    if ApplicationController.ios_device?
      input_html_options[:type] = 'datetime-local'
      device = :ios
    else
      input_html_options[:role] = 'datetimepicker-input'
      wrapper_role = :datetimepicker
    end

    input_tag = super
    str = ''
    str = "<div class=\"input-append date datetimepicker datepicker-wrapper #{device}\" role=\"#{wrapper_role}\">"
    str << input_tag
    str << template.content_tag(:span, class: 'add-on') { template.content_tag(:i, '', class: 'icon-th') }
    str << '<button class="reset-picker" type="button" role="reset-date"><i class="fontello-icon-cancel-circled-1"></i></button>'
    str << '</div>'
    str
  end
end
