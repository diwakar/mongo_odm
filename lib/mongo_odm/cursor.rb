# encoding: utf-8

#
# module. MongoODM
#
module MongoODM
#--------------

  #
  # class. Cursor
  #
  class Cursor
  #-----------

    #--------------------------------------------------------------------------
    #

    OPERATIONS = 
    [
      :close,
      :closed?,
      :count,
      :explain,
      :fields,
      :full_collection_name,
      :hint,
      :limit,
      :order,
      :query_options_hash,
      :query_opts,
      :selector,
      :skip,
      :snapshot,
      :sort,
      :timeout
    ]

    #--------------------------------------------------------------------------
    #

    include Enumerable

    #--------------------------------------------------------------------------
    #

    def initialize( _class, cursor )
    #------------------------------
      @_class = _class
      @cursor = cursor
    end

    #--------------------------------------------------------------------------
    #

    #
    #
    #
    OPERATIONS.each do | operation |
      define_method( name ) do | *operation | 
        @cursor.send( operation, *arguments ) 
      end
    end
    
    def count
    #--------
      @cursor.count
    end
    
    def to_a
    #-------
      
      @cursor.to_a.collect do | attributes | 
        MongoODM::Document.instantiate( attributes, 
                                        :class => @_class,
                                        :new => false )
      end
      
    end

    def each
    #-------
      
      puts 'each'
    
      @cursor.each do | attributes |
        yield MongoODM::Document.instantiate( attributes, 
                                              :class => @_class,
                                              :new => false )
      end
    
    end

    def next_document
    #----------------
    
      MongoODM::Document.instantiate( @cursor.next_document, 
                                      :class => @_class,
                                      :new => false )
    
    end  
    
  end 

end