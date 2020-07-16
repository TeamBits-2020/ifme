# frozen_string_literal: true
module ExternalResourcesFormHelper
  include FormHelper

  def new_external_resource_props
    new_form_props(external_resources_form_inputs, resources_path)
  end

  private

  def external_resource_input_props(field, type, label, group = false)
    { id: "external_resource_#{field}", type: type,
      name: "external_resource[#{field}]#{group ? '[]' : ''}",
      label: label }
  end

  def external_resources_form_inputs
    [external_resource_name, external_resource_link, external_resource_language]
  end

  def external_resource_text_input_props(field, type, label, required = false)
    external_resource_input_props(field, type, label)
        .merge(value: @external_resource[field] || nil, required: required, dark: true)
  end

  def external_resource_name
    external_resource_text_input_props('name', 'text', 'Name', true)
  end

  def external_resource_link
    external_resource_text_input_props('link', 'text', 'Link', true)
  end

  def external_resource_language
    external_resource_text_input_props('language', 'text', 'Language', true)
  end

end
