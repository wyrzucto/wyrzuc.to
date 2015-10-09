Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder

module FormtasticBootstrap
  class FormBuilder
    configure :default_inline_hint_class, 'help-inline'
    configure :default_block_hint_class, 'help-block'
    configure :default_inline_error_class, 'help-inline'
    configure :default_block_error_class,  'help-block'
  end

  module Inputs
    class BooleanInput
      include Base

      def to_html
        bootstrap_wrapping do
          builder.check_box(input_name, form_control_input_html_options)
        end
      end

      def wrapper_html_options
        super.tap do |options|
          options[:class] = (options[:class].split + ["checkbox"]).join(" ")
        end
      end

    end
  end
end



module FormtasticBootstrap
  module Inputs
    class SwitchInput < FormtasticBootstrap::Inputs::RadioInput
      include Base
      include Base::Choices

      def to_html
        form_group_wrapping do
          label_html <<
          template.content_tag(:div,
            collection.map { |choice| choice_html(choice) }.join("\n").html_safe + error_html(:block),
            class: 'form-radios-wrapper'
          )
        end
      end

      def choice_html(choice)
        radio_wrapping do
          builder.radio_button(input_name, choice_value(choice), input_html_options.merge(choice_html_options(choice)).merge(:required => false)) <<
          template.content_tag(:label,
            choice_label(choice),
            label_html_options.merge(choice_label_html_options(choice))
          )
        end
      end
    end
  end
end
