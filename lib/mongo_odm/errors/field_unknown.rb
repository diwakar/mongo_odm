module MongoODM
#--------------

  module Errors
  #------------
  
    class FieldUnknown < MongoODM::Errors::Base
    #------------------------------------------
    
      def initialize( field_name, class_name )
      #---------------------------------------        
        super "no field named '#{field_name.to_s}' is defined for #{class_name}"
      end
    
    end
    
  end
  
end