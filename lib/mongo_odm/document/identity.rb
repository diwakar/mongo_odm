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
    module Identity
    #--------------

      #------------------------------------------------------------------------
      #

      #
      #
      #
      def id
      #-----
        read_attribute( '_id' )
      end
      
      #
      #
      #
      def id=( id )
      #------------
        write_attribute( '_id', id )
      end

      #------------------------------------------------------------------------
      #

      #
      #
      #
      def generate_id
      #--------------  
        write_attribute( '_id', BSON::ObjectId.new )
      end

    end

  end

end
