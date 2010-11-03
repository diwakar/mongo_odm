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
    module Fields
    #------------

      #
      # class. Field
      #
      # The +Field+ class represents a field.
      #
      class Field
      #----------
        
        #--------------------------------------------------------------------
        # h2. attributes
        
        # the name of the field
        attr_reader :name
        # the type (class) of the field
        attr_reader :type
        # the options of the field
        attr_reader :options

        #--------------------------------------------------------------------
        # h2. initialization

        def initialize( name, type, options = {} )
        #-----------------------------------------
          @name = name.to_sym
          @type = type
          @options = options.to_options
        end

        #--------------------------------------------------------------------
        # h2. queries

        # 
        # method. default
        #
        def default
        #----------
        
          # the default field value; retrieve from the options
          default = options[ :default ]
  
          # is there are default value?
          unless default.nil?
            self.value_from( default.respond_to?( :call ) ? default.call : default )
          end
        
        end

        # 
        # method. read_only?
        #
        def read_only?
        #-------------
        
          # the read only field value; retrieve from the options or false
          options[ :read_only ] || false
        
        end

        #--------------------------------------------------------------------
        # h2. helpers

        #
        # method. value_from
        #
        def value_from( value )
        #----------------------
          #raise MongoODM::Errors::TypeCastMissing.new(value, @type) unless @type.respond_to?(:type_cast)
          @type.from( value )
        end

      end

    end

  end

end