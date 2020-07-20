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
    [external_resource_name, external_resource_link, external_resource_languages]
  end

  def external_resource_text_input_props(field, type, label, required = false)
    external_resource_input_props(field, type, label)
      .merge(value: @external_resource[field] || nil, required: required, dark: false)
  end

  def external_resource_name
    external_resource_text_input_props('name', 'text', 'name', true)
  end

  def external_resource_link
    external_resource_text_input_props('link', 'text', 'link', true)
  end

  def external_resource_languages
    {
      id: 999,
      name: 'external_resource[languages][]',
      label: 'Choose a language',
      type: 'select',
      value: 'languages',
      options: [
        {
          id: 1,
          value: 'en',
          label: 'English'
        },
        {
          id: 2,
          value: 'pt-BR',
          label: 'Portuguese'
        },
        {
          id: 3,
          value: 'es',
          label: 'Spanish'
        },
        {
          id: 4,
          value: 'fr',
          label: 'French'
        },
        {
          id: 5,
          value: 'it',
          label: 'Italian'
        },
        {
          id: 6,
          value: 'hi',
          label: 'Hindi'
        },
        {
          id: 7,
          value: 'nb',
          label: 'Norwegian'
        },
        {
          id: 8,
          value: 'nl',
          label: 'Dutch'
        },
        {
          id: 9,
          value: 'sv',
          label: 'Swedish'
        },
        {
          id: 10,
          value: 'vi',
          label: 'Vietnamese'
        }
      ]
    }
  end
end
