module MongoODM
#--------------

  module Document
  #--------------

    module AttributeMethods
    #----------------------

      module Write
      #-----------

        extend ActiveSupport::Concern
        
        included do
          attribute_method_suffix "="
        end

        module ClassMethods
        #------------------
          
          protected; def define_method_attribute=( attribute_name )
          #--------------------------------------------------------

            generated_attribute_methods.module_eval(
              "def #{attribute_name}=( value );" + 
                "write_attribute( '#{attribute_name}', value );" +
              "end",
              __FILE__, 
              __LINE__
            )
          
          end
        
        end

        public; def write_attribute( attribute_name, value )
        #---------------------------------------------------
        
          field = self.class.fields[ attribute_name ]
          type = field ? field.type : value.class
          
          raise MongoODM::Errors::FieldReadOnly, attribute_name.to_s \
            if field && 
               field.read_only? && 
               @attributes.include?( attribute_name )

          @attributes[ attribute_name ] = 
            attribute_name.to_sym == :_id ? value : type.from( value )

        end

        private; def attribute=( attribute_name, value )
        #-----------------------------------------------
          write_attribute( attribute_name, value )
        end

      end

    end

  end

end