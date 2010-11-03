require 'mongo_odm/document/attribute_methods/read'
require 'mongo_odm/document/attribute_methods/write'

#
# module. MongoODM
#
module MongoODM
#--------------

  #
  # module. Document
  #
  module Document
  #--------------

    #
    # module. Document
    #
    module AttributeMethods
    #----------------------

      extend ActiveSupport::Concern
      
      included do
      
        include ActiveModel::AttributeMethods
        
        include MongoODM::Document::AttributeMethods::Read
        include MongoODM::Document::AttributeMethods::Write
        include MongoODM::Document::AttributeMethods::Query
              
      end
      
      module ClassMethods
      #------------------

        def define_attribute_methods_for_fields
        #--------------------------------------
          define_attribute_methods( fields.keys )
        end
        
        def default_attributes
        #---------------------
          defaults = HashWithIndifferentAccess.new
          fields.each_value do | field | 
            defaults << [ field.name, field.default ] unless field.default.nil?
          end
          defaults  
        end

      end

      attr_reader :attributes

      def force_attributes=( new_attributes )
      #--------------------------------------
        send( :attributes=, new_attributes, true )
      end

      def attributes=( new_attributes, auto_generate_attributes = false )
      #------------------------------------------------------------------
      
        return if new_attributes.blank?
        
        new_attributes.each do | name, value |
          if respond_to?( :"#{name}=" )
            puts "send( :'#{name}=', #{value.inspect} )"
            send( :"#{name}=", value )
          else
            auto_generate_attributes ? 
              write_attribute( name, value ) : 
              raise( MongoODM::Errors::UnknownFieldError, "unknown field: #{name}" )
          end
        end
      
      end

      def freeze
        @attributes.freeze; super
      end

      def load_attributes_or_defaults(attrs)
        attrs = self.class.default_attributes.merge(attrs)
        self.force_attributes = attrs
      end
          
      def attribute_method?(attr_name)
        attr_name == '_id' || attributes.include?(attr_name)
      end
      protected :attribute_method?

      def method_missing( method_id, *args, &block )
      #---------------------------------------------
      
        if !self.class.attribute_methods_generated?
          
          # if not ...
          
          # define the attribute methods ...
          self.class.define_attribute_methods_for_fields
          method_name = method_id.to_s
          guard_private_attribute_method!(method_name, args)
          send( method_id, *args, &block )
        
        else
        
          super
        
        end
      
      end

      def respond_to?( *args )
      #-----------------------
        self.class.define_attribute_methods_for_fields \
          unless self.class.attribute_methods_generated?
        super
      end
    
    end

  end

end
