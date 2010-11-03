module MongoODM
#--------------

  module Document
  #--------------

    module AttributeMethods
    #----------------------

      module Read
      #----------

        extend ActiveSupport::Concern
        
        included do
          attribute_method_suffix ""
        end

        module ClassMethods
        #------------------
        
          protected; def define_method_attribute( attribute_name )
          #-------------------------------------------------------
          
            generated_attribute_methods.module_eval(
              "def #{attribute_name}; " + 
                "read_attribute( '#{attribute_name}' ); " +
              "end",
              __FILE__, 
              __LINE__
            )
          
          end
        
        end

        public; def read_attribute( attribute_name )
        #-------------------------------------------
          @attributes[ attribute_name ]
        end
        
        public; def []( attribute_name ) 
        #-------------------------------
          read_attribute( attribute_name )
        end

        private; def attribute( attribute_name )
        #---------------------------------------
          read_attribute( attribute_name )
        end

      end
      
    end
    
  end
  
end
