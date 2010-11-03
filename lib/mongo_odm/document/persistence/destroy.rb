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
      # method. destroy
      #
      def destroy( options = {} )
      #--------------------------
        
        # the final result; assuming failure
        result = false

        # if the document is not new remove the document with the current 
        # document id from the collection; was it removed successfully?
        if self.new? || 
           self.class.collection.remove( { :_id => self.id }, options )
          
          # if so ...
          
          # mark the document as destroyed
          self.mark_destroyed

          # freeze this document instance
          self.freeze

          # the save operation was a success
          result = true
          
        end
        
        # return the final result             
        result
        
      end

    end

  end

end