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
    module Collection
    #----------------

      extend ActiveSupport::Concern

      included do
        
        # the name of the collection storing this class
        class_attribute :_collection_name
        
        # assign the default collection name for the Document class
        self._collection_name = self.name.underscore 
        
        # the collection storing the class
        class_attribute :_collection
        
      end

      module ClassMethods
      #------------------

        #
        # method. collection_name
        #
        def collection_name( name )
        #--------------------------
          _collection_name = name.to_s
        end
        
        #
        # method. collection
        #
        def collection
        #-------------
          self._collection ||= 
            MongoODM::Collection.new( self, self.database[ _collection_name ] )
        end
        
      end

    end

  end

end
