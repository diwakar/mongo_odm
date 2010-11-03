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
    # module. Persistence
    #
    module Persistence
    #-----------------

      #
      # method. update
      #
      def update( options = {} )
      #-------------------------
        
        #
        result = false
      
        #
        if self.class.collection.update( { '_id' => self.id }, 
                                         self.attributes.to_bson,
                                         options )            
          
          #
          result = true
        
        end
        
        #                                    
        result
        
      end

    end

  end

end
