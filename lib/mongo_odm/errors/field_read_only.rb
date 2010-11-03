module MongoODM
#--------------

  module Errors
  #------------
    
    class FieldReadOnly < MongoODM::Errors::Base
    #-------------------------------------------
    
      def initialize( field_name )
      #---------------------------
        super "the field '#{field_name.to_s}' is read only"
      end
      
    end
    
  end
  
end