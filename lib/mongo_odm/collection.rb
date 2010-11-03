# encoding: utf-8

#
# module. MongoODM
#
module MongoODM
#--------------
  
  #
  # class. Collection
  #
  class Collection
  #---------------

    #--------------------------------------------------------------------------
    #

    OPERATIONS = 
    [
      :[],
      :hint=,
      :save,
      :insert,
      :create_index,
      :drop_index,
      :drop_indexes,
      :drop,
      :find_and_modify,
      :map_reduce,
      :group,
      :index_information,
      :options,
      :stats
    ]
  
    #--------------------------------------------------------------------------
    #
  
    #
    #
    #
    def initialize( _class, collection )
    #-----------------------------------
  
      @_class = _class
      @collection = collection
  
    end
  
    #--------------------------------------------------------------------------
    #
    
    OPERATIONS.each do | operation |
      define_method( operation ) do | *argument | 
        @collection.send( operation, *argument ) 
      end
    end    

    #
    #
    #
    def find( selector = {}, options = {} )
    #--------------------------------------
    
      # restrict the results to the 
      append_default_class_names_to_selector( selector )      

      #
      cursor = @collection.find( selector, options )
  
      #
      unless cursor.nil?
  
        # instantiate a MongoODM class specific cursor from the Mongo cursor
        cursor = MongoODM::Cursor.new( self.class, cursor )
  
        # was a block given?
        if block_given?
      
          # yield the cursor to the given block
          yield cursor
                
          # close the cursor
          cursor.close()

          # reset the cursor 
          cursor = nil

        end
  
      end

      cursor

    end

    #
    #
    #
    def find_one( selector_or_id = nil, options = {} )
    #-------------------------------------------------
      
      selector = 
        case selector_or_id
           when nil
             {}
           when BSON::ObjectId
             { :_id => selector_or_id }
           when String
             { :_id => BSON::ObjectId.from( selector_or_id ) }
           when Hash
             selector_or_id
           else
             raise ArgumentError,
                   "The argument #{selector_or_id.inspect} cannot be" + 
                   " used in this method." 
        end
    
      find( selector, options.merge( :limit => -1 ) ).next_document
    
    end

    #
    #
    #
    def distinct( key, selector = {} )
    #---------------------------------
      @collection.
        distinct( key, 
                  append_default_class_names_to_selector( selector ) )
    end

    #
    #
    #
    def update( selector, document, options = {} )
    #---------------------------------------------
      @collection.
        update( append_default_class_names_to_selector( selector ), 
                document,
                options )
    end
    
    #
    #
    #
    def remove( selector, options = {} )
    #-----------------------------------
      @collection.
        remove( append_default_class_names_to_selector( selector ), 
                options )
    end    

    #
    #
    #
    def remove_all( options = {} )
    #-----------------------------
      remove( append_default_class_names_to_selector( {} ), options )
    end
        
    #
    #
    #
    def count( selector = {} )
    #-------------------------
      find( selector ).count()
    end

    #--------------------------------------------------------------------------
    #
    
    #
    #
    #
    def append_default_class_names_to_selector( selector )
    #-----------------------------------------------------

      #
      selector[ :_class_name ] =
          { '$in' => self.default_class_names_for_selector } \
        if !selector.include?( :_class_name ) && 
           ( MongoODM::Document > @_class.superclass )

      selector
      
    end

    #
    #
    #
    def default_class_names_for_selector
    #-----------------------------------
      @default_class_names_for_selector ||=
        ( [ @_class ] + @_class.descendants ).map { | c | c.name }
    end
  
  end

end
