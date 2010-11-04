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
    # module. FinderMethods
    #
    module FinderMethods
    #-------------------

      extend ActiveSupport::Concern

      module ClassMethods
      #------------------

        #
        #
        #
        def find( *arguments )
        #---------------------
          collection.find_with_ids( *arguments )
        end

        #
        #
        #
        def all( options = {} )
        #----------------------
          collection.find( {}, options )
        end
        
      end
      
    end
    
  end
  
end 
