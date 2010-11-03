#
# module. MongoODM
#
module MongoODM
#--------------

  #
  # module. ConnectionOrchestrator
  #
  class ConnectionAdapter
  #----------------------
    
    #--------------------------------------------------------------------------
    #

    #
    #
    #
    def initialize( connection_configuration )
    #-----------------------------------------

      raise MongoODM::Errors::ConnectionConfigurationInvalid \
        if connection_configuration.nil? || !connection_configuration.valid?

      @connection_configuration = connection_configuration

    end

    #--------------------------------------------------------------------------
    #

    #
    # method. connection
    #
    def connection
    #-------------
      
      create_connection! if @_connection.nil?
      
      @_connection
                               
    end

    #
    # method. connection
    #
    def database
    #-----------
      
      if @_db.nil?
        create_database!
        authenticate_database!
      end
      
      @_db
      
    end

    #--------------------------------------------------------------------------
    #
    
    private; def create_connection!
    #------------------------------

      @_connection =  
        Mongo::Connection.new( @connection_configuration.host, 
                               @connection_configuration.port )
                               
      rails MongoOBM::Errors::ConnectionNotEstablished \
        if @_connection.nil?
          
    end

    private; def create_database!
    #----------------------------

      @_db = self.connection.db( @connection_configuration.name )  

    end

    private; def authenticate_database!
    #----------------------------------
    end
        
  end
    
end