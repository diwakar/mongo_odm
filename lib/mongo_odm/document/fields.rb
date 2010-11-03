require 'mongo_odm/document/fields/field'

#
# module. MongoODM
#
module MongoODM
  
  #
  # module. Document
  # 
  module Document
  #--------------
  
    #
    # module. Fields
    #
    module Fields
    #------------

      extend ActiveSupport::Concern

      module ClassMethods
      #------------------
                
        #
        #
        #
        def inherited( subclass )
        #------------------------
          super
          subclass.fields.merge!( self.fields )
        end

        #
        #
        #
        def fields
        #---------
          @fields ||= {}.with_indifferent_access
        end

        #
        #
        #
        def field( name, type = String, options = {} )
        #---------------------------------------------
          
          fields[ name ] = Field.new( name, type, options )
          fields[ name ]
        
        end
    
      end

    end

  end

end