#
# module. MongoODM
#
module MongoODM
#--------------

  #
  # module. ConnectionOrchestrator
  #
  class ConnectionOrchestrator
  #---------------------------
    
    #
    include Singleton    
    
    #--------------------------------------------------------------------------
    #

    def self.retrieve_or_establish_connection( connection_configuration )
    #--------------------------------------------------------------------

      orchestrator = ConnectionOrchestrator.instance
      
      orchestrator.connection_established?( connection_configuration ) ?
        orchestrator.retrieve_connection( connection_configuration ) :
        orchestrator.establish_connection( connection_configuration )
    
    end

    #--------------------------------------------------------------------------
    #

    #
    #
    #
    def initialize
    #-------------
      @connections = {}
    end

    #--------------------------------------------------------------------------
    #

    #
    # method. connection_established?
    #
    def connection_established?( connection_configuration )
    #------------------------------------------------------
      @connections.include?( connection_configuration.uri )
    end

    #
    # method. retrieve_connection
    #
    def retrieve_connection( connection_configuration )
    #--------------------------------------------------
      @connections[ connection_configuration.uri ]
    end
    
    #
    # method. establish_connection
    #
    def establish_connection( connection_configuration )
    #---------------------------------------------------
    
      uri = connection_configuration.uri
    
      connection = 
        @connections[ uri ] || 
        MongoODM::ConnectionAdapter.new( connection_configuration )
    
      @connections[ uri ] = connection 
      
    end
        
  end
    
end