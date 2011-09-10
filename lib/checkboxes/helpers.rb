module Checkboxes

  module Helpers

    module FormBuilderExtension

      def checkboxes_for(relation)

        field_name=Checkboxes::Core.field_name(relation)

        output = ""
        output << "#{self.label(relation)}<br />"
        for record in Checkboxes::Core.relation_klass(self.object.class, relation).all
          output << @template.check_box_tag("#{@object_name}[#{field_name}][]",record.id,self.object.send(relation).include?(record),:id=>record)
          output << "#{record}<br />"
        end
        output << @template.hidden_field_tag("#{@object_name}[#{field_name}][]")
        output.html_safe
      end

    end

  end

end
