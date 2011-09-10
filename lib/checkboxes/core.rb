module Checkboxes

  module Core # This module contains utility methods for both extensions and helpers.

    class CheckboxesNameError <  StandardError; end

    extend self

    # Checks the validity of the relations
    # on a given class.
    # A relation will be valid:
    # * It exists
    # * It's an _has_many
    # * It uses the _through_ option
    # @todo makes error raised more specific
    # @raise CheckboxesNameError Generic Error
    # @return [boolean] It returns _true_, it raises an exception if the validation fails.
    def validate(klass, *relations)
      for relation in relations
        unless (klass.reflections[relation].present? &&
                klass.reflections[relation].macro == :has_many &&
                klass.reflections[relation].options[:through].present?)
          raise CheckboxesNameError, "#{relation} isn't an has_many :through for model #{klass}, check it out please."
        end
      end
    end

    # Returns the class of a relation of
    # of a given class.
    # It cares about the _source_ option of the
    # _has_many_.
    # @return [class]
    def relation_klass(klass, relation)
      source=klass.reflections[relation].options[:source]
      relation_klass = source.present? ? source.to_s : relation.to_s
      relation_klass.classify.constantize
    end

    # Returns a pattern name for the attr_accessor used for handling checkboxes.
    # @return [String]
    def field_name(relation)
      "__#{relation}_ids"
    end


  end

end
