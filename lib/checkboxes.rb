require 'active_record'
require 'action_view'
require 'checkboxes/core'
require 'checkboxes/methods'
require 'checkboxes/helpers'

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send :include, Checkboxes::Methods
end

if defined?(ActionView::Helpers::FormBuilder)
  ActionView::Helpers::FormBuilder.send :include,Checkboxes::Helpers::FormBuilderExtension
end
