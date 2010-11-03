module MongoODM
#--------------

  module Document
  #--------------

    module AttributeMethods
    #----------------------

      module Query
      #-----------

        extend ActiveSupport::Concern
        
        included do
          attribute_method_suffix "?"
        end

        module ClassMethods
        #------------------
          
          protected; def define_method_attribute?( attribute_name )
          #--------------------------------------------------------
          
            generated_attribute_methods.module_eval(
              "def #{attribute_name}?; " +
                 "query_attribute('#{attribute_name}'); " +
              "end",
              __FILE__, 
              __LINE__
            ) 

          end

        end

        #
        # method. query_attribute
        #
        def query_attribute( attribute_name )
        #------------------------------------
          !!@attributes[ attribute_name ]
        end

        #
        # method. attribute?
        #
        def attribute?( attribute_name ) 
        #-------------------------------
          query_attribute( attribute_name )
        end

      end

    end

  end

end
