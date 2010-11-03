#
# module. MongoODM
#
module MongoODM
#--------------

  #
  # class. MongoODM::ConnectionConfiguration
  # 
  # The +MongoODM::ConnectionConfiguration+ specifies the settings required
  # to establish a connection to a specific database on a Mongo database
  # server.
  #
  class ConnectionConfiguration
  #----------------------------
  
    # the default database host
    DEFAULT_HOST = 'localhost'

    # the default database port
    DEFAULT_PORT = 27017
  
    #------------------------------------------------------------------------
    # attributes
  
    # the host and port of the database server
    attr_accessor :host, :port
  
    # the name of the database
    attr_accessor :name
  
    # database is an alias for name
    alias :database :name
    alias :database= :name=

    # the database credentials
    attr_accessor :username, :password

    # the pool size
    attr_accessor :pool_size
  
    #------------------------------------------------------------------------
    # h2. initialization

    #
    # method. initialize
    #
    # The +initialize+ method 
    #
    def initialize( options = {} )
    #-----------------------------
  
      # initialize the host and port to default values
      self.host = DEFAULT_HOST
      self.port = DEFAULT_PORT
    
      # initialize from the given options
      self.from( options )

    end

    #------------------------------------------------------------------------
    # h2. queries

    #
    #
    #
    def valid?
    #---------
      !( self.host.blank? || self.port.blank? || self.name.blank? )
    end

    #
    # method. []
    #
    # The +[]+ faciliates the retrieval of attributes through a given 
    # attribute name or symbol.
    #
    def []( key )
    #------------
      self.send( "#{key}" )
    end
    
    #
    # method. to_uri
    #
    def uri
    #------
    
      "mongodb://" +
        "#{self.username << ':' << self.password << '@' \
            unless ( self.username.blank? || self.password.blank? ) }" +
        "#{self.host}:#{self.port}/#{self.name}"
  
    end

    #------------------------------------------------------------------------
    # h2. operations
  
    #
    # method. from 
    # 
    # The +from+ method initialize this instance from the given -other-.
    #
    # The -other- may a +String+ or +Symbol+ indicating the name of the 
    # database or any other +Object+ ( which must respond to +[]+ ) the 
    # pertinent attributes of which will be used to initialize this instance.
    #
    # returns. self
    #
    def from( other )
    #----------------
  
      # is a String or Symbol given?
      if other.is_a?( String ) || other.is_a?( Symbol )
        # if so, it's the name of the database ...
        self.name = other.to_s
      else
        # if not ...
      
        # for each attribute
        [ :host, :port, 
          :name, :database, 
          :username, :password, 
          :pool_size ].each do | attribute |

          # retrieve the value of the attribute from the given other
          value = other[ attribute ]
        
          # assign the value to the corresponding attribute of self 
          # if it's not blank
          self.send( "{attribute}=", value ) unless value.blank?
        
        end        
    
      end
    
      self
    
    end

  end

end