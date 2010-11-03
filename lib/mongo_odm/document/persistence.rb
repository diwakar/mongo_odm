require 'mongo_odm/document/persistence/create'
require 'mongo_odm/document/persistence/update'
require 'mongo_odm/document/persistence/destroy'

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
      #
      #
      def save( options = {} )
      #-----------------------
        self.create_or_update( options )
      end  

      #
      #
      #
      def save!( options = {} )
      #------------------------
        self.create_or_update || raise( 'the document is invalid' )
      end

      #
      #
      #
      def update_attributes( attributes )
      #----------------------------------
        self.attributes = attributes
        save
      end
      
      #
      #
      #
      def update_attributes!( attributes )
      #-----------------------------------
        self.attributes = attributes
        save!
      end

      #------------------------------------------------------------------------
      # h2. implementation

      #
      #
      #
      protected; def create_or_update( options = {} )
      #----------------------------------------------
        self.new? ? create( options ) : update( options )
      end
    
    end

  end

end
