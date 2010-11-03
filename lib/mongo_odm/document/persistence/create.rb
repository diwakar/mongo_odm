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
      # method. create
      #
      def create( options = {} )
      #-------------------------
        
        # the final result; assuming failure
        result = false
        
        # generate an id if there is no id
        self.generate_id if self.id.nil?
        
        # insert the document into the class collection;
        # was the document inserted successfully?    
        if self.class.collection.insert( self.attributes.to_bson, 
                                         options )
          
          # if so ...
          
          # the document is no longer new                                              
          @_new = false
          
          # the save operation was a success
          result = true
          
        end
        
        # return the final result                
        result
        
      end

    end

  end

end
