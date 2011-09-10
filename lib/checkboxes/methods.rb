module Checkboxes

  # This module contains all the methods that _concern_ with
  # ActiveRecord::Base.
  module Methods

    extend ActiveSupport::Concern

    module ClassMethods

      # Use it in your model for the relations you need to
      # handle with checkboxes.
      # @return [nil]
      # @raise CheckboxesNameError If any relation is not valid.
      def checkboxes_for(*relations)

        klass = self

        Checkboxes::Core.validate(klass, *relations)

        relations.each do |relation|

          field_name=Checkboxes::Core.field_name(relation)

          attr_accessible field_name.to_sym

          define_method "#{field_name}=" do |ids|
            send("#{relation}=",ids.select { |id| id.present? }.map {|id| Checkboxes::Core.relation_klass(klass, relation).find(id)})
          end

          define_method field_name do
            send("#{relation}").map {|e| e.id}
          end

        end

      end

    end

  end

end
