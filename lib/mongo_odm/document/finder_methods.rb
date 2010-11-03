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

        def find_with_ids( *ids )
        #------------------------

          expects_array = ids.first.kind_of?(Array)
          return ids.first if expects_array && ids.first.empty?

          ids = ids.flatten.compact.uniq

          case ids.size
          when 0
            raise RecordNotFound, "Couldn't find #{@klass.name} without an ID"
          when 1
            result = find_one( ids.first )
            expects_array ? [ result ] : result
          else
            find_some( ids )
          end
          
        end

        #
        #
        #
        def find_one( id, options = {} )
        #-------------------------------

          attributes = 
            self.collection.find_one( BSON::ObjectId.from( id ), options )
          
          attributes.blank? ?
            nil :
            Document.instantiate( attributes, :class => self, :new => false )
        end

        #
        #
        #
        def find_some( ids, options = {} )
        #---------------------------------
          
          
          ids = ids.map { | id | BSON::ObjectId.from( id ) }
          
        end

        #----------------------------------------------------------------------
        #

        #
        #
        #
        def find_by_mongodb_selector( selector = {}, options = {} )
        #----------------------------------------------------------
        
          #
          append_default_class_names_to_selector( selector )      
          
          #
          cursor = self.collection.find( selector, options )
      
          #
          unless cursor.nil?
      
            # instantiate a MongoODM class specific cursor from the Mongo cursor
            cursor = MongoODM::Cursor.new( self.class, cursor )
      
            # was a block given?
            if block_given?
          
              # yield the cursor to the given block
              yied cursor
          
              # close the cursor
              cursor.close()

              # reset the cursor 
              cursor = nil

            end
      
          end
    
          cursor
    
        end

      end
      
    end
    
  end
  
end 
